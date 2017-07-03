/**********************************************************************
 * Copyright (C) 2006-2017 by Consultingwerk Ltd. ("CW") -            *
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
    File        : Web2DemoRouteProvider
    Purpose     : Provides Routes for the web2 demo module
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : Sat Apr 08 22:04:13 CEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.SmartFramework.Menu.Routes.* FROM PROPATH .
USING Consultingwerk.Util.*                       FROM PROPATH .
USING Progress.Json.ObjectModel.*                 FROM PROPATH .
USING Progress.Lang.*                             FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.Web2.Web2DemoRouteProvider
    IMPLEMENTS IRouteProvider:

    /**
     * Purpose: Constructor for the Web2DemoRouteProvider class
     * Notes:
     */
    CONSTRUCTOR PUBLIC Web2DemoRouteProvider ():

        DEFINE VARIABLE oRouteService AS ISmartRoutesService NO-UNDO .

        oRouteService = {Consultingwerk/get-service.i Consultingwerk.SmartFramework.Menu.Routes.ISmartRoutesService} .

        IF VALID-OBJECT (oRouteService) THEN
            oRouteService:RegisterRouteProviderForModule("Web2 Demo":U, THIS-OBJECT) .

    END CONSTRUCTOR.

    /**
     * Purpose: Returns the list of route definition instances
     * Notes:
     * @param poRoutes The JSON array with the route definitions so far
     * @return The list of RouteDefinition instances
     */
    METHOD PUBLIC ListRouteDefinition GetRoutes (poRoutes AS JsonArray):

        DEFINE VARIABLE oList     AS ListRouteDefinition NO-UNDO .
        DEFINE VARIABLE oRoute    AS RouteDefinition     NO-UNDO .
        DEFINE VARIABLE oChild    AS RouteDefinition     NO-UNDO .

        DEFINE VARIABLE oParent   AS JsonObject          NO-UNDO .
        DEFINE VARIABLE oChildren AS JsonArray           NO-UNDO .

        oList = NEW ListRouteDefinition () .

        oRoute = NEW RouteDefinition("/start":U,
                                     "Consultingwerk/SmartComponentsDemo/Web2/Ng2/start-page-template.html":U,
                                     "StartController":U) .

        ASSIGN oRoute:BrowserTitleTemplate    = "Start":U
               oRoute:BreadcrumbLabelTemplate = "Start":U .

        oList:Add(oRoute) .

        /* Seek the /customer route */
        oParent = JsonHelper:FindJsonObjectWithPropertyValue (poRoutes, "path":U, "/customer":U) .

        IF VALID-OBJECT (oParent) THEN DO:

            oRoute = NEW RouteDefinition("/:CustNum/orders":U,
                                         "Consultingwerk/Web2/entityview.html":U,
                                         ?,
                                         ArrayHelper:Array ("CustNum":U),
                                         ArrayHelper:Array ("orderDataSource":U),
                                         ArrayHelper:Array ("CustNum":U)) .

            ASSIGN
                oRoute:EntityName              = "Consultingwerk.SmartComponentsDemo.OERA.Sports2000.OrderBusinessEntity":U
                oRoute:EntityTable             = "eOrder":U
                oRoute:EntityViewTables        = "eCustomer":U
                oRoute:EntityView              = "order":U
                oRoute:BrowserTitleTemplate    = "Orders for [orderDataSource.selected.Ordernum] [orderDataSource.selected.OrderDate]":U
                oRoute:BreadcrumbLabelTemplate = "Orders for [CustNum]":U
                .

            oChild = oRoute:Children:Add (NEW RouteDefinition("/:Ordernum/orderlines":U,
                                                              "Consultingwerk/Web2/entityview.html":U,
                                                              ?,
                                                              ArrayHelper:Array ("CustNum":U, "Ordernum":U),
                                                              ArrayHelper:Array ("orderDataSource":U, "orderlineDataSource":U),
                                                              ArrayHelper:Array ("CustNum":U, "Ordernum":U))) .

            ASSIGN
                oChild:EntityName              = "Consultingwerk.SmartComponentsDemo.OERA.Sports2000.OrderBusinessEntity":U
                oChild:EntityTable             = "eOrderLine":U
                oChild:EntityViewTables        = "eItem":U
                oChild:EntityView              = "orderline":U
                oChild:BrowserTitleTemplate    = "Orderlines for [orderlineDataSource.selected.Ordernum]":U
                oChild:BreadcrumbLabelTemplate = "Orderlines of [Ordernum]":U
                .

            IF NOT oParent:Has ("children":U) THEN DO:
                oChildren = NEW JsonArray () .
                oParent:Add ("children":U, oChildren) .
            END.
            ELSE
                oChildren = oParent:GetJsonArray ("children":U) .

            oChildren:Add (oRoute:ToJson()) .
        END.

        RETURN oList .

    END METHOD.

END CLASS.
