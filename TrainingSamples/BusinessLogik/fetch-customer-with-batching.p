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

/* Read data in batches of 10 records */
oRequest = NEW FetchDataRequest ("eCustomer",
                                 SUBSTITUTE ("for each eCustomer where eCustomer.City EQ &1",
                                             QUOTER ("Boston")),
                                 10) .
REPEAT:
    ServiceInterface:FetchData("TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity",
                               oRequest,
                               OUTPUT DATASET dsCustomer BY-REFERENCE) .
                               
    FOR EACH eCustomer:
        DISPL eCustomer.CustNum FORMAT ">>>,>>>,>>9" eCustomer.Name eCustomer.City WITH WIDTH 200 .                            
    END.

    /* When the previous request tells me there's no more data, 
       get out of the loop. */
    IF oRequest:NextContext = "" THEN
        LEAVE .

    PAUSE . 
END.




CATCH err AS Progress.Lang.Error :
    ErrorHelper:ShowErrorMessage(err) .    
END CATCH.
