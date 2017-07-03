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
    File        : eOrderLine.i
    Purpose     : 

    Syntax      :

    Description :  

    Author(s)   : Mike Fechner
    Created     : 28.01.2013 22:32:12
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

DEFINE {&ACCESS} TEMP-TABLE eOrderLine NO-UNDO {&REFERENCE-ONLY} &IF DEFINED (NO-BEFORE) EQ 0 &THEN BEFORE-TABLE eOrderLineBefore &ENDIF
    FIELD Ordernum AS INTEGER FORMAT "zzzzzzzzz9":U INIT "0":U LABEL "Order Num":T SERIALIZE-NAME "Ordernum":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U
    FIELD Linenum AS INTEGER FORMAT ">>9":U INIT "0":U LABEL "Line Num":T SERIALIZE-NAME "Linenum":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U
    FIELD Itemnum AS INTEGER FORMAT "zzzzzzzzz9":U INIT "0":U LABEL "Item Num":T SERIALIZE-NAME "Itemnum":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U
    FIELD Price AS DECIMAL FORMAT "->,>>>,>>9.99":U INIT "0":U LABEL "Price":T SERIALIZE-NAME "Price":U XML-DATA-TYPE "decimal":U XML-NODE-TYPE "ELEMENT":U
    FIELD Qty AS INTEGER FORMAT "->>>>9":U INIT "0":U LABEL "Qty":T SERIALIZE-NAME "Qty":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U
    FIELD Discount AS INTEGER FORMAT ">>9%":U INIT "0":U LABEL "Discount":T SERIALIZE-NAME "Discount":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U
    FIELD ExtendedPrice AS DECIMAL FORMAT "->>>,>>9.99":U INIT "0":U LABEL "Extended Price":T SERIALIZE-NAME "ExtendedPrice":U XML-DATA-TYPE "decimal":U XML-NODE-TYPE "ELEMENT":U
    FIELD OrderLineStatus AS CHARACTER FORMAT "x(20)":U INIT "Ordered":U LABEL "Order Line Status":T SERIALIZE-NAME "OrderLineStatus":U XML-DATA-TYPE "string":U XML-NODE-TYPE "ELEMENT":U
    FIELD SmartRecordKey AS CHARACTER FORMAT "X(80)":U
    FIELD SmartAttachments AS LOGICAL FORMAT "yes/no":U INIT "no":U LABEL "Attachments":T
    FIELD SmartComments AS LOGICAL FORMAT "yes/no":U INIT "no":U LABEL "Comments":T
    FIELD SmartCopiedFrom AS CHARACTER FORMAT "X(8)":U

    INDEX orderline AS UNIQUE PRIMARY Ordernum ASCENDING Linenum ASCENDING

    .
