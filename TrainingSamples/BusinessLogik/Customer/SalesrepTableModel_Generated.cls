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
    File        : SalesrepTableModel_Generated
    Purpose     : Auto Generated portion of the SalesrepTableModel class
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 03/07/2017 14:41:47,829+02:00
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH .
USING TrainingSamples.BusinessLogik.Customer.* FROM PROPATH .  
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity", type="TableModelGenerated") .

CLASS TrainingSamples.BusinessLogik.Customer.SalesrepTableModel_Generated 
    INHERITS TableModel ABSTRACT: 

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current SalesRep value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY SalesRep AS CHARACTER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetCharacterFieldValue ("SalesRep":U) .
    END GET . 
    PUBLIC SET (arg AS CHARACTER):
        THIS-OBJECT:SetCharacterFieldValue ("SalesRep":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the SalesRep field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC CHARACTER SalesRepWhenAvailable (pDefaultValue AS CHARACTER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("SalesRep":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current RepName value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY RepName AS CHARACTER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetCharacterFieldValue ("RepName":U) .
    END GET . 
    PUBLIC SET (arg AS CHARACTER):
        THIS-OBJECT:SetCharacterFieldValue ("RepName":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the RepName field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC CHARACTER RepNameWhenAvailable (pDefaultValue AS CHARACTER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("RepName":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current Region value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Region AS CHARACTER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetCharacterFieldValue ("Region":U) .
    END GET . 
    PUBLIC SET (arg AS CHARACTER):
        THIS-OBJECT:SetCharacterFieldValue ("Region":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the Region field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC CHARACTER RegionWhenAvailable (pDefaultValue AS CHARACTER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("Region":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current MonthQuota_01 value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_01 AS INTEGER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetIntegerFieldValue ("MonthQuota_01":U) .
    END GET . 
    PUBLIC SET (arg AS INTEGER):
        THIS-OBJECT:SetIntegerFieldValue ("MonthQuota_01":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the MonthQuota_01 field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC INTEGER MonthQuota_01WhenAvailable (pDefaultValue AS INTEGER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("MonthQuota_01":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current MonthQuota_02 value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_02 AS INTEGER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetIntegerFieldValue ("MonthQuota_02":U) .
    END GET . 
    PUBLIC SET (arg AS INTEGER):
        THIS-OBJECT:SetIntegerFieldValue ("MonthQuota_02":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the MonthQuota_02 field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC INTEGER MonthQuota_02WhenAvailable (pDefaultValue AS INTEGER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("MonthQuota_02":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current MonthQuota_03 value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_03 AS INTEGER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetIntegerFieldValue ("MonthQuota_03":U) .
    END GET . 
    PUBLIC SET (arg AS INTEGER):
        THIS-OBJECT:SetIntegerFieldValue ("MonthQuota_03":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the MonthQuota_03 field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC INTEGER MonthQuota_03WhenAvailable (pDefaultValue AS INTEGER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("MonthQuota_03":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current MonthQuota_04 value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_04 AS INTEGER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetIntegerFieldValue ("MonthQuota_04":U) .
    END GET . 
    PUBLIC SET (arg AS INTEGER):
        THIS-OBJECT:SetIntegerFieldValue ("MonthQuota_04":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the MonthQuota_04 field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC INTEGER MonthQuota_04WhenAvailable (pDefaultValue AS INTEGER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("MonthQuota_04":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current MonthQuota_05 value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_05 AS INTEGER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetIntegerFieldValue ("MonthQuota_05":U) .
    END GET . 
    PUBLIC SET (arg AS INTEGER):
        THIS-OBJECT:SetIntegerFieldValue ("MonthQuota_05":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the MonthQuota_05 field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC INTEGER MonthQuota_05WhenAvailable (pDefaultValue AS INTEGER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("MonthQuota_05":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current MonthQuota_06 value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_06 AS INTEGER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetIntegerFieldValue ("MonthQuota_06":U) .
    END GET . 
    PUBLIC SET (arg AS INTEGER):
        THIS-OBJECT:SetIntegerFieldValue ("MonthQuota_06":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the MonthQuota_06 field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC INTEGER MonthQuota_06WhenAvailable (pDefaultValue AS INTEGER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("MonthQuota_06":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current MonthQuota_07 value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_07 AS INTEGER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetIntegerFieldValue ("MonthQuota_07":U) .
    END GET . 
    PUBLIC SET (arg AS INTEGER):
        THIS-OBJECT:SetIntegerFieldValue ("MonthQuota_07":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the MonthQuota_07 field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC INTEGER MonthQuota_07WhenAvailable (pDefaultValue AS INTEGER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("MonthQuota_07":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current MonthQuota_08 value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_08 AS INTEGER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetIntegerFieldValue ("MonthQuota_08":U) .
    END GET . 
    PUBLIC SET (arg AS INTEGER):
        THIS-OBJECT:SetIntegerFieldValue ("MonthQuota_08":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the MonthQuota_08 field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC INTEGER MonthQuota_08WhenAvailable (pDefaultValue AS INTEGER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("MonthQuota_08":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current MonthQuota_09 value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_09 AS INTEGER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetIntegerFieldValue ("MonthQuota_09":U) .
    END GET . 
    PUBLIC SET (arg AS INTEGER):
        THIS-OBJECT:SetIntegerFieldValue ("MonthQuota_09":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the MonthQuota_09 field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC INTEGER MonthQuota_09WhenAvailable (pDefaultValue AS INTEGER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("MonthQuota_09":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current MonthQuota_10 value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_10 AS INTEGER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetIntegerFieldValue ("MonthQuota_10":U) .
    END GET . 
    PUBLIC SET (arg AS INTEGER):
        THIS-OBJECT:SetIntegerFieldValue ("MonthQuota_10":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the MonthQuota_10 field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC INTEGER MonthQuota_10WhenAvailable (pDefaultValue AS INTEGER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("MonthQuota_10":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current MonthQuota_11 value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_11 AS INTEGER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetIntegerFieldValue ("MonthQuota_11":U) .
    END GET . 
    PUBLIC SET (arg AS INTEGER):
        THIS-OBJECT:SetIntegerFieldValue ("MonthQuota_11":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the MonthQuota_11 field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC INTEGER MonthQuota_11WhenAvailable (pDefaultValue AS INTEGER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("MonthQuota_11":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current MonthQuota_12 value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_12 AS INTEGER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetIntegerFieldValue ("MonthQuota_12":U) .
    END GET . 
    PUBLIC SET (arg AS INTEGER):
        THIS-OBJECT:SetIntegerFieldValue ("MonthQuota_12":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the MonthQuota_12 field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC INTEGER MonthQuota_12WhenAvailable (pDefaultValue AS INTEGER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("MonthQuota_12":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current Email value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Email AS CHARACTER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetCharacterFieldValue ("Email":U) .
    END GET . 
    PUBLIC SET (arg AS CHARACTER):
        THIS-OBJECT:SetCharacterFieldValue ("Email":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the Email field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC CHARACTER EmailWhenAvailable (pDefaultValue AS CHARACTER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("Email":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current PhoneOffice value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY PhoneOffice AS CHARACTER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetCharacterFieldValue ("PhoneOffice":U) .
    END GET . 
    PUBLIC SET (arg AS CHARACTER):
        THIS-OBJECT:SetCharacterFieldValue ("PhoneOffice":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the PhoneOffice field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC CHARACTER PhoneOfficeWhenAvailable (pDefaultValue AS CHARACTER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("PhoneOffice":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current PhonePrivate value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY PhonePrivate AS CHARACTER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetCharacterFieldValue ("PhonePrivate":U) .
    END GET . 
    PUBLIC SET (arg AS CHARACTER):
        THIS-OBJECT:SetCharacterFieldValue ("PhonePrivate":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the PhonePrivate field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC CHARACTER PhonePrivateWhenAvailable (pDefaultValue AS CHARACTER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("PhonePrivate":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current PhoneMobile value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY PhoneMobile AS CHARACTER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetCharacterFieldValue ("PhoneMobile":U) .
    END GET . 
    PUBLIC SET (arg AS CHARACTER):
        THIS-OBJECT:SetCharacterFieldValue ("PhoneMobile":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the PhoneMobile field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC CHARACTER PhoneMobileWhenAvailable (pDefaultValue AS CHARACTER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("PhoneMobile":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .



    /*------------------------------------------------------------------------------
        Purpose: Returns the Filter Class for this TableModel
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Filter AS SalesrepTableModelFilter NO-UNDO 
    GET:
        DEFINE VARIABLE oFilter AS SalesrepTableModelFilter NO-UNDO.
        
        oFilter = NEW SalesrepTableModelFilter (THIS-OBJECT) .
        
        &IF PROVERSION BEGINS "10" &THEN
        ASSIGN THIS-OBJECT:SavedFilterReference = oFilter .
        &ENDIF
        
        RETURN oFilter .      
    END.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the SalesrepTableModel_Generated class
        Notes:   
        @param poDatasetModel The reference to the owning DatasetModel
        @param phBufferHandle The handle of the ProDataset member buffer this TableModel represents
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC SalesrepTableModel_Generated (poDatasetModel AS DatasetModel, phBufferHandle AS HANDLE):
        
        SUPER (poDatasetModel, phBufferHandle).
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the SalesrepTableModel_Generated class
        Notes:   Creates a view model
        @param poTableModel The reference to SalesrepTableModel on which this SalesrepTableModel servers as a ViewModel
        @param phBufferHandle The handle of the ProDataset member buffer this TableModel represents
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PROTECTED SalesrepTableModel_Generated (poTableModel AS SalesrepTableModel, phBufferHandle AS HANDLE):
        
        SUPER (poTableModel, phBufferHandle).
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
       Purpose: Creates a new instance of the SalesrepTableModel as a view model for the current record
       Notes:
       @return The SalesrepTableModel as the view model
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC SalesrepTableModel CreateCurrentRecordView ():
        
        RETURN CAST (THIS-OBJECT:CreateCurrentRecordViewInternal (), 
                     SalesrepTableModel) . 
        
    END METHOD.

    /*------------------------------------------------------------------------------
       Purpose: Creates a new instance of the SalesrepTableModel as a view model
       Notes:
       @return The SalesrepTableModel as the view model
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC SalesrepTableModel CreateView ():
        
        RETURN CAST (THIS-OBJECT:CreateViewInternal (), 
                     SalesrepTableModel) . 
        
    END METHOD.
    
END CLASS.
