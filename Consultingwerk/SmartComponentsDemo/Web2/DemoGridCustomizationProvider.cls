/**********************************************************************
 * Copyright (C) 2006-2016 by Consultingwerk Ltd. ("CW") -            *
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
    File        : DemoGridCustomizationProvider
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : Thu Sep 08 20:59:47 CEST 2016
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.SmartComponentsDemo.Web2.* FROM PROPATH .
USING Consultingwerk.Web.Kendo.*                FROM PROPATH .
USING Consultingwerk.Web.Kendo.Grid.*           FROM PROPATH .
USING Consultingwerk.Web2.Services.SmartViews.* FROM PROPATH .
USING Progress.Json.ObjectModel.*               FROM PROPATH .
USING Progress.Lang.*                           FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.Web2.DemoGridCustomizationProvider
    IMPLEMENTS IGridCustomizationProvider:

    DEFINE VARIABLE oWindowSizes3 AS WindowSizesEnum EXTENT 2 NO-UNDO .
    DEFINE VARIABLE oWindowSizes4 AS WindowSizesEnum EXTENT 1 NO-UNDO .

    /**
     * Purpose: Constructor for the DemoGridCustomizationProvider
     * Notes:
     */
    CONSTRUCTOR PUBLIC DemoGridCustomizationProvider ():
        DEFINE VARIABLE oLayoutProvider AS IGridLayoutProvider NO-UNDO .

        SUPER ().

        ASSIGN oLayoutProvider = {Consultingwerk/get-service.i IGridLayoutProvider "NEW Grid ()"} .

        oLayoutProvider:RegisterCustomizationProvider ("*CustomerBusinessEntity":U,
                                                       "*":U,
                                                       THIS-OBJECT) .

        ASSIGN oWindowSizes3[1] = WindowSizesEnum:lg
               oWindowSizes3[2] = WindowSizesEnum:md
               oWindowSizes4[1] = WindowSizesEnum:lg
               .

    END CONSTRUCTOR.

    /**
     * Purpose: Customizes the resulting JSON defition
     * Notes:
     * @param pcEntityName The name of the Business Entity to return a view spec form
     * @param pcViewName The name of the view
     * @param poJsonObject The JSON Object with the Kendo UI definition to customize
     */
    METHOD PUBLIC VOID CustomizeGridPostSerialization (pcEntityName AS CHARACTER,
                                                       pcViewName AS CHARACTER,
                                                       poJsonObject AS JsonObject):

        /* noop */

    END METHOD.

    /**
     * Purpose: Customizes the ABL KendoGrid definition
     * Notes:
     * @param pcEntityName The name of the Business Entity to return a view spec form
     * @param pcViewName The name of the view
     * @param poKendoGrid The KendoGrid structure to customize
     */
    METHOD PUBLIC VOID CustomizeGridPreSerialization (pcEntityName AS CHARACTER,
                                                      pcViewName AS CHARACTER,
                                                      poKendoGrid AS KendoGrid):

        DEFINE VARIABLE i              AS INTEGER NO-UNDO .
        DEFINE VARIABLE oCommandColumn AS Column  NO-UNDO .

        /* poKendoGrid:filterable = NEW Filterable ("menu":U) . */

        /* Remove "destroy" COMMAND */
        {Consultingwerk/foreachABL.i Column oColumn in poKendogrid:Columns '' columnLoop}
            IF EXTENT (oColumn:command) <> ? AND oColumn:command[1] = "destroy":U THEN DO:
                poKendogrid:Columns:Remove(oColumn) .
                LEAVE columnLoop .
            END.
        END.

        DO i = 3 TO poKendoGrid:Columns:Count:

            oColumn = poKendoGrid:Columns:GetItem(i) .

            IF EXTENT (oColumn:windowSizes) = ? THEN DO:
                IF i = 3 THEN
                    ASSIGN oColumn:windowSizes = oWindowSizes3 .
                ELSE IF i > 3 THEN
                    ASSIGN oColumn:windowSizes = oWindowSizes4 .
            END.
        END.

        /* Add command button to Customer grid */
        IF pcEntityName MATCHES "*Customer*":U THEN DO:

            oColumn = NEW Column () .

            ASSIGN oColumn:type  = "command":U
                   oColumn:title = "Orders":U
                   oColumn:form  = "/customer/:CustNum/orders":U
                   oColumn:text  = "View Orders":U .

            poKendoGrid:Columns:Add (oColumn) .

            /* Put Customer On Hold */

            oCommandColumn = NEW Column () .

            ASSIGN oCommandColumn:type   = "command":U
                   oCommandColumn:title  = "On Hold":U
                   oCommandColumn:action = "PutCustomerOnHoldHandler":U
                   oCommandColumn:text   = "On Hold":U .

            poKendoGrid:Columns:Add (oCommandColumn) .


            ASSIGN poKendoGrid:editable = ?
                   poKendoGrid:editButtonTitle = ? .

            poKendoGrid:detailTemplate =

"            <div class=~"col-xs-12~">~n~
                <smart-data-source~n~
                    [smart-filter]=~"[~{ operator: 'eq', field: 'CustNum', value: dataItem.CustNum }]~"~n~
                    smart-foreign-fields=~"CustNum,CustNum~"~n~
                    smart-object-name=~"orderDataSource~" ~n~
                    smart-business-entity-name=~"Consultingwerk.SmartComponentsDemo.OERA.Sports2000.OrderBusinessEntity~"~n~
                    smart-entity-table='eOrder'~n~
                    smart-entity-view='eCustomer'>~n~
                </smart-data-source>~n~
                <smart-grid~n~
                smart-object-name='orderGrid' ~n~
                smart-data-source='orderDataSource'~n~
                smart-grid-layout='Consultingwerk.SmartComponentsDemo.OERA.Sports2000.OrderBusinessEntity/order'>~n~
                </smart-grid>~n~
            </div>":U .

        END.

    END METHOD.

END CLASS.
