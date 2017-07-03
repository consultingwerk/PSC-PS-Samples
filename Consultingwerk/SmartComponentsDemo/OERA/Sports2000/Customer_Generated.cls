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
    File        : Customer
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

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Customer_Generated 
    INHERITS EntityTable
    ABSTRACT: 

    DEFINE PUBLIC PROPERTY Address AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Address = arg .
        THIS-OBJECT:SetModified () .
        OnAddressChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT AddressChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnAddressChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:AddressChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Address2 AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Address2 = arg .
        THIS-OBJECT:SetModified () .
        OnAddress2Changed (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT Address2Changed SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnAddress2Changed (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:Address2Changed:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Balance AS DECIMAL  NO-UNDO
    GET.
    PUBLIC SET (arg as DECIMAL):
        THIS-OBJECT:Balance = arg .
        THIS-OBJECT:SetModified () .
        OnBalanceChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT BalanceChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnBalanceChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:BalanceChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY City AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:City = arg .
        THIS-OBJECT:SetModified () .
        OnCityChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT CityChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnCityChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:CityChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Comments AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Comments = arg .
        THIS-OBJECT:SetModified () .
        OnCommentsChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT CommentsChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnCommentsChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:CommentsChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Contact AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Contact = arg .
        THIS-OBJECT:SetModified () .
        OnContactChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT ContactChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnContactChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:ContactChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Country AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Country = arg .
        THIS-OBJECT:SetModified () .
        OnCountryChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT CountryChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnCountryChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:CountryChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY CreditLimit AS DECIMAL  NO-UNDO
    GET.
    PUBLIC SET (arg as DECIMAL):
        THIS-OBJECT:CreditLimit = arg .
        THIS-OBJECT:SetModified () .
        OnCreditLimitChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT CreditLimitChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnCreditLimitChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:CreditLimitChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY CustNum AS INTEGER  NO-UNDO
    GET.
    PROTECTED SET (arg as INTEGER):
        THIS-OBJECT:CustNum = arg .
        THIS-OBJECT:SetModified () .
        OnCustNumChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT CustNumChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnCustNumChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:CustNumChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Discount AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:Discount = arg .
        THIS-OBJECT:SetModified () .
        OnDiscountChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT DiscountChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnDiscountChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:DiscountChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY EmailAddress AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:EmailAddress = arg .
        THIS-OBJECT:SetModified () .
        OnEmailAddressChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT EmailAddressChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnEmailAddressChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:EmailAddressChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Fax AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Fax = arg .
        THIS-OBJECT:SetModified () .
        OnFaxChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT FaxChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnFaxChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:FaxChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Flags AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Flags = arg .
        THIS-OBJECT:SetModified () .
        OnFlagsChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT FlagsChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnFlagsChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:FlagsChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Name AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Name = arg .
        THIS-OBJECT:SetModified () .
        OnNameChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT NameChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnNameChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:NameChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Phone AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Phone = arg .
        THIS-OBJECT:SetModified () .
        OnPhoneChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT PhoneChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnPhoneChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:PhoneChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY PostalCode AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:PostalCode = arg .
        THIS-OBJECT:SetModified () .
        OnPostalCodeChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT PostalCodeChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnPostalCodeChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:PostalCodeChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY SalesRep AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:SalesRep = arg .
        THIS-OBJECT:SetModified () .
        OnSalesRepChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT SalesRepChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnSalesRepChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:SalesRepChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY State AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:State = arg .
        THIS-OBJECT:SetModified () .
        OnStateChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the property value changes                                                                      
        Notes:                                         
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event                               
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT StateChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnStateChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:StateChanged:Publish (THIS-OBJECT, e) . 
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


    /*------------------------------------------------------------------------------
        Purpose: Constructor of the Customer_Generated class                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC Customer_Generated ():
    
    
    END CONSTRUCTOR .

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the Customer_Generated class                                                                      
        Notes:                                         
        @param phBuffer A source buffer to copy the values from                                
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC Customer_Generated (phBuffer AS HANDLE):
    
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

        ASSIGN THIS-OBJECT:Address = phBuffer::Address .

        ASSIGN THIS-OBJECT:Address2 = phBuffer::Address2 .

        ASSIGN THIS-OBJECT:Balance = phBuffer::Balance .

        ASSIGN THIS-OBJECT:City = phBuffer::City .

        ASSIGN THIS-OBJECT:Comments = phBuffer::Comments .

        ASSIGN THIS-OBJECT:Contact = phBuffer::Contact .

        ASSIGN THIS-OBJECT:Country = phBuffer::Country .

        ASSIGN THIS-OBJECT:CreditLimit = phBuffer::CreditLimit .

        ASSIGN THIS-OBJECT:CustNum = phBuffer::CustNum .

        ASSIGN THIS-OBJECT:Discount = phBuffer::Discount .

        ASSIGN THIS-OBJECT:EmailAddress = phBuffer::EmailAddress .

        ASSIGN THIS-OBJECT:Fax = phBuffer::Fax .

        ASSIGN THIS-OBJECT:Flags = phBuffer::Flags .

        ASSIGN THIS-OBJECT:Name = phBuffer::Name .

        ASSIGN THIS-OBJECT:Phone = phBuffer::Phone .

        ASSIGN THIS-OBJECT:PostalCode = phBuffer::PostalCode .

        ASSIGN THIS-OBJECT:SalesRep = phBuffer::SalesRep .

        ASSIGN THIS-OBJECT:State = phBuffer::State .

        ASSIGN THIS-OBJECT:Terms = phBuffer::Terms .



    END METHOD . 
    
    /*------------------------------------------------------------------------------
        Purpose: Copies the entity table's properties to the buffer values                                                                         
        Notes:
        @param phBuffer The handle of the record buffer to assign fields to 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED OVERRIDE VOID AssignToBuffer (phBuffer AS HANDLE):
    
        ASSIGN phBuffer::Address = THIS-OBJECT:Address .

        ASSIGN phBuffer::Address2 = THIS-OBJECT:Address2 .

        ASSIGN phBuffer::Balance = THIS-OBJECT:Balance .

        ASSIGN phBuffer::City = THIS-OBJECT:City .

        ASSIGN phBuffer::Comments = THIS-OBJECT:Comments .

        ASSIGN phBuffer::Contact = THIS-OBJECT:Contact .

        ASSIGN phBuffer::Country = THIS-OBJECT:Country .

        ASSIGN phBuffer::CreditLimit = THIS-OBJECT:CreditLimit .

        ASSIGN phBuffer::CustNum = THIS-OBJECT:CustNum .

        ASSIGN phBuffer::Discount = THIS-OBJECT:Discount .

        ASSIGN phBuffer::EmailAddress = THIS-OBJECT:EmailAddress .

        ASSIGN phBuffer::Fax = THIS-OBJECT:Fax .

        ASSIGN phBuffer::Flags = THIS-OBJECT:Flags .

        ASSIGN phBuffer::Name = THIS-OBJECT:Name .

        ASSIGN phBuffer::Phone = THIS-OBJECT:Phone .

        ASSIGN phBuffer::PostalCode = THIS-OBJECT:PostalCode .

        ASSIGN phBuffer::SalesRep = THIS-OBJECT:SalesRep .

        ASSIGN phBuffer::State = THIS-OBJECT:State .

        ASSIGN phBuffer::Terms = THIS-OBJECT:Terms .

    
    
    END METHOD . 

    /*------------------------------------------------------------------------------
        Purpose: Destructor of the Customer_Generated class                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    DESTRUCTOR PUBLIC Customer_Generated ():

    END DESTRUCTOR.

END CLASS.