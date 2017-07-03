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
    File        : CustomerQueryCharacterPredicate
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 03/07/2017 17:42:22,506+02:00
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Ccs.BusinessLogic.*                FROM PROPATH.
USING Consultingwerk.OERA.QueryBuilder.* FROM PROPATH .
USING Consultingwerk.Util.*              FROM PROPATH .
USING TrainingSamples.BusinessLogik.CustomerWithReposition.* FROM PROPATH .  
USING Progress.Lang.*                    FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerBusinessEntity", type="QueryFieldPredicate") .

CLASS TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerQueryCharacterPredicate
    INHERITS CharacterQueryPredicate:

    /**
     * Purpose: Constructor for the CustomerQueryCharacterPredicate class
     * Notes:
     * @param poParent The reference to the table query builder instance
     * @param pcFieldName The name of the field
     */
    CONSTRUCTOR PUBLIC CustomerQueryCharacterPredicate (poParent AS CustomerQuery, pcFieldName AS CHARACTER):

        SUPER (poParent, pcFieldName) .

    END CONSTRUCTOR.

    /**
     * Purpose: Adds a Begins filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC CustomerQuery Begins (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Begins, pcValue), CustomerQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Contains filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC CustomerQuery Contains (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Contains, pcValue), CustomerQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Matches filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC CustomerQuery Matches (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Matches, pcValue), CustomerQuery) .

    END METHOD.

    /**
     * Purpose: Adds an Eq filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC CustomerQuery Eq (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Eq, pcValue), CustomerQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Ge filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC CustomerQuery Ge (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Ge, pcValue), CustomerQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Gt filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC CustomerQuery Gt (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Gt, pcValue), CustomerQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Le filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC CustomerQuery Le (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Le, pcValue), CustomerQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Lt filter condition
     * Notes:
     * @param pcValue The reference value
     */
    METHOD PUBLIC CustomerQuery Lt (pcValue AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Lt, pcValue), CustomerQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InList filter condition
     * Notes:
     * @param pcValue The array of reference values
     */
    METHOD PUBLIC CustomerQuery InList (pcValues AS CHARACTER EXTENT):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InList, pcValues), CustomerQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InRange filter condition
     * Notes:
     * @param pcValue1 The reference value for the lower boundary
     * @param pcValue2 The reference value for the upper boundary
     */
    METHOD PUBLIC CustomerQuery InRange (pcValue1 AS CHARACTER, pcValue2 AS CHARACTER):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InRange, ArrayHelper:Array (pcValue1, pcValue2)), CustomerQuery) .

    END METHOD.

END CLASS.
