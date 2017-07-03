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
    File        : Salesrep
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

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.Salesrep_Generated 
    INHERITS EntityTable
    ABSTRACT: 

    DEFINE PUBLIC PROPERTY Email AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Email = arg .
        THIS-OBJECT:SetModified () .
        OnEmailChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT EmailChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnEmailChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:EmailChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY LargeImage AS MEMPTR  NO-UNDO
    GET.
    PUBLIC SET (arg as MEMPTR):
        THIS-OBJECT:LargeImage = arg .
        THIS-OBJECT:SetModified () .
        OnLargeImageChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT LargeImageChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnLargeImageChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:LargeImageChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY MonthQuota01 AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:MonthQuota01 = arg .
        THIS-OBJECT:SetModified () .
        OnMonthQuota01Changed (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT MonthQuota01Changed SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnMonthQuota01Changed (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:MonthQuota01Changed:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY MonthQuota02 AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:MonthQuota02 = arg .
        THIS-OBJECT:SetModified () .
        OnMonthQuota02Changed (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT MonthQuota02Changed SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnMonthQuota02Changed (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:MonthQuota02Changed:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY MonthQuota03 AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:MonthQuota03 = arg .
        THIS-OBJECT:SetModified () .
        OnMonthQuota03Changed (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT MonthQuota03Changed SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnMonthQuota03Changed (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:MonthQuota03Changed:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY MonthQuota04 AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:MonthQuota04 = arg .
        THIS-OBJECT:SetModified () .
        OnMonthQuota04Changed (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT MonthQuota04Changed SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnMonthQuota04Changed (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:MonthQuota04Changed:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY MonthQuota05 AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:MonthQuota05 = arg .
        THIS-OBJECT:SetModified () .
        OnMonthQuota05Changed (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT MonthQuota05Changed SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnMonthQuota05Changed (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:MonthQuota05Changed:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY MonthQuota06 AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:MonthQuota06 = arg .
        THIS-OBJECT:SetModified () .
        OnMonthQuota06Changed (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT MonthQuota06Changed SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnMonthQuota06Changed (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:MonthQuota06Changed:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY MonthQuota07 AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:MonthQuota07 = arg .
        THIS-OBJECT:SetModified () .
        OnMonthQuota07Changed (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT MonthQuota07Changed SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnMonthQuota07Changed (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:MonthQuota07Changed:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY MonthQuota08 AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:MonthQuota08 = arg .
        THIS-OBJECT:SetModified () .
        OnMonthQuota08Changed (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT MonthQuota08Changed SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnMonthQuota08Changed (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:MonthQuota08Changed:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY MonthQuota09 AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:MonthQuota09 = arg .
        THIS-OBJECT:SetModified () .
        OnMonthQuota09Changed (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT MonthQuota09Changed SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnMonthQuota09Changed (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:MonthQuota09Changed:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY MonthQuota10 AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:MonthQuota10 = arg .
        THIS-OBJECT:SetModified () .
        OnMonthQuota10Changed (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT MonthQuota10Changed SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnMonthQuota10Changed (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:MonthQuota10Changed:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY MonthQuota11 AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:MonthQuota11 = arg .
        THIS-OBJECT:SetModified () .
        OnMonthQuota11Changed (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT MonthQuota11Changed SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnMonthQuota11Changed (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:MonthQuota11Changed:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY MonthQuota12 AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:MonthQuota12 = arg .
        THIS-OBJECT:SetModified () .
        OnMonthQuota12Changed (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT MonthQuota12Changed SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnMonthQuota12Changed (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:MonthQuota12Changed:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY PhoneMobile AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:PhoneMobile = arg .
        THIS-OBJECT:SetModified () .
        OnPhoneMobileChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT PhoneMobileChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnPhoneMobileChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:PhoneMobileChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY PhoneOffice AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:PhoneOffice = arg .
        THIS-OBJECT:SetModified () .
        OnPhoneOfficeChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT PhoneOfficeChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnPhoneOfficeChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:PhoneOfficeChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY PhonePrivate AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:PhonePrivate = arg .
        THIS-OBJECT:SetModified () .
        OnPhonePrivateChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT PhonePrivateChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnPhonePrivateChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:PhonePrivateChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Region AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Region = arg .
        THIS-OBJECT:SetModified () .
        OnRegionChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT RegionChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnRegionChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:RegionChanged:Publish (THIS-OBJECT, e) . 
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
    PROTECTED SET (arg as CHARACTER):
        THIS-OBJECT:SalesRep = arg .
        THIS-OBJECT:SetModified () .
        OnSalesRepChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT SalesRepChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnSalesRepChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:SalesRepChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY SmallImage AS MEMPTR  NO-UNDO
    GET.
    PUBLIC SET (arg as MEMPTR):
        THIS-OBJECT:SmallImage = arg .
        THIS-OBJECT:SetModified () .
        OnSmallImageChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    DEFINE PUBLIC EVENT SmallImageChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    METHOD PROTECTED VOID OnSmallImageChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:SmallImageChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .


    /*------------------------------------------------------------------------------
        Purpose: Constructor of the Salesrep_Generated class                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC Salesrep_Generated ():
    
    
    END CONSTRUCTOR .

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the Salesrep_Generated class                                                                      
        Notes:                                         
        @param phBuffer A source buffer to copy the values from                                
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC Salesrep_Generated (phBuffer AS HANDLE):
    
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

        ASSIGN THIS-OBJECT:Email = phBuffer::Email .

        COPY-LOB FROM phBuffer::LargeImage TO THIS-OBJECT:LargeImage .

        ASSIGN THIS-OBJECT:MonthQuota01 = phBuffer::MonthQuota01 .

        ASSIGN THIS-OBJECT:MonthQuota02 = phBuffer::MonthQuota02 .

        ASSIGN THIS-OBJECT:MonthQuota03 = phBuffer::MonthQuota03 .

        ASSIGN THIS-OBJECT:MonthQuota04 = phBuffer::MonthQuota04 .

        ASSIGN THIS-OBJECT:MonthQuota05 = phBuffer::MonthQuota05 .

        ASSIGN THIS-OBJECT:MonthQuota06 = phBuffer::MonthQuota06 .

        ASSIGN THIS-OBJECT:MonthQuota07 = phBuffer::MonthQuota07 .

        ASSIGN THIS-OBJECT:MonthQuota08 = phBuffer::MonthQuota08 .

        ASSIGN THIS-OBJECT:MonthQuota09 = phBuffer::MonthQuota09 .

        ASSIGN THIS-OBJECT:MonthQuota10 = phBuffer::MonthQuota10 .

        ASSIGN THIS-OBJECT:MonthQuota11 = phBuffer::MonthQuota11 .

        ASSIGN THIS-OBJECT:MonthQuota12 = phBuffer::MonthQuota12 .

        ASSIGN THIS-OBJECT:PhoneMobile = phBuffer::PhoneMobile .

        ASSIGN THIS-OBJECT:PhoneOffice = phBuffer::PhoneOffice .

        ASSIGN THIS-OBJECT:PhonePrivate = phBuffer::PhonePrivate .

        ASSIGN THIS-OBJECT:Region = phBuffer::Region .

        ASSIGN THIS-OBJECT:RepName = phBuffer::RepName .

        ASSIGN THIS-OBJECT:SalesRep = phBuffer::SalesRep .

        COPY-LOB FROM phBuffer::SmallImage TO THIS-OBJECT:SmallImage .



    END METHOD . 
    
    /*------------------------------------------------------------------------------
        Purpose: Copies the entity table's properties to the buffer values                                                                         
        Notes:                                                                        
        @param phBuffer The handle of the record buffer to assign fields to 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED OVERRIDE VOID AssignToBuffer (phBuffer AS HANDLE):
    
        ASSIGN phBuffer::Email = THIS-OBJECT:Email .

        COPY-LOB FROM THIS-OBJECT:LargeImage TO phBuffer::LargeImage .

        ASSIGN phBuffer::MonthQuota01 = THIS-OBJECT:MonthQuota01 .

        ASSIGN phBuffer::MonthQuota02 = THIS-OBJECT:MonthQuota02 .

        ASSIGN phBuffer::MonthQuota03 = THIS-OBJECT:MonthQuota03 .

        ASSIGN phBuffer::MonthQuota04 = THIS-OBJECT:MonthQuota04 .

        ASSIGN phBuffer::MonthQuota05 = THIS-OBJECT:MonthQuota05 .

        ASSIGN phBuffer::MonthQuota06 = THIS-OBJECT:MonthQuota06 .

        ASSIGN phBuffer::MonthQuota07 = THIS-OBJECT:MonthQuota07 .

        ASSIGN phBuffer::MonthQuota08 = THIS-OBJECT:MonthQuota08 .

        ASSIGN phBuffer::MonthQuota09 = THIS-OBJECT:MonthQuota09 .

        ASSIGN phBuffer::MonthQuota10 = THIS-OBJECT:MonthQuota10 .

        ASSIGN phBuffer::MonthQuota11 = THIS-OBJECT:MonthQuota11 .

        ASSIGN phBuffer::MonthQuota12 = THIS-OBJECT:MonthQuota12 .

        ASSIGN phBuffer::PhoneMobile = THIS-OBJECT:PhoneMobile .

        ASSIGN phBuffer::PhoneOffice = THIS-OBJECT:PhoneOffice .

        ASSIGN phBuffer::PhonePrivate = THIS-OBJECT:PhonePrivate .

        ASSIGN phBuffer::Region = THIS-OBJECT:Region .

        ASSIGN phBuffer::RepName = THIS-OBJECT:RepName .

        ASSIGN phBuffer::SalesRep = THIS-OBJECT:SalesRep .

        COPY-LOB FROM THIS-OBJECT:SmallImage TO phBuffer::SmallImage .

    
    
    END METHOD . 

    /*------------------------------------------------------------------------------
        Purpose: Destructor of the Salesrep_Generated class                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    DESTRUCTOR PUBLIC Salesrep_Generated ():

    END DESTRUCTOR.

END CLASS.