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
    File        : eOrder.i
    Purpose     : 

    Syntax      :

    Description :  

    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04.07.2017 16:47:47
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Order.OrderBusinessEntity", type="TempTable") .
@openapi.openedge.entity.primarykey (fields="Ordernum").

DEFINE {&ACCESS} TEMP-TABLE eOrder{&SUFFIX} NO-UNDO {&REFERENCE-ONLY} &IF DEFINED (NO-BEFORE) EQ 0 &THEN BEFORE-TABLE eOrderBefore{&SUFFIX} &ENDIF
    FIELD Ordernum AS INTEGER FORMAT "zzzzzzzzz9":U INITIAL "0":U LABEL "Order Num":T
    FIELD KlantenNo AS INTEGER FORMAT ">>>>9":U INITIAL "0":U LABEL "Cust Num":T
    FIELD OrderDate AS DATE FORMAT "99/99/99":U INITIAL "today":U LABEL "Ordered":T
    FIELD ShipDate AS DATE FORMAT "99/99/9999":U INITIAL ? LABEL "Shipped":T
    FIELD PromiseDate AS DATE FORMAT "99/99/99":U INITIAL ? LABEL "Promised":T
    FIELD Carrier AS CHARACTER FORMAT "x(25)":U LABEL "Carrier":T
    FIELD Instructions AS CHARACTER FORMAT "x(50)":U LABEL "Instructions":T
    FIELD PO AS CHARACTER FORMAT "x(20)":U LABEL "PO":T
    FIELD Terms AS CHARACTER FORMAT "x(20)":U INITIAL "Net30":U LABEL "Terms":T
    FIELD SalesRep AS CHARACTER FORMAT "x(4)":U LABEL "Sales Rep":T
    FIELD BillToID AS INTEGER FORMAT "zzzzzzzzz9":U INITIAL "0":U LABEL "Bill To ID":T
    FIELD ShipToID AS INTEGER FORMAT "zzzzzzzzz9":U INITIAL "0":U LABEL "Ship To ID":T
    FIELD OrderStatus AS CHARACTER FORMAT "x(20)":U INITIAL "Ordered":U LABEL "Order Status":T
    FIELD WarehouseNum AS INTEGER FORMAT "zzzzzzzzz9":U INITIAL "0":U LABEL "Warehouse Num":T
    FIELD Creditcard AS CHARACTER FORMAT "x(20)":U INITIAL "Visa":U LABEL "Credit Card":T

    INDEX CustOrder AS UNIQUE KlantenNo ASCENDING Ordernum ASCENDING
    INDEX OrderDate OrderDate ASCENDING
    INDEX OrderNum AS UNIQUE PRIMARY Ordernum ASCENDING
    INDEX OrderStatus OrderStatus ASCENDING
    INDEX SalesRep SalesRep ASCENDING

    .

    