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
    File        : CountryTableModel_Generated
    Purpose     : Auto Generated portion of the CountryTableModel class
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner
    Created     : 19/12/2013 22:10:20,811+01:00
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH .
USING Consultingwerk.SmartComponentsDemo.OERA.Sports2000.* FROM PROPATH .  
USING Progress.Lang.* FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CountryTableModel_Generated 
    INHERITS TableModel ABSTRACT: 

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current Country value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Country AS CHARACTER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetCharacterFieldValue ("Country":U) .
    END GET . 
    PUBLIC SET (arg AS CHARACTER):
        THIS-OBJECT:SetCharacterFieldValue ("Country":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current CountryEuropeanUnion value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY CountryEuropeanUnion AS LOGICAL NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetLogicalFieldValue ("CountryEuropeanUnion":U) .
    END GET . 
    PUBLIC SET (arg AS LOGICAL):
        THIS-OBJECT:SetLogicalFieldValue ("CountryEuropeanUnion":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current CountryName value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY CountryName AS CHARACTER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetCharacterFieldValue ("CountryName":U) .
    END GET . 
    PUBLIC SET (arg AS CHARACTER):
        THIS-OBJECT:SetCharacterFieldValue ("CountryName":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current NumberOfCustomers value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY NumberOfCustomers AS INT64 NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetInt64FieldValue ("NumberOfCustomers":U) .
    END GET . 
    PUBLIC SET (arg AS INT64):
        THIS-OBJECT:SetInt64FieldValue ("NumberOfCustomers":U, arg) .
    END SET .



    /*------------------------------------------------------------------------------
        Purpose: Returns the Filter Class for this TableModel
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Filter AS CountryTableModelFilter NO-UNDO 
    GET:
        RETURN NEW CountryTableModelFilter (THIS-OBJECT) .       
    END.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CountryTableModel_Generated class
        Notes:   
        @param poDatasetModel The reference to the owning DatasetModel
        @param phBufferHandle The handle of the ProDataset member buffer this TableModel represents
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CountryTableModel_Generated (poDatasetModel AS DatasetModel, phBufferHandle AS HANDLE):
        
        SUPER (poDatasetModel, phBufferHandle).
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CountryTableModel_Generated class
        Notes:   Creates a view model
        @param poTableModel The reference to CountryTableModel on which this CountryTableModel servers as a ViewModel
        @param phBufferHandle The handle of the ProDataset member buffer this TableModel represents
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PROTECTED CountryTableModel_Generated (poTableModel AS CountryTableModel, phBufferHandle AS HANDLE):
        
        SUPER (poTableModel, phBufferHandle).
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
       Purpose: Creates a new instance of the CountryTableModel as a view model
       Notes:
       @return The CountryTableModel as the view model
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC CountryTableModel CreateView ():
        
        RETURN CAST (THIS-OBJECT:CreateViewInternal (), 
                     CountryTableModel) . 
        
    END METHOD.
    
END CLASS.
