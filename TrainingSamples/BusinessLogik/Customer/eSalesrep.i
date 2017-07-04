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
    Created     : 04.07.2017 09:39:13
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
    FIELD SmallImage AS BLOB FORMAT "x(8)":U INITIAL ? LABEL "SmallImage":T
    FIELD EmailAddress AS CHARACTER FORMAT "x(80)":U LABEL "E-Mail":T
    FIELD PhoneOffice AS CHARACTER FORMAT "x(40)":U LABEL "Office Phone":T
    FIELD PhonePrivate AS CHARACTER FORMAT "x(40)":U LABEL "Private Phone":T
    FIELD PhoneHandy AS CHARACTER FORMAT "x(40)":U LABEL "Mobile Phone":T
    FIELD SmallImage1 AS BLOB FORMAT "x(8)":U LABEL "SmallImage":T
    FIELD SmallImage2 AS BLOB FORMAT "x(8)":U LABEL "SmallImage":T

    INDEX SalesRep AS UNIQUE PRIMARY SalesRep ASCENDING

    .

    