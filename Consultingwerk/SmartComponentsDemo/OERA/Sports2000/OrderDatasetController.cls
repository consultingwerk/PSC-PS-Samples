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
    File        : OrderDatasetController
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner
    Created     : 09.11.2012 13:29:35
    Notes       : Conditionally implements the IDatasetController Interface
                  when the SmartComponentLibrary preprocessor option is set.
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

{Consultingwerk/products.i}

USING Consultingwerk.SmartComponents.Interfaces.* .
USING Consultingwerk.SmartComponentsDemo.OERA.Sports2000.* .
USING Progress.Lang.*.

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.OrderDatasetController 
    &IF DEFINED (SmartComponentLibrary) NE 0 &THEN IMPLEMENTS IDatasetController &ENDIF : 

    { Consultingwerk/SmartComponentsDemo/OERA/Sports2000/dsOrder.i }

    /*------------------------------------------------------------------------------
        Purpose: Returns the reference to the static dataset defined inside the
                 Dataset Controller                                                                     
        Notes:   Interface IDatasetController member                                                                        
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY DatasetHandle AS HANDLE NO-UNDO 
    GET.
    PRIVATE SET. 

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the OrderDatasetController class                                                                      
        Notes:   Assigns the DatasetHandle property                                                                         
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderDatasetController ():
        SUPER ().

        THIS-OBJECT:DatasetHandle = DATASET dsOrder:HANDLE .         
        
    END CONSTRUCTOR.
    
    /*------------------------------------------------------------------------------
        Purpose: Invoked by SmartBusinessEntityAdapter and SmartDatasetChildAdapter
                 instances when detaching from the Dataset of the DatasetController.
                 Allows event unsubscription etc.                                                                      
        Notes:   Interface IDatasetController member                                                                        
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID DeregisterConsumer (poConsumer AS Progress.Lang.Object):
        
    END METHOD.
        
    /*------------------------------------------------------------------------------
        Purpose: Invoked by SmartBusinessEntityAdapter and SmartDatasetChildAdapter
                 instances when attaching to the Dataset of the DatasetController.
                 Allows event subscription etc.                                                                     
        Notes:   Interface IDatasetController member                                                                        
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID RegisterConsumer (poConsumer AS Progress.Lang.Object):

    END METHOD.

END CLASS.