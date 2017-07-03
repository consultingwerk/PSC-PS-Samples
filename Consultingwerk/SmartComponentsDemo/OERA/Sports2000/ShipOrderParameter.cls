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
    File        : ShipOrderParameter
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : Fri Sep 17 14:13:00 CEST 2010
    Notes       : 
  ----------------------------------------------------------------------*/


ROUTINE-LEVEL ON ERROR UNDO, THROW.

{Consultingwerk/products.i}

USING Consultingwerk.* FROM PROPATH .
USING Progress.Lang.*  FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.ShipOrderParameter 
&IF "{&FrameworkSerializationType}" EQ "XML" OR PROVERSION BEGINS "10.2":U &THEN
    INHERITS XmlSerializable
&ELSE
    INHERITS JsonSerializable
&ENDIF            
    :
        
    {Consultingwerk/JsonSerializableProperty.i Instructions CHARACTER} .
    {Consultingwerk/JsonSerializableProperty.i OrderNum INTEGER} .
    {Consultingwerk/JsonSerializableProperty.i ShipDate DATE "INIT TODAY"} .
    {Consultingwerk/JsonSerializableProperty.i SalesRep CHARACTER} .

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the ShipOrderParameter class                                                                     
        Notes:                                                                        
        @param piOrderNum The value for the OrderNum property
        @param pdtShipDate The value for the ShipDate property
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC ShipOrderParameter (piOrderNum AS INTEGER, pdtShipDate AS DATE):
        THIS-OBJECT ().
        
        THIS-OBJECT:OrderNum = piOrderNum . 
        THIS-OBJECT:ShipDate = pdtShipDate .  
        
    END CONSTRUCTOR.
    
    /*------------------------------------------------------------------------------
        Purpose: Constructor for the ShipOrderParameter class                                                                     
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC ShipOrderParameter ():
        SUPER ().
        
        THIS-OBJECT:AddSerializableProperties ("{&SerializableProperties}":U) .
        
    END CONSTRUCTOR.

END CLASS.