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
    File        : SalesRepDataAccess
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 18.03.2011 00:27:55
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.*      FROM PROPATH .
USING Consultingwerk.OERA.Enum.* FROM PROPATH .
USING Consultingwerk.Util.*      FROM PROPATH .
USING Progress.Lang.*            FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.SalesRepDataAccess INHERITS DataAccess:

    { Consultingwerk/SmartComponentsDemo/OERA/Sports2000/dsSalesRep.i &ACCESS="PRIVATE" &REFERENCE-ONLY="REFERENCE-ONLY"}

    DEFINE PRIVATE DATA-SOURCE src_Salesrep FOR Salesrep .

    DEFINE VARIABLE lLargeImages AS LOGICAL NO-UNDO.
    DEFINE VARIABLE lSmallImages AS LOGICAL NO-UNDO.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the SalesRepDataAccess class
        Notes:   Used by the BusinessEntity, will receive the handle of the dataset
                 instance form the BusinessEntity as a parameter. Permanently BIND's
                 to that dataset using the PRIVATE BindDataset Method.
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC SalesRepDataAccess (phDataset AS HANDLE):
        SUPER (INPUT phDataset).

        BindDataset (DATASET-HANDLE phDataset BIND) .

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Attaches the DATA-SOURCE objects to the ProDataset Buffers
        Notes:   Overrides ABSTRACT method in Consultingwerk.OERA.DataAccess,
                 Invoked in FetchData and SaveChanges
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID AttachDataSources ():

        DEFINE VARIABLE cMapping AS CHARACTER NO-UNDO.
        DEFINE VARIABLE cExclude AS CHARACTER NO-UNDO.

        ASSIGN cMapping = "SalesRep,Salesrep.SalesRep,RepName,Salesrep.RepName,Region,Salesrep.Region,MonthQuota01,SalesRep.MonthQuota[1],MonthQuota02,SalesRep.MonthQuota[2],MonthQuota03,SalesRep.MonthQuota[3],MonthQuota04,SalesRep.MonthQuota[4],MonthQuota05,SalesRep.MonthQuota[5],MonthQuota06,SalesRep.MonthQuota[6],MonthQuota07,SalesRep.MonthQuota[7],MonthQuota08,SalesRep.MonthQuota[8],MonthQuota09,SalesRep.MonthQuota[9],MonthQuota10,SalesRep.MonthQuota[10],MonthQuota11,SalesRep.MonthQuota[11],MonthQuota12,SalesRep.MonthQuota[12]":U .

        IF THIS-OBJECT:RequestType = RequestTypeEnum:FetchData THEN DO:

            IF lLargeImages THEN
                ASSIGN cMapping = cMapping + ",LargeImage,Salesrep.LargeImage":U .
            ELSE
                ASSIGN cExclude = cExclude + ",LargeImage":U .

            IF lSmallImages THEN
                ASSIGN cMapping = cMapping + ",SmallImage,Salesrep.SmallImage":U .
            ELSE
                ASSIGN cExclude = cExclude + ",SmallImage":U .
        END.

        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsSalesRep:HANDLE, FALSE) .

        BUFFER eSalesrep:ATTACH-DATA-SOURCE (DATA-SOURCE src_Salesrep:HANDLE,
                                             TRIM (cMapping, ",":U),
                                             TRIM (cExclude, ",":U)) .
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Do nothing, just receive the parameter and bind to the received
                 Dataset reference
        Notes:   Invoked from the class constructor
    ------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID BindDataset (DATASET dsSalesRep BIND):
        /* NOOP */
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: TO-DO: Subscribe to ProDataset Event Handlers using SET-CALLBACK
                 as needed
        Notes:   Overrides ABSTRACT method in Consultingwerk.OERA.DataAccess,
                 Invoked in FetchData
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID DefineReadEvents ():

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Detaches the DATA-SOURCE objects to the ProDataset Buffers
        Notes:   Overrides ABSTRACT method in Consultingwerk.OERA.DataAccess,
                 Invoked in FetchData and SaveChanges
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID DetachDataSources ():

        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsSalesRep:HANDLE, FALSE) .

        BUFFER eSalesrep:DETACH-DATA-SOURCE () .

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID eSalesrepModifyBeginTrans ():

        DEFINE VARIABLE cMessages AS CHARACTER NO-UNDO.

        FIND eSalesrep WHERE ROWID(eSalesrep) = BUFFER eSalesrepBefore:AFTER-ROWID
            NO-ERROR .

        IF eSalesrep.MonthQuota01 > 0 THEN .
        ELSE cMessages = cMessages + CHR(10) + "Quota for January needs to be GE zero." .
        IF eSalesrep.MonthQuota02 > 0 THEN .
        ELSE cMessages = cMessages + CHR(10) + "Quota for February needs to be GE zero." .
        IF eSalesrep.MonthQuota03 > 0 THEN .
        ELSE cMessages = cMessages + CHR(10) + "Quota for March needs to be GE zero." .
        IF eSalesrep.MonthQuota04 > 0 THEN .
        ELSE cMessages = cMessages + CHR(10) + "Quota for April needs to be GE zero." .
        IF eSalesrep.MonthQuota05 > 0 THEN .
        ELSE cMessages = cMessages + CHR(10) + "Quota for May needs to be GE zero." .
        IF eSalesrep.MonthQuota06 > 0 THEN .
        ELSE cMessages = cMessages + CHR(10) + "Quota for June needs to be GE zero." .
        IF eSalesrep.MonthQuota07 > 0 THEN .
        ELSE cMessages = cMessages + CHR(10) + "Quota for July needs to be GE zero." .
        IF eSalesrep.MonthQuota08 > 0 THEN .
        ELSE cMessages = cMessages + CHR(10) + "Quota for August needs to be GE zero." .
        IF eSalesrep.MonthQuota09 > 0 THEN .
        ELSE cMessages = cMessages + CHR(10) + "Quota for September needs to be GE zero." .
        IF eSalesrep.MonthQuota10 > 0 THEN .
        ELSE cMessages = cMessages + CHR(10) + "Quota for October needs to be GE zero." .
        IF eSalesrep.MonthQuota11 > 0 THEN .
        ELSE cMessages = cMessages + CHR(10) + "Quota for November needs to be GE zero." .
        IF eSalesrep.MonthQuota12 > 0 THEN .
        ELSE cMessages = cMessages + CHR(10) + "Quota for December needs to be GE zero." .

        IF cMessages > "":U THEN DO:
            ASSIGN cMessages = "Salesrep: " + eSalesrep.Salesrep + cMessages .

            Consultingwerk.Util.DatasetHelper:SetErrorString
                (BUFFER eSalesrepBefore:HANDLE,
                 cMessages) .
        END.

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Override to FetchData in DataAcceess
        Notes:   Controls retrieval of images
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID FetchData (poFetchDataRequest AS Consultingwerk.OERA.IFetchDataRequest):

         ASSIGN lLargeImages = ListHelper:EntryIsInList ("IncludeLargeImages":U,
                                                         poFetchDataRequest:CustomContext)
                lSmallImages = ListHelper:EntryIsInList ("IncludeSmallImages":U,
                                                         poFetchDataRequest:CustomContext)
                                      .
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
            WHEN "eSalesrep":U THEN
                cMap = DATA-SOURCE src_Salesrep:GET-DATASET-BUFFER:DATA-SOURCE-COMPLETE-MAP .

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
            WHEN "eSalesrep":U THEN
                RETURN "FOR EACH Salesrep INDEXED-REPOSITION":U.

        END CASE .

    END METHOD.

END CLASS.
