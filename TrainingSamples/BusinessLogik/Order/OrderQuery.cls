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
    File        : OrderQuery
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04/07/2017 13:46:39,949+02:00
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.QueryBuilder.* FROM PROPATH .
USING TrainingSamples.BusinessLogik.Order.* FROM PROPATH .
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Order.OrderBusinessEntity", type="TableQuery") .

CLASS TrainingSamples.BusinessLogik.Order.OrderQuery
    INHERITS TableQuery:

    /**
     * Purpose: Provides the filter options for the Ordernum field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Ordernum AS OrderQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW OrderQueryIntegerPredicate (THIS-OBJECT, "Ordernum":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the CustNum field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY CustNum AS OrderQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW OrderQueryIntegerPredicate (THIS-OBJECT, "CustNum":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the OrderDate field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY OrderDate AS OrderQueryDatePredicate NO-UNDO
    GET:
        RETURN NEW OrderQueryDatePredicate (THIS-OBJECT, "OrderDate":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the ShipDate field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY ShipDate AS OrderQueryDatePredicate NO-UNDO
    GET:
        RETURN NEW OrderQueryDatePredicate (THIS-OBJECT, "ShipDate":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the PromiseDate field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY PromiseDate AS OrderQueryDatePredicate NO-UNDO
    GET:
        RETURN NEW OrderQueryDatePredicate (THIS-OBJECT, "PromiseDate":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Carrier field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Carrier AS OrderQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW OrderQueryCharacterPredicate (THIS-OBJECT, "Carrier":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Instructions field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Instructions AS OrderQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW OrderQueryCharacterPredicate (THIS-OBJECT, "Instructions":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the PO field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY PO AS OrderQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW OrderQueryCharacterPredicate (THIS-OBJECT, "PO":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Terms field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Terms AS OrderQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW OrderQueryCharacterPredicate (THIS-OBJECT, "Terms":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the SalesRep field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY SalesRep AS OrderQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW OrderQueryCharacterPredicate (THIS-OBJECT, "SalesRep":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the BillToID field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY BillToID AS OrderQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW OrderQueryIntegerPredicate (THIS-OBJECT, "BillToID":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the ShipToID field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY ShipToID AS OrderQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW OrderQueryIntegerPredicate (THIS-OBJECT, "ShipToID":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the OrderStatus field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY OrderStatus AS OrderQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW OrderQueryCharacterPredicate (THIS-OBJECT, "OrderStatus":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the WarehouseNum field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY WarehouseNum AS OrderQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW OrderQueryIntegerPredicate (THIS-OBJECT, "WarehouseNum":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Creditcard field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Creditcard AS OrderQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW OrderQueryCharacterPredicate (THIS-OBJECT, "Creditcard":U) .
    END GET .

    /**
     * Purpose: Indicates that the following field would be joined using an AND
     * Notes:
     * @return The reference to the OrderQuery instance itself
     */
    DEFINE PUBLIC PROPERTY And AS OrderQuery NO-UNDO
    GET:
        THIS-OBJECT:AndImpl () .

        RETURN THIS-OBJECT .
    END GET .

    /**
     * Purpose: Indicates that the following field would be joined using an OR
     * Notes:
     * @return The reference to the OrderQuery instance itself
     */
    DEFINE PUBLIC PROPERTY Or AS OrderQuery NO-UNDO
    GET:
        THIS-OBJECT:OrImpl () .

        RETURN THIS-OBJECT .
    END GET .

    /**
     * Purpose: Constructor for the OrderQuery class
     * Notes:
     */
    CONSTRUCTOR PUBLIC OrderQuery ():
        SUPER ("eOrder":U) .

    END CONSTRUCTOR.

    /**
     * Purpose: Constructor for the OrderQuery class
     * Notes:   
     * @param pOrdernum The filter value for the eOrder.Ordernum field
     */
    CONSTRUCTOR PUBLIC OrderQuery (pOrdernum AS INTEGER):
        SUPER ("eOrder":U).

        THIS-OBJECT:Ordernum:Eq (POrdernum) .

    END CONSTRUCTOR.

    /**
     * Purpose: Joins a Query Entry using AND
     * Notes:
     * @param poQuery The OrderQuery instance to join using AND
     */
    METHOD PUBLIC OrderQuery And (poQuery AS OrderQuery):

        THIS-OBJECT:AndImpl (poQuery:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins two Query Entries using AND
     * Notes:
     * @param poQuery1 The first OrderQuery instance to join using AND
     * @param poQuery2 The second OrderQuery instance to join using AND
     */
    METHOD PUBLIC OrderQuery And (poQuery1 AS OrderQuery,
                                                           poQuery2 AS OrderQuery):

        THIS-OBJECT:OrImpl(poQuery1:ToQueryEntry(), poQuery2:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins three Query Entries using AND
     * Notes:
     * @param poQuery1 The first OrderQuery instance to join using AND
     * @param poQuery2 The second OrderQuery instance to join using AND
     * @param poQuery3 The third OrderQuery instance to join using AND
     */
    METHOD PUBLIC OrderQuery And (poQuery1 AS OrderQuery,
                                                           poQuery2 AS OrderQuery,
                                                           poQuery3 AS OrderQuery):

        THIS-OBJECT:OrImpl(poQuery1:ToQueryEntry(), poQuery2:ToQueryEntry(), poQuery3:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins a Query Entry using OR
     * Notes:
     * @param poQuery The OrderQuery instance to join using OR
     */
    METHOD PUBLIC OrderQuery Or (poQuery AS OrderQuery):

        THIS-OBJECT:OrImpl(poQuery:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins two Query Entries using OR
     * Notes:
     * @param poQuery1 The first OrderQuery instance to join using OR
     * @param poQuery2 The second OrderQuery instance to join using OR
     */
    METHOD PUBLIC OrderQuery Or (poQuery1 AS OrderQuery,
                                                          poQuery2 AS OrderQuery):

        THIS-OBJECT:OrImpl(poQuery1:ToQueryEntry(), poQuery2:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins three Query Entries using OR
     * Notes:
     * @param poQuery1 The first OrderQuery instance to join using OR
     * @param poQuery2 The second OrderQuery instance to join using OR
     * @param poQuery3 The third OrderQuery instance to join using OR
     */
    METHOD PUBLIC OrderQuery Or (poQuery1 AS OrderQuery,
                                                          poQuery2 AS OrderQuery,
                                                          poQuery3 AS OrderQuery):

        THIS-OBJECT:OrImpl(poQuery1:ToQueryEntry(), poQuery2:ToQueryEntry(), poQuery3:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

END CLASS.
