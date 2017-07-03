/**********************************************************************
 * Copyright (C) 2006-2013 by Consultingwerk Ltd. ("CW") -            *
 * www.consultingwerk.de and other contributors as listed             *
 * below.  All Rights Reserved.                                       *
 *                                                                    *
 *  Software is distributed on an "AS IS", WITHOUT WARRANTY OF ANY    *
 *   KIND, either express or implied.                                 *
 *                                                                    *
 *  Contributors:                                                     *
 *                                                                    *
 **********************************************************************/
/*------------------------------------------------------------------------
    File        : OrderDataAccess
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : Wed Feb 24 22:26:48 CET 2010
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.*                                FROM PROPATH .
USING Consultingwerk.SmartComponentsDemo.OERA.Sports2000.* FROM PROPATH .
USING Consultingwerk.SmartFramework.*                      FROM PROPATH .
USING Progress.Lang.*                                      FROM PROPATH .
USING Consultingwerk.Util.* FROM PROPATH.

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.OrderDataAccess
    INHERITS SmartDataAccess:

    {Consultingwerk/SmartComponentsDemo/OERA/Sports2000/dsOrder.i &ACCESS="PRIVATE" &REFERENCE-ONLY="REFERENCE-ONLY"}

    @DefineDataSourcesStart.
    DEFINE PRIVATE DATA-SOURCE src_Customer FOR Customer .
    DEFINE PRIVATE DATA-SOURCE src_Item FOR Item .
    DEFINE PRIVATE DATA-SOURCE src_Order FOR Order .
    DEFINE PRIVATE DATA-SOURCE src_OrderLine FOR OrderLine .
    DEFINE PRIVATE DATA-SOURCE src_Salesrep FOR Salesrep .
    @DefineDataSourcesEnd.

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderDataAccess (INPUT phDataset AS HANDLE):
        SUPER (INPUT phDataset).

        BindDataset (DATASET-HANDLE phDataset BIND) .

        THIS-OBJECT:ForceApplyQueryOnChildTables = FALSE .

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID AttachDataSources ():

        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsOrder:HANDLE, FALSE) .

        @AttachDataSourcesStart.
        BUFFER eCustomer:ATTACH-DATA-SOURCE (DATA-SOURCE src_Customer:HANDLE, "CustNum,Customer.CustNum,Country,Customer.Country,Name,Customer.Name,Address,Customer.Address,Address2,Customer.Address2,City,Customer.City,State,Customer.State,PostalCode,Customer.PostalCode,Contact,Customer.Contact,Phone,Customer.Phone,SalesRep,Customer.SalesRep,CreditLimit,Customer.CreditLimit,Balance,Customer.Balance,Terms,Customer.Terms,Discount,Customer.Discount,Comments,Customer.Comments,Fax,Customer.Fax,EmailAddress,Customer.EmailAddress":U) .
        BUFFER eItem:ATTACH-DATA-SOURCE (DATA-SOURCE src_Item:HANDLE, "Itemnum,Item.Itemnum,ItemName,Item.ItemName,Price,Item.Price,Onhand,Item.Onhand,Allocated,Item.Allocated,ReOrder,Item.ReOrder,OnOrder,Item.OnOrder,CatPage,Item.CatPage,CatDescription,Item.CatDescription,Category1,Item.Category1,Category2,Item.Category2,Special,Item.Special,Weight,Item.Weight,Minqty,Item.Minqty":U) .
        BUFFER eOrder:ATTACH-DATA-SOURCE (DATA-SOURCE src_Order:HANDLE, "Ordernum,Order.Ordernum,CustNum,Order.CustNum,OrderDate,Order.OrderDate,ShipDate,Order.ShipDate,PromiseDate,Order.PromiseDate,Carrier,Order.Carrier,Instructions,Order.Instructions,PO,Order.PO,Terms,Order.Terms,SalesRep,Order.SalesRep,BillToID,Order.BillToID,ShipToID,Order.ShipToID,OrderStatus,Order.OrderStatus,WarehouseNum,Order.WarehouseNum,Creditcard,Order.Creditcard":U) .
        BUFFER eOrderLine:ATTACH-DATA-SOURCE (DATA-SOURCE src_OrderLine:HANDLE, "Ordernum,OrderLine.Ordernum,Linenum,OrderLine.Linenum,Itemnum,OrderLine.Itemnum,Price,OrderLine.Price,Qty,OrderLine.Qty,Discount,OrderLine.Discount,ExtendedPrice,OrderLine.ExtendedPrice,OrderLineStatus,OrderLine.OrderLineStatus":U) .
        BUFFER eSalesrep:ATTACH-DATA-SOURCE (DATA-SOURCE src_Salesrep:HANDLE, "SalesRep,Salesrep.SalesRep,RepName,Salesrep.RepName,Region,Salesrep.Region,MonthQuota01,Salesrep.MonthQuota[1],MonthQuota02,Salesrep.MonthQuota[2],MonthQuota03,Salesrep.MonthQuota[3],MonthQuota04,Salesrep.MonthQuota[4],MonthQuota05,Salesrep.MonthQuota[5],MonthQuota06,Salesrep.MonthQuota[6],MonthQuota07,Salesrep.MonthQuota[7],MonthQuota08,Salesrep.MonthQuota[8],MonthQuota09,Salesrep.MonthQuota[9],MonthQuota10,Salesrep.MonthQuota[10],MonthQuota11,Salesrep.MonthQuota[11],MonthQuota12,Salesrep.MonthQuota[12],SmallImage,Salesrep.SmallImage,LargeImage,Salesrep.LargeImage,Email,Salesrep.Email,PhoneMobile,Salesrep.PhoneMobile,PhoneOffice,Salesrep.PhoneOffice,PhonePrivate,Salesrep.PhonePrivate":U) .
        @AttachDataSourcesEnd.

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Do nothing, just receive the parameter and bind to the received
                 Dataset reference
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID BindDataset (DATASET dsOrder BIND):
        /* NOOP */
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID DefineReadEvents ():

/*          BUFFER eOrder:SET-CALLBACK-PROCEDURE                          */
/*                    ("AFTER-FILL", "eOrderAfterFill", TARGET-PROCEDURE).*/

/*        BUFFER eOrder:SET-CALLBACK ("AFTER-ROW-FILL", "eOrderAfterRowFill") .*/
        BUFFER eOrder:SET-CALLBACK ("AFTER-FILL", "eOrderAfterFill") .

        DATASET dsOrder:SET-CALLBACK ("BEFORE-FILL", "dsOrderBeforeFill") .

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID DetachDataSources ():

        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsOrder:HANDLE, FALSE) .

        @DetachDataSourcesStart.
        BUFFER eCustomer:DETACH-DATA-SOURCE () .
        BUFFER eItem:DETACH-DATA-SOURCE () .
        BUFFER eOrder:DETACH-DATA-SOURCE () .
        BUFFER eOrderLine:DETACH-DATA-SOURCE () .
        BUFFER eSalesrep:DETACH-DATA-SOURCE () .
        @DetachDataSourcesEnd.

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Callback method for the BEFORE-FILL event of dsOrder
        Notes:
        @param dsOrder The Dataset
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID dsOrderBeforeFill (DATASET dsOrder):

/*                                                                     */
/*         MESSAGE BUFFER eOrderLine:DATA-SOURCE:fill-where-string SKIP*/
/*                                                                     */
/*                BUFFER eSalesrep:DATA-SOURCE:fill-where-string       */
/*             VIEW-AS ALERT-BOX.                                      */

    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID eOrderAfterRowFill (DATASET dsOrder):

/*        eOrder.Instructions = UPPER (eOrder.Instructions) .*/

        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
            Purpose:
            Notes:
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID eOrderAfterFill (DATASET dsOrder):

/*        FOR EACH eOrder:                                       */
/*            eOrder.Instructions = UPPER (eOrder.Instructions) .*/
/*        END.                                                   */

    END METHOD.


    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID eOrderCreateBeginTrans ():

        FIND eOrder WHERE ROWID(eOrder) = BUFFER eOrderBefore:AFTER-ROWID
            NO-ERROR .

        ASSIGN eOrder.Instructions = "Created " + STRING (NOW)
               eOrder.Ordernum     = NEXT-VALUE (NextOrdNum) .

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID eOrderLineDeleteEndTrans ():

/*        MESSAGE "delete end" AVAILABLE (eOrderLineBefore) eOrderLineBefore.Linenum*/
/*        VIEW-AS ALERT-BOX.                                                  */

/*        MESSAGE AVAILABLE (eOrderLineBefore)*/
/*            VIEW-AS ALERT-BOX.              */

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID eOrderModifyBeginTrans ():

        FIND eOrder WHERE ROWID(eOrder) = BUFFER eOrderBefore:AFTER-ROWID
            NO-ERROR .

        IF eOrderBefore.OrderDate <> eOrder.OrderDate AND
           eOrderBefore.OrderDate <> ? THEN
            Consultingwerk.Util.DatasetHelper:SetErrorString
                (BUFFER eOrderBefore:HANDLE,
                 FieldValidationError:Format ("OrderDate",
                                              "Order Date cannot be modified.")) .

        IF eOrderBefore.ShipDate <> eOrder.ShipDate AND
           eOrderBefore.ShipDate <> ? THEN
            Consultingwerk.Util.DatasetHelper:SetErrorString
                (BUFFER eOrderBefore:HANDLE,
                 FieldValidationError:Format ("ShipDate",
                                              "Order is already shipped. Ship Date cannot be modified.")) .
    END METHOD.
/*                                                                                                                       */
/*    /*------------------------------------------------------------------------------                                   */
/*        Purpose:                                                                                                       */
/*        Notes:                                                                                                         */
/*        @param parameter1 Description                                                                                  */
/*        @return                                                                                                        */
/*    ------------------------------------------------------------------------------*/                                   */
/*    METHOD OVERRIDE PROTECTED LOGICAL DatasetFill (phDataset AS HANDLE,                                                   */
/*                                                   poFetchDataRequest AS Consultingwerk.OERA.IFetchDataRequest):          */
/*                                                                                                                               */
/*        DEFINE VARIABLE hBuffer AS HANDLE NO-UNDO.                                                                           */
/*        DEFINE VARIABLE cQuery  AS CHARACTER NO-UNDO.                                                                  */
/*        DEFINE VARIABLE iIndex  AS INTEGER NO-UNDO.                                                                       */
/*        DEFINE VARIABLE i       AS INTEGER NO-UNDO.                                                                       */
/*        DEFINE VARIABLE iBuffer AS INTEGER NO-UNDO.                                                                       */
/*                                                                                                                           */
/*                                                                                                                               */
/*        DO iBuffer = 1 TO phDataset:NUM-BUFFERS:                                                                             */
/*                                                                                                                       */
/*            ASSIGN hBuffer = phDataset:GET-BUFFER-HANDLE (iBuffer) .                                                   */
/*                                                                                                                               */
/*            IF VALID-HANDLE (hBuffer:DATA-SOURCE) AND LOOKUP (hBuffer:NAME, poFetchDataRequest:Tables) > 1 THEN DO:          */
/*                                                                                                                       */
/*                 ASSIGN cQuery = THIS-OBJECT:SourceDefaultQuery (hBuffer:NAME) .                                       */
/*                                                                                                                       */
/*                 ASSIGN iIndex = LOOKUP ("WHERE":U, cQuery, " ":U) .                                                   */
/*                                                                                                                       */
/*                 IF iIndex = 0 THEN NEXT .                                                                             */
/*                                                                                                                       */
/*                 DO i = 1 TO iIndex:                                                                                   */
/*                        ENTRY (i, cQuery, " ":U) = "":U .                                                              */
/*                 END.                                                                                                  */
/*                                                                                                                       */
/*                                                                                                                       */
/*                 IF hBuffer:DATA-SOURCE:FILL-WHERE-STRING > "" THEN DO:                                                */
/*                     hBuffer:DATA-SOURCE:FILL-WHERE-STRING = hBuffer:DATA-SOURCE:FILL-WHERE-STRING + " AND " + cQuery .*/
/*                 END.                                                                                                  */
/*                 ELSE                                                                                                  */
/*                     BUFFER eOrderLine:DATA-SOURCE:FILL-WHERE-STRING = "WHERE " + cQuery  .                               */
/*                                                                                                                                   */
/*            END.                                                                                                             */
/*        END.                                                                                                                 */
/*                                                                                                                               */
/*        SUPER:DatasetFill (phDataset, poFetchDataRequest).                                                                   */
/*                                                                                                                       */
/*    END METHOD .                                                                                                          */

    /*------------------------------------------------------------------------------
        Purpose: Finds a record and returns the Database RECID
        Notes:
        @param poParameter The GetRecidParameter with the data for this method
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID FindRecid (poParameter AS GetRecidParameter):

        DEFINE VARIABLE roRowid AS ROWID EXTENT  NO-UNDO .
        DEFINE VARIABLE hBuffer AS HANDLE        NO-UNDO .
        DEFINE VARIABLE i       AS INTEGER       NO-UNDO .

        DEFINE VARIABLE cFind   AS CHARACTER     NO-UNDO .
        DEFINE VARIABLE iCount  AS INTEGER       NO-UNDO .
        DEFINE VARIABLE cRecids AS LONGCHAR      NO-UNDO .

        AttachDataSources() .

        ASSIGN iCount = NUM-ENTRIES (poParameter:QueryString, CHR (1)) .

        DO i = 1 TO iCount:
            ASSIGN cFind = ENTRY (i, poParameter:QueryString, CHR (1)) .

            roRowid = FindRecord (cFind,
                                  DATASET dsOrder:GET-BUFFER-HANDLE (poParameter:Buffer),
                                  SourceDefaultQuery (poParameter:Buffer),
                                  0,
                                  0) .

            ASSIGN hBuffer = DATASET dsOrder:GET-BUFFER-HANDLE (poParameter:Buffer):DATA-SOURCE:GET-SOURCE-BUFFER (1) .

            hBuffer:FIND-BY-ROWID (roRowid) .

            ASSIGN cRecids = cRecids + (IF cRecids > "":U THEN ",":U ELSE "":U) +
                             STRING (hBuffer:RECID) .
        END.

        poParameter:Recid = cRecids.

        FINALLY:
            DetachDataSources()     .
        END FINALLY.

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID OnHandleCommitSysError (e AS Consultingwerk.OERA.HandleCommitErrorEventArgs):

        SUPER:OnHandleCommitSysError (e).

        IF NOT e:Handled THEN DO:
            IF e:Error:GetMessageNum (1) = 132 AND e:BufferHandle:AFTER-BUFFER:NAME = "eOrderLine" THEN DO:

                DatasetHelper:AddErrorString (e:BufferHandle, "Looks like we have duplicate keys for orderline.") .

                e:Handled = TRUE .
            END.
        END.

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC CHARACTER SourceColumn (pcTable AS CHARACTER,
                                                   pcColumn AS CHARACTER):

        DEFINE VARIABLE cMap  AS CHARACTER NO-UNDO.

        @SourceColumnCaseBlock.
        CASE pcTable:
            WHEN 'eOrder' THEN
            DO:
              cMap = DATA-SOURCE src_order:get-dataset-buffer:data-source-complete-map.
            END.
            WHEN 'eOrderLine' THEN
            DO:
              cMap = DATA-SOURCE src_orderline:get-dataset-buffer:data-source-complete-map.
            END.
            WHEN 'eSalesRep' THEN
            DO:
              cMap = DATA-SOURCE src_SalesRep:get-dataset-buffer:data-source-complete-map.
            END.
            WHEN 'eCustomer' THEN
            DO:
              cMap = DATA-SOURCE src_Customer:get-dataset-buffer:data-source-complete-map.
            END.
            WHEN "eItem":U THEN
                cMap = DATA-SOURCE src_Item:GET-DATASET-BUFFER:DATA-SOURCE-COMPLETE-MAP .
        END CASE .

        RETURN ENTRY(LOOKUP(pccolumn,cMap) + 1,cMap).

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC CHARACTER SourceDefaultQuery (pcTable AS CHARACTER):

        @SourceDefaultQueryCaseBlock.
        CASE pcTable:
            WHEN 'eOrder' THEN
              RETURN 'FOR EACH Order INDEXED-REPOSITION'.
            WHEN 'eOrderLine' THEN
              RETURN 'FOR EACH OrderLine INDEXED-REPOSITION'.
            WHEN 'eSalesRep' THEN
                RETURN 'FOR EACH SalesRep INDEXED-REPOSITION'.
            WHEN 'eCustomer' THEN
                RETURN 'FOR EACH Customer INDEXED-REPOSITION'.
            WHEN "eItem":U THEN
                RETURN "FOR EACH Item INDEXED-REPOSITION":U.
        END CASE .

    END METHOD.

END CLASS.
