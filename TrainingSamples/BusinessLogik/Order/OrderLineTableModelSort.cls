/*------------------------------------------------------------------------
    File        : OrderLineTableModelSort
    Purpose     : Sort class for the OrderLineTableModel 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner
    Created     : 04/07/2017 13:46:39,561+02:00
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.*                                                  FROM PROPATH . 
USING Consultingwerk.Assertion.*                                        FROM PROPATH . 
USING Consultingwerk.OERA.*                                             FROM PROPATH . 
USING Consultingwerk.OERA.ModelFilter.*                                 FROM PROPATH .
USING TrainingSamples.BusinessLogik.Order.* FROM PROPATH .  
USING Progress.Lang.*                                                   FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Order.OrderBusinessEntity", type="TableModelSort") .

CLASS TrainingSamples.BusinessLogik.Order.OrderLineTableModelSort
    INHERITS TableModelSort: 

    DEFINE PRIVATE VARIABLE oTableModel AS OrderLineTableModel_Generated NO-UNDO . 

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Ordernum field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Ordernum AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Ordernum":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Linenum field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Linenum AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Linenum":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Itemnum field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Itemnum AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Itemnum":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Price field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Price AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Price":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Qty field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Qty AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Qty":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Discount field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Discount AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Discount":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the ExtendedPrice field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY ExtendedPrice AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "ExtendedPrice":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the OrderLineStatus field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY OrderLineStatus AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "OrderLineStatus":U). 
    END GET.



    /*------------------------------------------------------------------------------
        Purpose: Constructor for the OrderLineTableModelSort class
        Notes:   
        @param poTableModel The reference to the TableModel for this Sort class
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderLineTableModelSort (poTableModel AS OrderLineTableModel_Generated):
        SUPER (poTableModel).
        
        ObjectAssert:IsValid (poTableModel, "TableModel":U) .
        
        ASSIGN oTableModel = poTableModel.
        
    END CONSTRUCTOR.

END CLASS.
