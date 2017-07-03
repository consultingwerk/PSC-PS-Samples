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
    File        : eItem.i
    Purpose     : 

    Syntax      :

    Description :  

    Author(s)   : Mike Fechner
    Created     : 28.01.2013 22:32:12
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

DEFINE {&ACCESS} TEMP-TABLE eItem NO-UNDO {&REFERENCE-ONLY} &IF DEFINED (NO-BEFORE) EQ 0 &THEN BEFORE-TABLE eItemBefore &ENDIF
    FIELD Itemnum AS INTEGER FORMAT "zzzzzzzzz9":U INIT "0":U LABEL "Item Num":T SERIALIZE-NAME "Itemnum":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U
    FIELD ItemName AS CHARACTER FORMAT "x(25)":U LABEL "Item Name":T SERIALIZE-NAME "ItemName":U XML-DATA-TYPE "string":U XML-NODE-TYPE "ELEMENT":U
    FIELD Price AS DECIMAL FORMAT "->,>>>,>>9.99":U INIT "0":U LABEL "Price":T SERIALIZE-NAME "Price":U XML-DATA-TYPE "decimal":U XML-NODE-TYPE "ELEMENT":U
    FIELD Onhand AS INTEGER FORMAT "->>>>9":U INIT "0":U LABEL "On Hand":T SERIALIZE-NAME "Onhand":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U
    FIELD Allocated AS INTEGER FORMAT "->>>>9":U INIT "0":U LABEL "Allocated":T SERIALIZE-NAME "Allocated":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U
    FIELD ReOrder AS INTEGER FORMAT "->>>>9":U INIT "0":U LABEL "Re Order":T SERIALIZE-NAME "ReOrder":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U
    FIELD OnOrder AS INTEGER FORMAT "->>>>9":U INIT "0":U LABEL "On Order":T SERIALIZE-NAME "OnOrder":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U
    FIELD CatPage AS INTEGER FORMAT ">>9":U INIT "0":U LABEL "Cat Page":T SERIALIZE-NAME "CatPage":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U
    FIELD CatDescription AS CHARACTER FORMAT "X(200)":U LABEL "Cat-Description":T SERIALIZE-NAME "CatDescription":U XML-DATA-TYPE "string":U XML-NODE-TYPE "ELEMENT":U
    FIELD Category1 AS CHARACTER FORMAT "x(30)":U LABEL "Category1":T SERIALIZE-NAME "Category1":U XML-DATA-TYPE "string":U XML-NODE-TYPE "ELEMENT":U
    FIELD Category2 AS CHARACTER FORMAT "x(30)":U LABEL "Category2":T SERIALIZE-NAME "Category2":U XML-DATA-TYPE "string":U XML-NODE-TYPE "ELEMENT":U
    FIELD Special AS CHARACTER FORMAT "x(8)":U LABEL "Special":T SERIALIZE-NAME "Special":U XML-DATA-TYPE "string":U XML-NODE-TYPE "ELEMENT":U
    FIELD Weight AS DECIMAL FORMAT "->>,>>9.99":U INIT "0":U LABEL "Weight":T SERIALIZE-NAME "Weight":U XML-DATA-TYPE "decimal":U XML-NODE-TYPE "ELEMENT":U
    FIELD Minqty AS INTEGER FORMAT "->>>>9":U INIT "0":U LABEL "Min Qty":T SERIALIZE-NAME "Minqty":U XML-DATA-TYPE "int":U XML-NODE-TYPE "ELEMENT":U

    INDEX ItemNum AS UNIQUE PRIMARY Itemnum ASCENDING

    .
