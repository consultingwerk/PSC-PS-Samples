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
    File        : CustomerFilter
    Purpose     : Filter class for the Customer TableModel
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : Sat Jun 15 03:28:08 CEST 2013
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.*                                                  FROM PROPATH . 
USING Consultingwerk.Assertion.*                                        FROM PROPATH . 
USING Consultingwerk.OERA.*                                             FROM PROPATH . 
USING Consultingwerk.OERA.ModelFilter.*                                 FROM PROPATH .
USING Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Model.*        FROM PROPATH .  
USING Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Model.Filter.* FROM PROPATH .  
USING Progress.Lang.*                                                   FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Model.Filter.CustomerFilter
    INHERITS TableModelFilter: 

    DEFINE PRIVATE VARIABLE oTableModel AS CustomerModel NO-UNDO . 

    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the Name field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY City AS CharacterFilter NO-UNDO 
    GET:
        RETURN oTableModel:NewCharacterFilter ("City":U,
                                               THIS-OBJECT) .
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the Name field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Comments AS CharacterFilter NO-UNDO 
    GET:
        RETURN oTableModel:NewCharacterFilter ("Comments":U,
                                               THIS-OBJECT) .
    END GET.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the Name field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Contact AS CharacterFilter NO-UNDO 
    GET:
        RETURN oTableModel:NewCharacterFilter ("Contact":U,
                                               THIS-OBJECT) .
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the Name field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Country AS CharacterFilter NO-UNDO 
    GET:
        RETURN oTableModel:NewCharacterFilter ("Country":U,
                                               THIS-OBJECT) .
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the IntegerFilter for the CustNum field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY CustNum AS IntegerFilter NO-UNDO 
    GET:
        RETURN oTableModel:NewIntegerFilter ("CustNum":U,
                                             THIS-OBJECT) .
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the Name field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Name AS CharacterFilter NO-UNDO 
    GET:
        RETURN oTableModel:NewCharacterFilter ("Name":U,
                                               THIS-OBJECT) .
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the IntegerFilter for the PostalCode field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY PostalCode AS IntegerFilter NO-UNDO 
    GET:
        RETURN oTableModel:NewIntegerFilter ("PostalCode":U,
                                             THIS-OBJECT) .
    END GET.
     
    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the Name field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY State AS CharacterFilter NO-UNDO 
    GET:
        RETURN oTableModel:NewCharacterFilter ("State":U,
                                               THIS-OBJECT) .
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CustomerFilter class
        Notes:   
        @param poTableModel The reference to the TableMode for this Filter class
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerFilter (poTableModel AS CustomerModel):
        SUPER (poTableModel).
        
        ObjectAssert:IsValid (poTableModel, "TableModel":U) .
        
        ASSIGN oTableModel = poTableModel.
        
    END CONSTRUCTOR.

END CLASS.
