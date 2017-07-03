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
    File        : Order
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

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Order_Generated 
    INHERITS EntityTable
    ABSTRACT: 

    DEFINE PUBLIC PROPERTY Customer AS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Customer NO-UNDO GET. PROTECTED SET. 

    DEFINE PUBLIC PROPERTY OrderLines AS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.ListOrderLine NO-UNDO GET. PROTECTED SET. 

    DEFINE PUBLIC PROPERTY SalesRepresentative AS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Salesrep NO-UNDO GET. PROTECTED SET. 

    DEFINE PUBLIC PROPERTY BillToID AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:BillToID = arg .
        THIS-OBJECT:SetModified () .
        OnBillToIDChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT BillToIDChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnBillToIDChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:BillToIDChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Carrier AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Carrier = arg .
        THIS-OBJECT:SetModified () .
        OnCarrierChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT CarrierChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnCarrierChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:CarrierChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Creditcard AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Creditcard = arg .
        THIS-OBJECT:SetModified () .
        OnCreditcardChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT CreditcardChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnCreditcardChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:CreditcardChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY CustName AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:CustName = arg .
        THIS-OBJECT:SetModified () .
        OnCustNameChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT CustNameChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnCustNameChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:CustNameChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY CustNum AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:CustNum = arg .
        THIS-OBJECT:SetModified () .
        OnCustNumChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT CustNumChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnCustNumChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:CustNumChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Instructions AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Instructions = arg .
        THIS-OBJECT:SetModified () .
        OnInstructionsChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT InstructionsChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnInstructionsChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:InstructionsChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY OrderDate AS DATE  NO-UNDO
    GET.
    PUBLIC SET (arg as DATE):
        THIS-OBJECT:OrderDate = arg .
        THIS-OBJECT:SetModified () .
        OnOrderDateChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT OrderDateChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnOrderDateChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:OrderDateChanged:Publish (THIS-OBJECT, e) . 
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

    DEFINE PUBLIC PROPERTY OrderStatus AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:OrderStatus = arg .
        THIS-OBJECT:SetModified () .
        OnOrderStatusChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT OrderStatusChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnOrderStatusChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:OrderStatusChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY OrderTotal AS DECIMAL  NO-UNDO
    GET.
    PUBLIC SET (arg as DECIMAL):
        THIS-OBJECT:OrderTotal = arg .
        THIS-OBJECT:SetModified () .
        OnOrderTotalChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT OrderTotalChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnOrderTotalChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:OrderTotalChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY PO AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:PO = arg .
        THIS-OBJECT:SetModified () .
        OnPOChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT POChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnPOChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:POChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY PromiseDate AS DATE  NO-UNDO
    GET.
    PUBLIC SET (arg as DATE):
        THIS-OBJECT:PromiseDate = arg .
        THIS-OBJECT:SetModified () .
        OnPromiseDateChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT PromiseDateChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnPromiseDateChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:PromiseDateChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY RepName AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:RepName = arg .
        THIS-OBJECT:SetModified () .
        OnRepNameChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT RepNameChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnRepNameChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:RepNameChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY SalesRep AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:SalesRep = arg .
        THIS-OBJECT:SetModified () .
        OnSalesRepChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT SalesRepChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnSalesRepChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:SalesRepChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY ShipDate AS DATE  NO-UNDO
    GET.
    PUBLIC SET (arg as DATE):
        THIS-OBJECT:ShipDate = arg .
        THIS-OBJECT:SetModified () .
        OnShipDateChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT ShipDateChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnShipDateChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:ShipDateChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY ShipToID AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:ShipToID = arg .
        THIS-OBJECT:SetModified () .
        OnShipToIDChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT ShipToIDChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnShipToIDChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:ShipToIDChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Terms AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Terms = arg .
        THIS-OBJECT:SetModified () .
        OnTermsChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT TermsChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnTermsChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:TermsChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY WarehouseNum AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:WarehouseNum = arg .
        THIS-OBJECT:SetModified () .
        OnWarehouseNumChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT WarehouseNumChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnWarehouseNumChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:WarehouseNumChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .


    /*------------------------------------------------------------------------------
        Purpose: Constructor of the Order_Generated class                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC Order_Generated ():
    
        THIS-OBJECT:OrderLines = NEW Consultingwerk.SmartComponentsDemo.OERA.Sports2000.ListOrderLine () .

    
    END CONSTRUCTOR .

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the Order_Generated class                                                                      
        Notes:                                         
        @param phBuffer A source buffer to copy the values from                                
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC Order_Generated (phBuffer AS HANDLE):
    
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

        ASSIGN THIS-OBJECT:BillToID = phBuffer::BillToID .

        ASSIGN THIS-OBJECT:Carrier = phBuffer::Carrier .

        ASSIGN THIS-OBJECT:Creditcard = phBuffer::Creditcard .

        ASSIGN THIS-OBJECT:CustName = phBuffer::CustName .

        ASSIGN THIS-OBJECT:CustNum = phBuffer::CustNum .

        ASSIGN THIS-OBJECT:Instructions = phBuffer::Instructions .

        ASSIGN THIS-OBJECT:OrderDate = phBuffer::OrderDate .

        ASSIGN THIS-OBJECT:Ordernum = phBuffer::Ordernum .

        ASSIGN THIS-OBJECT:OrderStatus = phBuffer::OrderStatus .

        ASSIGN THIS-OBJECT:OrderTotal = phBuffer::OrderTotal .

        ASSIGN THIS-OBJECT:PO = phBuffer::PO .

        ASSIGN THIS-OBJECT:PromiseDate = phBuffer::PromiseDate .

        ASSIGN THIS-OBJECT:RepName = phBuffer::RepName .

        ASSIGN THIS-OBJECT:SalesRep = phBuffer::SalesRep .

        ASSIGN THIS-OBJECT:ShipDate = phBuffer::ShipDate .

        ASSIGN THIS-OBJECT:ShipToID = phBuffer::ShipToID .

        ASSIGN THIS-OBJECT:Terms = phBuffer::Terms .

        ASSIGN THIS-OBJECT:WarehouseNum = phBuffer::WarehouseNum .

        hBuffer = THIS-OBJECT:GetChildRecord (phBuffer, "eOrdereCustomerRelation":U) .
        
        IF hBuffer:AVAILABLE THEN 
            THIS-OBJECT:Customer = NEW Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Customer (hBuffer) .
        ELSE 
            Consultingwerk.Util.GarbageCollectorHelper:DeleteObject (THIS-OBJECT:Customer) .

        THIS-OBJECT:OrderLines:Clear () .
        THIS-OBJECT:GetChildRecords (phBuffer,
                                     "eOrdereOrderLineRelation":U,
                                     THIS-OBJECT:OrderLines,
                                     "Consultingwerk.SmartComponentsDemo.OERA.Sports2000.OrderLine":U) .

        hBuffer = THIS-OBJECT:GetChildRecord (phBuffer, "eOrdereSalesrepRelation":U) .
        
        IF hBuffer:AVAILABLE THEN 
            THIS-OBJECT:SalesRepresentative = NEW Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Salesrep (hBuffer) .
        ELSE 
            Consultingwerk.Util.GarbageCollectorHelper:DeleteObject (THIS-OBJECT:SalesRepresentative) .



    END METHOD . 
    
    /*------------------------------------------------------------------------------
        Purpose: Copies the entity table's properties to the buffer values                                                                         
        Notes:                                                                        
        @param phBuffer The handle of the record buffer to assign fields to 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED OVERRIDE VOID AssignToBuffer (phBuffer AS HANDLE):
    
        ASSIGN phBuffer::BillToID = THIS-OBJECT:BillToID .

        ASSIGN phBuffer::Carrier = THIS-OBJECT:Carrier .

        ASSIGN phBuffer::Creditcard = THIS-OBJECT:Creditcard .

        ASSIGN phBuffer::CustName = THIS-OBJECT:CustName .

        ASSIGN phBuffer::CustNum = THIS-OBJECT:CustNum .

        ASSIGN phBuffer::Instructions = THIS-OBJECT:Instructions .

        ASSIGN phBuffer::OrderDate = THIS-OBJECT:OrderDate .

        ASSIGN phBuffer::Ordernum = THIS-OBJECT:Ordernum .

        ASSIGN phBuffer::OrderStatus = THIS-OBJECT:OrderStatus .

        ASSIGN phBuffer::OrderTotal = THIS-OBJECT:OrderTotal .

        ASSIGN phBuffer::PO = THIS-OBJECT:PO .

        ASSIGN phBuffer::PromiseDate = THIS-OBJECT:PromiseDate .

        ASSIGN phBuffer::RepName = THIS-OBJECT:RepName .

        ASSIGN phBuffer::SalesRep = THIS-OBJECT:SalesRep .

        ASSIGN phBuffer::ShipDate = THIS-OBJECT:ShipDate .

        ASSIGN phBuffer::ShipToID = THIS-OBJECT:ShipToID .

        ASSIGN phBuffer::Terms = THIS-OBJECT:Terms .

        ASSIGN phBuffer::WarehouseNum = THIS-OBJECT:WarehouseNum .

    
    
    END METHOD . 

    /*------------------------------------------------------------------------------
        Purpose: Destructor of the Order_Generated class                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    DESTRUCTOR PUBLIC Order_Generated ():

    END DESTRUCTOR.

END CLASS.