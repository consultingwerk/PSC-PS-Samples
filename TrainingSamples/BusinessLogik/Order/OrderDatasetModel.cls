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
    File        : Order
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04/07/2017 13:46:39,890+02:00
    Notes       : Custom constructors that should not be replaced when the  
                  DatasetModel class is regenerated, need to be annotated 
                  using the @CustomConstructor. annotation
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH .
USING TrainingSamples.BusinessLogik.Order.* FROM PROPATH .  
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Order.OrderBusinessEntity", type="DatasetModel") .

CLASS TrainingSamples.BusinessLogik.Order.OrderDatasetModel
    INHERITS OrderDatasetModel_Generated: 

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the OrderDatasetModel class
        Notes:   
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderDatasetModel ():
        SUPER ().

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the OrderDatasetModel class
        Notes:   
        @param pOrdernum The filter value for the eOrder.Ordernum field
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderDatasetModel (pOrdernum AS INTEGER):
        SUPER ().

        THIS-OBJECT:Order:Filter:Ordernum:EQ (pOrdernum) .

        THIS-OBJECT:Order:Filter:Run () .

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the OrderDatasetModel class
        Notes:   
        @param pOrdernum The filter value for the eOrderLine.Ordernum field
        @param pLinenum The filter value for the eOrderLine.Linenum field
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderDatasetModel (pOrdernum AS INTEGER, pLinenum AS INTEGER):
        SUPER ().

        THIS-OBJECT:OrderLine:Filter:Ordernum:EQ (pOrdernum) .
        THIS-OBJECT:OrderLine:Filter:Linenum:EQ (pLinenum) .

        THIS-OBJECT:OrderLine:Filter:Run () .

    END CONSTRUCTOR.

    @CustomConstructor.
    /*------------------------------------------------------------------------------
        Purpose: Constructor for the OrderDatasetModel class
        Notes:   Retrieves data based on a named query   
        @param pcTables The comma delimited list of the Table Names to retrieve
        @param poNamedQuery The INamedQueryParameter that defines a named query
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderDatasetModel (pcTables AS CHARACTER,
                                       poNamedQuery AS INamedQueryParameter):
        SUPER ().

        THIS-OBJECT:RetrieveData (pcTables, poNamedQuery) .

    END CONSTRUCTOR.

    @CustomConstructor.
    /*------------------------------------------------------------------------------
        Purpose: Constructor for the OrderDatasetModel class
        Notes:   Retrieves data based on a named query   
        @param poNamedQuery The INamedQueryParameter that defines a named query
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderDatasetModel (poNamedQuery AS INamedQueryParameter):
        SUPER ().

        THIS-OBJECT:RetrieveData (poNamedQuery) .

    END CONSTRUCTOR.

END CLASS.
