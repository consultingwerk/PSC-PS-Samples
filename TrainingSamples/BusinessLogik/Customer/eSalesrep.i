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
    Created     : 03.07.2017 14:41:45
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity", type="TempTable") .
@openapi.openedge.entity.primarykey (fields="SalesRep").

DEFINE {&ACCESS} TEMP-TABLE eSalesrep{&SUFFIX} NO-UNDO {&REFERENCE-ONLY} &IF DEFINED (NO-BEFORE) EQ 0 &THEN BEFORE-TABLE eSalesrepBefore{&SUFFIX} &ENDIF
    FIELD SalesRep AS CHARACTER FORMAT "x(4)":U LABEL "Sales Rep":T
    FIELD RepName AS CHARACTER FORMAT "x(30)":U LABEL "Rep Name":T
    FIELD Region AS CHARACTER FORMAT "x(8)":U LABEL "Region":T
    FIELD MonthQuota_01 AS INTEGER FORMAT "->,>>>,>>9":U INITIAL "0":U LABEL "Month Quota":T
    FIELD MonthQuota_02 AS INTEGER FORMAT "->,>>>,>>9":U INITIAL "0":U LABEL "Month Quota":T
    FIELD MonthQuota_03 AS INTEGER FORMAT "->,>>>,>>9":U INITIAL "0":U LABEL "Month Quota":T
    FIELD MonthQuota_04 AS INTEGER FORMAT "->,>>>,>>9":U INITIAL "0":U LABEL "Month Quota":T
    FIELD MonthQuota_05 AS INTEGER FORMAT "->,>>>,>>9":U INITIAL "0":U LABEL "Month Quota":T
    FIELD MonthQuota_06 AS INTEGER FORMAT "->,>>>,>>9":U INITIAL "0":U LABEL "Month Quota":T
    FIELD MonthQuota_07 AS INTEGER FORMAT "->,>>>,>>9":U INITIAL "0":U LABEL "Month Quota":T
    FIELD MonthQuota_08 AS INTEGER FORMAT "->,>>>,>>9":U INITIAL "0":U LABEL "Month Quota":T
    FIELD MonthQuota_09 AS INTEGER FORMAT "->,>>>,>>9":U INITIAL "0":U LABEL "Month Quota":T
    FIELD MonthQuota_10 AS INTEGER FORMAT "->,>>>,>>9":U INITIAL "0":U LABEL "Month Quota":T
    FIELD MonthQuota_11 AS INTEGER FORMAT "->,>>>,>>9":U INITIAL "0":U LABEL "Month Quota":T
    FIELD MonthQuota_12 AS INTEGER FORMAT "->,>>>,>>9":U INITIAL "0":U LABEL "Month Quota":T
    FIELD SmallImage AS BLOB FORMAT "x(8)":U INITIAL ? LABEL "SmallImage":T
    FIELD LargeImage AS BLOB FORMAT "x(8)":U INITIAL ? LABEL "LargeImage":T
    FIELD Email AS CHARACTER FORMAT "x(80)":U LABEL "E-Mail":T
    FIELD PhoneOffice AS CHARACTER FORMAT "x(40)":U LABEL "Office Phone":T
    FIELD PhonePrivate AS CHARACTER FORMAT "x(40)":U LABEL "Private Phone":T
    FIELD PhoneMobile AS CHARACTER FORMAT "x(40)":U LABEL "Mobile Phone":T

    INDEX SalesRep AS UNIQUE PRIMARY SalesRep ASCENDING

    .

    