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
    File        : CustomerDatasetController
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 03.07.2017 17:42:21
    Notes       : Conditionally implements the IDatasetController Interface
                  when the SmartComponentLibrary preprocessor option is set.
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

{Consultingwerk/products.i}

USING TrainingSamples.BusinessLogik.CustomerWithReposition.* FROM PROPATH .
USING Consultingwerk.SmartComponents.Interfaces.* FROM PROPATH .
USING Consultingwerk.Util.*                       FROM PROPATH . 
USING Progress.Lang.*                             FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerBusinessEntity", type="DatasetController") .

CLASS TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerDatasetController 
    &IF DEFINED (SmartComponentLibrary) NE 0 &THEN IMPLEMENTS IDatasetController &ENDIF : 

    { TrainingSamples/BusinessLogik/CustomerWithReposition/dsCustomer.i }

    /*------------------------------------------------------------------------------
        Purpose: Returns the reference to the static dataset defined inside the
                 Dataset Controller                                                                     
        Notes:   Interface IDatasetController member                                                                        
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY DatasetHandle AS HANDLE NO-UNDO 
    GET.
    PRIVATE SET. 

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the CustomerDatasetController class                                                                      
        Notes:   Assigns the DatasetHandle property                                                                         
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerDatasetController ():
        SUPER ().

        THIS-OBJECT:DatasetHandle = DATASET dsCustomer:HANDLE .         
        
    END CONSTRUCTOR.
    
    /*------------------------------------------------------------------------------
        Purpose: Invoked by SmartBusinessEntityAdapter and SmartDatasetChildAdapter
                 instances when detaching from the Dataset of the DatasetController.
                 Allows event unsubscription etc.                                                                      
        Notes:   Interface IDatasetController member                                                                        
        @param poConsumer The reference of the Object detaching from the Dataset Controller                                                                
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID DeregisterConsumer (poConsumer AS Progress.Lang.Object):
        
    END METHOD.
        
    /*------------------------------------------------------------------------------
        Purpose: Invoked by SmartBusinessEntityAdapter and SmartDatasetChildAdapter
                 instances when attaching to the Dataset of the DatasetController.
                 Allows event subscription etc.                                                                     
        Notes:   Interface IDatasetController member                                                                        
        @param poConsumer The reference of the Object attaching to the Dataset Controller                                                                
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID RegisterConsumer (poConsumer AS Progress.Lang.Object):

    END METHOD.

END CLASS.