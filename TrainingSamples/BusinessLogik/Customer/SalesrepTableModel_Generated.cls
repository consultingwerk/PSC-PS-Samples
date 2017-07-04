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
    Created     : 04/07/2017 10:12:44,950+02:00
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
        Purpose: Gets and sets the current EmailAddress value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY EmailAddress AS CHARACTER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetCharacterFieldValue ("EmailAddress":U) .
    END GET . 
    PUBLIC SET (arg AS CHARACTER):
        THIS-OBJECT:SetCharacterFieldValue ("EmailAddress":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the EmailAddress field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC CHARACTER EmailAddressWhenAvailable (pDefaultValue AS CHARACTER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("EmailAddress":U):BUFFER-VALUE .
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
        Purpose: Gets and sets the current PhoneHandy value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY PhoneHandy AS CHARACTER NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetCharacterFieldValue ("PhoneHandy":U) .
    END GET . 
    PUBLIC SET (arg AS CHARACTER):
        THIS-OBJECT:SetCharacterFieldValue ("PhoneHandy":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the PhoneHandy field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC CHARACTER PhoneHandyWhenAvailable (pDefaultValue AS CHARACTER):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("PhoneHandy":U):BUFFER-VALUE .
        ELSE 
            RETURN pDefaultValue .
    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current AverageQuota value
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY AverageQuota AS DECIMAL NO-UNDO
    GET:
        RETURN THIS-OBJECT:GetDecimalFieldValue ("AverageQuota":U) .
    END GET . 
    PUBLIC SET (arg AS DECIMAL):
        THIS-OBJECT:SetDecimalFieldValue ("AverageQuota":U, arg) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the AverageQuota field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC DECIMAL AverageQuotaWhenAvailable (pDefaultValue AS DECIMAL):
        IF THIS-OBJECT:BufferHandle:AVAILABLE THEN 
            RETURN THIS-OBJECT:BufferHandle:BUFFER-FIELD ("AverageQuota":U):BUFFER-VALUE .
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
