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
    File        : GetRecidParameter
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : Thu May 05 16:25:02 CEST 2011
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.Serializable.
USING Progress.Lang.*.

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.GetRecidParameter 
    INHERITS Serializable: 

    {Consultingwerk/SerializableProperty.i Buffer CHARACTER} .
    {Consultingwerk/SerializableProperty.i QueryString LONGCHAR} .
    {Consultingwerk/SerializableProperty.i Recid LONGCHAR} .

END CLASS.