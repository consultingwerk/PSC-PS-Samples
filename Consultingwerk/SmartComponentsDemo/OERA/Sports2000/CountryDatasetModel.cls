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
    File        : Country
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner
    Created     : 19/12/2013 22:10:20,818+01:00
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH .
USING Consultingwerk.SmartComponentsDemo.OERA.Sports2000.* FROM PROPATH .  
USING Progress.Lang.* FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CountryDatasetModel
    INHERITS CountryDatasetModel_Generated: 

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CountryDatasetModel class
        Notes:   
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CountryDatasetModel ():
        SUPER ().

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CountryDatasetModel class
        Notes:   
        @param pCountry The filter value for the eCountry.Country field
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CountryDatasetModel (pCountry AS CHARACTER):
        SUPER ().

        THIS-OBJECT:Country:Filter:Country:EQ (pCountry) .

        THIS-OBJECT:Country:Filter:Run () .

    END CONSTRUCTOR.

END CLASS.
