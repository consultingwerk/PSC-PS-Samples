/*------------------------------------------------------------------------
    File        : OrderDataAccess
    Purpose     : Data Access Component 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04.07.2017 13:46:39 
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING TrainingSamples.BusinessLogik.Order.* FROM PROPATH .
USING Consultingwerk.SmartFramework.* FROM PROPATH .
USING Consultingwerk.OERA.*           FROM PROPATH .
USING Consultingwerk.Util.*           FROM PROPATH . 
USING Progress.Lang.*                 FROM PROPATH .
USING ProgressPS.CustomClasses.OERA.* FROM PROPATH .
USING Consultingwerk.* FROM PROPATH.

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Order.OrderBusinessEntity", type="DataAccess") .

CLASS TrainingSamples.BusinessLogik.Order.OrderDataAccess 
    INHERITS PscDataAccess
    USE-WIDGET-POOL: 

    { TrainingSamples/BusinessLogik/Order/dsOrder.i &ACCESS="PRIVATE" &REFERENCE-ONLY="REFERENCE-ONLY"}

    @DefineDataSourcesStart.
    DEFINE PRIVATE DATA-SOURCE src_Order FOR Order .
    DEFINE PRIVATE DATA-SOURCE src_OrderLine FOR OrderLine .
    @DefineDataSourcesEnd.

    @DefineDataSourceInformationStart.
    @DefineDataSourceInformationEnd.

    DEFINE VARIABLE oOrderDataSource AS IBufferDataSource NO-UNDO . 

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the OrderDataAccess class                                                                      
        Notes:   Used by the BusinessEntity, will receive the handle of the dataset
                 instance form the BusinessEntity as a parameter. Permanently BIND's
                 to that dataset using the PRIVATE BindDataset Method.                                                                        
        @param phDataset The handle of the Business Entity dataset 
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderDataAccess (phDataset AS HANDLE):
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
        
        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsOrder:HANDLE, FALSE) .
        
        @AttachDataSourcesStart.
        THIS-OBJECT:AttachDataSource (BUFFER eOrder:HANDLE,
                                      DATA-SOURCE src_Order:HANDLE, "
                                      Ordernum,Order.Ordernum,
                                      KlantenNo,Order.CustNum,
                                      OrderDate,Order.OrderDate,
                                      ShipDate,Order.ShipDate,
                                      PromiseDate,Order.PromiseDate,
                                      Carrier,Order.Carrier,
                                      Instructions,Order.Instructions,
                                      PO,Order.PO,
                                      Terms,Order.Terms,
                                      SalesRep,Order.SalesRep,
                                      BillToID,Order.BillToID,
                                      ShipToID,Order.ShipToID,
                                      OrderStatus,Order.OrderStatus,
                                      WarehouseNum,Order.WarehouseNum,
                                      Creditcard,Order.Creditcard":U) .
        THIS-OBJECT:AttachDataSource (BUFFER eOrderLine:HANDLE,
                                      DATA-SOURCE src_OrderLine:HANDLE, "
                                      Ordernum,OrderLine.Ordernum,
                                      Linenum,OrderLine.Linenum,
                                      Itemnum,OrderLine.Itemnum,
                                      Price,OrderLine.Price,
                                      Qty,OrderLine.Qty,
                                      Discount,OrderLine.Discount,
                                      ExtendedPrice,OrderLine.ExtendedPrice,
                                      OrderLineStatus,OrderLine.OrderLineStatus":U) .
        @AttachDataSourcesEnd.
        
        DEFINE VARIABLE cMapping AS CHARACTER NO-UNDO.
        IF VALID-OBJECT (oOrderDataSource) THEN DO:
            ASSIGN cMapping = BUFFER eOrder:DATA-SOURCE-COMPLETE-MAP .
            BUFFER eORder:DETACH-DATA-SOURCE () .
            THIS-OBJECT:AttachDataSource(BUFFER eOrder:HANDLE, oOrderDataSource, cMapping) .
        END.
        
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Do nothing, just receive the parameter and bind to the received 
                 Dataset reference                                                                    
        Notes:   Invoked from the class constructor   
        @param dsOrder DATASET to bind to                                                                     
    ------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID BindDataset (DATASET dsOrder BIND):
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
        
        BUFFER eOrderLine:SET-CALLBACK ("BEFORE-FILL":U, "eOrderLineBeforeFill":U, THIS-OBJECT).

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Detaches the DATA-SOURCE objects to the ProDataset Buffers                                                                      
        Notes:   Overrides ABSTRACT method in Consultingwerk.OERA.DataAccess,
                 Invoked in FetchData and SaveChanges
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID DetachDataSources ():

        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsOrder:HANDLE, FALSE) .
    
        @DetachDataSourcesStart.
        BUFFER eOrder:DETACH-DATA-SOURCE () .
        BUFFER eOrderLine:DETACH-DATA-SOURCE () .
        @DetachDataSourcesEnd.
        
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Callback method for the BEFORE-FILL event of eOrderLine
        Notes:   Errors thrown from or raised in the FILL call-back methods of the 
                 DataAccess class (SET-CALLBACK) will stop the Dataset from getting 
                 filled / filled further. However errors thrown from the call-back 
                 methods are not thrown from the FILL() method further up into a 
                 catch block or to the client.  
                 See http://knowledgebase.progress.com/articles/Article/P188375
        @param dsOrder The Dataset   
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID eOrderLineBeforeFill (DATASET dsOrder):
    
        THIS-OBJECT:SuggestDataSourceIndex (BUFFER eOrderLine:HANDLE, "orderline":U) .    
        
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Detaches the DATA-SOURCE objects to the ProDataset Buffers                                                                      
        Notes:   Overrides ABSTRACT method in Consultingwerk.OERA.DataAccess,
                 Invoked in FetchData and SaveChanges
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID FetchData (poFetchDataRequest AS IFetchDataRequest):
    
        DEFINE VARIABLE oQueryParser     AS QueryParser      NO-UNDO .
        DEFINE VARIABLE oQueryExpression AS IQueryExpression NO-UNDO .
        DEFINE VARIABLE cQueryString     AS CHARACTER        NO-UNDO .
 
        /* Only try to filter by eCustomer.ItemNum or eCustomer.RepName, when eCustomer is the first requested table */
        IF ENTRY (1, THIS-OBJECT:ExpandTables (poFetchDataRequest:Tables)) = "eOrder":U THEN DO:
 
            cQueryString = ENTRY (1, poFetchDataRequest:Queries, CHR(1)) .
 
            /* Parse QueryString of the request into a list of query predicates */
            oQueryParser = NEW QueryParser () .
            oQueryExpression = oQueryParser:ParseQueryString (cQueryString) .
 
            /* Filter by ItemNum ? */                                          /* In the client query, it's ways filtered relatively to the TT's */
            IF VALID-OBJECT (QueryExpression:FindQueryExpressionForBufferField (BufferHelper:ParseFieldName ("eOrder.ItemName":U),
                                                                                oQueryExpression)) THEN
                ASSIGN oOrderDataSource = NEW BufferDataSource ("Item", "OrderLine",
                                                                "Order") .
        END.        

        SUPER:FetchData (poFetchDataRequest) .
        
        FINALLY:
            GarbageCollectorHelper:DeleteObject(oOrderDataSource) .                    
        END FINALLY.

    END METHOD .

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
       
        IF VALID-OBJECT (oOrderDataSource) THEN 
            CASE pcColumn:
                WHEN "eOrder.ItemName" THEN
                    RETURN "Item.ItemName".
/*                WHEN "eOrder.KlantenNo" THEN*/
/*                    RETURN "Order.CustNum" .*/
            END CASE .            
            
        @SourceColumnCaseBlock.
        CASE pcTable:
            WHEN "eOrder":U THEN
                cMap = BUFFER eOrder:DATA-SOURCE-COMPLETE-MAP . 
            WHEN "eOrderLine":U THEN
                cMap = BUFFER eOrderLine:DATA-SOURCE-COMPLETE-MAP . 

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
    
        DEFINE VARIABLE cUserId AS CHARACTER NO-UNDO INIT "HXM".
    
        IF VALID-OBJECT (oOrderDataSource) THEN 
            RETURN SUBSTITUTE ("FOR EACH Item,each OrderLine of Item,each Order of Orderline where Order.Salesrep = &1":U,
                                   QUOTER (cUserId)) .
    
        @SourceDefaultQueryCaseBlock.
        CASE pcTable:
            WHEN "eOrder":U THEN
                RETURN SUBSTITUTE ("FOR EACH Order where Order.Salesrep = '&1' use-index OrderDate":U,
                                   cUserId) . 
            WHEN "eOrderLine":U THEN
                RETURN "FOR EACH OrderLine":U. 

        END CASE . 
        
    END METHOD.

END CLASS.
