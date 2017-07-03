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
    File        : dsCountry.i
    Purpose     : Business Entity for Country

    Syntax      :

    Description : 

    Author(s)   : Mike Fechner
    Created     : 19.12.2013 22:10:18
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

&SCOPED-DEFINE ACCESS {&ACCESS}
&SCOPED-DEFINE REFERENCE-ONLY {&REFERENCE-ONLY}

&GLOBAL-DEFINE DATASET-NAME dsCountry

{ Consultingwerk/SmartComponentsDemo/OERA/Sports2000/eCountry.i }


DEFINE {&ACCESS} DATASET dsCountry {&REFERENCE-ONLY} FOR eCountry 

    .    
