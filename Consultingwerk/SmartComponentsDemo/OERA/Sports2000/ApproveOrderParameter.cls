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
    File        : ApproveOrderParameter
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : Sat Sep 10 17:55:30 CEST 2011
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Consultingwerk.Serializable.

ROUTINE-LEVEL ON ERROR UNDO, THROW.

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.ApproveOrderParameter 
    INHERITS Serializable: 
        
    {Consultingwerk/SerializableProperty.i OrderNum INTEGER} .
    {Consultingwerk/SerializableProperty.i ProcessInstanceName CHARACTER} .
        
    /*------------------------------------------------------------------------------
        Purpose:                                                                        
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC ApproveOrderParameter ():
        SUPER ().
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose:                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC ApproveOrderParameter (piOrderNum AS INTEGER):
        SUPER ().
        
        THIS-OBJECT:OrderNum = piOrderNum .
        
    END CONSTRUCTOR.

END CLASS.
