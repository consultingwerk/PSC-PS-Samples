/*------------------------------------------------------------------------
    File        : CustomerBusinessEntity
    Purpose     : Business Entity for Customer
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 03.07.2017 14:41:45
    Notes       : 
  ----------------------------------------------------------------------*/

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.*                FROM PROPATH .
USING Consultingwerk.Assertion.*      FROM PROPATH .
USING TrainingSamples.BusinessLogik.Customer.* FROM PROPATH .
USING Consultingwerk.SmartFramework.* FROM PROPATH .
USING Consultingwerk.OERA.*           FROM PROPATH .
USING Consultingwerk.Util.*           FROM PROPATH . 
USING ProgressPS.CustomClasses.OERA.* FROM PROPATH .
USING Progress.Lang.*                 FROM PROPATH .
USING Consultingwerk.OERA.Enum.RequestTypeEnum FROM PROPATH.

/* Sample Annotations - see http://confluence.consultingwerkcloud.com/wiki/display/SCL/The+Annotation+based+Type+Descriptor
@BusinessEntityView (name="order", isdefault="true", entitytable="eOrder", entityview="eCustomer", 
                     listcolumns="eOrder.OrderNum,eOrder.OrderDate,eOrder.CustNum,eCustomer.Name",
                     viewercolumns="eOrder.OrderNum,eOrder.OrderDate,eOrder.CustNum,eCustomer.Name,eOrder.OrderStatus") .
@BusinessEntityTable (name="eOrder", mandatoryColumns="ordernum,orderstatus", readonlyColumns="ordernum") .
@BusinessEntityTable (name="eCustomer", mandatoryColumns="ordernum,orderstatus", readonly="true") .
*/

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity", type="BusinessEntity") .

CLASS TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity 
    INHERITS PscBusinessEntity IMPLEMENTS IFetchDataByReference
    USE-WIDGET-POOL: 

    { TrainingSamples/BusinessLogik/Customer/dsCustomer.i }

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the CustomerBusinessEntity class                                                                     
        Notes:   Passes the handle of the dataset instance to the base class and 
                 sets the default DataAccessName                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerBusinessEntity ():
        SUPER (DATASET dsCustomer:HANDLE).
        
        THIS-OBJECT:DataAccessName = "TrainingSamples.BusinessLogik.Customer.CustomerDataAccess":U .

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
        
        FOR EACH eCustomer:  // Either use BLOCK-LEVEL above or ON ERROR UNDO, THROW here 
            
            ASSIGN eCustomer.DuePayments = eCustomer.CreditLimit < eCustomer.Balance .
                   
            /* High credit limit customers */               
            IF eCustomer.CreditLimit > 100000 THEN 
                ASSIGN eCustomer.CustomerFlags = "H" .
            /* Mid credit limit customers */     
            ELSE IF eCustomer.CreditLimit > 50000 THEN 
                ASSIGN eCustomer.CustomerFlags = "M" .                                 
            
        END. 
        
        FOR EACH eSalesrep: // Either use BLOCK-LEVEL above or ON ERROR UNDO, THROW here
        
            ASSIGN eSalesrep.AverageQuota = (eSalesrep.MonthQuota_01 + eSalesrep.MonthQuota_02 + 
                                             eSalesrep.MonthQuota_03) / 3 .  
        
        END.

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Provides a hook for high level data validation before Update 
                 operations                                                                     
        Notes:   Invoked during SaveChanges (). When the ERROR flag of the ProDataset
                 is set, the Update operation will be cancelled before writing back
                 the data to the database using the DataAccess object                                                                      
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID ValidateData ():
        
        FOR EACH eCustomer
            WHERE ROW-STATE (eCustomer) = ROW-CREATED 
               OR ROW-STATE (eCustomer) = ROW-MODIFIED: // Either use BLOCK-LEVEL above or ON ERROR UNDO, THROW here
            BufferHelper:FindBeforeBuffer (BUFFER eCustomer:HANDLE) .
            
            IF eCustomer.Country = "USA" THEN DO:
                IF eCustomer.State = "" THEN 
                    ASSIGN BUFFER eCustomer:ERROR        = TRUE 
                           BUFFER eCustomer:ERROR-STRING = "USA Customers require a state" 
                           DATASET dsCustomer:ERROR      = TRUE .
            END.

            IF eCustomer.City = "" THEN 
                DatasetHelper:AddErrorString(BUFFER eCustomer:HANDLE, "City", 
                                             "We really need at least a city for shipping") .
        
            IF 
                ValidationHelper:IsNotNullOrEmpty(BUFFER eCustomer:HANDLE, "Name", "Name must not be empty")  
            THEN 
                ValidationHelper:MinLength(BUFFER eCustomer:HANDLE, "Name", 4, "Names must be at least 4 charasters long") .
                
            
            ValidationHelper:IsInList(BUFFER eCustomer:HANDLE, "City",
                                      "Boston,Cologne,Rotterdam,Brussels,Milano,Alphen,Osnabrück,Stuttgart",
                                      "Unknown city") .
        END.

        FOR EACH eCustomerBefore WHERE ROW-STATE (eCustomerBefore) = ROW-DELETED:
            
        END.

        @GeneratedValidationStart.
        /* The following code is auto-generated. Don't insert custom code 
           between the @GeneratedValidationStart. and @GeneratedValidationEnd.
           annotations as it would get overwritten when you update the Business
           entity. */

        FOR EACH eCustomer ON ERROR UNDO, THROW:
            Consultingwerk.OERA.ValidationHelper:IsNotNullOrEmpty (BUFFER eCustomer:HANDLE, "Address":U, "Address may not be empty.":U).
            Consultingwerk.OERA.ValidationHelper:IsNotNullOrEmpty (BUFFER eCustomer:HANDLE, "PostalCode":U, "ZIP code must be entered.":U).
        END .
        @GeneratedValidationEnd.
        
    END METHOD.

END CLASS.
