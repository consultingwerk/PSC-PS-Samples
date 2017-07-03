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
    File        : dsOrder.i
    Purpose     : Business Entity for Order

    Syntax      :

    Description : 

    Author(s)   : Mike Fechner
    Created     : 28.01.2013 22:32:12
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

&SCOPED-DEFINE ACCESS {&ACCESS}
&SCOPED-DEFINE REFERENCE-ONLY {&REFERENCE-ONLY}

&GLOBAL-DEFINE DATASET-NAME dsOrder

{ Consultingwerk/SmartComponentsDemo/OERA/Sports2000/eOrder.i }
{ Consultingwerk/SmartComponentsDemo/OERA/Sports2000/eCustomer.i }
{ Consultingwerk/SmartComponentsDemo/OERA/Sports2000/eOrderLine.i }
{ Consultingwerk/SmartComponentsDemo/OERA/Sports2000/eItem.i }
{ Consultingwerk/SmartComponentsDemo/OERA/Sports2000/eSalesrep.i }


DEFINE {&ACCESS} DATASET dsOrder {&REFERENCE-ONLY} FOR eOrder, eCustomer, eOrderLine, eItem, eSalesrep 
    DATA-RELATION eOrdereCustomerRelation FOR eOrder, eCustomer 
        RELATION-FIELDS (CustNum,CustNum)
    DATA-RELATION eOrdereOrderLineRelation FOR eOrder, eOrderLine 
        RELATION-FIELDS (Ordernum,Ordernum)
    DATA-RELATION eOrdereSalesrepRelation FOR eOrder, eSalesrep 
        RELATION-FIELDS (SalesRep,SalesRep)
    DATA-RELATION eOrderLineeItemRelation FOR eOrderLine, eItem 
        RELATION-FIELDS (Itemnum,Itemnum)

    .    
