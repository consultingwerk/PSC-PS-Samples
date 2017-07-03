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
    File        : CustomerDataAccess
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 25.02.2011 20:53:22
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.*           FROM PROPATH .
USING Consultingwerk.SmartFramework.* FROM PROPATH .
USING Progress.Lang.*                 FROM PROPATH .

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerDataAccess
    INHERITS SmartDataAccess:

    { Consultingwerk/SmartComponentsDemo/OERA/Sports2000/dsCustomer.i &ACCESS="PRIVATE" &REFERENCE-ONLY="REFERENCE-ONLY"}

    DEFINE PRIVATE DATA-SOURCE src_Customer FOR Customer .
    DEFINE PRIVATE DATA-SOURCE src_Salesrep FOR Salesrep .

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the CustomerDataAccess class
        Notes:   Used by the BusinessEntity, will receive the handle of the dataset
                 instance form the BusinessEntity as a parameter. Permanently BIND's
                 to that dataset using the PRIVATE BindDataset Method.
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerDataAccess (phDataset AS HANDLE):
        SUPER (INPUT phDataset).

        BindDataset (DATASET-HANDLE phDataset BIND) .

        THIS-OBJECT:AssignSkipList = "CustNum":U .

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Attaches the DATA-SOURCE objects to the ProDataset Buffers
        Notes:   Overrides ABSTRACT method in Consultingwerk.OERA.DataAccess,
                 Invoked in FetchData and SaveChanges
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID AttachDataSources ():

        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsCustomer:HANDLE, FALSE) .

        BUFFER eCustomer:ATTACH-DATA-SOURCE (DATA-SOURCE src_Customer:HANDLE, "CustNum,Customer.CustNum,Country,Customer.Country,Name,Customer.Name,Address,Customer.Address,Address2,Customer.Address2,City,Customer.City,State,Customer.State,PostalCode,Customer.PostalCode,Contact,Customer.Contact,Phone,Customer.Phone,SalesRep,Customer.SalesRep,CreditLimit,Customer.CreditLimit,Balance,Customer.Balance,Terms,Customer.Terms,Discount,Customer.Discount,Comments,Customer.Comments,Fax,Customer.Fax,EmailAddress,Customer.EmailAddress":U) .
        BUFFER eSalesrep:ATTACH-DATA-SOURCE (DATA-SOURCE src_Salesrep:HANDLE, "SalesRep,Salesrep.SalesRep,RepName,Salesrep.RepName,Region,Salesrep.Region,MonthQuota01,SalesRep.MonthQuota[1],MonthQuota02,SalesRep.MonthQuota[2],MonthQuota03,SalesRep.MonthQuota[3],MonthQuota04,SalesRep.MonthQuota[4],MonthQuota05,SalesRep.MonthQuota[5],MonthQuota06,SalesRep.MonthQuota[6],MonthQuota07,SalesRep.MonthQuota[7],MonthQuota08,SalesRep.MonthQuota[8],MonthQuota09,SalesRep.MonthQuota[9],MonthQuota10,SalesRep.MonthQuota[10],MonthQuota11,SalesRep.MonthQuota[11],MonthQuota12,SalesRep.MonthQuota[12],SmallImage,Salesrep.SmallImage,LargeImage,Salesrep.LargeImage":U) .

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Do nothing, just receive the parameter and bind to the received
                 Dataset reference
        Notes:   Invoked from the class constructor
    ------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID BindDataset (DATASET dsCustomer BIND):
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

        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsCustomer:HANDLE, FALSE) .

        BUFFER eCustomer:DETACH-DATA-SOURCE () .
        BUFFER eSalesrep:DETACH-DATA-SOURCE () .

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

        DEFINE VARIABLE cMap  AS CHARACTER NO-UNDO .
        DEFINE VARIABLE iPos  AS INTEGER   NO-UNDO .

        CASE pcTable:
            WHEN "eCustomer":U THEN
                cMap = DATA-SOURCE src_Customer:GET-DATASET-BUFFER:DATA-SOURCE-COMPLETE-MAP .
            WHEN "eSalesrep":U THEN
                cMap = DATA-SOURCE src_Salesrep:GET-DATASET-BUFFER:DATA-SOURCE-COMPLETE-MAP .

        END CASE .

        ASSIGN iPos = LOOKUP(pcColumn, cMap) .

        IF iPos MODULO 2 = 1 THEN
            RETURN ENTRY(LOOKUP(pcColumn,cMap) + 1,cMap).
        ELSE
            RETURN "":U .

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
            WHEN "eCustomer":U THEN
                RETURN "FOR EACH Customer INDEXED-REPOSITION":U.
            WHEN "eSalesrep":U THEN
                RETURN "FOR EACH Salesrep INDEXED-REPOSITION":U.

        END CASE .
    END METHOD.

END CLASS.
