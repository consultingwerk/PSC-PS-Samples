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
    File        : CustomerBusinessEntity
    Purpose     : Business Entity for Customer
    Syntax      :
    Description : Example Business Entity for customer
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 25.02.2011 20:53:22
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.Framework.Session.* FROM PROPATH.
USING Consultingwerk.*                 FROM PROPATH .
USING Consultingwerk.Framework.*       FROM PROPATH .
USING Consultingwerk.OERA.*            FROM PROPATH .
USING Consultingwerk.OERA.Exceptions.* FROM PROPATH.
USING Consultingwerk.SmartFramework.*  FROM PROPATH .
USING Progress.Lang.*                  FROM PROPATH .
USING Consultingwerk.Util.*            FROM PROPATH .

@BusinessEntityTable (name="eCustomer", MandatoryColumns="Name,SalesRep", ReadOnlyColumns="CustNum", DefaultSort="BY eCustomer.Country BY eCustomer.Name") .

@BusinessEntityView (name="customer", isdefault="true", entitytable="eCustomer", entityview="eSalesrep",
                     listcolumns="eCustomer.CustNum,eCustomer.Name,eCustomer.Country,eCustomer.City,eSalesrep.RepName",
                     viewercolumns="eCustomer.CustNum,eCustomer.Name,eCustomer.Country,eCustomer.SalesRep,eSalesrep.RepName,Comments") .
@BusinessEntityView (name="customerDetails", entitytable="eCustomer", entityview="eSalesrep",
                     listcolumns="eCustomer.CustNum,eCustomer.Name,eCustomer.Country,eCustomer.City",
                     viewercolumns="eCustomer.CustNum,eCustomer.Name,Country,eCustomer.SalesRep,eSalesrep.RepName,Comments,Balance,CreditLimit") .

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity
    INHERITS SmartBusinessEntity:

    { Consultingwerk/SmartComponentsDemo/OERA/Sports2000/dsCustomer.i }


    /*------------------------------------------------------------------------------
        Purpose: Constructor of the CustomerBusinessEntity class
        Notes:   Passes the handle of the dataset instance to the base class and
                 sets the default DataAccessName
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerBusinessEntity ():
        SUPER (DATASET dsCustomer:HANDLE).

        THIS-OBJECT:DataAccessName = "Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerDataAccess":U .

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose:  Fetch data from the Data Access object
        Notes:
        @param poFetchDataRequest The IFetchDataRequest object with the parameters for this call
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID FetchData (poFetchDataRequest AS Consultingwerk.OERA.IFetchDataRequest):

        DEFINE VARIABLE oParser     AS QueryParser      NO-UNDO .
        DEFINE VARIABLE oExpression AS IQueryExpression NO-UNDO .
        DEFINE VARIABLE cValue      AS CHARACTER        NO-UNDO.

        IF poFetchDataRequest:Queries MATCHES "*search*" THEN DO:

            oParser = NEW QueryParser () .
            oExpression = oParser:ParseQueryString (poFetchDataRequest:Queries) .

            IF QueryExpression:HasExpressionForField ("eCustomer.Search", oExpression) THEN DO:

                cValue = CAST (QueryExpression:GetExpressionForField("eCustomer.Search", oExpression):SecondOperand,
                               CharacterHolder):Value  .

                IF DataTypeHelper:ToInteger (cValue) > 0 THEN
                    poFetchDataRequest:Queries = SUBSTITUTE ("for each eCustomer where eCustomer.CustNum = &1",
                                                             QUOTER (cValue)) .

                ELSE
                    poFetchDataRequest:Queries = SUBSTITUTE ("for each eCustomer where eCustomer.Name begins &1 or eCustomer.City begins &1",
                                                             QUOTER (cValue)) .
            END.

        END.

        IF VALID-OBJECT (poFetchDataRequest:NamedQuery) THEN DO:

            CASE poFetchDataRequest:NamedQuery:Name:

                WHEN "SearchInAddress":U THEN DO:

                    IF NOT poFetchDataRequest:NamedQuery:Parameters:ContainsKey ("Query":U) THEN
                        UNDO, THROW NEW NamedQueryParameterMissingException (poFetchDataRequest:NamedQuery:Name,
                                                                             "Query":U) .

                    ASSIGN poFetchDataRequest:Tables  = "eCustomer,eSalesRep":U
                           poFetchDataRequest:Queries = SUBSTITUTE ("for each eCustomer where eCustomer.Name begins &1 ~
                                                                                           or eCustomer.City begins &1 ~
                                                                                           or eCustomer.Address begins &1 ~
                                                                                           or eCustomer.Address2 begins &1":U,
                                                                    QUOTER (CAST (poFetchDataRequest:NamedQuery:Parameters:GetItem("Query":U), CharacterHolder):Value)) .
                END.

                OTHERWISE
                     UNDO, THROW NEW InvalidNamedQueryException (poFetchDataRequest:NamedQuery:Name) .

            END CASE .
        END.

        SUPER:FetchData (poFetchDataRequest).

    END METHOD .

/*    @InvokeMethod (template="invoke-receive-dataset", parameterClassName="Test.SCL1246.WarningParameter", datasetInput="false", datasetOutput="true") .*/
/*    /*------------------------------------------------------------------------------                                                                   */
/*        Purpose:                                                                                                                                       */
/*        Notes:                                                                                                                                         */
/*        @param dsCustomer INPUT-OUTPUT DATASET                                                                                                         */
/*        @param poParameter The Parameter Object for this method                                                                                        */
/*    ------------------------------------------------------------------------------*/                                                                   */
/*    METHOD PUBLIC VOID GetWarnings (INPUT-OUTPUT DATASET dsCustomer, poParameter AS Test.SCL1246.WarningParameter):                                    */
/*                                                                                                                                                       */
/*        MESSAGE poParameter:EntityType skip poParameter:EntityRef view-as alert-box.                                                                   */
/*                                                                                                                                                       */
/*    END METHOD .                                                                                                                                       */

    /*------------------------------------------------------------------------------
        Purpose: Provides a hook to modify data in the ProDataset after Read and
                 Update operations (i.e. population of aggregated values)
        Notes:   Invoked during FetchData () and SaveChanges ()
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID ReceiveData ():

        FOR EACH eCustomer:

            IF (eCustomer.Comments > "":U) THEN
                ASSIGN eCustomer.Flags = "C":U .
            ELSE IF (eCustomer.Balance > 1000) THEN
                ASSIGN eCustomer.Flags = "B":U .
            ELSE
                ASSIGN eCustomer.Flags = "":U .
        END.

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Saves changes using the DataAccess object
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID SaveChanges ():

        IF VALID-OBJECT (THIS-OBJECT:SaveChangesParameter) THEN DO:
/*            MESSAGE THIS-OBJECT:SaveChangesParameter*/
/*                VIEW-AS ALERT-BOX.            */

            CAST (THIS-OBJECT:SaveChangesParameter, Consultingwerk.CharacterHolder):Value = "Hello to frontend." .
        END.

        SUPER:SaveChanges().

    END METHOD .

    @InvokeMethod (template="invoke-receive-dataset", parameterClassName="Consultingwerk.CharacterHolder", datasetInput="true", datasetOutput="true") .
    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        @param dsCustomer INPUT-OUTPUT DATASET
        @param poParameter The Parameter Object for this method
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID TestMethodMobile (INPUT-OUTPUT DATASET dsCustomer, poParameter AS Consultingwerk.CharacterHolder):

        LogManager:WriteFormattedMessage ("poParameter: &1", STRING (poParameter:Serialize())) .

    END METHOD .

    @InvokeMethod (template="invoke-receive-dataset", parameterClassName="Consultingwerk.CharacterHolder", datasetInput="false", datasetOutput="true") .
    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        @param dsCustomer INPUT-OUTPUT DATASET
        @param poParameter The Parameter Object for this method
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID TestMethodMobile42 (INPUT-OUTPUT DATASET dsCustomer, poParameter AS Consultingwerk.CharacterHolder):

        LogManager:WriteFormattedMessage ("poParameter: &1", STRING (poParameter:Serialize())) .

        ASSIGN poParameter:Value = "Das ist toll!" .

        THIS-OBJECT:FetchData (NEW FetchDataRequest ("eCustomer", 1)) .

    END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Provides a hook for high level data validation before Update
                 operations
        Notes:   Invoked during SaveChanges (). When the ERROR flag of the ProDataset
                 is set, the Update operation will be cancelled before writing back
                 the data to the database using the DataAccess object
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID ValidateData ():

        FOR EACH eCustomer ON ERROR UNDO, THROW:

            Consultingwerk.OERA.Validate:IsNotNullOrEmpty (BUFFER eCustomer:HANDLE, "Name":U,
                                                           ?).

            IF
            Consultingwerk.OERA.Validate:IsNotNullOrEmpty (BUFFER eCustomer:HANDLE, "SalesRep":U,
                                                           ?)
            THEN
            Consultingwerk.OERA.Validate:CanFind (BUFFER eCustomer:HANDLE,
                                                  "SalesRep":U,
                                                  "Consultingwerk.SmartComponentsDemo.OERA.Sports2000.SalesRepBusinessEntity":U,
                                                  "eSalesRep":U,
                                                  SUBSTITUTE ("FOR EACH eSalesRep WHERE eSalesRep.SalesRep = &1":U, QUOTER (eCustomer.SalesRep)),
                                                  ?) .


        END.

    END METHOD.

END CLASS.
