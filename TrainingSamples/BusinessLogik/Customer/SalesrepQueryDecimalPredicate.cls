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
    File        : SalesrepQueryDecimalPredicate
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04/07/2017 10:12:45,664+02:00
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Ccs.BusinessLogic.*                FROM PROPATH.
USING Consultingwerk.OERA.QueryBuilder.* FROM PROPATH .
USING Consultingwerk.Util.*              FROM PROPATH .
USING TrainingSamples.BusinessLogik.Customer.* FROM PROPATH .  
USING Progress.Lang.*                    FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity", type="QueryFieldPredicate") .

CLASS TrainingSamples.BusinessLogik.Customer.SalesrepQueryDecimalPredicate
    INHERITS DecimalQueryPredicate:

    /**
     * Purpose: Constructor for the SalesrepQueryDecimalPredicate class
     * Notes:
     * @param poParent The reference to the table query builder instance
     * @param pcFieldName The name of the field
     */
    CONSTRUCTOR PUBLIC SalesrepQueryDecimalPredicate (poParent AS SalesrepQuery, pcFieldName AS CHARACTER):

        SUPER (poParent, pcFieldName) .

    END CONSTRUCTOR.

    /**
     * Purpose: Adds an Eq filter condition
     * Notes:
     * @param pdeValue The reference value
     */
    METHOD PUBLIC SalesrepQuery Eq (pdeValue AS DECIMAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Eq, pdeValue), SalesrepQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Ge filter condition
     * Notes:
     * @param pdeValue The reference value
     */
    METHOD PUBLIC SalesrepQuery Ge (pdeValue AS DECIMAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Ge, pdeValue), SalesrepQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Gt filter condition
     * Notes:
     * @param pdeValue The reference value
     */
    METHOD PUBLIC SalesrepQuery Gt (pdeValue AS DECIMAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Gt, pdeValue), SalesrepQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Le filter condition
     * Notes:
     * @param pdeValue The reference value
     */
    METHOD PUBLIC SalesrepQuery Le (pdeValue AS DECIMAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Le, pdeValue), SalesrepQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Lt filter condition
     * Notes:
     * @param pdeValue The reference value
     */
    METHOD PUBLIC SalesrepQuery Lt (pdeValue AS DECIMAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Lt, pdeValue), SalesrepQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InList filter condition
     * Notes:
     * @param pdeValue The array of reference values
     */
    METHOD PUBLIC SalesrepQuery InList (pdeValues AS DECIMAL EXTENT):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InList, pdeValues), SalesrepQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InRange filter condition
     * Notes:
     * @param pdeValue1 The reference value for the lower boundary
     * @param pdeValue2 The reference value for the upper boundary
     */
    METHOD PUBLIC SalesrepQuery InRange (pdeValue1 AS DECIMAL, pdeValue2 AS DECIMAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InRange, ArrayHelper:Array (pdeValue1, pdeValue2)), SalesrepQuery) .

    END METHOD.

END CLASS.
