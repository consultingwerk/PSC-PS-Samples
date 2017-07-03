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
    File        : CustomerDatasetModel
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : Sat Jun 15 03:09:34 CEST 2013
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.*                                      FROM PROPATH .
USING Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Model.* FROM PROPATH .  
USING Progress.Lang.*                                            FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Model.CustomerDatasetModel 
    INHERITS DatasetModel: 

    { Consultingwerk/SmartComponentsDemo/OERA/Sports2000/dsCustomer.i}

    /*------------------------------------------------------------------------------
        Purpose: Returns the reference to the Customer model
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Customer AS CustomerModel NO-UNDO 
    GET.
    PRIVATE SET. 

    /*------------------------------------------------------------------------------
        Purpose: 
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE OVERRIDE PUBLIC PROPERTY EntityName AS CHARACTER NO-UNDO INIT "Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity":U
    GET.
    PROTECTED SET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the reference to the Customer model
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Salesrep AS SalesrepModel NO-UNDO 
    GET.
    PRIVATE SET. 

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CustomerDatasetModel class
        Notes:   
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerDatasetModel ():
        SUPER (DATASET dsCustomer:HANDLE).

        THIS-OBJECT:Customer = NEW CustomerModel (THIS-OBJECT, 
                                                  BUFFER eCustomer:HANDLE) .

        THIS-OBJECT:Salesrep = NEW SalesrepModel (THIS-OBJECT, 
                                                  BUFFER eSalesrep:HANDLE) .

        THIS-OBJECT:TableModels:Add (THIS-OBJECT:Customer) .
        THIS-OBJECT:TableModels:Add (THIS-OBJECT:Salesrep) .

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CustomerDatasetModel class
        Notes:   
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerDatasetModel (piCustNum AS INTEGER):

        THIS-OBJECT() .

        THIS-OBJECT:Customer:Filter:CustNum:EQ (piCustNum):Run () .

    END CONSTRUCTOR .

END CLASS.
