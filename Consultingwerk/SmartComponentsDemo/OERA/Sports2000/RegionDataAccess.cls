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
    File        : RegionDataAccess
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 15.08.2011 09:57:26
    Notes       :
  ----------------------------------------------------------------------*/

USING Consultingwerk.OERA.DataAccess.
USING Progress.Lang.*.

ROUTINE-LEVEL ON ERROR UNDO, THROW.

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.RegionDataAccess INHERITS DataAccess:

    { Consultingwerk/SmartComponentsDemo/OERA/Sports2000/dsRegion.i &ACCESS="PRIVATE" &REFERENCE-ONLY="REFERENCE-ONLY"}

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the RegionDataAccess class
        Notes:   Used by the BusinessEntity, will receive the handle of the dataset
                 instance form the BusinessEntity as a parameter. Permanently BIND's
                 to that dataset using the PRIVATE BindDataset Method.
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC RegionDataAccess (phDataset AS HANDLE):
        SUPER (INPUT phDataset).

        BindDataset (DATASET-HANDLE phDataset BIND) .

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Attaches the DATA-SOURCE objects to the ProDataset Buffers
        Notes:   Overrides ABSTRACT method in Consultingwerk.OERA.DataAccess,
                 Invoked in FetchData and SaveChanges
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID AttachDataSources ():

        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsRegion:HANDLE, FALSE) .


    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Do nothing, just receive the parameter and bind to the received
                 Dataset reference
        Notes:   Invoked from the class constructor
    ------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID BindDataset (DATASET dsRegion BIND):
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

        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsRegion:HANDLE, FALSE) .


    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID FetchData (poFetchDataRequest AS Consultingwerk.OERA.IFetchDataRequest):

        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsRegion:HANDLE,
                                                              FALSE) .

        EMPTY TEMP-TABLE eRegion .

        CREATE eRegion .
        ASSIGN eRegion.Region      = "East"
               eRegion.Description = "The Eastern Region" .

        CREATE eRegion .
        ASSIGN eRegion.Region      = "Central"
               eRegion.Description = "Central USA" .

        CREATE eRegion .
        ASSIGN eRegion.Region      = "Southern"
               eRegion.Description = "Southern states, US" .

        CREATE eRegion .
        ASSIGN eRegion.Region      = "Bretagne"
               eRegion.Description = "Southern France" .

        CREATE eRegion .
        ASSIGN eRegion.Region      = "Sverige"
               eRegion.Description = "Northern Europe" .

        CREATE eRegion .
        ASSIGN eRegion.Region      = "Noord"
               eRegion.Description = "Northern Europe, Remaining Countries" .

        CREATE eRegion .
        ASSIGN eRegion.Region      = "Finland"
               eRegion.Description = "Finish Region" .

        CREATE eRegion .
        ASSIGN eRegion.Region      = "Austria"
               eRegion.Description = "In the Alps" .

        CREATE eRegion .
        ASSIGN eRegion.Region      = "West"
               eRegion.Description = "":U .

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:
        Notes:
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID SaveChanges ():

        UNDO, THROW NEW AppError ("Region's cannot be updated.", 0) .

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

        END CASE .

    END METHOD.

END CLASS.
