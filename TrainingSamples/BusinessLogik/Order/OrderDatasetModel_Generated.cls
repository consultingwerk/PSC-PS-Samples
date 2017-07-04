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
    File        : Order_Generated
    Purpose     : Auto Generated portion of the Order class
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04/07/2017 13:46:39,880+02:00
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH .
USING TrainingSamples.BusinessLogik.Order.* FROM PROPATH .  
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Order.OrderBusinessEntity", type="DatasetModelGenerated") .

CLASS TrainingSamples.BusinessLogik.Order.OrderDatasetModel_Generated 
    INHERITS DatasetModel ABSTRACT: 

    { TrainingSamples/BusinessLogik/Order/dsOrder.i &ACCESS=PROTECTED }

    /*------------------------------------------------------------------------------
        Purpose: Returns the reference to the Order table model
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Order AS OrderTableModel NO-UNDO
    GET.
    PRIVATE SET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the reference to the OrderLine table model
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY OrderLine AS OrderLineTableModel NO-UNDO
    GET.
    PRIVATE SET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the name of the Business Entity this model belongs to 
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE OVERRIDE PUBLIC PROPERTY EntityName AS CHARACTER NO-UNDO INIT "TrainingSamples.BusinessLogik.Order.OrderBusinessEntity":U
    GET.
    PROTECTED SET.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the OrderDatasetModel_Generated class
        Notes:   
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderDatasetModel_Generated ():
        SUPER (DATASET dsOrder:HANDLE).

        THIS-OBJECT:Order = NEW OrderTableModel (THIS-OBJECT, BUFFER eOrder:HANDLE) .

        THIS-OBJECT:TableModels:Add (THIS-OBJECT:Order) .

        THIS-OBJECT:OrderLine = NEW OrderLineTableModel (THIS-OBJECT, BUFFER eOrderLine:HANDLE) .

        THIS-OBJECT:TableModels:Add (THIS-OBJECT:OrderLine) .

    
    END CONSTRUCTOR.

  

END CLASS.