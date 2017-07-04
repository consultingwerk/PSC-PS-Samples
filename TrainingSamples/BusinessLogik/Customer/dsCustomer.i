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
    File        : dsCustomer.i
    Purpose     : Business Entity for Customer

    Syntax      :

    Description : 

    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04.07.2017 11:37:35
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

&SCOPED-DEFINE ACCESS {&ACCESS}
&SCOPED-DEFINE REFERENCE-ONLY {&REFERENCE-ONLY}
&SCOPED-DEFINE SUFFIX {&SUFFIX}

&GLOBAL-DEFINE DATASET-NAME dsCustomer

{ TrainingSamples/BusinessLogik/Customer/eCustomer.i }
{ TrainingSamples/BusinessLogik/Customer/eSalesrep.i &NO-BEFORE=YES }


@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity", type="Dataset") .

DEFINE {&ACCESS} DATASET dsCustomer{&SUFFIX} {&REFERENCE-ONLY} FOR eCustomer{&SUFFIX}, eSalesrep{&SUFFIX} 
    DATA-RELATION eCustomereSalesrepRelation FOR eCustomer{&SUFFIX}, eSalesrep{&SUFFIX} 
        RELATION-FIELDS (SalesRep,SalesRep)

    .    
