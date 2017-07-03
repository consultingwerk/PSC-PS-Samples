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
    File        : dsItem.i
    Purpose     : Business Entity for Item

    Syntax      :

    Description : 

    Author(s)   : Mike Fechner
    Created     : 26.10.2012 13:32:26
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

&SCOPED-DEFINE ACCESS {&ACCESS}
&SCOPED-DEFINE REFERENCE-ONLY {&REFERENCE-ONLY}

&GLOBAL-DEFINE DATASET-NAME dsItem

{ Consultingwerk/SmartComponentsDemo/OERA/Sports2000/eItem.i }


DEFINE {&ACCESS} DATASET dsItem {&REFERENCE-ONLY} FOR eItem 

    .    
