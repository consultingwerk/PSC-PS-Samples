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
    File        : CustomerQueryLogicalPredicate
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : 04/07/2017 10:12:45,613+02:00
    Notes       :
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Ccs.BusinessLogic.*                FROM PROPATH.
USING Consultingwerk.OERA.QueryBuilder.* FROM PROPATH .
USING Consultingwerk.Util.*              FROM PROPATH .
USING TrainingSamples.BusinessLogik.Customer.* FROM PROPATH .  
USING Progress.Lang.*                    FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity", type="QueryFieldPredicate") .

CLASS TrainingSamples.BusinessLogik.Customer.CustomerQueryLogicalPredicate
    INHERITS LogicalQueryPredicate:

    /**
     * Purpose: Constructor for the CustomerQueryLogicalPredicate class
     * Notes:
     * @param poParent The reference to the table query builder instance
     * @param pcFieldName The name of the field
     */
    CONSTRUCTOR PUBLIC CustomerQueryLogicalPredicate (poParent AS CustomerQuery, pcFieldName AS CHARACTER):

        SUPER (poParent, pcFieldName) .

    END CONSTRUCTOR.

    /**
     * Purpose: Adds an Eq filter condition
     * Notes:
     * @param plValue The reference value
     */
    METHOD PUBLIC CustomerQuery Eq (plValue AS LOGICAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Eq, plValue), CustomerQuery) .

    END METHOD.

    /**
     * Purpose: Adds a Ge filter condition
     * Notes:
     * @param plValue The reference value
     */
    METHOD PUBLIC CustomerQuery Ge (plValue AS LOGICAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Ge, plValue), CustomerQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Gt filter condition
     * Notes:
     * @param plValue The reference value
     */
    METHOD PUBLIC CustomerQuery Gt (plValue AS LOGICAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Gt, plValue), CustomerQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Le filter condition
     * Notes:
     * @param plValue The reference value
     */
    METHOD PUBLIC CustomerQuery Le (plValue AS LOGICAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Le, plValue), CustomerQuery) .

    END METHOD.

     /**
     * Purpose: Adds a Lt filter condition
     * Notes:
     * @param plValue The reference value
     */
    METHOD PUBLIC CustomerQuery Lt (plValue AS LOGICAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:Lt, plValue), CustomerQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InList filter condition
     * Notes:
     * @param plValue The array of reference values
     */
    METHOD PUBLIC CustomerQuery InList (plValues AS LOGICAL EXTENT):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InList, plValues), CustomerQuery) .

    END METHOD.

     /**
     * Purpose: Adds an InRange filter condition
     * Notes:
     * @param plValue1 The reference value for the lower boundary
     * @param plValue2 The reference value for the upper boundary
     */
    METHOD PUBLIC CustomerQuery InRange (plValue1 AS LOGICAL, plValue2 AS LOGICAL):

        RETURN CAST (THIS-OBJECT:InsertQueryEntry (QueryOperatorEnum:InRange, ArrayHelper:Array (plValue1, plValue2)), CustomerQuery) .

    END METHOD.

END CLASS.
