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
    File        : SalesrepQueryCharacterPredicate
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 03/07/2017 17:42:22,515+02:00
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Ccs.BusinessLogic.*                FROM PROPATH.
USING Consultingwerk.OERA.QueryBuilder.* FROM PROPATH .
USING Consultingwerk.Util.*              FROM PROPATH .
USING TrainingSamples.BusinessLogik.CustomerWithReposition.* FROM PROPATH .  
USING Progress.Lang.*                    FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerBusinessEntity", type="QueryFieldPredicate") .

CLASS TrainingSamples.BusinessLogik.CustomerWithReposition.SalesrepQueryCharacterPredicate
    INHERITS CharacterQueryPredicate:

    /**
     * Purpose: Constructor for the SalesrepQueryCharacterPredicate class
     * Notes:
     * @param poParent The reference to the table query builder instance
     * @param pcFieldName The name of the field
     */
    CONSTRUCTOR PUBLIC SalesrepQueryCharacterPredicate (poParent AS SalesrepQuery, pcFieldName AS CHARACTER):

        SUPER (poParent, pcFieldName) .

    END CONSTRUCTOR.

    /**
     * Purpose: Adds a Begins filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC SalesrepQuery Begins (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Begins, pcValue), SalesrepQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Contains filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC SalesrepQuery Contains (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Contains, pcValue), SalesrepQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Matches filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC SalesrepQuery Matches (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Matches, pcValue), SalesrepQuery) .

    END METHOD.

    /**
     * Purpose: Adds an Eq filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC SalesrepQuery Eq (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Eq, pcValue), SalesrepQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Ge filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC SalesrepQuery Ge (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Ge, pcValue), SalesrepQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Gt filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC SalesrepQuery Gt (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Gt, pcValue), SalesrepQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Le filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC SalesrepQuery Le (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Le, pcValue), SalesrepQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Lt filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC SalesrepQuery Lt (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Lt, pcValue), SalesrepQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InList filter condition
     * Notes:
     * @param pcValue The array of reference values
     */
    METHOD PUBLIC SalesrepQuery InList (pcValues AS CHARACTER EXTENT):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InList, pcValues), SalesrepQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InRange filter condition
     * Notes:
     * @param pcValue1 The reference value for the lower boundary
     * @param pcValue2 The reference value for the upper boundary
     */
    METHOD PUBLIC SalesrepQuery InRange (pcValue1 AS CHARACTER, pcValue2 AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InRange, ArrayHelper:Array (pcValue1, pcValue2)), SalesrepQuery) .

    END METHOD.

END CLASS.
