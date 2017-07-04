/*------------------------------------------------------------------------
    File        : get-orders-by-named-query.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Jul 04 14:17:18 CEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH.
USING TrainingSamples.BusinessLogik.Order.* FROM PROPATH.

{TrainingSamples/BusinessLogik/Order/dsOrder.i}

DEFINE VARIABLE oRequest AS IFetchDataRequest NO-UNDO . 

/* ***************************  Main Block  *************************** */

oRequest = NEW FetchDataRequest () . 

/*
oRequest:NamedQuery = NEW NamedQueryParameter ("OpenOrdersOfCustomer") .
oRequest:NamedQuery:Parameters:Add ("CustNum", 42) .
*/

oRequest:NamedQuery = NEW OpenOrdersOfCustomerQuery (1) .

ServiceInterface:FetchData("TrainingSamples.BusinessLogik.Order.OrderBusinessEntity",
                           oRequest, OUTPUT DATASET dsOrder) .
                           
FOR EACH eOrder: DISPL Custnum OrderSTATUS . end .                            
                           