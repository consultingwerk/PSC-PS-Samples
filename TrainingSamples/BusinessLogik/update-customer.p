
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

USING Consultingwerk.OERA.* FROM PROPATH.
USING Consultingwerk.Util.* FROM PROPATH.

{TrainingSamples/BusinessLogik/Customer/dsCustomer.i}

DEFINE VARIABLE oRequest AS IFetchDataRequest NO-UNDO .

/* ***************************  Main Block  *************************** */

DEFAULT-WINDOW:WIDTH = 210 . 

DEFAULT-WINDOW:VISIBLE = TRUE .
DEFAULT-WINDOW:TITLE = "Please be patient". 
PROCESS EVENTS . 

oRequest = NEW FetchDataRequest ("eCustomer",
                                 SUBSTITUTE ("for each eCustomer where eCustomer.City EQ &1",
                                             QUOTER ("Boston")),
                                 10) .

ServiceInterface:FetchData("TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity",
                           oRequest,
                           OUTPUT DATASET dsCustomer BY-REFERENCE) .

DatasetHelper:SetTrackingChanges(DATASET dsCustomer:HANDLE, TRUE) .
                           
FOR EACH eCustomer:
    DISPL eCustomer.CustNum FORMAT ">>>,>>>,>>9" eCustomer.Name eCustomer.City WITH WIDTH 200 .                            

    UPDATE eCustomer.Name eCustomer.City . 

END.

DEFINE VARIABLE hChanges AS HANDLE NO-UNDO.

hChanges = DatasetHelper:GetChangesDataset(DATASET dsCustomer:HANDLE) .

ServiceInterface:SaveChanges ("TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity",
                              INPUT-OUTPUT DATASET-HANDLE hChanges BY-REFERENCE) .   

DatasetHelper:ThrowDatasetErrors(hChanges) .

CATCH err AS Progress.Lang.Error :
    ErrorHelper:ShowErrorMessage(err) .    
END CATCH.
