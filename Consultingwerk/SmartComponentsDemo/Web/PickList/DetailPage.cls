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
    File        : DetailPage
    Purpose     : Order Details page with ability to process BPM tasks
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : Fri Oct 19 06:54:42 CEST 2012
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

{Consultingwerk/products.i}

USING Consultingwerk.*                                  FROM PROPATH .
USING Consultingwerk.SmartComponentsDemo.Web.PickList.* FROM PROPATH .
USING Consultingwerk.Web.*                              FROM PROPATH .
USING Consultingwerk.Web.Widgets.*                      FROM PROPATH .
USING Consultingwerk.Web.Widgets.Grid.*                 FROM PROPATH .
USING Consultingwerk.Web.Widgets.Ribbon.*               FROM PROPATH .
USING Progress.Lang.*                                   FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.Web.PickList.DetailPage INHERITS Page IMPLEMENTS IPage:

    DEFINE VARIABLE oRibbon AS SmartWebRibbon NO-UNDO .
    DEFINE VARIABLE oHeader AS SmartWebViewer NO-UNDO .
    DEFINE VARIABLE oGrid   AS SmartWebGrid   NO-UNDO .

    DEFINE VARIABLE cProcessID AS CHARACTER   NO-UNDO .

    {Consultingwerk/SmartComponentsDemo/OERA/Sports2000/dsOrder.i}
    &IF DEFINED (OpenEdgeBPM) NE 0 &THEN
    {Consultingwerk/BPM/Schema/dsWorkItem.i}
    &ENDIF

    DEFINE QUERY qHeader FOR eOrder, eCustomer .
    DEFINE QUERY qQuery FOR eOrderLine, eItem .

    DEFINE VARIABLE oProcessIdHiddenField AS Consultingwerk.Web.Widgets.HiddenField NO-UNDO .

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the DetailPage class
        Notes:
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC DetailPage ():
        SUPER ().

        THIS-OBJECT:BuildRibbon () .
        THIS-OBJECT:BuildViewer () .
        THIS-OBJECT:BuildGrid () .

        IF NOT VALID-HANDLE (Consultingwerk.Framework.Session.SessionManager:ContextDataset) THEN DO:

            DEFINE VARIABLE oContextDatasetFactory AS Consultingwerk.OERA.Context.IContextDatasetFactory NO-UNDO .
            oContextDatasetFactory = NEW Consultingwerk.OERA.Context.ContextDatasetFactory () .
            Consultingwerk.Framework.Session.SessionManager:ContextDataset = oContextDatasetFactory:CreateContextDataset() .
        END.

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Event handler for the BuildUrl Event
        Notes:
        @param sender The object that raised the event
        @param e The BuildIamgeUrlEventArgs with the data for this event
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID AppendOrderNumToImageUrlHandler (sender AS Progress.Lang.Object,
                                                           e AS BuildUrlEventArgs):

        e:Url = e:Url + SUBSTITUTE ("&&OrderNum=&1&&ProcessID=&2":U, eOrderLine.OrderNum,cProcessID) .

    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Builds the Ribbon for the Page
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID BuildGrid ():

        DEFINE VARIABLE oColumn      AS GridColumn            NO-UNDO .
        DEFINE VARIABLE oImageColumn AS LinkGridColumn        NO-UNDO .

        ASSIGN oGrid   = NEW SmartWebGrid ("OrderLineGrid":U) .

        oColumn = oGrid:Columns:Add (NEW GridColumn (BUFFER eOrderLine:BUFFER-FIELD ("LineNum":U))) .
        oColumn = oGrid:Columns:Add (NEW GridColumn (BUFFER eOrderLine:BUFFER-FIELD ("ItemNum":U))) .

        oImageColumn = CAST (oGrid:Columns:Add (NEW LinkGridColumn (BUFFER eOrderLine:BUFFER-FIELD ("ItemNum":U))),
                             LinkGridColumn) .

        oImageColumn:ColumnDisplayType = ColumnDisplayTypeEnum:Image .
        oImageColumn:ColumnLabel = " ":U .
        oImageColumn:AltText = "Pick" .
        oImageColumn:Image = "item.png":U .
        oImageColumn:Hyperlink = "#":U .
        oImageColumn:Width = "80":U .
        oImageColumn:Format = ? .

        oImageColumn:ImageAttributes = 'width="72" height="48"':U .

        oImageColumn:BuildImageUrl:Subscribe (BuildImageUrlHandler) .

        oColumn = oGrid:Columns:Add (NEW GridColumn (BUFFER eItem:BUFFER-FIELD ("ItemName":U))).
        oColumn:Width = "400":U .
        oColumn = oGrid:Columns:Add (NEW GridColumn (BUFFER eOrderLine:BUFFER-FIELD ("OrderLineStatus":U))) .

        oImageColumn = CAST (oGrid:Columns:Add (NEW LinkGridColumn (BUFFER eOrderLine:BUFFER-FIELD ("LineNum":U))),
                             LinkGridColumn) .

        oImageColumn:ColumnDisplayType = ColumnDisplayTypeEnum:Image .
        oImageColumn:ColumnLabel = " ":U .
        oImageColumn:AltText = "Pick" .
        oImageColumn:Image = "/PickList/box_preferences.png":U .
        oImageColumn:Hyperlink = "DetailPage?Action=Shipped&&LineNum=&1":U .
        oImageColumn:Width = "50":U .
        oImageColumn:Format = ? .

        oImageColumn:BuildUrl:Subscribe (AppendOrderNumToImageUrlHandler) .


        oImageColumn = CAST (oGrid:Columns:Add (NEW LinkGridColumn (BUFFER eOrderLine:BUFFER-FIELD ("LineNum":U))),
                             LinkGridColumn) .

        oImageColumn:ColumnDisplayType = ColumnDisplayTypeEnum:Image .
        oImageColumn:ColumnLabel = " ":U .
        oImageColumn:AltText = "Back Order" .
        oImageColumn:Image = "/PickList/shelf_empty.png":U .
        oImageColumn:Hyperlink = "DetailPage?Action=BackOrder&&LineNum=&1":U .
        oImageColumn:Width = "50":U .
        oImageColumn:Format = ? .

        oImageColumn:BuildUrl:Subscribe (AppendOrderNumToImageUrlHandler) .

        oGrid:Query = QUERY qQuery:HANDLE .

        THIS-OBJECT:Controls:Add (oGrid) .

    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Event handler for the BuildImageUrl Event
        Notes:
        @param sender The object that raised the event
        @param e The BuildIamgeUrlEventArgs with the data for this event
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID BuildImageUrlHandler (sender AS Progress.Lang.Object,
                                                e AS BuildUrlEventArgs):

        e:Url = SUBSTITUTE ("/Sports2000Images/cat&1.jpg":U,
                            STRING (eOrderLine.ItemNum, "99999":U)) .

    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Builds the Ribbon for the Page
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID BuildRibbon ():

        DEFINE VARIABLE oTabs   AS RibbonTab   EXTENT 1 NO-UNDO .
        DEFINE VARIABLE oGroups AS RibbonGroup EXTENT   NO-UNDO .

        ASSIGN oRibbon = NEW SmartWebRibbon ("MaintenanceRibbon":U)  .

        /* Initialize Ribbon */
        ASSIGN oTabs[1] = NEW RibbonTab ("PickList":U, "Pick List")  .

        oRibbon:Tabs:Add (oTabs) .

        EXTENT (oGroups) = 2 .

        ASSIGN oGroups[1] = NEW RibbonGroup ("PickList":U, "Pick List")
               oGroups[2] = NEW RibbonGroup ("View":U, "View") .

        oGroups[1]:Tools:Add (NEW ButtonTool ("Confirm":U, "Confirm", RibbonToolSize:Large, "/PickList/ok.png":U)) .
        oGroups[1]:Tools:Add (NEW ButtonTool ("Cancel":U, "Cancel", RibbonToolSize:Large, "/PickList/delete.png":U)) .

        oGroups[2]:Tools:Add (NEW ButtonTool ("Reload":U, "Reload Order", RibbonToolSize:Large, "/PickList/nav_refresh_blue.png":U)) .

        oTabs[1]:Groups:Add (oGroups).

        EXTENT (oGroups) = ? .
        EXTENT (oGroups) = 1 .

        ASSIGN oGroups[1] = NEW RibbonGroup ("View":U, "View") .

        /* Sample Task Bar Menu */
        oRibbon:TaskBarMenu:Caption = "SmartComponents.Web" .
        oRibbon:TaskBarMenu:TaskBarMenuItems:Add (NEW TaskBarMenuItem ("www":U, "Consultingwerk Web", "http://www.consultingwerk.de":U    )) .
        oRibbon:TaskBarMenu:TaskBarMenuItems:Add (NEW TaskBarMenuItem ("blog":U, "Blog", "http://blog.consultingwerk.de":U    )) .
        oRibbon:TaskBarMenu:TaskBarMenuItems:Add (NEW TaskBarMenuItem ("facebook":U, "Facebook", "https://www.facebook.com/Consultingwerk":U    )) .

        oRibbon:ToolClick:Subscribe (ToolClickHandler) .

        THIS-OBJECT:Controls:Add (oRibbon) .

    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID BuildViewer ():

        DEFINE VARIABLE oLabel   AS Label   NO-UNDO .
        DEFINE VARIABLE oTextBox AS TextBox NO-UNDO .
        DEFINE VARIABLE oEditor  AS Editor  NO-UNDO .

        ASSIGN oHeader = NEW SmartWebViewer ("OrderHeader":U).

        oHeader:Height = 140 .

        oHeader:Query = QUERY qHeader:HANDLE .
        oHeader:Controls:Add (NEW HiddenField ("OrderNum":U, BUFFER eOrder:BUFFER-FIELD ("OrderNum":U))) .

        oProcessIdHiddenField = CAST (oHeader:Controls:Add (NEW HiddenField ("ProcessId":U)),
                                      Consultingwerk.Web.Widgets.HiddenField) .

        oLabel = CAST (oHeader:Controls:Add (NEW Label ("OrderNum_Label":U, "Order Number:")), Label) .
        oLabel:Left = 10 .
        oLabel:Top = 10 .

        oTextBox = CAST (oHeader:Controls:Add (NEW TextBox ("OrderNum":U, BUFFER eOrder:BUFFER-FIELD ("OrderNum":U))), TextBox) .
        oTextBox:Left = 120 .
        oTextBox:Top = 10 .
        oTextBox:ReadOnly = TRUE .

        oLabel = CAST (oHeader:Controls:Add (NEW Label ("PromiseDate_Label":U, "Promise Date:")), Label) .
        oLabel:Left = 250 .
        oLabel:Top = 10 .

        oTextBox = CAST (oHeader:Controls:Add (NEW TextBox ("PromiseDate":U, BUFFER eOrder:BUFFER-FIELD ("PromiseDate":U))), TextBox) .
        oTextBox:Left = 350 .
        oTextBox:Top = 10 .
        oTextBox:ReadOnly = TRUE .

        oLabel = CAST (oHeader:Controls:Add (NEW Label ("OrderDate_Label":U, "Order Date:")), Label) .
        oLabel:Left = 480 .
        oLabel:Top = 10 .

        oTextBox = CAST (oHeader:Controls:Add (NEW TextBox ("OrderDate":U, BUFFER eOrder:BUFFER-FIELD ("OrderDate":U))), TextBox) .
        oTextBox:Left = 580 .
        oTextBox:Top = 10 .
        oTextBox:ReadOnly = TRUE .

        oLabel = CAST (oHeader:Controls:Add (NEW Label ("Customer_Label":U, "Customer:")), Label) .
        oLabel:Left = 10 .
        oLabel:Top = 40 .

        oTextBox = CAST (oHeader:Controls:Add (NEW TextBox ("CustomerName":U, BUFFER eCustomer:BUFFER-FIELD ("Name":U))), TextBox) .
        oTextBox:Left = 120 .
        oTextBox:Top = 40 .
        oTextBox:Width = 300 .
        oTextBox:ReadOnly = TRUE .

        oLabel = CAST (oHeader:Controls:Add (NEW Label ("Country_Label":U, "Country:")), Label) .
        oLabel:Left = 480 .
        oLabel:Top = 40 .

        oTextBox = CAST (oHeader:Controls:Add (NEW TextBox ("Country":U, BUFFER eCustomer:BUFFER-FIELD ("Country":U))), TextBox) .
        oTextBox:Left = 580 .
        oTextBox:Top = 40 .
        oTextBox:Width = 100 .
        oTextBox:ReadOnly = TRUE .

        oLabel = CAST (oHeader:Controls:Add (NEW Label ("Instructions_Label":U, "Feedback:")), Label) .
        oLabel:Left = 10 .
        oLabel:Top = 70 .

        oEditor = CAST (oHeader:Controls:Add (NEW Editor ("Instructions":U, BUFFER eOrder:BUFFER-FIELD ("Instructions":U))), Editor) .
        oEditor:Left = 120 .
        oEditor:Top = 70 .
        oEditor:Width = 800 .
        oEditor:Height = 60 .

        THIS-OBJECT:Controls:Add (oHeader) .

    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        @return
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC LOGICAL ProcessWebInput ():

        DEFINE VARIABLE cAction    AS CHARACTER NO-UNDO.
        DEFINE VARIABLE iOrderNum  AS INTEGER NO-UNDO.
        DEFINE VARIABLE iOrderLine AS INTEGER NO-UNDO.

        DEFINE BUFFER OrderLine FOR OrderLine .

        ASSIGN cAction    = Consultingwerk.Web.WebUtilities:GetField ("Action":U)
               iOrderNum  = INTEGER (Consultingwerk.Web.WebUtilities:GetField ("OrderNum":U))
               iOrderLine = INTEGER (Consultingwerk.Web.WebUtilities:GetField ("LineNum":U)) .

        oProcessIdHiddenField:ScreenValue = Consultingwerk.Web.WebUtilities:GetField ("ProcessID":U) .

        CASE cAction:
            WHEN "Shipped" THEN DO:

                FIND OrderLine WHERE OrderLine.Ordernum = iOrderNum
                                 AND OrderLine.Linenum  = iOrderLine EXCLUSIVE-LOCK NO-ERROR .

                ASSIGN OrderLine.OrderLineStatus = "Shipped" .
            END.

            WHEN "BackOrder" THEN DO:

                FIND OrderLine WHERE OrderLine.Ordernum = iOrderNum
                                 AND OrderLine.Linenum  = iOrderLine EXCLUSIVE-LOCK NO-ERROR .

                ASSIGN OrderLine.OrderLineStatus = "Back Ordered" .
            END.

        END CASE .


        RETURN SUPER:ProcessWebInput().

    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Processes the Web Request using the Page object
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID ProcessWebRequest ():

        DEFINE VARIABLE oRequest     AS Consultingwerk.OERA.FetchDataRequest NO-UNDO .
        DEFINE VARIABLE iOrderNum    AS INTEGER                              NO-UNDO.


        DEFINE VARIABLE oUserSession AS Progress.BPM.UserSession             NO-UNDO .
        DEFINE VARIABLE oTask        AS Progress.BPM.Task                    NO-UNDO .
        DEFINE VARIABLE oDataSlot    AS Progress.BPM.DataSlot                NO-UNDO EXTENT .

        ASSIGN iOrderNum  = INTEGER (Consultingwerk.Web.WebUtilities:GetField ("OrderNum":U))
               cProcessID = Consultingwerk.Web.WebUtilities:GetField ("ProcessID":U).

        &IF DEFINED (OpenEdgeBPM) NE 0 &THEN
        IF IntegerType:IsNullOrEmpty (iOrderNum) AND
           CharacterType:IsNotNullOrEmpty (cProcessID) THEN DO:

            oUserSession = Consultingwerk.BPM.BPMHelper:ConnectNative ("admin":U, "admin":U) .

            oTask = oUserSession:GetTask (SUBSTITUTE ("OrderEntryDemo_OE11#&1::Pick and Pack::admin(Warehouse)", cProcessID)) .
            oDataSlot = oTask:GetDataSlots() .

            iOrderNum = INTEGER (oDataSlot[1]:Value) .
        END.
        &ENDIF

        /* Fetch By Order Number */
        oRequest = NEW Consultingwerk.OERA.FetchDataRequest ("eOrder,eCustomer,eOrderLine,eItem":U,
                                                             SUBSTITUTE ("FOR EACH eOrder WHERE eOrder.OrderNum = &1":U, iOrderNum),
                                                             1) .

        Consultingwerk.OERA.ServiceInterface:FetchData ("Consultingwerk.SmartComponentsDemo.OERA.Sports2000.OrderBusinessEntity":U,
                                                        oRequest,
                                                        OUTPUT DATASET dsOrder) .

        OPEN QUERY qHeader FOR EACH eOrder, FIRST eCustomer OF eOrder OUTER-JOIN .
        GET FIRST qHeader .

        OPEN QUERY qQuery FOR EACH eOrderLine, FIRST eItem OF eOrderLine OUTER-JOIN .
        GET FIRST qQuery .

        SUPER:ProcessWebRequest().

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Event handler for the ToolClick handler of the SmartWebRibbon
        Notes:
        @param sender The reference to the object that raised the event
        @param e The ToolClickEventArgs with the data for this event
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID ToolClickHandler (sender AS Progress.Lang.Object,
                                            e AS Consultingwerk.Web.Widgets.ToolClickEventArgs):

        &IF DEFINED (OpenEdgeBPM) NE 0 &THEN
        DEFINE VARIABLE oUserSession AS Progress.BPM.UserSession NO-UNDO .
        DEFINE VARIABLE oTask        AS Progress.BPM.Task        NO-UNDO .
        ASSIGN cProcessID = Consultingwerk.Web.WebUtilities:GetField ("ProcessID":U).
        &ENDIF

        CASE e:Tool:Key:

            &IF DEFINED (OpenEdgeBPM) NE 0 &THEN
            WHEN "Confirm":U THEN DO:

                oUserSession = Consultingwerk.BPM.BPMHelper:ConnectNative ("admin":U, "admin":U) .

                oTask = oUserSession:GetTask (SUBSTITUTE ("OrderEntryDemo_OE11#&1::Pick and Pack::admin(Warehouse)":U, cProcessID)) .
                oTask:Complete() .

/*                DEFINE VARIABLE oDialog AS SmartWebDialog NO-UNDO .                             */
/*                                                                                                */
/*                oDialog = NEW SmartWebDialog ("Information":U) .                                */
/*                oDialog:DialogText = "Please wait for the next Order from your Email inbox.":U .*/
/*                                                                                                */
/*                THIS-OBJECT:Controls:Add (oDialog) .                                                  */

            END.
            &ENDIF
        END CASE .

    END METHOD .

END CLASS.
