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
    Created     : 03/07/2017 14:41:48,140+02:00
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
     * Purpose: Provides the filter options for the MonthQuota_04 field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY MonthQuota_04 AS SalesrepQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryIntegerPredicate (THIS-OBJECT, "MonthQuota_04":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the MonthQuota_05 field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY MonthQuota_05 AS SalesrepQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryIntegerPredicate (THIS-OBJECT, "MonthQuota_05":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the MonthQuota_06 field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY MonthQuota_06 AS SalesrepQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryIntegerPredicate (THIS-OBJECT, "MonthQuota_06":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the MonthQuota_07 field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY MonthQuota_07 AS SalesrepQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryIntegerPredicate (THIS-OBJECT, "MonthQuota_07":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the MonthQuota_08 field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY MonthQuota_08 AS SalesrepQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryIntegerPredicate (THIS-OBJECT, "MonthQuota_08":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the MonthQuota_09 field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY MonthQuota_09 AS SalesrepQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryIntegerPredicate (THIS-OBJECT, "MonthQuota_09":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the MonthQuota_10 field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY MonthQuota_10 AS SalesrepQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryIntegerPredicate (THIS-OBJECT, "MonthQuota_10":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the MonthQuota_11 field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY MonthQuota_11 AS SalesrepQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryIntegerPredicate (THIS-OBJECT, "MonthQuota_11":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the MonthQuota_12 field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY MonthQuota_12 AS SalesrepQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryIntegerPredicate (THIS-OBJECT, "MonthQuota_12":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Email field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Email AS SalesrepQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryCharacterPredicate (THIS-OBJECT, "Email":U) .
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
     * Purpose: Provides the filter options for the PhoneMobile field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY PhoneMobile AS SalesrepQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW SalesrepQueryCharacterPredicate (THIS-OBJECT, "PhoneMobile":U) .
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
