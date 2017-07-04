/*------------------------------------------------------------------------
    File        : CustomerBusinessEntity
    Purpose     : Business Entity for Customer
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 03.07.2017 17:42:20
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.*                FROM PROPATH .
USING Consultingwerk.Assertion.*      FROM PROPATH .
USING TrainingSamples.BusinessLogik.CustomerWithReposition.* FROM PROPATH .
USING Consultingwerk.SmartFramework.* FROM PROPATH .
USING Consultingwerk.OERA.*           FROM PROPATH .
USING Consultingwerk.Util.*           FROM PROPATH . 
USING ProgressPS.CustomClasses.OERA.* FROM PROPATH .
USING Progress.Lang.*                 FROM PROPATH .

/* Sample Annotations - see http://confluence.consultingwerkcloud.com/wiki/display/SCL/The+Annotation+based+Type+Descriptor
@BusinessEntityView (name="order", isdefault="true", entitytable="eOrder", entityview="eCustomer", 
                     listcolumns="eOrder.OrderNum,eOrder.OrderDate,eOrder.CustNum,eCustomer.Name",
                     viewercolumns="eOrder.OrderNum,eOrder.OrderDate,eOrder.CustNum,eCustomer.Name,eOrder.OrderStatus") .
@BusinessEntityTable (name="eOrder", mandatoryColumns="ordernum,orderstatus", readonlyColumns="ordernum") .
@BusinessEntityTable (name="eCustomer", mandatoryColumns="ordernum,orderstatus", readonly="true") .
*/

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerBusinessEntity", type="BusinessEntity") .

CLASS TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerBusinessEntity 
    INHERITS PscBusinessEntity IMPLEMENTS IFetchDataByReference
    USE-WIDGET-POOL: 

    { TrainingSamples/BusinessLogik/CustomerWithReposition/dsCustomer.i }

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the CustomerBusinessEntity class                                                                     
        Notes:   Passes the handle of the dataset instance to the base class and 
                 sets the default DataAccessName                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerBusinessEntity ():
        SUPER (DATASET dsCustomer:HANDLE).
        
        THIS-OBJECT:DataAccessName = "TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerDataAccess":U .

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose:  Fetch data from the Data Access object
        Notes:
        @param poFetchDataRequest The IFetchDataRequest object with the parameters for this call
        @param dsCustomer The dataset, intended to by passed BY-REFERENCE
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC FINAL VOID FetchDataByReference (poFetchDataRequest AS Consultingwerk.OERA.IFetchDataRequest,
                                                   OUTPUT DATASET dsCustomer):

        THIS-OBJECT:FetchData (poFetchDataRequest, DATASET dsCustomer:HANDLE) .

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

END CLASS.
