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
    File        : OrderQueryDatePredicate
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04/07/2017 13:46:39,943+02:00
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Ccs.BusinessLogic.*                FROM PROPATH.
USING Consultingwerk.OERA.QueryBuilder.* FROM PROPATH .
USING Consultingwerk.Util.*              FROM PROPATH .
USING TrainingSamples.BusinessLogik.Order.* FROM PROPATH .  
USING Progress.Lang.*                    FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Order.OrderBusinessEntity", type="QueryFieldPredicate") .

CLASS TrainingSamples.BusinessLogik.Order.OrderQueryDatePredicate
    INHERITS DateQueryPredicate:

    /**
     * Purpose: Constructor for the OrderQueryDatePredicate class
     * Notes:
     * @param poParent The reference to the table query builder instance
     * @param pcFieldName The name of the field
     */
    CONSTRUCTOR PUBLIC OrderQueryDatePredicate (poParent AS OrderQuery, pcFieldName AS CHARACTER):

        SUPER (poParent, pcFieldName) .

    END CONSTRUCTOR.

    /**
     * Purpose: Adds an Eq filter condition
     * Notes:
     * @param pdaValue The reference value
     */
    METHOD PUBLIC OrderQuery Eq (pdaValue AS DATE):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Eq, pdaValue), OrderQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Ge filter condition
     * Notes:
     * @param pdaValue The reference value
     */
    METHOD PUBLIC OrderQuery Ge (pdaValue AS DATE):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Ge, pdaValue), OrderQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Gt filter condition
     * Notes:
     * @param pdaValue The reference value
     */
    METHOD PUBLIC OrderQuery Gt (pdaValue AS DATE):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Gt, pdaValue), OrderQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Le filter condition
     * Notes:
     * @param pdaValue The reference value
     */
    METHOD PUBLIC OrderQuery Le (pdaValue AS DATE):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Le, pdaValue), OrderQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Lt filter condition
     * Notes:
     * @param pdaValue The reference value
     */
    METHOD PUBLIC OrderQuery Lt (pdaValue AS DATE):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Lt, pdaValue), OrderQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InList filter condition
     * Notes:
     * @param pdaValue The array of reference values
     */
    METHOD PUBLIC OrderQuery InList (pdaValues AS DATE EXTENT):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InList, pdaValues), OrderQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InRange filter condition
     * Notes:
     * @param pdaValue1 The reference value for the lower boundary
     * @param pdaValue2 The reference value for the upper boundary
     */
    METHOD PUBLIC OrderQuery InRange (pdaValue1 AS DATE, pdaValue2 AS DATE):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InRange, ArrayHelper:Array (pdaValue1, pdaValue2)), OrderQuery) .

    END METHOD.

END CLASS.
