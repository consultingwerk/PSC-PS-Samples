/*------------------------------------------------------------------------
    File        : OpenOrdersOfCustomerQuery
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mikef
    Created     : Tue Jul 04 14:24:57 CEST 2017
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Consultingwerk.OERA.NamedQueryParameter.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS TrainingSamples.BusinessLogik.Order.OpenOrdersOfCustomerQuery 
    INHERITS NamedQueryParameter: 

    CONSTRUCTOR PUBLIC OpenOrdersOfCustomerQuery (piCustNum AS INTEGER):
        SUPER ("OpenOrdersOfCustomerQuery":U).
        
        THIS-OBJECT:Parameters:Add ("CustNum", piCustNum) .
        
    END CONSTRUCTOR.

    

END CLASS.
