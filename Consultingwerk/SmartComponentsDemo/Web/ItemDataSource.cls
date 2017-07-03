/**********************************************************************
 * Copyright (C) 2006-2012 by Consultingwerk Ltd. ("CW") -            *
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
    File        : ItemDataSource
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd
    Created     : Thu Nov 13 23:27:16 CET 2014
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.Web.Data.* FROM PROPATH .
USING Progress.Lang.*           FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.Web.ItemDataSource 
    INHERITS JsonDataSource: 

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    DEFINE OVERRIDE PUBLIC PROPERTY EntityName AS CHARACTER NO-UNDO 
       INITIAL "Consultingwerk.SmartComponentsDemo.OERA.Sports2000.ItemBusinessEntity":U
    GET .
     
    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    DEFINE OVERRIDE PUBLIC PROPERTY EntityTable AS CHARACTER NO-UNDO 
       INITIAL "eItem":U
    GET .

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    DEFINE OVERRIDE PUBLIC PROPERTY EntityView AS CHARACTER NO-UNDO 
       INITIAL "":U
    GET .

END CLASS.
