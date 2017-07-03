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
    File        : eRegion.i
    Purpose     : 

    Syntax      :

    Description :  

    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 15.08.2011 09:57:26
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

DEFINE {&ACCESS} TEMP-TABLE eRegion NO-UNDO {&REFERENCE-ONLY} BEFORE-TABLE eTempTableBefore
    FIELD Region AS CHARACTER FORMAT "X(80)":U LABEL "Region"
    FIELD Description AS CHARACTER FORMAT "X(500)":U LABEL "Description"

    INDEX Region AS UNIQUE PRIMARY Region ASCENDING

    .
