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
    File        : eOrder.i
    Purpose     : 

    Syntax      :

    Description :  

    Author(s)   : Mike Fechner
    Created     : 28.01.2013 22:32:12
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

DEFINE {&ACCESS} TEMP-TABLE eOrder NO-UNDO {&REFERENCE-ONLY} &IF DEFINED (NO-BEFORE) EQ 0 &THEN BEFORE-TABLE eOrderBefore &ENDIF
    FIELD Ordernum AS INTEGER FORMAT "zzzzzzzzz9":U INIT "0":U LABEL "Order Num":T SERIALIZE-NAME "Ordernum":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U
    FIELD CustNum AS INTEGER FORMAT ">>>>9":U INIT "0":U LABEL "Cust Num":T SERIALIZE-NAME "CustNum":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U
    FIELD OrderDate AS DATE FORMAT "99/99/99":U INIT "today":U LABEL "Ordered":T SERIALIZE-NAME "OrderDate":U XML-DATA-TYPE "date":U XML-NODE-TYPE "ELEMENT":U
    FIELD ShipDate AS DATE FORMAT "99/99/9999":U LABEL "Shipped":T SERIALIZE-NAME "ShipDate":U XML-DATA-TYPE "date":U XML-NODE-TYPE "ELEMENT":U
    FIELD PromiseDate AS DATE FORMAT "99/99/99":U LABEL "Promised":T SERIALIZE-NAME "PromiseDate":U XML-DATA-TYPE "date":U XML-NODE-TYPE "ELEMENT":U
    FIELD Carrier AS CHARACTER FORMAT "x(25)":U LABEL "Carrier":T SERIALIZE-NAME "Carrier":U XML-DATA-TYPE "string":U XML-NODE-TYPE "ELEMENT":U
    FIELD Instructions AS CHARACTER FORMAT "x(50)":U LABEL "Instructions":T SERIALIZE-NAME "Instructions":U XML-DATA-TYPE "string":U XML-NODE-TYPE "ELEMENT":U
    FIELD PO AS CHARACTER FORMAT "x(20)":U LABEL "PO":T SERIALIZE-NAME "PO":U XML-DATA-TYPE "string":U XML-NODE-TYPE "ELEMENT":U
    FIELD Terms AS CHARACTER FORMAT "x(20)":U INIT "Net30":U LABEL "Terms":T SERIALIZE-NAME "Terms":U XML-DATA-TYPE "string":U XML-NODE-TYPE "ELEMENT":U
    FIELD SalesRep AS CHARACTER FORMAT "x(4)":U LABEL "Sales Rep":T SERIALIZE-NAME "SalesRep":U XML-DATA-TYPE "string":U XML-NODE-TYPE "ELEMENT":U
    FIELD BillToID AS INTEGER FORMAT "zzzzzzzzz9":U INIT "0":U LABEL "Bill To ID":T SERIALIZE-NAME "BillToID":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U
    FIELD ShipToID AS INTEGER FORMAT "zzzzzzzzz9":U INIT "0":U LABEL "Ship To ID":T SERIALIZE-NAME "ShipToID":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U
    FIELD OrderStatus AS CHARACTER FORMAT "x(20)":U INIT "Ordered":U LABEL "Order Status":T SERIALIZE-NAME "OrderStatus":U XML-DATA-TYPE "string":U XML-NODE-TYPE "ELEMENT":U
    FIELD WarehouseNum AS INTEGER FORMAT "zzzzzzzzz9":U INIT "0":U LABEL "Warehouse Num":T SERIALIZE-NAME "WarehouseNum":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U
    FIELD Creditcard AS CHARACTER FORMAT "x(20)":U INIT "Visa":U LABEL "Credit Card":T SERIALIZE-NAME "Creditcard":U XML-DATA-TYPE "string":U XML-NODE-TYPE "ELEMENT":U
    FIELD CustName AS CHARACTER FORMAT "X(30)":U
    FIELD RepName AS CHARACTER FORMAT "X(30)":U
    FIELD OrderTotal AS DECIMAL FORMAT ">>>>>9.99":U
    FIELD SmartRecordKey AS CHARACTER FORMAT "X(80)":U
    FIELD SmartAttachments AS LOGICAL FORMAT "yes/no":U INIT "no":U LABEL "Attachments":T
    FIELD SmartComments AS LOGICAL FORMAT "yes/no":U INIT "no":U LABEL "Comments":T
    FIELD SmartCopiedFrom AS CHARACTER FORMAT "X(8)":U

    INDEX OrderNum AS UNIQUE PRIMARY Ordernum ASCENDING

    .
