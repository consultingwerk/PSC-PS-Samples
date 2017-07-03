/*------------------------------------------------------------------------
    File        : CustomerTableModelSort
    Purpose     : Sort class for the CustomerTableModel 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner
    Created     : 03/07/2017 17:42:22,087+02:00
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.*                                                  FROM PROPATH . 
USING Consultingwerk.Assertion.*                                        FROM PROPATH . 
USING Consultingwerk.OERA.*                                             FROM PROPATH . 
USING Consultingwerk.OERA.ModelFilter.*                                 FROM PROPATH .
USING TrainingSamples.BusinessLogik.CustomerWithReposition.* FROM PROPATH .  
USING Progress.Lang.*                                                   FROM PROPATH .

@BusinessEntityGenerator (entityname="TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerBusinessEntity", type="TableModelSort") .

CLASS TrainingSamples.BusinessLogik.CustomerWithReposition.CustomerTableModelSort
    INHERITS TableModelSort: 

    DEFINE PRIVATE VARIABLE oTableModel AS CustomerTableModel_Generated NO-UNDO . 

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the CustNum field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY CustNum AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "CustNum":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Country field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Country AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Country":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Name field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Name AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Name":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Address field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Address AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Address":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Address2 field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Address2 AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Address2":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the City field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY City AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "City":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the State field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY State AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "State":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the PostalCode field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY PostalCode AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "PostalCode":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Contact field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Contact AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Contact":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Phone field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Phone AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Phone":U). 
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
        Purpose: Returns the Sort option for the CreditLimit field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY CreditLimit AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "CreditLimit":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Balance field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Balance AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Balance":U). 
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
        Purpose: Returns the Sort option for the Discount field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Discount AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Discount":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Comments field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Comments AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Comments":U). 
    END GET.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Fax field
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Fax AS TableModelSortField NO-UNDO 
    GET:
        RETURN NEW TableModelSortField (THIS-OBJECT, "Fax":U). 
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
        Purpose: Constructor for the CustomerTableModelSort class
        Notes:   
        @param poTableModel The reference to the TableModel for this Sort class
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerTableModelSort (poTableModel AS CustomerTableModel_Generated):
        SUPER (poTableModel).
        
        ObjectAssert:IsValid (poTableModel, "TableModel":U) .
        
        ASSIGN oTableModel = poTableModel.
        
    END CONSTRUCTOR.

END CLASS.
