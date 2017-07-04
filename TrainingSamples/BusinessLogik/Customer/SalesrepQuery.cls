/**********************************************************************
 * Copyright (C) 2006-2017 by Consultingwerk Ltd. ("CW") -            *
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
    File        : SalesrepQuery
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04/07/2017 10:12:45,683+02:00
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.QueryBuilder.* FROM PROPATH .
USING TrainingSamples.BusinessLogik.Customer.* FROM PROPATH .
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity", type="TableQuery") .

CLASS TrainingSamples.BusinessLogik.Customer.SalesrepQuery
    INHERITS TableQuery:

    /**
     * Purpose: Provides the filter options for the SalesRep field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY SalesRep AS SalesrepQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryCharacterPredicate (THIS-OBJECT, "SalesRep":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the RepName field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY RepName AS SalesrepQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryCharacterPredicate (THIS-OBJECT, "RepName":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Region field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Region AS SalesrepQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryCharacterPredicate (THIS-OBJECT, "Region":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the MonthQuota_01 field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY MonthQuota_01 AS SalesrepQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryIntegerPredicate (THIS-OBJECT, "MonthQuota_01":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the MonthQuota_02 field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY MonthQuota_02 AS SalesrepQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryIntegerPredicate (THIS-OBJECT, "MonthQuota_02":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the MonthQuota_03 field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY MonthQuota_03 AS SalesrepQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryIntegerPredicate (THIS-OBJECT, "MonthQuota_03":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the EmailAddress field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY EmailAddress AS SalesrepQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryCharacterPredicate (THIS-OBJECT, "EmailAddress":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the PhoneOffice field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY PhoneOffice AS SalesrepQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryCharacterPredicate (THIS-OBJECT, "PhoneOffice":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the PhonePrivate field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY PhonePrivate AS SalesrepQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryCharacterPredicate (THIS-OBJECT, "PhonePrivate":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the PhoneHandy field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY PhoneHandy AS SalesrepQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryCharacterPredicate (THIS-OBJECT, "PhoneHandy":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the AverageQuota field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY AverageQuota AS SalesrepQueryDecimalPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryDecimalPredicate (THIS-OBJECT, "AverageQuota":U) .
    END GET .

    /**
     * Purpose: Indicates that the following field would be joined using an AND
     * Notes:
     * @return The reference to the SalesrepQuery instance itself
     */
    DEFINE PUBLIC PROPERTY And AS SalesrepQuery NO-UNDO
    GET:
        THIS-OBJECT:AndImpl () .

        RETURN THIS-OBJECT .
    END GET .

    /**
     * Purpose: Indicates that the following field would be joined using an OR
     * Notes:
     * @return The reference to the SalesrepQuery instance itself
     */
    DEFINE PUBLIC PROPERTY Or AS SalesrepQuery NO-UNDO
    GET:
        THIS-OBJECT:OrImpl () .

        RETURN THIS-OBJECT .
    END GET .

    /**
     * Purpose: Constructor for the SalesrepQuery class
     * Notes:
     */
    CONSTRUCTOR PUBLIC SalesrepQuery ():
        SUPER ("eSalesrep":U) .

    END CONSTRUCTOR.

    /**
     * Purpose: Constructor for the SalesrepQuery class
     * Notes:   
     * @param pSalesRep The filter value for the eSalesrep.SalesRep field
     */
    CONSTRUCTOR PUBLIC SalesrepQuery (pSalesRep AS CHARACTER):
        SUPER ("eSalesrep":U).

        THIS-OBJECT:SalesRep:Eq (PSalesRep) .

    END CONSTRUCTOR.

    /**
     * Purpose: Joins a Query Entry using AND
     * Notes:
     * @param poQuery The SalesrepQuery instance to join using AND
     */
    METHOD PUBLIC SalesrepQuery And (poQuery AS SalesrepQuery):

        THIS-OBJECT:AndImpl (poQuery:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins two Query Entries using AND
     * Notes:
     * @param poQuery1 The first SalesrepQuery instance to join using AND
     * @param poQuery2 The second SalesrepQuery instance to join using AND
     */
    METHOD PUBLIC SalesrepQuery And (poQuery1 AS SalesrepQuery,
                                                           poQuery2 AS SalesrepQuery):

        THIS-OBJECT:OrImpl(poQuery1:ToQueryEntry(), poQuery2:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins three Query Entries using AND
     * Notes:
     * @param poQuery1 The first SalesrepQuery instance to join using AND
     * @param poQuery2 The second SalesrepQuery instance to join using AND
     * @param poQuery3 The third SalesrepQuery instance to join using AND
     */
    METHOD PUBLIC SalesrepQuery And (poQuery1 AS SalesrepQuery,
                                                           poQuery2 AS SalesrepQuery,
                                                           poQuery3 AS SalesrepQuery):

        THIS-OBJECT:OrImpl(poQuery1:ToQueryEntry(), poQuery2:ToQueryEntry(), poQuery3:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins a Query Entry using OR
     * Notes:
     * @param poQuery The SalesrepQuery instance to join using OR
     */
    METHOD PUBLIC SalesrepQuery Or (poQuery AS SalesrepQuery):

        THIS-OBJECT:OrImpl(poQuery:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins two Query Entries using OR
     * Notes:
     * @param poQuery1 The first SalesrepQuery instance to join using OR
     * @param poQuery2 The second SalesrepQuery instance to join using OR
     */
    METHOD PUBLIC SalesrepQuery Or (poQuery1 AS SalesrepQuery,
                                                          poQuery2 AS SalesrepQuery):

        THIS-OBJECT:OrImpl(poQuery1:ToQueryEntry(), poQuery2:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins three Query Entries using OR
     * Notes:
     * @param poQuery1 The first SalesrepQuery instance to join using OR
     * @param poQuery2 The second SalesrepQuery instance to join using OR
     * @param poQuery3 The third SalesrepQuery instance to join using OR
     */
    METHOD PUBLIC SalesrepQuery Or (poQuery1 AS SalesrepQuery,
                                                          poQuery2 AS SalesrepQuery,
                                                          poQuery3 AS SalesrepQuery):

        THIS-OBJECT:OrImpl(poQuery1:ToQueryEntry(), poQuery2:ToQueryEntry(), poQuery3:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

END CLASS.
