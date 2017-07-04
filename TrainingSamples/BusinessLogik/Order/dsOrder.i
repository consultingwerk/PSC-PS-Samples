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
    File        : dsOrder.i
    Purpose     : Business Entity for Order

    Syntax      :

    Description : 

    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04.07.2017 13:46:38
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

&SCOPED-DEFINE ACCESS {&ACCESS}
&SCOPED-DEFINE REFERENCE-ONLY {&REFERENCE-ONLY}
&SCOPED-DEFINE SUFFIX {&SUFFIX}

&GLOBAL-DEFINE DATASET-NAME dsOrder

{ TrainingSamples/BusinessLogik/Order/eOrder.i }
{ TrainingSamples/BusinessLogik/Order/eOrderLine.i }


@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Order.OrderBusinessEntity", type="Dataset") .

DEFINE {&ACCESS} DATASET dsOrder{&SUFFIX} {&REFERENCE-ONLY} FOR eOrder{&SUFFIX}, eOrderLine{&SUFFIX} 
    DATA-RELATION eOrdereOrderLineRelation FOR eOrder{&SUFFIX}, eOrderLine{&SUFFIX} 
        RELATION-FIELDS (Ordernum,Ordernum)

    .    
