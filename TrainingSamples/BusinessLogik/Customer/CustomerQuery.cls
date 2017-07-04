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
    File        : CustomerQuery
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04/07/2017 10:12:45,618+02:00
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.QueryBuilder.* FROM PROPATH .
USING TrainingSamples.BusinessLogik.Customer.* FROM PROPATH .
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity", type="TableQuery") .

CLASS TrainingSamples.BusinessLogik.Customer.CustomerQuery
    INHERITS TableQuery:

    /**
     * Purpose: Provides the filter options for the CustNum field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY CustNum AS CustomerQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryIntegerPredicate (THIS-OBJECT, "CustNum":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Country field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Country AS CustomerQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryCharacterPredicate (THIS-OBJECT, "Country":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Name field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Name AS CustomerQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryCharacterPredicate (THIS-OBJECT, "Name":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Address field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Address AS CustomerQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryCharacterPredicate (THIS-OBJECT, "Address":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Address2 field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Address2 AS CustomerQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryCharacterPredicate (THIS-OBJECT, "Address2":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the City field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY City AS CustomerQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryCharacterPredicate (THIS-OBJECT, "City":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the State field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY State AS CustomerQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryCharacterPredicate (THIS-OBJECT, "State":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the PostalCode field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY PostalCode AS CustomerQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryCharacterPredicate (THIS-OBJECT, "PostalCode":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Contact field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Contact AS CustomerQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryCharacterPredicate (THIS-OBJECT, "Contact":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Phone field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Phone AS CustomerQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryCharacterPredicate (THIS-OBJECT, "Phone":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the SalesRep field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY SalesRep AS CustomerQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryCharacterPredicate (THIS-OBJECT, "SalesRep":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the CreditLimit field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY CreditLimit AS CustomerQueryDecimalPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryDecimalPredicate (THIS-OBJECT, "CreditLimit":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Balance field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Balance AS CustomerQueryDecimalPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryDecimalPredicate (THIS-OBJECT, "Balance":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Terms field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Terms AS CustomerQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryCharacterPredicate (THIS-OBJECT, "Terms":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Discount field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Discount AS CustomerQueryIntegerPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryIntegerPredicate (THIS-OBJECT, "Discount":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Comments field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Comments AS CustomerQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryCharacterPredicate (THIS-OBJECT, "Comments":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the Fax field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY Fax AS CustomerQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryCharacterPredicate (THIS-OBJECT, "Fax":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the EmailAddress field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY EmailAddress AS CustomerQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryCharacterPredicate (THIS-OBJECT, "EmailAddress":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the DuePayments field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY DuePayments AS CustomerQueryLogicalPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryLogicalPredicate (THIS-OBJECT, "DuePayments":U) .
    END GET .

    /**
     * Purpose: Provides the filter options for the CustomerFlags field
     * Notes:
     */
    DEFINE PUBLIC PROPERTY CustomerFlags AS CustomerQueryCharacterPredicate NO-UNDO
    GET:
        RETURN NEW CustomerQueryCharacterPredicate (THIS-OBJECT, "CustomerFlags":U) .
    END GET .

    /**
     * Purpose: Indicates that the following field would be joined using an AND
     * Notes:
     * @return The reference to the CustomerQuery instance itself
     */
    DEFINE PUBLIC PROPERTY And AS CustomerQuery NO-UNDO
    GET:
        THIS-OBJECT:AndImpl () .

        RETURN THIS-OBJECT .
    END GET .

    /**
     * Purpose: Indicates that the following field would be joined using an OR
     * Notes:
     * @return The reference to the CustomerQuery instance itself
     */
    DEFINE PUBLIC PROPERTY Or AS CustomerQuery NO-UNDO
    GET:
        THIS-OBJECT:OrImpl () .

        RETURN THIS-OBJECT .
    END GET .

    /**
     * Purpose: Constructor for the CustomerQuery class
     * Notes:
     */
    CONSTRUCTOR PUBLIC CustomerQuery ():
        SUPER ("eCustomer":U) .

    END CONSTRUCTOR.

    /**
     * Purpose: Constructor for the CustomerQuery class
     * Notes:   
     * @param pCustNum The filter value for the eCustomer.CustNum field
     */
    CONSTRUCTOR PUBLIC CustomerQuery (pCustNum AS INTEGER):
        SUPER ("eCustomer":U).

        THIS-OBJECT:CustNum:Eq (PCustNum) .

    END CONSTRUCTOR.

    /**
     * Purpose: Joins a Query Entry using AND
     * Notes:
     * @param poQuery The CustomerQuery instance to join using AND
     */
    METHOD PUBLIC CustomerQuery And (poQuery AS CustomerQuery):

        THIS-OBJECT:AndImpl (poQuery:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins two Query Entries using AND
     * Notes:
     * @param poQuery1 The first CustomerQuery instance to join using AND
     * @param poQuery2 The second CustomerQuery instance to join using AND
     */
    METHOD PUBLIC CustomerQuery And (poQuery1 AS CustomerQuery,
                                                           poQuery2 AS CustomerQuery):

        THIS-OBJECT:OrImpl(poQuery1:ToQueryEntry(), poQuery2:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins three Query Entries using AND
     * Notes:
     * @param poQuery1 The first CustomerQuery instance to join using AND
     * @param poQuery2 The second CustomerQuery instance to join using AND
     * @param poQuery3 The third CustomerQuery instance to join using AND
     */
    METHOD PUBLIC CustomerQuery And (poQuery1 AS CustomerQuery,
                                                           poQuery2 AS CustomerQuery,
                                                           poQuery3 AS CustomerQuery):

        THIS-OBJECT:OrImpl(poQuery1:ToQueryEntry(), poQuery2:ToQueryEntry(), poQuery3:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins a Query Entry using OR
     * Notes:
     * @param poQuery The CustomerQuery instance to join using OR
     */
    METHOD PUBLIC CustomerQuery Or (poQuery AS CustomerQuery):

        THIS-OBJECT:OrImpl(poQuery:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins two Query Entries using OR
     * Notes:
     * @param poQuery1 The first CustomerQuery instance to join using OR
     * @param poQuery2 The second CustomerQuery instance to join using OR
     */
    METHOD PUBLIC CustomerQuery Or (poQuery1 AS CustomerQuery,
                                                          poQuery2 AS CustomerQuery):

        THIS-OBJECT:OrImpl(poQuery1:ToQueryEntry(), poQuery2:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

    /**
     * Purpose: Joins three Query Entries using OR
     * Notes:
     * @param poQuery1 The first CustomerQuery instance to join using OR
     * @param poQuery2 The second CustomerQuery instance to join using OR
     * @param poQuery3 The third CustomerQuery instance to join using OR
     */
    METHOD PUBLIC CustomerQuery Or (poQuery1 AS CustomerQuery,
                                                          poQuery2 AS CustomerQuery,
                                                          poQuery3 AS CustomerQuery):

        THIS-OBJECT:OrImpl(poQuery1:ToQueryEntry(), poQuery2:ToQueryEntry(), poQuery3:ToQueryEntry()) .

        RETURN THIS-OBJECT .

    END METHOD.

END CLASS.
