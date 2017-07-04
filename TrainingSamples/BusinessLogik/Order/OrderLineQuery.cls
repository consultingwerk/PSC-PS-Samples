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
    File        : OrderLineQuery
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04/07/2017 13:46:39,960+02:00
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.QueryBuilder.* FROM PROPATH .
USING TrainingSamples.BusinessLogik.Order.* FROM PROPATH .
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Order.OrderBusinessEntity", type="TableQuery") .

CLASS TrainingSamples.BusinessLogik.Order.OrderLineQuery
    INHERITS TableQuery:

    /**
     * Purpose: Provides the filter options for the Ordernum field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Ordernum AS OrderLineQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW OrderLineQueryIntegerPredicate (THIS-OBJECT, "Ordernum":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Linenum field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Linenum AS OrderLineQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW OrderLineQueryIntegerPredicate (THIS-OBJECT, "Linenum":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Itemnum field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Itemnum AS OrderLineQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW OrderLineQueryIntegerPredicate (THIS-OBJECT, "Itemnum":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Price field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Price AS OrderLineQueryDecimalPredicate NO-UNDO
    GET:
        RETURN NEW OrderLineQueryDecimalPredicate (THIS-OBJECT, "Price":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Qty field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Qty AS OrderLineQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW OrderLineQueryIntegerPredicate (THIS-OBJECT, "Qty":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Discount field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Discount AS OrderLineQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW OrderLineQueryIntegerPredicate (THIS-OBJECT, "Discount":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the ExtendedPrice field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY ExtendedPrice AS OrderLineQueryDecimalPredicate NO-UNDO
    GET:
        RETURN NEW OrderLineQueryDecimalPredicate (THIS-OBJECT, "ExtendedPrice":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the OrderLineStatus field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY OrderLineStatus AS OrderLineQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW OrderLineQueryCharacterPredicate (THIS-OBJECT, "OrderLineStatus":U) .
    END GET .

    /**
     * Purpose: Indicates that the following field would be joined using an AND
     * Notes:
     * @return The reference to the OrderLineQuery instance itself
     */
    DEFINE PUBLIC PROPERTY And AS OrderLineQuery NO-UNDO
    GET:
        THIS-OBJECT:AndImpl () .

        RETURN THIS-OBJECT .
    END GET .

    /**
     * Purpose: Indicates that the following field would be joined using an OR
     * Notes:
     * @return The reference to the OrderLineQuery instance itself
     */
    DEFINE PUBLIC PROPERTY Or AS OrderLineQuery NO-UNDO
    GET:
        THIS-OBJECT:OrImpl () .

        RETURN THIS-OBJECT .
    END GET .

    /**
     * Purpose: Constructor for the OrderLineQuery class
     * Notes:
     */
    CONSTRUCTOR PUBLIC OrderLineQuery ():
        SUPER ("eOrderLine":U) .

    END CONSTRUCTOR.

    /**
     * Purpose: Constructor for the OrderLineQuery class
     * Notes:   
     * @param pOrdernum The filter value for the eOrderLine.Ordernum field
     * @param pLinenum The filter value for the eOrderLine.Linenum field
     */
    CONSTRUCTOR PUBLIC OrderLineQuery (pOrdernum AS INTEGER, pLinenum AS INTEGER):
        SUPER ("eOrderLine":U).

        THIS-OBJECT:Ordernum:Eq (POrdernum) .
        THIS-OBJECT:Linenum:Eq (PLinenum) .

    END CONSTRUCTOR.

    /**
     * Purpose: Joins a Query Entry using AND
     * Notes:
     * @param poQuery The OrderLineQuery instance to join using AND
     */
    METHOD PUBLIC OrderLineQuery And (poQuery AS OrderLineQuery):

        THIS-OBJECT:AndImpl (poQuery:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins two Query Entries using AND
     * Notes:
     * @param poQuery1 The first OrderLineQuery instance to join using AND
     * @param poQuery2 The second OrderLineQuery instance to join using AND
     */
    METHOD PUBLIC OrderLineQuery And (poQuery1 AS OrderLineQuery,
                                                           poQuery2 AS OrderLineQuery):

        THIS-OBJECT:OrImpl(poQuery1:ToQueryEntry(), poQuery2:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins three Query Entries using AND
     * Notes:
     * @param poQuery1 The first OrderLineQuery instance to join using AND
     * @param poQuery2 The second OrderLineQuery instance to join using AND
     * @param poQuery3 The third OrderLineQuery instance to join using AND
     */
    METHOD PUBLIC OrderLineQuery And (poQuery1 AS OrderLineQuery,
                                                           poQuery2 AS OrderLineQuery,
                                                           poQuery3 AS OrderLineQuery):

        THIS-OBJECT:OrImpl(poQuery1:ToQueryEntry(), poQuery2:ToQueryEntry(), poQuery3:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins a Query Entry using OR
     * Notes:
     * @param poQuery The OrderLineQuery instance to join using OR
     */
    METHOD PUBLIC OrderLineQuery Or (poQuery AS OrderLineQuery):

        THIS-OBJECT:OrImpl(poQuery:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins two Query Entries using OR
     * Notes:
     * @param poQuery1 The first OrderLineQuery instance to join using OR
     * @param poQuery2 The second OrderLineQuery instance to join using OR
     */
    METHOD PUBLIC OrderLineQuery Or (poQuery1 AS OrderLineQuery,
                                                          poQuery2 AS OrderLineQuery):

        THIS-OBJECT:OrImpl(poQuery1:ToQueryEntry(), poQuery2:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins three Query Entries using OR
     * Notes:
     * @param poQuery1 The first OrderLineQuery instance to join using OR
     * @param poQuery2 The second OrderLineQuery instance to join using OR
     * @param poQuery3 The third OrderLineQuery instance to join using OR
     */
    METHOD PUBLIC OrderLineQuery Or (poQuery1 AS OrderLineQuery,
                                                          poQuery2 AS OrderLineQuery,
                                                          poQuery3 AS OrderLineQuery):

        THIS-OBJECT:OrImpl(poQuery1:ToQueryEntry(), poQuery2:ToQueryEntry(), poQuery3:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

END CLASS.
