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
    File        : eOrderLine.i
    Purpose     : 

    Syntax      :

    Description :  

    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04.07.2017 13:46:38
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Order.OrderBusinessEntity", type="TempTable") .
@openapi.openedge.entity.primarykey (fields="Ordernum,Linenum").

DEFINE {&ACCESS} TEMP-TABLE eOrderLine{&SUFFIX} NO-UNDO {&REFERENCE-ONLY} &IF DEFINED (NO-BEFORE) EQ 0 &THEN BEFORE-TABLE eOrderLineBefore{&SUFFIX} &ENDIF
    FIELD Ordernum AS INTEGER FORMAT "zzzzzzzzz9":U INITIAL "0":U LABEL "Order Num":T
    FIELD Linenum AS INTEGER FORMAT ">>9":U INITIAL "0":U LABEL "Line Num":T
    FIELD Itemnum AS INTEGER FORMAT "zzzzzzzzz9":U INITIAL "0":U LABEL "Item Num":T
    FIELD Price AS DECIMAL FORMAT "->,>>>,>>9.99":U INITIAL "0":U LABEL "Price":T
    FIELD Qty AS INTEGER FORMAT "->>>>9":U INITIAL "0":U LABEL "Qty":T
    FIELD Discount AS INTEGER FORMAT ">>9%":U INITIAL "0":U LABEL "Discount":T
    FIELD ExtendedPrice AS DECIMAL FORMAT "->>>,>>9.99":U INITIAL "0":U LABEL "Extended Price":T
    FIELD OrderLineStatus AS CHARACTER FORMAT "x(20)":U INITIAL "Ordered":U LABEL "Order Line Status":T

    INDEX itemnum Itemnum ASCENDING
    INDEX orderline AS UNIQUE PRIMARY Ordernum ASCENDING Linenum ASCENDING
    INDEX OrderLineStatus OrderLineStatus ASCENDING

    .

    