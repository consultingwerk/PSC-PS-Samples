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
    File        : eSalesrep.i
    Purpose     : 

    Syntax      :

    Description :  

    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04.08.2016 00:10:10
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

@BusinessEntityGenerator (entityname="Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity", type="TempTable") .
@openapi.openedge.entity.primarykey (fields="SalesRep").

DEFINE {&ACCESS} TEMP-TABLE eSalesrep{&SUFFIX} NO-UNDO {&REFERENCE-ONLY} &IF DEFINED (NO-BEFORE) EQ 0 &THEN BEFORE-TABLE eSalesrepBefore{&SUFFIX} &ENDIF
    FIELD SalesRep AS CHARACTER FORMAT "x(4)":U LABEL "Sales Rep":T
    FIELD RepName AS CHARACTER FORMAT "x(30)":U LABEL "Rep Name":T
    FIELD Region AS CHARACTER FORMAT "x(8)":U LABEL "Region":T
    FIELD MonthQuota01 AS INTEGER FORMAT "->,>>>,>>9":U INIT "0":U LABEL "Month Quota":T SERIALIZE-NAME "MonthQuota":U
    FIELD MonthQuota02 AS INTEGER FORMAT "->,>>>,>>9":U INIT "0":U
    FIELD MonthQuota03 AS INTEGER FORMAT "->,>>>,>>9":U INIT "0":U
    FIELD MonthQuota04 AS INTEGER FORMAT "->,>>>,>>9":U INIT "0":U
    FIELD MonthQuota05 AS INTEGER FORMAT "->,>>>,>>9":U INIT "0":U
    FIELD MonthQuota06 AS INTEGER FORMAT "->,>>>,>>9":U INIT "0":U
    FIELD MonthQuota07 AS INTEGER FORMAT "->,>>>,>>9":U INIT "0":U
    FIELD MonthQuota08 AS INTEGER FORMAT "->,>>>,>>9":U INIT "0":U
    FIELD MonthQuota09 AS INTEGER FORMAT "->,>>>,>>9":U INIT "0":U
    FIELD MonthQuota10 AS INTEGER FORMAT "->,>>>,>>9":U INIT "0":U
    FIELD MonthQuota11 AS INTEGER FORMAT "->,>>>,>>9":U INIT "0":U
    FIELD MonthQuota12 AS INTEGER FORMAT "->,>>>,>>9":U INIT "0":U
    FIELD SmallImage AS BLOB FORMAT "x(8)":U LABEL "SmallImage":T
    FIELD LargeImage AS BLOB FORMAT "x(8)":U LABEL "LargeImage":T
    FIELD Email AS CHARACTER FORMAT "x(80)":U LABEL "E-Mail":T
    FIELD PhoneMobile AS CHARACTER FORMAT "x(40)":U LABEL "Mobile Phone":T
    FIELD PhoneOffice AS CHARACTER FORMAT "x(40)":U LABEL "Office Phone":T
    FIELD PhonePrivate AS CHARACTER FORMAT "x(40)":U LABEL "Private Phone":T

    INDEX SalesRep AS UNIQUE PRIMARY SalesRep ASCENDING

    .

    