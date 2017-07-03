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
    File        : Item
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner
    Created     : 09.11.2012 13:29:38 
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.EntityTable FROM PROPATH .
USING Consultingwerk.SmartComponentsDemo.OERA.Sports2000.* FROM PROPATH .
USING Progress.Lang.* FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Item_Generated 
    INHERITS EntityTable
    ABSTRACT: 

    DEFINE PUBLIC PROPERTY Allocated AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:Allocated = arg .
        THIS-OBJECT:SetModified () .
        OnAllocatedChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT AllocatedChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnAllocatedChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:AllocatedChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY CatDescription AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:CatDescription = arg .
        THIS-OBJECT:SetModified () .
        OnCatDescriptionChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT CatDescriptionChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnCatDescriptionChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:CatDescriptionChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Category1 AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Category1 = arg .
        THIS-OBJECT:SetModified () .
        OnCategory1Changed (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT Category1Changed SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnCategory1Changed (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:Category1Changed:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Category2 AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Category2 = arg .
        THIS-OBJECT:SetModified () .
        OnCategory2Changed (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT Category2Changed SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnCategory2Changed (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:Category2Changed:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY CatPage AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:CatPage = arg .
        THIS-OBJECT:SetModified () .
        OnCatPageChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT CatPageChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnCatPageChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:CatPageChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY ItemName AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:ItemName = arg .
        THIS-OBJECT:SetModified () .
        OnItemNameChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT ItemNameChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnItemNameChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:ItemNameChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Itemnum AS INTEGER  NO-UNDO
    GET.
    PROTECTED SET (arg as INTEGER):
        THIS-OBJECT:Itemnum = arg .
        THIS-OBJECT:SetModified () .
        OnItemnumChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT ItemnumChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnItemnumChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:ItemnumChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Minqty AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:Minqty = arg .
        THIS-OBJECT:SetModified () .
        OnMinqtyChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT MinqtyChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnMinqtyChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:MinqtyChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Onhand AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:Onhand = arg .
        THIS-OBJECT:SetModified () .
        OnOnhandChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT OnhandChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnOnhandChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:OnhandChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY OnOrder AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:OnOrder = arg .
        THIS-OBJECT:SetModified () .
        OnOnOrderChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT OnOrderChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnOnOrderChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:OnOrderChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Price AS DECIMAL  NO-UNDO
    GET.
    PUBLIC SET (arg as DECIMAL):
        THIS-OBJECT:Price = arg .
        THIS-OBJECT:SetModified () .
        OnPriceChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT PriceChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnPriceChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:PriceChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY ReOrder AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:ReOrder = arg .
        THIS-OBJECT:SetModified () .
        OnReOrderChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT ReOrderChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnReOrderChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:ReOrderChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Special AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Special = arg .
        THIS-OBJECT:SetModified () .
        OnSpecialChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT SpecialChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnSpecialChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:SpecialChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Weight AS DECIMAL  NO-UNDO
    GET.
    PUBLIC SET (arg as DECIMAL):
        THIS-OBJECT:Weight = arg .
        THIS-OBJECT:SetModified () .
        OnWeightChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT WeightChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnWeightChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:WeightChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .


    /*------------------------------------------------------------------------------
        Purpose: Constructor of the Item_Generated class                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC Item_Generated ():
    
    
    END CONSTRUCTOR .

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the Item_Generated class                                                                      
        Notes:                                         
        @param phBuffer A source buffer to copy the values from                                
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC Item_Generated (phBuffer AS HANDLE):
    
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
        Purpose: Destructor of the Item_Generated class                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    DESTRUCTOR PUBLIC Item_Generated ():

    END DESTRUCTOR.

END CLASS.