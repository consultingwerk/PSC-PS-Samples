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
    File        : CustomerModel
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : Sat Jun 15 03:12:23 CEST 2013
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.*                                             FROM PROPATH .
USING Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Model.*        FROM PROPATH .  
USING Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Model.Filter.* FROM PROPATH .  
USING Progress.Lang.*                                                   FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Model.CustomerModel 
    INHERITS TableModel: 

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current CustNum value 
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY CustNum AS INTEGER NO-UNDO 
    GET:
        RETURN THIS-OBJECT:GetIntegerFieldValue ("CustNum":U) . 
    END GET . 
    SET (arg AS INTEGER):
        THIS-OBJECT:SetIntegerFieldValue ("CustNum":U, arg) .
    END SET . 

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current Name value 
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Name AS CHARACTER NO-UNDO 
    GET:
        RETURN THIS-OBJECT:GetCharacterFieldValue ("Name":U) .
    END GET . 
    SET (arg AS CHARACTER):
        THIS-OBJECT:SetCharacterFieldValue ("Name":U, arg) .
    END SET . 

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current State value 
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY State AS CHARACTER NO-UNDO 
    GET:
        RETURN THIS-OBJECT:GetCharacterFieldValue ("State":U) .
    END GET . 
    SET (arg AS CHARACTER):
        THIS-OBJECT:SetCharacterFieldValue ("State":U, arg) .
    END SET . 

    /*------------------------------------------------------------------------------
        Purpose: Returns the Filter Class for this TableModel
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Filter AS CustomerFilter NO-UNDO 
    GET:
        RETURN NEW CustomerFilter (THIS-OBJECT) .         
    END.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CustomerModel class
        Notes:   
        @param poDatasetModel The reference to the owning DatasetModel
        @param phBufferHandle The handle of the ProDataset member buffer this TableModel represents
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerModel (poDatasetModel AS DatasetModel, 
                                      phBufferHandle AS HANDLE):
        
        SUPER (poDatasetModel, phBufferHandle).
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Filters by the CustNum Index 
        Notes:   
        @param piCustNum The CustNum to filter at
        @return The reference to the CustomerModel
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC CustomerModel FilterByCustNum (piCustNum AS INTEGER):
        
        THIS-OBJECT:ClearFilter () . 
        THIS-OBJECT:Filter:CustNum:EQ (piCustNum) .
        THIS-OBJECT:Fill () .
        
        RETURN THIS-OBJECT .

    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Filters by the Country and PostalCode Index 
        Notes:   
        @param piCustNum The CustNum to filter at
        @return The reference to the CustomerModel
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC CustomerModel FilterByCountryPost (pcCountry AS CHARACTER,
                                                     piPostalCode AS INTEGER):
        
        THIS-OBJECT:ClearFilter () . 
        THIS-OBJECT:Filter:Country:EQ (pcCountry) .
        THIS-OBJECT:Filter:PostalCode:EQ (piPostalCode) .
        THIS-OBJECT:Fill () .
        
        RETURN THIS-OBJECT .

    END METHOD .

END CLASS.
