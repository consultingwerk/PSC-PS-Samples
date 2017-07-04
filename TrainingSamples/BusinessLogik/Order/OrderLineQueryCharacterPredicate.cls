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
    File        : OrderLineQueryCharacterPredicate
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04/07/2017 13:46:39,953+02:00
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Ccs.BusinessLogic.*                FROM PROPATH.
USING Consultingwerk.OERA.QueryBuilder.* FROM PROPATH .
USING Consultingwerk.Util.*              FROM PROPATH .
USING TrainingSamples.BusinessLogik.Order.* FROM PROPATH .  
USING Progress.Lang.*                    FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Order.OrderBusinessEntity", type="QueryFieldPredicate") .

CLASS TrainingSamples.BusinessLogik.Order.OrderLineQueryCharacterPredicate
    INHERITS CharacterQueryPredicate:

    /**
     * Purpose: Constructor for the OrderLineQueryCharacterPredicate class
     * Notes:
     * @param poParent The reference to the table query builder instance
     * @param pcFieldName The name of the field
     */
    CONSTRUCTOR PUBLIC OrderLineQueryCharacterPredicate (poParent AS OrderLineQuery, pcFieldName AS CHARACTER):

        SUPER (poParent, pcFieldName) .

    END CONSTRUCTOR.

    /**
     * Purpose: Adds a Begins filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC OrderLineQuery Begins (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Begins, pcValue), OrderLineQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Contains filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC OrderLineQuery Contains (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Contains, pcValue), OrderLineQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Matches filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC OrderLineQuery Matches (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Matches, pcValue), OrderLineQuery) .

    END METHOD.

    /**
     * Purpose: Adds an Eq filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC OrderLineQuery Eq (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Eq, pcValue), OrderLineQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Ge filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC OrderLineQuery Ge (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Ge, pcValue), OrderLineQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Gt filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC OrderLineQuery Gt (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Gt, pcValue), OrderLineQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Le filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC OrderLineQuery Le (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Le, pcValue), OrderLineQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Lt filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC OrderLineQuery Lt (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Lt, pcValue), OrderLineQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InList filter condition
     * Notes:
     * @param pcValue The array of reference values
     */
    METHOD PUBLIC OrderLineQuery InList (pcValues AS CHARACTER EXTENT):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InList, pcValues), OrderLineQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InRange filter condition
     * Notes:
     * @param pcValue1 The reference value for the lower boundary
     * @param pcValue2 The reference value for the upper boundary
     */
    METHOD PUBLIC OrderLineQuery InRange (pcValue1 AS CHARACTER, pcValue2 AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InRange, ArrayHelper:Array (pcValue1, pcValue2)), OrderLineQuery) .

    END METHOD.

END CLASS.
