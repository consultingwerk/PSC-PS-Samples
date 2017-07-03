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
    File        : ItemBusinessEntity
    Purpose     : Business Entity for Item
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner
    Created     : 26.10.2012 13:32:26
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.BusinessEntity.
USING Consultingwerk.SmartComponentsDemo.OERA.Sports2000.* .
USING Progress.Lang.*.

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.ItemBusinessEntity INHERITS BusinessEntity: 

    { Consultingwerk/SmartComponentsDemo/OERA/Sports2000/dsItem.i }

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the ItemBusinessEntity class                                                                     
        Notes:   Passes the handle of the dataset instance to the base class and 
                 sets the default DataAccessName                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC ItemBusinessEntity ():
        SUPER (DATASET dsItem:HANDLE).
        
        THIS-OBJECT:DataAccessName = "Consultingwerk.SmartComponentsDemo.OERA.Sports2000.ItemDataAccess":U .

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Provides a hook to modify data in the ProDataset after Read and 
                 Update operations (i.e. population of aggregated values)                                                                     
        Notes:   Invoked during FetchData () and SaveChanges ()                                                                     
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID ReceiveData ():
        
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Provides a hook for high level data validation before Update 
                 operations                                                                     
        Notes:   Invoked during SaveChanges (). When the ERROR flag of the ProDataset
                 is set, the Update operation will be cancelled before writing back
                 the data to the database using the DataAccess object                                                                      
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID ValidateData ():
        
    END METHOD.

END CLASS.
