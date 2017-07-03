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
    File        : Customer_Generated
    Purpose     : Auto Generated portion of the Customer class
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 03/07/2017 17:42:22,485+02:00
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH .
USING TrainingSamples.BusinessLogik.CustomerWithReposition.* FROM PROPATH .  
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerBusinessEntity", type="DatasetModelGenerated") .

CLASS TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerDatasetModel_Generated 
    INHERITS DatasetModel ABSTRACT: 

    { TrainingSamples/BusinessLogik/CustomerWithReposition/dsCustomer.i &ACCESS=PROTECTED }

    /*------------------------------------------------------------------------------
        Purpose: Returns the reference to the Customer table model
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Customer AS CustomerTableModel NO-UNDO
    GET.
    PRIVATE SET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the reference to the Salesrep table model
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Salesrep AS SalesrepTableModel NO-UNDO
    GET.
    PRIVATE SET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the name of the Business Entity this model belongs to 
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE OVERRIDE PUBLIC PROPERTY EntityName AS CHARACTER NO-UNDO INIT "TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerBusinessEntity":U
    GET.
    PROTECTED SET.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CustomerDatasetModel_Generated class
        Notes:   
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerDatasetModel_Generated ():
        SUPER (DATASET dsCustomer:HANDLE).

        THIS-OBJECT:Customer = NEW CustomerTableModel (THIS-OBJECT, BUFFER eCustomer:HANDLE) .

        THIS-OBJECT:TableModels:Add (THIS-OBJECT:Customer) .

        THIS-OBJECT:Salesrep = NEW SalesrepTableModel (THIS-OBJECT, BUFFER eSalesrep:HANDLE) .

        THIS-OBJECT:TableModels:Add (THIS-OBJECT:Salesrep) .

    
    END CONSTRUCTOR.

  

END CLASS.
