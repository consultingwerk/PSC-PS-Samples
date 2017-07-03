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
    File        : CustomerQueryIntegerPredicate
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 03/07/2017 17:42:22,510+02:00
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Ccs.BusinessLogic.*                FROM PROPATH.
USING Consultingwerk.OERA.QueryBuilder.* FROM PROPATH .
USING Consultingwerk.Util.*              FROM PROPATH .
USING TrainingSamples.BusinessLogik.CustomerWithReposition.* FROM PROPATH .  
USING Progress.Lang.*                    FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerBusinessEntity", type="QueryFieldPredicate") .

CLASS TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerQueryIntegerPredicate
    INHERITS IntegerQueryPredicate:

    /**
     * Purpose: Constructor for the CustomerQueryIntegerPredicate class
     * Notes:
     * @param poParent The reference to the table query builder instance
     * @param pcFieldName The name of the field
     */
    CONSTRUCTOR PUBLIC CustomerQueryIntegerPredicate (poParent AS CustomerQuery, pcFieldName AS CHARACTER):

        SUPER (poParent, pcFieldName) .

    END CONSTRUCTOR.

    /**
     * Purpose: Adds an Eq filter condition
     * Notes:
     * @param piValue The reference value
     */
    METHOD PUBLIC CustomerQuery Eq (piValue AS INTEGER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Eq, piValue), CustomerQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Ge filter condition
     * Notes:
     * @param piValue The reference value
     */
    METHOD PUBLIC CustomerQuery Ge (piValue AS INTEGER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Ge, piValue), CustomerQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Gt filter condition
     * Notes:
     * @param piValue The reference value
     */
    METHOD PUBLIC CustomerQuery Gt (piValue AS INTEGER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Gt, piValue), CustomerQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Le filter condition
     * Notes:
     * @param piValue The reference value
     */
    METHOD PUBLIC CustomerQuery Le (piValue AS INTEGER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Le, piValue), CustomerQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Lt filter condition
     * Notes:
     * @param piValue The reference value
     */
    METHOD PUBLIC CustomerQuery Lt (piValue AS INTEGER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Lt, piValue), CustomerQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InList filter condition
     * Notes:
     * @param piValue The array of reference values
     */
    METHOD PUBLIC CustomerQuery InList (piValues AS INTEGER EXTENT):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InList, piValues), CustomerQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InRange filter condition
     * Notes:
     * @param piValue1 The reference value for the lower boundary
     * @param piValue2 The reference value for the upper boundary
     */
    METHOD PUBLIC CustomerQuery InRange (piValue1 AS INTEGER, piValue2 AS INTEGER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InRange, ArrayHelper:Array (piValue1, piValue2)), CustomerQuery) .

    END METHOD.

END CLASS.
