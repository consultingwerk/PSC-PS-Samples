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

USING Consultingwerk.OERA.* FROM PROPATH .
USING Consultingwerk.Util.* FROM PROPATH .

{TrainingSamples/BusinessLogik/CustomerWithReposition/dsCustomer.i}

DEFINE VARIABLE oRequest AS IFetchDataRequest NO-UNDO .

/* ***************************  Main Block  *************************** */


ServiceInterface:FetchData("TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity",
                           NEW FetchDataRequest ("eCustomer,eSalesRep", 20),
                           OUTPUT DATASET dsCustomer) .


DATASET dsCustomer:TOP-NAV-QUERY:QUERY-OPEN () .
DATASET dsCustomer:RELATIONS-ACTIVE = TRUE . 
DATASET dsCustomer:TOP-NAV-QUERY:GET-FIRST () . 

//BUFFER eSalesrep:PARENT-RELATION:QUERY:QUERY-OPEN () . 

DEFAULT-WINDOW:WIDTH = 210 . 

DO WHILE NOT DATASET dsCustomer:TOP-NAV-QUERY:QUERY-OFF-END:
    DISPL eCustomer.CustNum eCustomer.Name eCustomer.Salesrep WITH DOWN WIDTH 200. 
    
    BUFFER eCustomer:SYNCHRONIZE () .

    DISPL eSalesrep.RepName . 
    
    DOWN 1 . 
    
    DATASET dsCustomer:TOP-NAV-QUERY:GET-NEXT .
END.    




CATCH err AS Progress.Lang.Error :
    ErrorHelper:ShowErrorMessage(err) .    
END CATCH.
