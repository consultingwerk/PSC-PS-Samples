/*------------------------------------------------------------------------
    File        : OrderBusinessEntity
    Purpose     : Business Entity for Order
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04.07.2017 13:46:38
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.*                FROM PROPATH .
USING Consultingwerk.Assertion.*      FROM PROPATH .
USING TrainingSamples.BusinessLogik.Order.* FROM PROPATH .
USING Consultingwerk.SmartFramework.* FROM PROPATH .
USING Consultingwerk.OERA.*           FROM PROPATH .
USING Consultingwerk.Util.*           FROM PROPATH . 
USING ProgressPS.CustomClasses.OERA.* FROM PROPATH .
USING Progress.Lang.*                 FROM PROPATH .
USING Consultingwerk.OERA.Exceptions.* FROM PROPATH.
USING Ccs.Common.Support.* FROM PROPATH.

/* Sample Annotations - see http://confluence.consultingwerkcloud.com/wiki/display/SCL/The+Annotation+based+Type+Descriptor
@BusinessEntityView (name="order", isdefault="true", entitytable="eOrder", entityview="eCustomer", 
                     listcolumns="eOrder.OrderNum,eOrder.OrderDate,eOrder.CustNum,eCustomer.Name",
                     viewercolumns="eOrder.OrderNum,eOrder.OrderDate,eOrder.CustNum,eCustomer.Name,eOrder.OrderStatus") .
@BusinessEntityTable (name="eOrder", mandatoryColumns="ordernum,orderstatus", addOnlyColumns="ordernum", readonlyColumns="ordernum") .
@BusinessEntityTable (name="eCustomer", mandatoryColumns="ordernum,orderstatus", readonly="true") .
*/

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Order.OrderBusinessEntity", type="BusinessEntity") .

CLASS TrainingSamples.BusinessLogik.Order.OrderBusinessEntity 
    INHERITS PscBusinessEntity IMPLEMENTS IFetchDataByReference
    USE-WIDGET-POOL: 

    { TrainingSamples/BusinessLogik/Order/dsOrder.i }

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the OrderBusinessEntity class                                                                     
        Notes:   Passes the handle of the dataset instance to the base class and 
                 sets the default DataAccessName                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderBusinessEntity ():
        SUPER (DATASET dsOrder:HANDLE).
        
        THIS-OBJECT:DataAccessName = "TrainingSamples.BusinessLogik.Order.OrderDataAccess":U .

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD OVERRIDE PUBLIC VOID FetchData (poFetchDataRequest AS Consultingwerk.OERA.IFetchDataRequest):
        
        IF VALID-OBJECT (poFetchDataRequest:NamedQuery) THEN DO:
            
            CASE poFetchDataRequest:NamedQuery:Name:
                WHEN "OpenOrdersOfCustomerQuery" THEN 
                    THIS-OBJECT:OpenOrdersOfCustomerQuery (poFetchDataRequest) .
                
                OTHERWISE 
                    UNDO, THROW NEW InvalidNamedQueryException (poFetchDataRequest:NamedQuery:Name) .
            END CASE .
            
            
        END.        
        
        
        SUPER:FetchData (poFetchDataRequest).

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:  Fetch data from the Data Access object
        Notes:
        @param poFetchDataRequest The IFetchDataRequest object with the parameters for this call
        @param dsOrder The dataset, intended to by passed BY-REFERENCE
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC FINAL VOID FetchDataByReference (poFetchDataRequest AS Consultingwerk.OERA.IFetchDataRequest,
                                                   OUTPUT DATASET dsOrder):

        THIS-OBJECT:FetchData (poFetchDataRequest, DATASET dsOrder:HANDLE) .

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OpenOrdersOfCustomerQuery (poFetchDataRequest AS Consultingwerk.OERA.IFetchDataRequest):
        
        IF NOT poFetchDataRequest:NamedQuery:Parameters:ContainsKey("CustNum") THEN 
            UNDO, THROW NEW NamedQueryParameterMissingException (poFetchDataRequest:NamedQuery:NAme, "CustNum") .

        poFetchDataRequest:Tables = "eOrder" .
        poFetchDataRequest:Queries = SUBSTITUTE ("for each eOrder where eOrder.CustNum = &1 and eOrder.OrderStatus = 'Ordered'",
                              CAST (poFetchDataRequest:NamedQuery:Parameters:GetItem("CustNum"),
                                    IIntegerHolder):Value) .

/*MESSAGE poFetchDataRequest:Queries*/
/*    VIEW-AS ALERT-BOX.            */
        
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Provides a hook to modify data in the ProDataset after Read and 
                 Update operations (i.e. population of aggregated values)                                                                     
        Notes:   Invoked during FetchData () and SaveChanges ()                                                                     
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID ReceiveData ():
        
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Provides a hook for high level data validation before Update 
                 operations                                                                     
        Notes:   Invoked during SaveChanges (). When the ERROR flag of the ProDataset
                 is set, the Update operation will be cancelled before writing back
                 the data to the database using the DataAccess object                                                                      
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID ValidateData ():
        
    END METHOD.


    @InvokeMethod (template="invoke-receive-dataset", parameterClassName="TrainingSamples.BusinessLogik.Order.CancelOrderParameter", datasetInput="false", datasetOutput="true") . 
    /*------------------------------------------------------------------------------
        Purpose:  
        Notes:   
        @param dsOrder INPUT-OUTPUT DATASET
        @param poParameter The Parameter Object for this method 
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID CancelOrder (INPUT-OUTPUT DATASET dsOrder, 
                                    poParameter AS TrainingSamples.BusinessLogik.Order.CancelOrderParameter):
    
        DEFINE VARIABLE oRequest AS IFetchDataRequest NO-UNDO . 
        
        oRequest = NEW FetchDataRequest ("eOrder", 
                                         SUBSTITUTE ("for each eOrder where eOrder.OrderNum = &1",
                                                     QUOTER (poParameter:OrderNumber))) .
        THIS-OBJECT:FetchData(oRequest) .                           
                                                     
        FIND FIRST eOrder . /* why not just fail, when not available? */                                                     
    
/* Disabled validation, to allow repeated usage ....  
      IF eOrder.OrderStatus <> "Ordered" THEN 
            UNDO, THROW NEW AppError ("Cannot cancel this order because of it's order status.", 0) .  */  
        THIS-OBJECT:TrackingChanges = TRUE . 
    
        ASSIGN eOrder.OrderStatus = "Cancelled" 
               eOrder.Instructions = "Cancelled because of: " + poParameter:CancelationReason . 
    
        THIS-OBJECT:SaveChanges () . 
        
        DatasetHelper:ThrowDatasetErrors(THIS-OBJECT:DatasetHandle) .
        
    END METHOD .
    
END CLASS.

