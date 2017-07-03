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
    File        : eCustomer.i
    Purpose     : 

    Syntax      :

    Description :  

    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 16.11.2016 21:45:29
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

@BusinessEntityGenerator (entityname="Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity", type="TempTable") .
@openapi.openedge.entity.primarykey (fields="CustNum").
@openapi.openedge.entity.field.property (field="EmailAddress", name="semanticType", value="Email").
@openapi.openedge.entity.field.property (field="Phone", name="semanticType", value="PhoneNumber").

DEFINE {&ACCESS} TEMP-TABLE eCustomer{&SUFFIX} NO-UNDO {&REFERENCE-ONLY} &IF DEFINED (NO-BEFORE) EQ 0 &THEN BEFORE-TABLE eCustomerBefore{&SUFFIX} &ENDIF
    FIELD CustNum AS INTEGER FORMAT ">>>>>>>9":U INIT "0":U LABEL "Cust Num":T
    FIELD Country AS CHARACTER FORMAT "x(20)":U INIT "USA":U LABEL "Country":T
    FIELD Name AS CHARACTER FORMAT "x(30)":U LABEL "Name":T
    FIELD Address AS CHARACTER FORMAT "x(35)":U LABEL "Address":T
    FIELD Address2 AS CHARACTER FORMAT "x(35)":U LABEL "Address2":T
    FIELD City AS CHARACTER FORMAT "x(25)":U LABEL "City":T
    FIELD State AS CHARACTER FORMAT "x(20)":U LABEL "State":T
    FIELD PostalCode AS CHARACTER FORMAT "x(10)":U LABEL "Postal Code":T
    FIELD Contact AS CHARACTER FORMAT "x(30)":U LABEL "Contact":T
    FIELD Phone AS CHARACTER FORMAT "x(20)":U LABEL "Phone":T
    FIELD SalesRep AS CHARACTER FORMAT "x(4)":U LABEL "Sales Rep":T
    FIELD CreditLimit AS DECIMAL FORMAT "->,>>>,>>9":U INIT "1500":U LABEL "Credit Limit":T
    FIELD Balance AS DECIMAL FORMAT "->,>>>,>>9.99":U INIT "0":U LABEL "Balance":T
    FIELD Terms AS CHARACTER FORMAT "x(20)":U INIT "Net30":U LABEL "Terms":T
    FIELD Discount AS INTEGER FORMAT ">>9%":U INIT "0":U LABEL "Discount":T
    FIELD Comments AS CHARACTER FORMAT "x(80)":U LABEL "Comments":T
    FIELD Fax AS CHARACTER FORMAT "x(20)":U LABEL "Fax":T
    FIELD EmailAddress AS CHARACTER FORMAT "x(50)":U LABEL "Email":T
    FIELD Flags AS CHARACTER FORMAT "X(8)":U LABEL "Notes":T
    FIELD SmartRecordKey AS CHARACTER FORMAT "X(80)":U
    FIELD SmartAttachments AS LOGICAL FORMAT "yes/no":U INIT "no":U LABEL "Attachments":T
    FIELD SmartComments AS LOGICAL FORMAT "yes/no":U INIT "no":U LABEL "Comments":T
    FIELD SmartCopiedFrom AS CHARACTER FORMAT "X(8)":U

    INDEX Comments AS WORD-INDEX Comments ASCENDING
    INDEX CountryPost Country ASCENDING PostalCode ASCENDING
    INDEX CustNum AS UNIQUE PRIMARY CustNum ASCENDING
    INDEX Name Name ASCENDING
    INDEX SalesRep SalesRep ASCENDING

    .

    