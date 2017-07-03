/*------------------------------------------------------------------------
    File        : CustomerDataAccess
    Purpose     : Data Access Component 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 03.07.2017 17:42:21 
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING TrainingSamples.BusinessLogik.CustomerWithReposition.* FROM PROPATH .
USING Consultingwerk.SmartFramework.* FROM PROPATH .
USING Consultingwerk.OERA.*           FROM PROPATH .
USING Consultingwerk.Util.*           FROM PROPATH . 
USING Progress.Lang.*                 FROM PROPATH .
USING ProgressPS.CustomClasses.OERA.* FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerBusinessEntity", type="DataAccess") .

CLASS TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerDataAccess 
    INHERITS PscDataAccess
    USE-WIDGET-POOL: 

    { TrainingSamples/BusinessLogik/CustomerWithReposition/dsCustomer.i &ACCESS="PRIVATE" &REFERENCE-ONLY="REFERENCE-ONLY"}

    @DefineDataSourcesStart.
    DEFINE PRIVATE DATA-SOURCE src_Customer FOR Customer .
    DEFINE PRIVATE DATA-SOURCE src_Salesrep FOR Salesrep .
    @DefineDataSourcesEnd.

    @DefineDataSourceInformationStart.
    @DefineDataSourceInformationEnd.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CustomerDataAccess class                                                                      
        Notes:   Used by the BusinessEntity, will receive the handle of the dataset
                 instance form the BusinessEntity as a parameter. Permanently BIND's
                 to that dataset using the PRIVATE BindDataset Method.                                                                        
        @param phDataset The handle of the Business Entity dataset 
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerDataAccess (phDataset AS HANDLE):
        SUPER (INPUT phDataset).
        
        BindDataset (DATASET-HANDLE phDataset BIND) .
        
        /* Fields that are not assigned to the database record when a new record is created. */
        /* THIS-OBJECT:AssignSkipList = "<key fields>":U. */
        
        
        /* Mike Fechner, Consultingwerk Ltd. 01.07.2014
           SCL-334: By default, prepare queries of joined data source 
                    queries. This behavior is the new default, and should
                    only be set to FALSE, when customers are already manipulating
                    the data-source query in code (e.g. QUERY-PREPARE in a BEFORE-FILL
                    call back) */
        THIS-OBJECT:PrepareJoinedChildTableQueries = TRUE . 
        
        /* Allows to force applying the Source Default Query to child tables
           even when no filter expression was provided by the consumer */
        /* THIS-OBJECT:ForceApplyQueryOnChildTables = FALSE . */ 
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Attaches the DATA-SOURCE objects to the ProDataset Buffers                                                                      
        Notes:   Overrides ABSTRACT method in Consultingwerk.OERA.DataAccess,
                 Invoked in FetchData and SaveChanges
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID AttachDataSources ():
        
        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsCustomer:HANDLE, FALSE) .
        
        @AttachDataSourcesStart.
        THIS-OBJECT:AttachDataSource (BUFFER eCustomer:HANDLE,
                                      DATA-SOURCE src_Customer:HANDLE, "
                                      CustNum,Customer.CustNum,
                                      Country,Customer.Country,
                                      Name,Customer.Name,
                                      Address,Customer.Address,
                                      Address2,Customer.Address2,
                                      City,Customer.City,
                                      State,Customer.State,
                                      PostalCode,Customer.PostalCode,
                                      Contact,Customer.Contact,
                                      Phone,Customer.Phone,
                                      SalesRep,Customer.SalesRep,
                                      CreditLimit,Customer.CreditLimit,
                                      Balance,Customer.Balance,
                                      Terms,Customer.Terms,
                                      Discount,Customer.Discount,
                                      Comments,Customer.Comments,
                                      Fax,Customer.Fax,
                                      EmailAddress,Customer.EmailAddress":U) .
        THIS-OBJECT:AttachDataSource (BUFFER eSalesrep:HANDLE,
                                      DATA-SOURCE src_Salesrep:HANDLE, "
                                      SalesRep,Salesrep.SalesRep,
                                      RepName,Salesrep.RepName,
                                      Region,Salesrep.Region,
                                      MonthQuota_01,Salesrep.MonthQuota[1],
                                      MonthQuota_02,Salesrep.MonthQuota[2],
                                      MonthQuota_03,Salesrep.MonthQuota[3],
                                      MonthQuota_04,Salesrep.MonthQuota[4],
                                      MonthQuota_05,Salesrep.MonthQuota[5],
                                      MonthQuota_06,Salesrep.MonthQuota[6],
                                      MonthQuota_07,Salesrep.MonthQuota[7],
                                      MonthQuota_08,Salesrep.MonthQuota[8],
                                      MonthQuota_09,Salesrep.MonthQuota[9],
                                      MonthQuota_10,Salesrep.MonthQuota[10],
                                      MonthQuota_11,Salesrep.MonthQuota[11],
                                      MonthQuota_12,Salesrep.MonthQuota[12],
                                      SmallImage,Salesrep.SmallImage,
                                      LargeImage,Salesrep.LargeImage,
                                      Email,Salesrep.Email,
                                      PhoneOffice,Salesrep.PhoneOffice,
                                      PhonePrivate,Salesrep.PhonePrivate,
                                      PhoneMobile,Salesrep.PhoneMobile":U) .
        @AttachDataSourcesEnd.
        
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Do nothing, just receive the parameter and bind to the received 
                 Dataset reference                                                                    
        Notes:   Invoked from the class constructor   
        @param dsCustomer DATASET to bind to                                                                     
    ------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID BindDataset (DATASET dsCustomer BIND):
        /* NOOP */
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: TO-DO: Subscribe to ProDataset Event Handlers using SET-CALLBACK
                 as needed                                                                      
        Notes:   Overrides ABSTRACT method in Consultingwerk.OERA.DataAccess,
                 Invoked in FetchData, note that the callback methods need to be 
                 PUBLIC and need to have the Dataset defined as an INPUT Parameter.
                 Errors thrown from or raised in the FILL call-back methods of the 
                 DataAccess class (SET-CALLBACK) will stop the Dataset from getting 
                 filled / filled further. However errors thrown from the call-back 
                 methods are not thrown from the FILL() method further up into a 
                 catch block or to the client.  
                 See http://knowledgebase.progress.com/articles/Article/P188375
        Sample:  BUFFER eCustomer:SET-CALLBACK (Consultingwerk.DatasetBufferCallbackEnum:AfterFill,
                                                "eCustomerAfterFill":U) .                 
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID DefineReadEvents ():
        
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Detaches the DATA-SOURCE objects to the ProDataset Buffers                                                                      
        Notes:   Overrides ABSTRACT method in Consultingwerk.OERA.DataAccess,
                 Invoked in FetchData and SaveChanges
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID DetachDataSources ():

        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsCustomer:HANDLE, FALSE) .
    
        @DetachDataSourcesStart.
        BUFFER eCustomer:DETACH-DATA-SOURCE () .
        BUFFER eSalesrep:DETACH-DATA-SOURCE () .
        @DetachDataSourcesEnd.
        
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Returns the database field name matching a temp-table field name
                 contained in a consumers query string (query string vs. temp-table
                 definition) 
        Notes:   Call-back used by Consultingwerk.OERA.Query.DSQueryString (part of 
                 DataAccess:FetchData () query preparation                        
                 TO-DO: Provide code for alternative mapping                                             
        @param pcTable The temp table name to return the source (database table) field name for
        @param pcColumn The temp table column name to return the source (database table) field name for             
        @return The database field name mapped to the passed in temp-table field
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC CHARACTER SourceColumn (pcTable AS CHARACTER, pcColumn AS CHARACTER):

        DEFINE VARIABLE cMap  AS CHARACTER NO-UNDO.
        DEFINE VARIABLE iPos  AS INTEGER   NO-UNDO .
            
        @SourceColumnCaseBlock.
        CASE pcTable:
            WHEN "eCustomer":U THEN
                cMap = DATA-SOURCE src_Customer:GET-DATASET-BUFFER:DATA-SOURCE-COMPLETE-MAP . 
            WHEN "eSalesrep":U THEN
                cMap = DATA-SOURCE src_Salesrep:GET-DATASET-BUFFER:DATA-SOURCE-COMPLETE-MAP . 

        END CASE .
     
        ASSIGN iPos = LOOKUP(pcColumn, cMap) .
        
        IF iPos MODULO 2 = 1 THEN  
            RETURN ENTRY(LOOKUP(pcColumn,cMap) + 1,cMap).    
        ELSE 
            RETURN "":U . 

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Returns the base query string used to retrieve data for the temp
                 tables. This query string will be appended by the query provided by
                 the consumer (FetchDataRequest object).                                                                      
        Notes:   Call-back used by Consultingwerk.OERA.Query.DSQueryString (part of 
                 DataAccess:FetchData () query preparation                        
                 TO-DO: Provide code to return the DATA-SOURCE root query string                                             
        @param pcTable The temp table name to return the source default (database) query string for
        @return The base query string used to retrieve data for the given temp-table
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC CHARACTER SourceDefaultQuery (pcTable AS CHARACTER):
    
        @SourceDefaultQueryCaseBlock.
        CASE pcTable:
            WHEN "eCustomer":U THEN
                RETURN "FOR EACH Customer INDEXED-REPOSITION":U. 
            WHEN "eSalesrep":U THEN
                RETURN "FOR EACH Salesrep INDEXED-REPOSITION":U. 

        END CASE . 
        
    END METHOD.

END CLASS.
