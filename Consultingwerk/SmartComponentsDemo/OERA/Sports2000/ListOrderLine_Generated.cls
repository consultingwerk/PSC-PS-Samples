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
    File        : ListOrderLine_Generated
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner
    Created     : 09.11.2012 13:29:38
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.Framework.Base.GenericList FROM PROPATH .
USING Consultingwerk.SmartComponentsDemo.OERA.Sports2000.* FROM PROPATH .
USING Progress.Lang.* FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.ListOrderLine_Generated
    INHERITS GenericList
    ABSTRACT:

    { Consultingwerk/Framework/Base/GenericList.i OrderLine }

    /*------------------------------------------------------------------------------
        Purpose: Creates a New Row, Initializes it and adds it to the List
        Notes:
        @return The reference to the new row instance
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED OrderLine NewRow ():

        DEFINE VARIABLE oOrderLine AS OrderLine NO-UNDO .

        oOrderLine = NEW OrderLine () .
        oOrderLine:InitializeNewRow () .

        THIS-OBJECT:Add (oOrderLine) .

        RETURN oOrderLine .

    END METHOD .

END CLASS.
