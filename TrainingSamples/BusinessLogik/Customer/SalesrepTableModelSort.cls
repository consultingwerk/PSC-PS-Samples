/*------------------------------------------------------------------------
    File        : SalesrepTableModelSort
    Purpose     : Sort class for the SalesrepTableModel 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner
    Created     : 03/07/2017 14:41:47,825+02:00
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
        Purpose: Returns the Sort option for the MonthQuota_04 field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_04 AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "MonthQuota_04":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the MonthQuota_05 field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_05 AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "MonthQuota_05":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the MonthQuota_06 field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_06 AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "MonthQuota_06":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the MonthQuota_07 field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_07 AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "MonthQuota_07":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the MonthQuota_08 field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_08 AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "MonthQuota_08":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the MonthQuota_09 field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_09 AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "MonthQuota_09":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the MonthQuota_10 field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_10 AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "MonthQuota_10":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the MonthQuota_11 field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_11 AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "MonthQuota_11":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the MonthQuota_12 field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY MonthQuota_12 AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "MonthQuota_12":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Email field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Email AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Email":U). 
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
        Purpose: Returns the Sort option for the PhoneMobile field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY PhoneMobile AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "PhoneMobile":U). 
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
