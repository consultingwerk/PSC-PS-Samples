/*------------------------------------------------------------------------
    File        : SalesrepTableModelSort
    Purpose     : Sort class for the SalesrepTableModel 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner
    Created     : 04/07/2017 09:39:24,682+02:00
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.*                                                  FROM PROPATH . 
USING Consultingwerk.Assertion.*                                        FROM PROPATH . 
USING Consultingwerk.OERA.*                                             FROM PROPATH . 
USING Consultingwerk.OERA.ModelFilter.*                                 FROM PROPATH .
USING TrainingSamples.BusinessLogik.Customer.* FROM PROPATH .  
USING Progress.Lang.*                                                   FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity", type="TableModelSort") .

CLASS TrainingSamples.BusinessLogik.Customer.SalesrepTableModelSort
    INHERITS TableModelSort: 

    DEFINE PRIVATE VARIABLE oTableModel AS SalesrepTableModel_Generated NO-UNDO . 

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the SalesRep field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY SalesRep AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "SalesRep":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the RepName field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY RepName AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "RepName":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Region field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Region AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Region":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the MonthQuota_01 field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_01 AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "MonthQuota_01":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the MonthQuota_02 field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_02 AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "MonthQuota_02":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the MonthQuota_03 field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_03 AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "MonthQuota_03":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the EmailAddress field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY EmailAddress AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "EmailAddress":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the PhoneOffice field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY PhoneOffice AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "PhoneOffice":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the PhonePrivate field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY PhonePrivate AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "PhonePrivate":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the PhoneHandy field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY PhoneHandy AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "PhoneHandy":U). 
    END GET.



    /*------------------------------------------------------------------------------
        Purpose: Constructor for the SalesrepTableModelSort class
        Notes:   
        @param poTableModel The reference to the TableModel for this Sort class
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC SalesrepTableModelSort (poTableModel AS SalesrepTableModel_Generated):
        SUPER (poTableModel).
        
        ObjectAssert:IsValid (poTableModel, "TableModel":U) .
        
        ASSIGN oTableModel = poTableModel.
        
    END CONSTRUCTOR.

END CLASS.
