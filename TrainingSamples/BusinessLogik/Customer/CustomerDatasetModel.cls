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
    File        : Customer
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 03/07/2017 14:41:48,089+02:00
    Notes       : Custom constructors that should not be replaced when the  
                  DatasetModel class is regenerated, need to be annotated 
                  using the @CustomConstructor. annotation
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH .
USING TrainingSamples.BusinessLogik.Customer.* FROM PROPATH .  
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity", type="DatasetModel") .

CLASS TrainingSamples.BusinessLogik.Customer.CustomerDatasetModel
    INHERITS CustomerDatasetModel_Generated: 

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CustomerDatasetModel class
        Notes:   
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerDatasetModel ():
        SUPER ().

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CustomerDatasetModel class
        Notes:   
        @param pCustNum The filter value for the eCustomer.CustNum field
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerDatasetModel (pCustNum AS INTEGER):
        SUPER ().

        THIS-OBJECT:Customer:Filter:CustNum:EQ (pCustNum) .

        THIS-OBJECT:Customer:Filter:Run () .

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CustomerDatasetModel class
        Notes:   
        @param pSalesRep The filter value for the eCustomer.SalesRep field
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerDatasetModel (pSalesRep AS CHARACTER):
        SUPER ().

        THIS-OBJECT:Customer:Filter:SalesRep:EQ (pSalesRep) .

        THIS-OBJECT:Customer:Filter:Run () .

    END CONSTRUCTOR.

    @CustomConstructor.
    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CustomerDatasetModel class
        Notes:   Retrieves data based on a named query   
        @param pcTables The comma delimited list of the Table Names to retrieve
        @param poNamedQuery The INamedQueryParameter that defines a named query
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerDatasetModel (pcTables AS CHARACTER,
                                       poNamedQuery AS INamedQueryParameter):
        SUPER ().

        THIS-OBJECT:RetrieveData (pcTables, poNamedQuery) .

    END CONSTRUCTOR.

    @CustomConstructor.
    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CustomerDatasetModel class
        Notes:   Retrieves data based on a named query   
        @param poNamedQuery The INamedQueryParameter that defines a named query
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerDatasetModel (poNamedQuery AS INamedQueryParameter):
        SUPER ().

        THIS-OBJECT:RetrieveData (poNamedQuery) .

    END CONSTRUCTOR.

END CLASS.
