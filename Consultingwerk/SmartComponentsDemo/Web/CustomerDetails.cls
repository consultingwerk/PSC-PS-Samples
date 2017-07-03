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
    File        : CustomerDetails
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd. 
    Created     : Wed Apr 04 23:26:34 CEST 2012
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.Web.*                FROM PROPATH.
USING Consultingwerk.Web.Widgets.*        FROM PROPATH .
USING Consultingwerk.Web.Widgets.Ribbon.* FROM PROPATH .
USING Progress.Lang.*                     FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.Web.CustomerDetails 
    INHERITS Page
    IMPLEMENTS IPage: 
    
    {Consultingwerk/SmartComponentsDemo/OERA/Sports2000/dsCustomer.i}
    
    DEFINE VARIABLE oViewer AS SmartDynamicWebViewer NO-UNDO .
    DEFINE VARIABLE oRibbon AS SmartWebRibbon        NO-UNDO .
    
    DEFINE QUERY qQuery FOR eCustomer, eSalesRep .
    
    /*------------------------------------------------------------------------------
        Purpose:                                                                        
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerDetails ():

        DEFINE VARIABLE oRequest       AS Consultingwerk.OERA.FetchDataRequest NO-UNDO . 
        DEFINE VARIABLE oTabs          AS RibbonTab EXTENT 3                   NO-UNDO .  
        DEFINE VARIABLE oGroups        AS RibbonGroup EXTENT                   NO-UNDO . 

        SUPER ().

        ASSIGN THIS-OBJECT:CustomStyleLibraries = "/SmartComponentsWeb/examples-offline.css,/SmartComponentsWeb/hover.css":U .        

        oRequest = NEW Consultingwerk.OERA.FetchDataRequest ("eCustomer,eSalesRep":U,
                                                             "FOR EACH eCustomer":U,
                                                             20) .
        
        Consultingwerk.OERA.ServiceInterface:FetchData ("Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity":U,
                                                        oRequest,
                                                        OUTPUT DATASET dsCustomer) .
        
        OPEN QUERY qQuery FOR EACH eCustomer, FIRST eSalesrep OF eCustomer OUTER-JOIN . 
        GET FIRST qQuery . 

        
        ASSIGN oRibbon = NEW SmartWebRibbon ("MaintenanceRibbon") 
               oViewer = NEW SmartDynamicWebViewer ("CustomerViewer") 
               oViewer:ViewerTitle = "Customer Detail":U .
        
        /* Initialize Ribbon */
        ASSIGN oTabs[1] = NEW RibbonTab ("Start":U, "Start") 
               oTabs[2] = NEW RibbonTab ("View":U, "View")
               oTabs[3] = NEW RibbonTab ("Options":U, "Options") .
        
        oRibbon:Tabs:Add (oTabs) .
        
        EXTENT (oGroups) = 3 .
        
        ASSIGN oGroups[1] = NEW RibbonGroup ("Maintenance":U, "Maintenance")
               oGroups[2] = NEW RibbonGroup ("Navigation":U, "Navigation") 
               oGroups[3] = NEW RibbonGroup ("View":U, "View") 
               .
             
        oGroups[1]:Tools:Add (NEW ButtonTool ("TableIOAdd":U, "Add Record", RibbonToolSize:Large, "/SmartComponentsWeb/Images/Buttons/document_add_32.png")) .             
        oGroups[1]:Tools:Add (NEW ButtonTool ("TableIOUpdate":U, "Update Record", RibbonToolSize:Large, "/SmartComponentsWeb/Images/Buttons/document_edit_32.png")) .           
        oGroups[1]:Tools:Add (NEW ButtonTool ("TableIOSave":U, "Save Changes", RibbonToolSize:Large, "/SmartComponentsWeb/Images/Buttons/floppy_disk_blue_16.png")) .           
        oGroups[1]:Tools:Add (NEW ButtonTool ("TableIOCancel":U, "Cancel Update", "/SmartComponentsWeb/Images/Buttons/delete_16.png")) .           
        oGroups[1]:Tools:Add (NEW ButtonTool ("TableIOCopy":U, "Copy Record", "/SmartComponentsWeb/Images/Buttons/copy_16.png")) .           
        oGroups[1]:Tools:Add (NEW ButtonTool ("TableIODelete":U, "Delete Record", "/SmartComponentsWeb/Images/Buttons/document_delete_16.png")) .           

        oGroups[2]:Tools:Add (NEW ButtonTool ("NavigationFirst":U, "First Record", RibbonToolSize:Large, "/SmartComponentsWeb/Images/Buttons/media_beginning_32.png")) .           
        oGroups[2]:Tools:Add (NEW ButtonTool ("NavigationPrevious":U, "Previous Record", RibbonToolSize:Large, "/SmartComponentsWeb/Images/Buttons/media_rewind_32.png")) .           
        oGroups[2]:Tools:Add (NEW ButtonTool ("NavigationNext":U, "Next Record", RibbonToolSize:Large, "/SmartComponentsWeb/Images/Buttons/media_fast_forward_32.png")) .           
        oGroups[2]:Tools:Add (NEW ButtonTool ("NavigationLast":U, "Last Record", RibbonToolSize:Large, "/SmartComponentsWeb/Images/Buttons/media_end_32.png")) .           

        CAST (oGroups[3]:Tools:Add (NEW ButtonTool ("Return":U, "Return to Search", RibbonToolSize:Large, "/SmartComponentsWeb/Images/Buttons/undo_32.png")),
                                    ButtonTool):URL = WebUtilities:UrlToPageObject (Progress.Lang.Class:GetClass ("Consultingwerk.SmartComponentsDemo.Web.CustomerList":U)) .           
                
        oTabs[1]:Groups:Add (oGroups).
        
        EXTENT (oGroups) = ? .
        EXTENT (oGroups) = 1 .
        
        ASSIGN oGroups[1] = NEW RibbonGroup ("View":U, "View") .
        
        oGroups[1]:Tools:Add (NEW ButtonTool ("View1", "View 1")) .
        oGroups[1]:Tools:Add (NEW ButtonTool ("View2", "View 2")) .
        oGroups[1]:Tools:Add (NEW ButtonTool ("View3", "View 3")) .
        
        oTabs[2]:Groups:Add (oGroups[1]) .
        
        ASSIGN oGroups[1] = NEW RibbonGroup ("Options":U, "Options") .

        oGroups[1]:Tools:Add (NEW ButtonTool ("Options1", "Options 1")) .
        oGroups[1]:Tools:Add (NEW ButtonTool ("Options2", "Options 2")) .
        oGroups[1]:Tools:Add (NEW ButtonTool ("Options3", "Options 3")) .
        
        oTabs[3]:Groups:Add (oGroups[1]) .
        
        /* Sample Task Bar Menu */
        oRibbon:TaskBarMenu:Caption = "SmartComponents.Web":U .
        oRibbon:TaskBarMenu:TaskBarMenuItems:Add (NEW TaskBarMenuItem ("www":U, "Consultingwerk Web", "http://www.consultingwerk.de":U, "/SmartComponentsWeb/js/SmartComponentsWeb/UI/icons/web.png":U)) . 
        oRibbon:TaskBarMenu:TaskBarMenuItems:Add (NEW TaskBarMenuItem ("blog":U, "Blog", "http://blog.consultingwerk.de":U, "/SmartComponentsWeb/js/SmartComponentsWeb/UI/icons/blog.png":U)) . 
        oRibbon:TaskBarMenu:TaskBarMenuItems:Add (NEW TaskBarMenuItem ("facebook":U, "Facebook", "https://www.facebook.com/Consultingwerk":U, "/SmartComponentsWeb/js/SmartComponentsWeb/UI/icons/facebook32.png":U)) .
        
        /* Initialize Viewer */
        oViewer:Query = QUERY qQuery:HANDLE . 
        oViewer:InitializeComponent () .
        
        THIS-OBJECT:Controls:Add (oRibbon) .
        THIS-OBJECT:Controls:Add (oViewer) .

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose:                                                                        
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID ProcessWebRequest ():
        
        DEFINE VARIABLE oRequest AS Consultingwerk.OERA.FetchDataRequest NO-UNDO . 
        DEFINE VARIABLE cQuery   AS CHARACTER                            NO-UNDO .
        DEFINE VARIABLE h AS HANDLE NO-UNDO.
        
        ASSIGN h = Consultingwerk.Web.WebContext:web-utilities-hdl . 
        
        ASSIGN cQuery = SUBSTITUTE ("FOR EACH eCustomer WHERE eCustomer.CustNum = &1":U,
                                    DYNAMIC-FUNCTION ("get-value":U IN h, "CustNum":U)) .
        
        oRequest = NEW Consultingwerk.OERA.FetchDataRequest ("eCustomer,eSalesRep":U,
                                                             cQuery,
                                                             1) .
        
        Consultingwerk.OERA.ServiceInterface:FetchData ("Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity":U,
                                                        oRequest,
                                                        OUTPUT DATASET dsCustomer) .
        
        OPEN QUERY qQuery FOR EACH eCustomer, FIRST eSalesrep OF eCustomer OUTER-JOIN . 
        GET FIRST qQuery . 
        
        SUPER:ProcessWebRequest().

    END METHOD.

END CLASS.
