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
    File        : OrderQueryCharacterPredicate
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04/07/2017 13:46:39,931+02:00
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Ccs.BusinessLogic.*                FROM PROPATH.
USING Consultingwerk.OERA.QueryBuilder.* FROM PROPATH .
USING Consultingwerk.Util.*              FROM PROPATH .
USING TrainingSamples.BusinessLogik.Order.* FROM PROPATH .  
USING Progress.Lang.*                    FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Order.OrderBusinessEntity", type="QueryFieldPredicate") .

CLASS TrainingSamples.BusinessLogik.Order.OrderQueryCharacterPredicate
    INHERITS CharacterQueryPredicate:

    /**
     * Purpose: Constructor for the OrderQueryCharacterPredicate class
     * Notes:
     * @param poParent The reference to the table query builder instance
     * @param pcFieldName The name of the field
     */
    CONSTRUCTOR PUBLIC OrderQueryCharacterPredicate (poParent AS OrderQuery, pcFieldName AS CHARACTER):

        SUPER (poParent, pcFieldName) .

    END CONSTRUCTOR.

    /**
     * Purpose: Adds a Begins filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC OrderQuery Begins (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Begins, pcValue), OrderQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Contains filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC OrderQuery Contains (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Contains, pcValue), OrderQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Matches filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC OrderQuery Matches (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Matches, pcValue), OrderQuery) .

    END METHOD.

    /**
     * Purpose: Adds an Eq filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC OrderQuery Eq (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Eq, pcValue), OrderQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Ge filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC OrderQuery Ge (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Ge, pcValue), OrderQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Gt filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC OrderQuery Gt (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Gt, pcValue), OrderQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Le filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC OrderQuery Le (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Le, pcValue), OrderQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Lt filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC OrderQuery Lt (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Lt, pcValue), OrderQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InList filter condition
     * Notes:
     * @param pcValue The array of reference values
     */
    METHOD PUBLIC OrderQuery InList (pcValues AS CHARACTER EXTENT):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InList, pcValues), OrderQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InRange filter condition
     * Notes:
     * @param pcValue1 The reference value for the lower boundary
     * @param pcValue2 The reference value for the upper boundary
     */
    METHOD PUBLIC OrderQuery InRange (pcValue1 AS CHARACTER, pcValue2 AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InRange, ArrayHelper:Array (pcValue1, pcValue2)), OrderQuery) .

    END METHOD.

END CLASS.
