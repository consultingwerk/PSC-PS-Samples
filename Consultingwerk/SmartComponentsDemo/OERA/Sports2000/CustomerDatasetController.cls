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
    File        : CustomerDatasetController
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 25.02.2011 20:53:22
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

{ Consultingwerk/products.i }

USING Consultingwerk.SmartComponents.Interfaces.* .
USING Progress.Lang.*.

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerDatasetController  
    &IF DEFINED (SmartComponentLibrary) NE 0 &THEN IMPLEMENTS IDatasetController &ENDIF : 

    { Consultingwerk/SmartComponentsDemo/OERA/Sports2000/dsCustomer.i }

    /*------------------------------------------------------------------------------
        Purpose:                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY DatasetHandle AS HANDLE NO-UNDO 
    GET.
    PRIVATE SET. 

    /*------------------------------------------------------------------------------
        Purpose:                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerDatasetController ():
        SUPER ().

        THIS-OBJECT:DatasetHandle = DATASET dsCustomer:HANDLE .         
        
    END CONSTRUCTOR.
    
    /*------------------------------------------------------------------------------
        Purpose:                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID DeregisterConsumer (poConsumer AS Progress.Lang.Object):
        
    END METHOD.
        
    /*------------------------------------------------------------------------------
        Purpose:                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID RegisterConsumer (poConsumer AS Progress.Lang.Object):

    END METHOD.

END CLASS.