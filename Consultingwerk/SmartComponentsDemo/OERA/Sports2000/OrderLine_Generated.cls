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
    File        : OrderLine
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

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.OrderLine_Generated 
    INHERITS EntityTable
    ABSTRACT: 

    DEFINE PUBLIC PROPERTY Item AS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Item NO-UNDO GET. PROTECTED SET. 

    DEFINE PUBLIC PROPERTY Discount AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:Discount = arg .
        THIS-OBJECT:SetModified () .
        OnDiscountChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT DiscountChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnDiscountChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:DiscountChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY ExtendedPrice AS DECIMAL  NO-UNDO
    GET.
    PUBLIC SET (arg as DECIMAL):
        THIS-OBJECT:ExtendedPrice = arg .
        THIS-OBJECT:SetModified () .
        OnExtendedPriceChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT ExtendedPriceChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnExtendedPriceChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:ExtendedPriceChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Itemnum AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:Itemnum = arg .
        THIS-OBJECT:SetModified () .
        OnItemnumChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT ItemnumChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnItemnumChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:ItemnumChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Linenum AS INTEGER  NO-UNDO
    GET.
    PROTECTED SET (arg as INTEGER):
        THIS-OBJECT:Linenum = arg .
        THIS-OBJECT:SetModified () .
        OnLinenumChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT LinenumChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnLinenumChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:LinenumChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY OrderLineStatus AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:OrderLineStatus = arg .
        THIS-OBJECT:SetModified () .
        OnOrderLineStatusChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT OrderLineStatusChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnOrderLineStatusChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:OrderLineStatusChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Ordernum AS INTEGER  NO-UNDO
    GET.
    PROTECTED SET (arg as INTEGER):
        THIS-OBJECT:Ordernum = arg .
        THIS-OBJECT:SetModified () .
        OnOrdernumChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT OrdernumChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnOrdernumChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:OrdernumChanged:Publish (THIS-OBJECT, e) . 
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

    DEFINE PUBLIC PROPERTY Qty AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:Qty = arg .
        THIS-OBJECT:SetModified () .
        OnQtyChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT QtyChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnQtyChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:QtyChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .


    /*------------------------------------------------------------------------------
        Purpose: Constructor of the OrderLine_Generated class                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderLine_Generated ():
    
    
    END CONSTRUCTOR .

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the OrderLine_Generated class                                                                      
        Notes:                                         
        @param phBuffer A source buffer to copy the values from                                
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderLine_Generated (phBuffer AS HANDLE):
    
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

        ASSIGN THIS-OBJECT:Discount = phBuffer::Discount .

        ASSIGN THIS-OBJECT:ExtendedPrice = phBuffer::ExtendedPrice .

        ASSIGN THIS-OBJECT:Itemnum = phBuffer::Itemnum .

        ASSIGN THIS-OBJECT:Linenum = phBuffer::Linenum .

        ASSIGN THIS-OBJECT:OrderLineStatus = phBuffer::OrderLineStatus .

        ASSIGN THIS-OBJECT:Ordernum = phBuffer::Ordernum .

        ASSIGN THIS-OBJECT:Price = phBuffer::Price .

        ASSIGN THIS-OBJECT:Qty = phBuffer::Qty .

        hBuffer = THIS-OBJECT:GetChildRecord (phBuffer, "eOrderLineeItemRelation":U) .
        
        IF hBuffer:AVAILABLE THEN 
            THIS-OBJECT:Item = NEW Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Item (hBuffer) .
        ELSE 
            Consultingwerk.Util.GarbageCollectorHelper:DeleteObject (THIS-OBJECT:Item) .



    END METHOD . 
    
    /*------------------------------------------------------------------------------
        Purpose: Copies the entity table's properties to the buffer values                                                                         
        Notes:                                                                        
        @param phBuffer The handle of the record buffer to assign fields to 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED OVERRIDE VOID AssignToBuffer (phBuffer AS HANDLE):
    
        ASSIGN phBuffer::Discount = THIS-OBJECT:Discount .

        ASSIGN phBuffer::ExtendedPrice = THIS-OBJECT:ExtendedPrice .

        ASSIGN phBuffer::Itemnum = THIS-OBJECT:Itemnum .

        ASSIGN phBuffer::Linenum = THIS-OBJECT:Linenum .

        ASSIGN phBuffer::OrderLineStatus = THIS-OBJECT:OrderLineStatus .

        ASSIGN phBuffer::Ordernum = THIS-OBJECT:Ordernum .

        ASSIGN phBuffer::Price = THIS-OBJECT:Price .

        ASSIGN phBuffer::Qty = THIS-OBJECT:Qty .

    
    
    END METHOD . 

    /*------------------------------------------------------------------------------
        Purpose: Destructor of the OrderLine_Generated class                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    DESTRUCTOR PUBLIC OrderLine_Generated ():

    END DESTRUCTOR.

END CLASS.