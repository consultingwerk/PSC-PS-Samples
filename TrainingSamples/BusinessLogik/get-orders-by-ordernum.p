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
USING Consultingwerk.Util.* FROM PROPATH.

{TrainingSamples/BusinessLogik/Order/dsOrder.i}

DEFINE VARIABLE oRequest AS IFetchDataRequest NO-UNDO . 

/* ***************************  Main Block  *************************** */

oRequest = NEW FetchDataRequest ("eOrder") . 
oRequest:Queries = "for each eOrder where eOrder.OrderNum = 2" .

ServiceInterface:FetchData("TrainingSamples.BusinessLogik.Order.OrderBusinessEntity",
                           oRequest, OUTPUT DATASET dsOrder) .
          
FOR EACH eOrder: 
    DISPL eOrder.KlantenNo eOrder.OrderNum eOrder.OrderStatus eOrder.Salesrep
           . 
end .                            
                           
CATCH err AS Progress.Lang.Error :
    ErrorHelper:ShowErrorMessage(err) .        
END CATCH.                           

                           
                           
                           
                           