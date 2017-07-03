
/*------------------------------------------------------------------------
    File        : fetch-customer.p
    Purpose     :

    Syntax      :

    Description :

    Author(s)   :
    Created     : Mon Jul 03 16:13:58 CEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.FetchDataRequest.
USING Consultingwerk.OERA.IFetchDataRequest.
USING Consultingwerk.OERA.ServiceInterface.
USING Consultingwerk.Util.ErrorHelper FROM PROPATH.

{TrainingSamples/BusinessLogik/Customer/dsCustomer.i}

DEFINE VARIABLE oRequest AS IFetchDataRequest NO-UNDO .

/* ***************************  Main Block  *************************** */

DEFAULT-WINDOW:WIDTH = 210 . 

DEFAULT-WINDOW:VISIBLE = TRUE .
DEFAULT-WINDOW:TITLE = "Please be patient". 
PROCESS EVENTS . 

oRequest = NEW FetchDataRequest ("eCustomer",
/*                                 SUBSTITUTE ("for each eCustomer where eCustomer.City EQ &1",*/
/*                                             QUOTER ("Boston")),                             */
                                 200000) .

ServiceInterface:FetchData("TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity",
                           oRequest,
                           OUTPUT DATASET dsCustomer) .
                           
FOR EACH eCustomer:
    DISPL eCustomer.CustNum FORMAT ">>>,>>>,>>9" eCustomer.Name eCustomer.City WITH WIDTH 200 .                            
END.

oRequest = NEW FetchDataRequest ("eSalesrep") .

ServiceInterface:FetchData("TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity",
                           oRequest,
                           OUTPUT DATASET dsCustomer) .

FOR EACH eSalesrep:
    DISPL eSalesrep.Salesrep eSalesrep.RepName WITH WIDTH 200 .                            
END.



ServiceInterface:FetchData("TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity",
                           NEW FetchDataRequest ("eCustomer,eSalesRep", 20),
                           OUTPUT DATASET dsCustomer) .

FOR EACH eCustomer, FIRST eSalesrep OF eCustomer:
    DISPL eCustomer.CustNum eCustomer.Name eCustomer.Salesrep eSalesrep.RepName WITH WIDTH 200 .                            
END.


CATCH err AS Progress.Lang.Error :
    ErrorHelper:ShowErrorMessage(err) .    
END CATCH.
