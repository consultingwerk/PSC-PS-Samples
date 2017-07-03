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
    File        : SalesRepBusinessEntity
    Purpose     : Business Entity for SalesRep
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 18.03.2011 00:27:55
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH .
USING Progress.Lang.*       FROM PROPATH .
USING Consultingwerk.Framework.Session.* FROM PROPATH.
USING Consultingwerk.Util.* FROM PROPATH.

@BusinessEntityTable (name="eSalesrep", MandatoryColumns="SalesRep", ReadOnlyColumns="") .

@BusinessEntityView (name="salesrep", isdefault="true", entitytable="eSalesrep", entityview="",
                     listcolumns="SalesRep,RepName,Region",
                     viewercolumns="SalesRep,RepName,Region") .

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.SalesRepBusinessEntity INHERITS BusinessEntity:

    { Consultingwerk/SmartComponentsDemo/OERA/Sports2000/dsSalesRep.i }

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the SalesRepBusinessEntity class
        Notes:   Passes the handle of the dataset instance to the base class and
                 sets the default DataAccessName
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC SalesRepBusinessEntity ():
        SUPER (DATASET dsSalesRep:HANDLE).

        THIS-OBJECT:DataAccessName = "Consultingwerk.SmartComponentsDemo.OERA.Sports2000.SalesRepDataAccess":U .

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Provides a hook to modify data in the ProDataset after Read and
                 Update operations (i.e. population of aggregated values)
        Notes:   Invoked during FetchData () and SaveChanges ()
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID ReceiveData ():

        IF VALID-HANDLE (SessionManager:ContextDataset) THEN DO:
            ContextWrapper:SetIntegerContextProperty ("TestInteger", ContextWrapper:GetIntegerContextProperty ("TestInteger") + 1) .

/*LogManager:WriteFormattedMessage ("**** TestInteger: &1", ContextWrapper:GetIntegerContextProperty ("TestInteger")) .*/
        END.

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Provides a hook for high level data validation before Update
                 operations
        Notes:   Invoked during SaveChanges (). When the ERROR flag of the ProDataset
                 is set, the Update operation will be cancelled before writing back
                 the data to the database using the DataAccess object
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID ValidateData ():

        FOR EACH eSalesrep:
            Consultingwerk.OERA.Validate:ReadOnly (BUFFER eSalesrep:HANDLE,
                                                   "SalesRep":U,
                                                   "Cannot update SalesRep code.":U) .

            Consultingwerk.OERA.Validate:IsNotNullOrEmpty (BUFFER eSalesrep:HANDLE,
                                                           "SalesRep":U,
                                                           "Salesrep needs to be entered.":U) .

            Consultingwerk.OERA.Validate:IsNotNullOrEmpty (BUFFER eSalesrep:HANDLE,
                                                           "Repname":U,
                                                           "Salesrep name needs to be entered.":U) .

            Consultingwerk.OERA.Validate:IsNotNullOrEmpty (BUFFER eSalesrep:HANDLE,
                                                           "Region":U,
                                                           "Region needs to be entered.":U) .
        END.

    END METHOD.

END CLASS.
