/*------------------------------------------------------------------------
    File        : OrderTableModelSort
    Purpose     : Sort class for the OrderTableModel 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner
    Created     : 04/07/2017 13:46:39,535+02:00
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

CLASS TrainingSamples.BusinessLogik.Order.OrderTableModelSort
    INHERITS TableModelSort: 

    DEFINE PRIVATE VARIABLE oTableModel AS OrderTableModel_Generated NO-UNDO . 

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Ordernum field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Ordernum AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Ordernum":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the CustNum field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY CustNum AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "CustNum":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the OrderDate field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY OrderDate AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "OrderDate":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the ShipDate field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY ShipDate AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "ShipDate":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the PromiseDate field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY PromiseDate AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "PromiseDate":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Carrier field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Carrier AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Carrier":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Instructions field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Instructions AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Instructions":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the PO field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY PO AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "PO":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Terms field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Terms AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Terms":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the SalesRep field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY SalesRep AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "SalesRep":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the BillToID field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY BillToID AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "BillToID":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the ShipToID field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY ShipToID AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "ShipToID":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the OrderStatus field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY OrderStatus AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "OrderStatus":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the WarehouseNum field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY WarehouseNum AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "WarehouseNum":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Creditcard field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Creditcard AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Creditcard":U). 
    END GET.



    /*------------------------------------------------------------------------------
        Purpose: Constructor for the OrderTableModelSort class
        Notes:   
        @param poTableModel The reference to the TableModel for this Sort class
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderTableModelSort (poTableModel AS OrderTableModel_Generated):
        SUPER (poTableModel).
        
        ObjectAssert:IsValid (poTableModel, "TableModel":U) .
        
        ASSIGN oTableModel = poTableModel.
        
    END CONSTRUCTOR.

END CLASS.
