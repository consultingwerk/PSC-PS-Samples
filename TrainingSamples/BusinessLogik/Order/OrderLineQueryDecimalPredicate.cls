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
    File        : OrderLineQueryDecimalPredicate
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04/07/2017 13:46:39,955+02:00
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Ccs.BusinessLogic.*                FROM PROPATH.
USING Consultingwerk.OERA.QueryBuilder.* FROM PROPATH .
USING Consultingwerk.Util.*              FROM PROPATH .
USING TrainingSamples.BusinessLogik.Order.* FROM PROPATH .  
USING Progress.Lang.*                    FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Order.OrderBusinessEntity", type="QueryFieldPredicate") .

CLASS TrainingSamples.BusinessLogik.Order.OrderLineQueryDecimalPredicate
    INHERITS DecimalQueryPredicate:

    /**
     * Purpose: Constructor for the OrderLineQueryDecimalPredicate class
     * Notes:
     * @param poParent The reference to the table query builder instance
     * @param pcFieldName The name of the field
     */
    CONSTRUCTOR PUBLIC OrderLineQueryDecimalPredicate (poParent AS OrderLineQuery, pcFieldName AS CHARACTER):

        SUPER (poParent, pcFieldName) .

    END CONSTRUCTOR.

    /**
     * Purpose: Adds an Eq filter condition
     * Notes:
     * @param pdeValue The reference value
     */
    METHOD PUBLIC OrderLineQuery Eq (pdeValue AS DECIMAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Eq, pdeValue), OrderLineQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Ge filter condition
     * Notes:
     * @param pdeValue The reference value
     */
    METHOD PUBLIC OrderLineQuery Ge (pdeValue AS DECIMAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Ge, pdeValue), OrderLineQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Gt filter condition
     * Notes:
     * @param pdeValue The reference value
     */
    METHOD PUBLIC OrderLineQuery Gt (pdeValue AS DECIMAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Gt, pdeValue), OrderLineQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Le filter condition
     * Notes:
     * @param pdeValue The reference value
     */
    METHOD PUBLIC OrderLineQuery Le (pdeValue AS DECIMAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Le, pdeValue), OrderLineQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Lt filter condition
     * Notes:
     * @param pdeValue The reference value
     */
    METHOD PUBLIC OrderLineQuery Lt (pdeValue AS DECIMAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Lt, pdeValue), OrderLineQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InList filter condition
     * Notes:
     * @param pdeValue The array of reference values
     */
    METHOD PUBLIC OrderLineQuery InList (pdeValues AS DECIMAL EXTENT):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InList, pdeValues), OrderLineQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InRange filter condition
     * Notes:
     * @param pdeValue1 The reference value for the lower boundary
     * @param pdeValue2 The reference value for the upper boundary
     */
    METHOD PUBLIC OrderLineQuery InRange (pdeValue1 AS DECIMAL, pdeValue2 AS DECIMAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InRange, ArrayHelper:Array (pdeValue1, pdeValue2)), OrderLineQuery) .

    END METHOD.

END CLASS.
