/**********************************************************************
 * Copyright (C) 2006-2015 by Consultingwerk Ltd. ("CW") -            *
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
    File        : DemoLayoutProvider
    Purpose     : Layout Privder for Demo Web2 screens
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : Sun Jul 19 17:51:00 CEST 2015
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.Exceptions.*               FROM PROPATH .
USING Consultingwerk.Web.Kendo.Data.*           FROM PROPATH .
USING Consultingwerk.Web2.Views.*               FROM PROPATH .
USING Consultingwerk.SmartComponentsDemo.Web2.* FROM PROPATH .
USING Progress.Lang.*                           FROM PROPATH .

{Consultingwerk/products.i}

CLASS Consultingwerk.SmartComponentsDemo.Web2.DemoLayoutProvider
    IMPLEMENTS ILayoutProvider:

    /*------------------------------------------------------------------------------
        Purpose: Returns a Layout to the web browser
        Notes:
        @param pcLayoutId The Id of the layout to return
        @param pcJSON The JSON structure of the layout
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID GetLayout (pcLayoutId AS CHARACTER,
                                  OUTPUT pcJSON AS CHARACTER):

        CASE pcLayoutId:
           WHEN "customerlist":U THEN
              THIS-OBJECT:CustomerList (pcLayoutId, OUTPUT pcJSON) .

           WHEN "customermaint":U THEN
              THIS-OBJECT:CustomerMaint (pcLayoutId, OUTPUT pcJSON) .

           WHEN "customerorders":U THEN
              THIS-OBJECT:CustomerOrders (pcLayoutId, OUTPUT pcJSON) .

           WHEN "salesrepmaint":U THEN
              THIS-OBJECT:SalesrepMaint (pcLayoutId, OUTPUT pcJSON) .

           OTHERWISE
              UNDO, THROW NEW Exception (SUBSTITUTE ("Invalid layout id: &1"{&TRAN}, pcLayoutId), 0) .

        END CASE .

    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Returns a Layout to the web browser
        Notes:
        @param pcLayoutId The Id of the layout to return
        @param pcJSON The JSON structure of the layout
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID CustomerList (pcLayoutId AS CHARACTER,
                                        OUTPUT pcJSON AS CHARACTER):

        DEFINE VARIABLE oLayout       AS SerializableLayoutElement     NO-UNDO .
        DEFINE VARIABLE oDataSource   AS SerializableDataSourceElement NO-UNDO .
        DEFINE VARIABLE oToolbar      AS SerializableToolbarElement    NO-UNDO .
        DEFINE VARIABLE oToolbarGroup AS SerializableToolbarGroup      NO-UNDO .
        DEFINE VARIABLE oGrid         AS SerializableGridElement       NO-UNDO .

        oLayout = NEW SerializableLayoutElement () .

        oLayout:Name = pcLayoutId .
        oLayout:InstanceId = "":U .
        oLayout:Template = "1grid":U .

        /* Toolbar */
        oToolbar = NEW SerializableToolbarElement () .
        oLayout:Elements:Add (oToolbar) .
        oToolbar:Name = "standardTableIO":U .
        oToolbarGroup = oToolbar:Groups:Add (NEW SerializableToolbarGroup ("TableIO":U)) .

        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOAdd":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOCopy":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOUpdate":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOSave":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOCancel":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIODelete":U)) .

        oToolbarGroup = oToolbar:Groups:Add (NEW SerializableToolbarGroup ("Navigation":U)) .

        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("NavigationFirst":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("NavigationPrev":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("NavigationNext":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("NavigationLast":U)) .

        /* Data Source */
        oDataSource = NEW SerializableDataSourceElement () .
        oDataSource:NavigationId = oToolbar:InstanceId .
        oDataSource:CatalogUri = "Catalog/Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity":U .

        oLayout:Elements:Add (oDataSource) .

        oDataSource:DataSource:type = "jsdo":U .
        oDataSource:DataSource:serverPaging = TRUE .
        oDataSource:DataSource:serverFiltering = TRUE .
        oDataSource:DataSource:filter = NEW Filter ("Country":U, FilterOperatorEnum:eq, "USA":U) .
/*        oDataSource:DataSource:filters:Add (NEW Filter ("Country":U, FilterOperatorEnum:eq, "USA":U)) .*/
        oDataSource:DataSource:sort = NEW Sort ("State":U, SortDirection:desc) .
        oDataSource:DataSource:serverSorting = TRUE .
        oDataSource:DataSource:pageSize = 10 .

        oDataSource:DataSource:transport = NEW JsdoTransport ("Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity":U,
                                                              "eCustomer":U) .

        /* Grid */
        oGrid = NEW SerializableGridElement ("Grid/Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity/customer":U) .
        oGrid:DataSourceId = oDataSource:InstanceId .
        oGrid:TableIOSourceId = oToolbar:InstanceId .
        oLayout:Elements:Add (oGrid) .

        pcJSON = oLayout:Serialize () .

    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Returns a Layout to the web browser
        Notes:
        @param pcLayoutId The Id of the layout to return
        @param pcJSON The JSON structure of the layout
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID CustomerMaint (pcLayoutId AS CHARACTER,
                                         OUTPUT pcJSON AS CHARACTER):

        DEFINE VARIABLE oLayout       AS SerializableLayoutElement     NO-UNDO .
        DEFINE VARIABLE oDataSource   AS SerializableDataSourceElement NO-UNDO .
        DEFINE VARIABLE oToolbar      AS SerializableToolbarElement    NO-UNDO .
        DEFINE VARIABLE oToolbarGroup AS SerializableToolbarGroup      NO-UNDO .
        DEFINE VARIABLE oViewer       AS SerializableViewerElement     NO-UNDO .
        DEFINE VARIABLE oGrid         AS SerializableGridElement       NO-UNDO .

        oLayout = NEW SerializableLayoutElement () .

        oLayout:Name = pcLayoutId .
        oLayout:InstanceId = "":U .
        oLayout:Template = "1grid1viewer":U .

        /* Toolbar */
        oToolbar = NEW SerializableToolbarElement () .
        oLayout:Elements:Add (oToolbar) .
        oToolbar:Name = "standardTableIO":U .
        oToolbarGroup = oToolbar:Groups:Add (NEW SerializableToolbarGroup ("TableIO":U)) .

        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOAdd":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOCopy":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOUpdate":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOSave":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOCancel":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIODelete":U)) .

        oToolbarGroup = oToolbar:Groups:Add (NEW SerializableToolbarGroup ("Navigation":U)) .

        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("NavigationFirst":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("NavigationPrev":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("NavigationNext":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("NavigationLast":U)) .

        /* Data Source */
        oDataSource = NEW SerializableDataSourceElement () .
        oDataSource:NavigationId = oToolbar:InstanceId .
        oDataSource:CatalogUri = "Catalog/Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity":U .

        oLayout:Elements:Add (oDataSource) .

        oDataSource:DataSource:type = "jsdo":U .
        oDataSource:DataSource:serverPaging = TRUE .
        oDataSource:DataSource:serverFiltering = TRUE .
        oDataSource:DataSource:filter = NEW Filter ("Country":U, FilterOperatorEnum:eq, "USA":U) .
/*        oDataSource:DataSource:filters:Add (NEW Filter ("Country":U, FilterOperatorEnum:eq, "USA":U)) .*/
        oDataSource:DataSource:sort = NEW Sort ("State":U, SortDirection:desc) .
        oDataSource:DataSource:serverSorting = TRUE .
        oDataSource:DataSource:pageSize = 10 .

        oDataSource:DataSource:transport = NEW JsdoTransport ("Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity":U,
                                                              "eCustomer":U) .

        /* Grid */
        oGrid = NEW SerializableGridElement ("Grid/Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity/customer":U) .
        oGrid:DataSourceId = oDataSource:InstanceId .
        oGrid:TableIOSourceId = oToolbar:InstanceId .
        oLayout:Elements:Add (oGrid) .

        /* Viewer */
        oViewer = NEW SerializableViewerElement ("Viewer/Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity/customer":U) .
        oViewer:DataSourceId = oDataSource:InstanceId .
        oViewer:TableIOSourceId = oToolbar:InstanceId .
        oLayout:Elements:Add (oViewer) .

        pcJSON = oLayout:Serialize () .

    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Returns a Layout to the web browser
        Notes:
        @param pcLayoutId The Id of the layout to return
        @param pcJSON The JSON structure of the layout
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID CustomerOrders (pcLayoutId AS CHARACTER,
                                          OUTPUT pcJSON AS CHARACTER):

        DEFINE VARIABLE oLayout       AS SerializableLayoutElement     NO-UNDO .
        DEFINE VARIABLE oDataSource   AS SerializableDataSourceElement NO-UNDO .
        DEFINE VARIABLE oDataSource2  AS SerializableDataSourceElement NO-UNDO .
        DEFINE VARIABLE oToolbar      AS SerializableToolbarElement    NO-UNDO .
        DEFINE VARIABLE oToolbarGroup AS SerializableToolbarGroup      NO-UNDO .
        DEFINE VARIABLE oViewer       AS SerializableViewerElement     NO-UNDO .
        DEFINE VARIABLE oGrid         AS SerializableGridElement       NO-UNDO .
        DEFINE VARIABLE oTabfolder    AS SerializableTabFolderElement  NO-UNDO .
        DEFINE VARIABLE oTab          AS SerializableTabElement        NO-UNDO .

        oLayout = NEW SerializableLayoutElement () .

        oLayout:Name = pcLayoutId .
        oLayout:InstanceId = "":U .
        oLayout:Template = "1grid1viewer":U .

        /* Toolbar */
        oToolbar = NEW SerializableToolbarElement () .
        oLayout:Elements:Add (oToolbar) .
        oToolbar:Name = "standardTableIO":U .
        oToolbarGroup = oToolbar:Groups:Add (NEW SerializableToolbarGroup ("TableIO":U)) .

        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOAdd":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOCopy":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOUpdate":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOSave":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOCancel":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIODelete":U)) .

        oToolbarGroup = oToolbar:Groups:Add (NEW SerializableToolbarGroup ("Navigation":U)) .

        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("NavigationFirst":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("NavigationPrev":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("NavigationNext":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("NavigationLast":U)) .

        /* Data Source */
        oDataSource = NEW SerializableDataSourceElement () .
        oDataSource:NavigationId = oToolbar:InstanceId .
        oDataSource:CatalogUri = "Catalog/Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity":U .

        oLayout:Elements:Add (oDataSource) .

        oDataSource:DataSource:type = "jsdo":U .
        oDataSource:DataSource:serverPaging = TRUE .
        oDataSource:DataSource:serverFiltering = TRUE .
        oDataSource:DataSource:filter = NEW Filter ("Country":U, FilterOperatorEnum:eq, "USA":U) .
/*        oDataSource:DataSource:filters:Add (NEW Filter ("Country":U, FilterOperatorEnum:eq, "USA":U)) .*/
        oDataSource:DataSource:sort = NEW Sort ("State":U, SortDirection:desc) .
        oDataSource:DataSource:serverSorting = TRUE .
        oDataSource:DataSource:pageSize = 10 .

        oDataSource:DataSource:transport = NEW JsdoTransport ("Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity":U,
                                                              "eCustomer":U) .

        /* Grid */
        oGrid = NEW SerializableGridElement ("Grid/Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity/customer":U) .
        oGrid:DataSourceId = oDataSource:InstanceId .
        oGrid:TableIOSourceId = oToolbar:InstanceId .
        oLayout:Elements:Add (oGrid) .

        /* Tabfolder */
        oTabFolder = NEW SerializableTabFolderElement () .
        oLayout:Elements:Add (oTabfolder) .

        /* Tab 1 */
        oTab = oTabFolder:CreateTab ("Customer":U, "1viewer":U) .

        /* Viewer */
        oViewer = NEW SerializableViewerElement ("Viewer/Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity/customer":U) .
        oViewer:DataSourceId = oDataSource:InstanceId .
        oViewer:TableIOSourceId = oToolbar:InstanceId .
        oTab:Elements:Add (oViewer) .

        /* Tab 2 */
        oTab = oTabFolder:CreateTab ("Orders":U, "1grid1viewer_vert":U) .




        /* Order Data Source */
        oDataSource2 = NEW SerializableDataSourceElement () .
        oDataSource2:NavigationId = oToolbar:InstanceId .
        oDataSource2:DataSourceId  = oDataSource:InstanceId .
        oDataSource2:ForeignFields = "Ordernum,Ordernum":U .
        oDataSource2:CatalogUri = "Catalog/Consultingwerk.SmartComponentsDemo.OERA.Sports2000.OrderBusinessEntity":U .

        oTab:Elements:Add (oDataSource2) .

        oDataSource2:DataSource:type = "jsdo":U .
        oDataSource2:DataSource:serverPaging = TRUE .
        oDataSource2:DataSource:serverFiltering = TRUE .
        oDataSource2:DataSource:serverSorting = TRUE .
        oDataSource2:DataSource:pageSize = 10 .
        oDataSource2:DataSource:sort = NEW Sort ("Ordernum":U, SortDirection:asc) .

        oDataSource2:DataSource:transport = NEW JsdoTransport ("Consultingwerk.SmartComponentsDemo.OERA.Sports2000.OrderBusinessEntity":U,
                                                               "eOrder":U) .

        /* Grid */
        oGrid = NEW SerializableGridElement ("Grid/Consultingwerk.SmartComponentsDemo.OERA.Sports2000.OrderBusinessEntity/order":U) .
        oGrid:DataSourceId = oDataSource2:InstanceId .
        oGrid:TableIOSourceId = oToolbar:InstanceId .
        oTab:Elements:Add (oGrid) .

        /* Viewer */
        oViewer = NEW SerializableViewerElement ("Viewer/Consultingwerk.SmartComponentsDemo.OERA.Sports2000.OrderBusinessEntity/order":U) .
        oViewer:DataSourceId = oDataSource2:InstanceId .
        oViewer:TableIOSourceId = oToolbar:InstanceId .
        oTab:Elements:Add (oViewer) .





        pcJSON = oLayout:Serialize () .

    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Returns a Layout to the web browser
        Notes:
        @param pcLayoutId The Id of the layout to return
        @param pcJSON The JSON structure of the layout
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID SalesrepMaint (pcLayoutId AS CHARACTER,
                                         OUTPUT pcJSON AS CHARACTER):

        DEFINE VARIABLE oLayout       AS SerializableLayoutElement     NO-UNDO .
        DEFINE VARIABLE oDataSource   AS SerializableDataSourceElement NO-UNDO .
        DEFINE VARIABLE oToolbar      AS SerializableToolbarElement    NO-UNDO .
        DEFINE VARIABLE oToolbarGroup AS SerializableToolbarGroup      NO-UNDO .
        DEFINE VARIABLE oViewer       AS SerializableViewerElement     NO-UNDO .
        DEFINE VARIABLE oGrid         AS SerializableGridElement       NO-UNDO .

        oLayout = NEW SerializableLayoutElement () .

        oLayout:Name = pcLayoutId .
        oLayout:InstanceId = "":U .
        oLayout:Template = "1grid1viewer":U .

        /* Toolbar */
        oToolbar = NEW SerializableToolbarElement () .
        oLayout:Elements:Add (oToolbar) .
        oToolbar:Name = "standardTableIO":U .
        oToolbarGroup = oToolbar:Groups:Add (NEW SerializableToolbarGroup ("TableIO":U)) .

        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOAdd":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOCopy":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOUpdate":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOSave":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIOCancel":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("TableIODelete":U)) .

        oToolbarGroup = oToolbar:Groups:Add (NEW SerializableToolbarGroup ("Navigation":U)) .

        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("NavigationFirst":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("NavigationPrev":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("NavigationNext":U)) .
        oToolbarGroup:Items:Add (NEW SerializableToolbarItem ("NavigationLast":U)) .

        /* Data Source */
        oDataSource = NEW SerializableDataSourceElement () .
        oDataSource:NavigationId = oToolbar:InstanceId .
        oDataSource:CatalogUri = "Catalog/Consultingwerk.SmartComponentsDemo.OERA.Sports2000.SalesRepBusinessEntity":U .

        oLayout:Elements:Add (oDataSource) .

        oDataSource:DataSource:type = "jsdo":U .
        oDataSource:DataSource:serverPaging = TRUE .
        oDataSource:DataSource:serverFiltering = TRUE .
/*        oDataSource:DataSource:filters:Add (NEW Filter ("Country":U, FilterOperatorEnum:eq, "USA":U)) .*/
        oDataSource:DataSource:sort = NEW Sort ("SalesRep":U, SortDirection:asc) .
        oDataSource:DataSource:serverSorting = TRUE .
        oDataSource:DataSource:pageSize = 10 .

        oDataSource:DataSource:transport = NEW JsdoTransport ("Consultingwerk.SmartComponentsDemo.OERA.Sports2000.SalesRepBusinessEntity":U,
                                                              "eSalesrep":U) .

        /* Grid */
        oGrid = NEW SerializableGridElement ("Grid/Consultingwerk.SmartComponentsDemo.OERA.Sports2000.SalesRepBusinessEntity/salesrep":U) .
        oGrid:DataSourceId = oDataSource:InstanceId .
        oGrid:TableIOSourceId = oToolbar:InstanceId .
        oLayout:Elements:Add (oGrid) .

        /* Viewer */
        oViewer = NEW SerializableViewerElement ("Viewer/Consultingwerk.SmartComponentsDemo.OERA.Sports2000.SalesRepBusinessEntity/salesrep":U) .
        oViewer:DataSourceId = oDataSource:InstanceId .
        oViewer:TableIOSourceId = oToolbar:InstanceId .
        oLayout:Elements:Add (oViewer) .

        pcJSON = oLayout:Serialize () .

    END METHOD .

END CLASS.
