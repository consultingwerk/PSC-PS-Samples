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
    File        : eItem
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner
    Created     : 26.10.2012 13:32:28 
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.EntityTable FROM PROPATH .
USING Consultingwerk.SmartComponentsDemo.OERA.Sports2000.* FROM PROPATH .
USING Progress.Lang.* FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.eItem_Generated 
    INHERITS EntityTable
    ABSTRACT: 

    DEFINE PUBLIC PROPERTY Allocated AS INTEGER  NO-UNDO GET. PUBLIC SET. 

    DEFINE PUBLIC PROPERTY CatDescription AS CHARACTER  NO-UNDO GET. PUBLIC SET. 

    DEFINE PUBLIC PROPERTY Category1 AS CHARACTER  NO-UNDO GET. PUBLIC SET. 

    DEFINE PUBLIC PROPERTY Category2 AS CHARACTER  NO-UNDO GET. PUBLIC SET. 

    DEFINE PUBLIC PROPERTY CatPage AS INTEGER  NO-UNDO GET. PUBLIC SET. 

    DEFINE PUBLIC PROPERTY ItemName AS CHARACTER  NO-UNDO GET. PUBLIC SET. 

    DEFINE PUBLIC PROPERTY Itemnum AS INTEGER  NO-UNDO GET. PUBLIC SET. 

    DEFINE PUBLIC PROPERTY Minqty AS INTEGER  NO-UNDO GET. PUBLIC SET. 

    DEFINE PUBLIC PROPERTY Onhand AS INTEGER  NO-UNDO GET. PUBLIC SET. 

    DEFINE PUBLIC PROPERTY OnOrder AS INTEGER  NO-UNDO GET. PUBLIC SET. 

    DEFINE PUBLIC PROPERTY Price AS DECIMAL  NO-UNDO GET. PUBLIC SET. 

    DEFINE PUBLIC PROPERTY ReOrder AS INTEGER  NO-UNDO GET. PUBLIC SET. 

    DEFINE PUBLIC PROPERTY Special AS CHARACTER  NO-UNDO GET. PUBLIC SET. 

    DEFINE PUBLIC PROPERTY Weight AS DECIMAL  NO-UNDO GET. PUBLIC SET. 


    /*------------------------------------------------------------------------------
        Purpose: Constructor of the eItem_Generated class                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC eItem_Generated ():
    
    
    END CONSTRUCTOR .

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the eItem_Generated class                                                                      
        Notes:                                         
        @param phBuffer A source buffer to copy the values from                                
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC eItem_Generated (phBuffer AS HANDLE):
    
        THIS-OBJECT () .
    
        Consultingwerk.Assertion.HandleAssert:WidgetType (phBuffer, 
                                                          "BUFFER":U) .     
    
        THIS-OBJECT:AssignFromBuffer (phBuffer) .  
    
    END CONSTRUCTOR .

        
    /*------------------------------------------------------------------------------
        Purpose: Copies the buffer values to the entity table's properties                                                                        
        Notes:                                                                        
        @param phBuffer The handle of the record buffer to assign properties from                                                             
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED OVERRIDE VOID AssignFromBuffer (phBuffer AS HANDLE):

        DEFINE VARIABLE hBuffer AS HANDLE NO-UNDO.

        ASSIGN THIS-OBJECT:Allocated = phBuffer::Allocated .

        ASSIGN THIS-OBJECT:CatDescription = phBuffer::CatDescription .

        ASSIGN THIS-OBJECT:Category1 = phBuffer::Category1 .

        ASSIGN THIS-OBJECT:Category2 = phBuffer::Category2 .

        ASSIGN THIS-OBJECT:CatPage = phBuffer::CatPage .

        ASSIGN THIS-OBJECT:ItemName = phBuffer::ItemName .

        ASSIGN THIS-OBJECT:Itemnum = phBuffer::Itemnum .

        ASSIGN THIS-OBJECT:Minqty = phBuffer::Minqty .

        ASSIGN THIS-OBJECT:Onhand = phBuffer::Onhand .

        ASSIGN THIS-OBJECT:OnOrder = phBuffer::OnOrder .

        ASSIGN THIS-OBJECT:Price = phBuffer::Price .

        ASSIGN THIS-OBJECT:ReOrder = phBuffer::ReOrder .

        ASSIGN THIS-OBJECT:Special = phBuffer::Special .

        ASSIGN THIS-OBJECT:Weight = phBuffer::Weight .



    END METHOD . 
    
    /*------------------------------------------------------------------------------
        Purpose: Copies the entity table's properties to the buffer values                                                                         
        Notes:                                                                        
        @param phBuffer The handle of the record buffer to assign fields to 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED OVERRIDE VOID AssignToBuffer (phBuffer AS HANDLE):
    
        ASSIGN phBuffer::Allocated = THIS-OBJECT:Allocated .

        ASSIGN phBuffer::CatDescription = THIS-OBJECT:CatDescription .

        ASSIGN phBuffer::Category1 = THIS-OBJECT:Category1 .

        ASSIGN phBuffer::Category2 = THIS-OBJECT:Category2 .

        ASSIGN phBuffer::CatPage = THIS-OBJECT:CatPage .

        ASSIGN phBuffer::ItemName = THIS-OBJECT:ItemName .

        ASSIGN phBuffer::Itemnum = THIS-OBJECT:Itemnum .

        ASSIGN phBuffer::Minqty = THIS-OBJECT:Minqty .

        ASSIGN phBuffer::Onhand = THIS-OBJECT:Onhand .

        ASSIGN phBuffer::OnOrder = THIS-OBJECT:OnOrder .

        ASSIGN phBuffer::Price = THIS-OBJECT:Price .

        ASSIGN phBuffer::ReOrder = THIS-OBJECT:ReOrder .

        ASSIGN phBuffer::Special = THIS-OBJECT:Special .

        ASSIGN phBuffer::Weight = THIS-OBJECT:Weight .

    
    
    END METHOD . 

    /*------------------------------------------------------------------------------
        Purpose: Destructor of the eItem_Generated class                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    DESTRUCTOR PUBLIC eItem_Generated ():

    END DESTRUCTOR.

END CLASS.