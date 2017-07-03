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
    File        : CustomerList
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : Wed Apr 04 23:26:34 CEST 2012
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.SmartComponentsDemo.Web.* FROM PROPATH . 
USING Consultingwerk.Web.*                     FROM PROPATH . 
USING Consultingwerk.Web.Widgets.*             FROM PROPATH .
USING Consultingwerk.Web.Widgets.Grid.*        FROM PROPATH .
USING Consultingwerk.Web.Widgets.Ribbon.*      FROM PROPATH .
USING Progress.Lang.*                          FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.Web.CustomerList 
    INHERITS Page
    IMPLEMENTS IPage: 
    
    {Consultingwerk/SmartComponentsDemo/OERA/Sports2000/dsCustomer.i}
    
    DEFINE VARIABLE oGrid   AS SmartKendoWebGrid NO-UNDO .
    DEFINE VARIABLE oRibbon AS SmartWebRibbon    NO-UNDO .
    
    /*------------------------------------------------------------------------------
        Purpose:                                                                        
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerList ():

        DEFINE VARIABLE oTabs       AS RibbonTab   EXTENT 3 NO-UNDO .  
        DEFINE VARIABLE oGroups     AS RibbonGroup EXTENT   NO-UNDO . 
        DEFINE VARIABLE oColumn     AS GridColumn           NO-UNDO .
        DEFINE VARIABLE oLinkColumn AS LinkGridColumn       NO-UNDO .

        DEFINE VARIABLE oImageColumn AS LinkGridColumn NO-UNDO . 

        SUPER ().
        
        ASSIGN THIS-OBJECT:CustomStyleLibraries = "/SmartComponentsWeb/examples-offline.css,/SmartComponentsWeb/hover.css":U . 
        
        ASSIGN oRibbon          = NEW SmartWebRibbon ("MaintenanceRibbon":U) 
               oGrid            = NEW SmartKendoWebGrid ("grid":U) 
               oGrid:DataSource = NEW CustomerDataSource () .
        
        /* Initialize Ribbon */
        ASSIGN oTabs[1] = NEW RibbonTab ("Start":U, "Start":U) 
               oTabs[2] = NEW RibbonTab ("View":U, "View":U)
               oTabs[3] = NEW RibbonTab ("Options":U, "Options":U) .
        
        oRibbon:Tabs:Add (oTabs) .
        
        EXTENT (oGroups) = 2 .
        
        ASSIGN oGroups[1] = NEW RibbonGroup ("Maintenance":U, "Maintenance")
               oGroups[2] = NEW RibbonGroup ("Navigation":U, "Navigation") .
             
        oGroups[1]:Tools:Add (NEW ButtonTool ("TableIOAdd":U, "Add Record", RibbonToolSize:Large, "/SmartComponentsWeb/Images/Buttons/document_add_32.png":U)) .             
        oGroups[1]:Tools:Add (NEW ButtonTool ("TableIOUpdate":U, "Update Record", RibbonToolSize:Large, "/SmartComponentsWeb/Images/Buttons/document_edit_32.png":U)) .           
        oGroups[1]:Tools:Add (NEW ButtonTool ("TableIOSave":U, "Save Changes", RibbonToolSize:Large, "/SmartComponentsWeb/Images/Buttons/floppy_disk_blue_16.png":U)) .           
        oGroups[1]:Tools:Add (NEW ButtonTool ("TableIOCancel":U, "Cancel Update", "/SmartComponentsWeb/Images/Buttons/delete_16.png":U)) .           
        oGroups[1]:Tools:Add (NEW ButtonTool ("TableIOCopy":U, "Copy Record", "/SmartComponentsWeb/Images/Buttons/copy_16.png":U)) .           
        oGroups[1]:Tools:Add (NEW ButtonTool ("TableIODelete":U, "Delete Record", "/SmartComponentsWeb/Images/Buttons/document_delete_16.png":U)) .           

        oGroups[2]:Tools:Add (NEW ButtonTool ("NavigationFirst":U, "First Batch", RibbonToolSize:Large, "/SmartComponentsWeb/Images/Buttons/media_beginning_32.png":U)) .           
        oGroups[2]:Tools:Add (NEW ButtonTool ("NavigationPrevious":U, "Previous Batch", RibbonToolSize:Large, "/SmartComponentsWeb/Images/Buttons/media_rewind_32.png":U)) .           
        oGroups[2]:Tools:Add (NEW ButtonTool ("NavigationNext":U, "Next Batch", RibbonToolSize:Large, "/SmartComponentsWeb/Images/Buttons/media_fast_forward_32.png":U)) .           
        oGroups[2]:Tools:Add (NEW ButtonTool ("NavigationLast":U, "Last Batch", RibbonToolSize:Large, "/SmartComponentsWeb/Images/Buttons/media_end_32.png":U)) .           
                
        oTabs[1]:Groups:Add (oGroups).
        
        EXTENT (oGroups) = ? .
        EXTENT (oGroups) = 1 .
        
        ASSIGN oGroups[1] = NEW RibbonGroup ("View":U, "View") .
        
        oGroups[1]:Tools:Add (NEW ButtonTool ("View1":U, "View 1")) .
        oGroups[1]:Tools:Add (NEW ButtonTool ("View2":U, "View 2")) .
        oGroups[1]:Tools:Add (NEW ButtonTool ("View3":U, "View 3")) .
        
        oTabs[2]:Groups:Add (oGroups[1]) .
        
        ASSIGN oGroups[1] = NEW RibbonGroup ("Options":U, "Options") .

        oGroups[1]:Tools:Add (NEW ButtonTool ("Options1":U, "Options 1")) .
        oGroups[1]:Tools:Add (NEW ButtonTool ("Options2":U, "Options 2")) .
        oGroups[1]:Tools:Add (NEW ButtonTool ("Options3":U, "Options 3")) .
        
        oTabs[3]:Groups:Add (oGroups[1]) .
        
        /* Sample Task Bar Menu */
        oRibbon:TaskBarMenu:Caption = "SmartComponents.Web":U .
        oRibbon:TaskBarMenu:TaskBarMenuItems:Add (NEW TaskBarMenuItem ("www":U, "Consultingwerk Web", "http://www.consultingwerk.de":U, "/SmartComponentsWeb/js/SmartComponentsWeb/UI/icons/web.png":U)) . 
        oRibbon:TaskBarMenu:TaskBarMenuItems:Add (NEW TaskBarMenuItem ("blog":U, "Blog", "http://blog.consultingwerk.de":U, "/SmartComponentsWeb/js/SmartComponentsWeb/UI/icons/blog.png":U)) . 
        oRibbon:TaskBarMenu:TaskBarMenuItems:Add (NEW TaskBarMenuItem ("facebook":U, "Facebook", "https://www.facebook.com/Consultingwerk":U, "/SmartComponentsWeb/js/SmartComponentsWeb/UI/icons/facebook32.png":U)) . 
        
        
        /* Initialize Grid */
        oGrid:GridTitle = "Customer Overview":U .
        
        oImageColumn = NEW LinkGridColumn (BUFFER eCustomer:BUFFER-FIELD ("CustNum":U)) .
        oImageColumn:ColumnDisplayType = ColumnDisplayTypeEnum:Image .
        oImageColumn:ColumnLabel = " ":U . 
        oImageColumn:AltText = "View Details" .
        oImageColumn:Image = "/SmartComponentsWeb/Images/document_edit.png":U .
        oImageColumn:Hyperlink = "CustomerDetails?CustNum=&1":U .
        oImageColumn:Width = "50" .
        oImageColumn:Filterable = FALSE . 
        oImageColumn:Sortable = FALSE . 
        
        oColumn = oGrid:Columns:Add (oImageColumn) . 
        oColumn = oGrid:Columns:Add (NEW GridColumn (BUFFER eCustomer:BUFFER-FIELD ("CustNum":U))) .
        oColumn:ColumnAlign = "right" . 
        oColumn:Width = "70" .  
        
        oColumn = oGrid:Columns:Add (NEW GridColumn (BUFFER eCustomer:BUFFER-FIELD ("Name":U))) . 
        oColumn = oGrid:Columns:Add (NEW GridColumn (BUFFER eCustomer:BUFFER-FIELD ("PostalCode":U))) .
        ASSIGN oColumn:ColumnAlign = "right"
               oColumn:Width       = "70".

        oColumn = oGrid:Columns:Add (NEW GridColumn (BUFFER eCustomer:BUFFER-FIELD ("City":U))) .
        oColumn = oGrid:Columns:Add (NEW GridColumn (BUFFER eCustomer:BUFFER-FIELD ("Country":U))) .
        oColumn = oGrid:Columns:Add (NEW GridColumn (BUFFER eCustomer:BUFFER-FIELD ("SalesRep":U))) .
        oColumn = oGrid:Columns:Add (NEW GridColumn (BUFFER eSalesRep:BUFFER-FIELD ("RepName":U))) .
        ASSIGN oColumn:Width = "400".
        
        oLinkColumn = NEW LinkGridColumn (BUFFER eCustomer:BUFFER-FIELD ("city":U)) .
        oLinkColumn:ColumnLabel = "Link to Google":U .
        oLinkColumn:AltText = "Link to Google" .
        oLinkColumn:Hyperlink = "https://www.google.de/maps/place/&1":U.
        oLinkColumn:FORMAT = "x(150)":U.
        oLinkColumn:ColumnDisplayType = ColumnDisplayTypeEnum:Text.
        oLinkColumn:LinkAttributes = "target = '_blank'":U.
        oLinkColumn:Width = "*":U .
        
        oGrid:Columns:Add (oLinkColumn) .                                                        
        
        THIS-OBJECT:Controls:Add (oRibbon) .
        THIS-OBJECT:Controls:Add (oGrid) .
        
/*        /* Dialog Test */                                                                                                                             */
/*        IF WebContext:REQUEST_METHOD = "GET":U THEN DO:                                                                                               */
/*            DEFINE VARIABLE oDialog AS SmartWebDialog NO-UNDO .                                                                                       */
/*                                                                                                                                                      */
/*            oDialog = NEW SmartWebDialog ("Information":U) .                                                                                          */
/*            oDialog:DialogText = "This is an prototype for the rendering engine of the SmartComponents.Web framework.":U .                            */
/*            oDialog:DetailText = "This is the Detail of the Message Dialog. It can optionally be shown and hidden. Press OK to close this dialog.":U .*/
/*                                                                                                                                                      */
/*            THIS-OBJECT:Controls:Add (oDialog) .                                                                                                      */
/*        END.                                                                                                                                          */
/*                                                                                                                                                      */
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose:                                                                        
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID ProcessWebRequest ():
        
        DEFINE VARIABLE oRequest AS Consultingwerk.OERA.FetchDataRequest NO-UNDO . 
        
        oRequest = NEW Consultingwerk.OERA.FetchDataRequest ("eCustomer,eSalesRep":U,
                                                             "FOR EACH eCustomer":U,
                                                             25) .
        
        Consultingwerk.OERA.ServiceInterface:FetchData ("Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity":U,
                                                        oRequest,
                                                        OUTPUT DATASET dsCustomer) .
        
        OPEN QUERY qQuery FOR EACH eCustomer, FIRST eSalesrep OF eCustomer OUTER-JOIN . 
        GET FIRST qQuery . 
        
        SUPER:ProcessWebRequest().

    END METHOD.

END CLASS.
