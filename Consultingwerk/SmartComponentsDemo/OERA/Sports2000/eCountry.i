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
    File        : eCountry.i
    Purpose     : 

    Syntax      :

    Description :  

    Author(s)   : Mike Fechner
    Created     : 19.12.2013 22:10:18
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

DEFINE {&ACCESS} TEMP-TABLE eCountry NO-UNDO {&REFERENCE-ONLY} &IF DEFINED (NO-BEFORE) EQ 0 &THEN BEFORE-TABLE eCountryBefore &ENDIF
    FIELD Country AS CHARACTER FORMAT "x(20)":U INIT "USA":U LABEL "Country":T SERIALIZE-NAME "Country":U XML-DATA-TYPE "string":U XML-NODE-TYPE "ELEMENT":U
    FIELD CountryName AS CHARACTER FORMAT "x(80)":U LABEL "Name":T SERIALIZE-NAME "CountryName":U XML-DATA-TYPE "string":U XML-NODE-TYPE "ELEMENT":U
    FIELD CountryFlag AS BLOB FORMAT "x(8)":U LABEL "CountryFlag":T SERIALIZE-NAME "CountryFlag":U XML-DATA-TYPE "base64Binary":U XML-NODE-TYPE "ELEMENT":U
    FIELD NumberOfCustomers AS INT64 FORMAT ">>>,>>>,>>9":U INIT "0":U LABEL "Number of Customers":T
    FIELD CountryEuropeanUnion AS LOGICAL FORMAT "yes/no":U INIT "no":U LABEL "EU Member":T SERIALIZE-NAME "CountryEuropeanUnion":U XML-DATA-TYPE "boolean":U XML-NODE-TYPE "ELEMENT":U

    INDEX Country AS UNIQUE PRIMARY Country ASCENDING

    .
