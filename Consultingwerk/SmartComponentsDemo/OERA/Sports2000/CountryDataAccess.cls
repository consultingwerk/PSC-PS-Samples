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
    File        : CountryDataAccess
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 16.03.2011 04:43:00
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.*      FROM PROPATH .
USING Consultingwerk.OERA.Enum.* FROM PROPATH .
USING Consultingwerk.Util.*      FROM PROPATH .
USING Progress.Lang.*            FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CountryDataAccess INHERITS DataAccess:

    { Consultingwerk/SmartComponentsDemo/OERA/Sports2000/dsCountry.i &ACCESS="PRIVATE" &REFERENCE-ONLY="REFERENCE-ONLY"}

    DEFINE PRIVATE DATA-SOURCE src_Country FOR Country .

    DEFINE VARIABLE lIncludeNumberOfCustomer AS LOGICAL NO-UNDO.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CountryDataAccess class
        Notes:   Used by the BusinessEntity, will receive the handle of the dataset
                 instance form the BusinessEntity as a parameter. Permanently BIND's
                 to that dataset using the PRIVATE BindDataset Method.
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CountryDataAccess (phDataset AS HANDLE):
        SUPER (INPUT phDataset).

        BindDataset (DATASET-HANDLE phDataset BIND) .

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Attaches the DATA-SOURCE objects to the ProDataset Buffers
        Notes:   Overrides ABSTRACT method in Consultingwerk.OERA.DataAccess,
                 Invoked in FetchData and SaveChanges
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID AttachDataSources ():

        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsCountry:HANDLE, FALSE) .

        BUFFER eCountry:ATTACH-DATA-SOURCE (DATA-SOURCE src_Country:HANDLE, "Country,Country.Country,CountryName,Country.CountryName,CountryFlag,Country.CountryFlag,CountryEuropeanUnion,Country.EuropeanUnion") .

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Do nothing, just receive the parameter and bind to the received
                 Dataset reference
        Notes:   Invoked from the class constructor
    ------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID BindDataset (DATASET dsCountry BIND):
        /* NOOP */
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: TO-DO: Subscribe to ProDataset Event Handlers using SET-CALLBACK
                 as needed
        Notes:   Overrides ABSTRACT method in Consultingwerk.OERA.DataAccess,
                 Invoked in FetchData
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID DefineReadEvents ():

        BUFFER eCountry:SET-CALLBACK ("AFTER-FILL", "eCountryAfterFill") .

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Detaches the DATA-SOURCE objects to the ProDataset Buffers
        Notes:   Overrides ABSTRACT method in Consultingwerk.OERA.DataAccess,
                 Invoked in FetchData and SaveChanges
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID DetachDataSources ():

        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsCountry:HANDLE, FALSE) .

        BUFFER eCountry:DETACH-DATA-SOURCE () .

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID eCountryAfterFill (DATASET dsCountry):

        DEFINE VARIABLE i AS INTEGER NO-UNDO.

        IF lIncludeNumberOfCustomer THEN
            FOR EACH eCountry:
                ASSIGN i = 0 .

                FOR EACH Customer OF eCountry NO-LOCK:
                    ASSIGN i = i + 1 .
                END.

                ASSIGN eCountry.NumberOfCustomers = i .
            END.

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID FetchData (poFetchDataRequest AS Consultingwerk.OERA.IFetchDataRequest):

        ASSIGN lIncludeNumberOfCustomer = ListHelper:EntryIsInList ("IncludeNumberOfCustomers":U,
                                                                    poFetchDataRequest:CustomContext) .

        SUPER:FetchData(INPUT poFetchDataRequest).

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Returns the database field name matching a temp-table field name
                 contained in a consumers query string (query string vs. temp-table
                 definition)
        Notes:   Call-back used by Consultingwerk.OERA.Query.DSQueryString (part of
                 DataAccess:FetchData () query preparation
                 TO-DO: Provide code for alternative mapping
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC CHARACTER SourceColumn (pcTable AS CHARACTER, pcColumn AS CHARACTER):

        DEFINE VARIABLE cMap  AS CHARACTER NO-UNDO.

        CASE pcTable:
            WHEN "eCountry":U THEN
                cMap = DATA-SOURCE src_Country:GET-DATASET-BUFFER:DATA-SOURCE-COMPLETE-MAP .

        END CASE .

        RETURN ENTRY(LOOKUP(pccolumn,cMap) + 1,cMap).

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Returns the base query string used to retrieve data for the temp
                 tables. This query string will be appended by the query provided by
                 the consumer (FetchDataRequest object).
        Notes:   Call-back used by Consultingwerk.OERA.Query.DSQueryString (part of
                 DataAccess:FetchData () query preparation
                 TO-DO: Provide code to return the DATA-SOURCE root query string
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC CHARACTER SourceDefaultQuery (pcTable AS CHARACTER):

        CASE pcTable:
            WHEN "eCountry":U THEN
                RETURN "FOR EACH Country INDEXED-REPOSITION":U.

        END CASE .

    END METHOD.

END CLASS.
