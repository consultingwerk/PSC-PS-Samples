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
    File        : DemoGridCustomProvider
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : Sun Sep 18 22:07:23 CEST 2016
    Notes       :
  ----------------------------------------------------------------------*/

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.*                          FROM PROPATH .
USING Consultingwerk.SmartComponentsDemo.Web2.* FROM PROPATH .
USING Consultingwerk.Web.Kendo.Grid.*           FROM PROPATH .
USING Consultingwerk.Web2.Services.SmartViews.* FROM PROPATH .
USING Progress.Json.ObjectModel.*               FROM PROPATH .
USING Progress.Lang.*                           FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.Web2.DemoGridCustomProvider IMPLEMENTS IGridCustomProvider:

    /*------------------------------------------------------------------------------
       Purpose:
       Notes:
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC DemoGridCustomProvider ():
        DEFINE VARIABLE oLayoutProvider AS IGridLayoutProvider NO-UNDO .

        SUPER ().

        ASSIGN oLayoutProvider = {Consultingwerk/get-service.i IGridLayoutProvider "NEW Grid ()"} .

        oLayoutProvider:RegisterGridCustomProvider("SampleGrid":U,
                                                   THIS-OBJECT) .

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
       Purpose:
       Notes:
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC Progress.Json.ObjectModel.JsonObject GetFragment (pcCustomViewName AS CHARACTER):

        DEFINE VARIABLE oCharacterHolder AS CharacterHolder NO-UNDO .

        oCharacterHolder = NEW CharacterHolder (pcCustomViewName) .

        RETURN oCharacterHolder:ToJsonObject () .

    END METHOD.

END CLASS.