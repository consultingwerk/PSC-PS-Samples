/**********************************************************************
 * Copyright (C) 2006-2014 by Consultingwerk Ltd. ("CW") -            *
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
    File        : dsCustomer.i
    Purpose     : Business Entity for Customer

    Syntax      :

    Description : Example Business Entity for customer

    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 05.03.2015 20:51:40
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

&SCOPED-DEFINE ACCESS {&ACCESS}
&SCOPED-DEFINE REFERENCE-ONLY {&REFERENCE-ONLY}
&SCOPED-DEFINE SUFFIX {&SUFFIX}

&GLOBAL-DEFINE DATASET-NAME dsCustomer

{ Consultingwerk/SmartComponentsDemo/OERA/Sports2000/eCustomer.i }
{ Consultingwerk/SmartComponentsDemo/OERA/Sports2000/eSalesrep.i &NO-BEFORE=YES }


@BusinessEntityGenerator (entityname="Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity", type="Dataset") .

DEFINE {&ACCESS} DATASET dsCustomer{&SUFFIX} {&REFERENCE-ONLY} FOR eCustomer{&SUFFIX}, eSalesrep{&SUFFIX} 
    DATA-RELATION eCustomereSalesrepRelation FOR eCustomer{&SUFFIX}, eSalesrep{&SUFFIX} 
        RELATION-FIELDS (SalesRep,SalesRep)
        NESTED 

    .    
