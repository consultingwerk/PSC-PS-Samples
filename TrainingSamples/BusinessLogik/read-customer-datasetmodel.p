/*------------------------------------------------------------------------
    File        : read-customer-datasetmodel.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Jul 04 12:06:09 CEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING TrainingSamples.BusinessLogik.Customer.* FROM PROPATH.

DEFINE VARIABLE oCustomer AS CustomerDatasetModel NO-UNDO .
DEFINE VARIABLE oCustomersOfBBB AS CustomerDatasetModel NO-UNDO .

/* ***************************  Main Block  *************************** */

oCustomer = NEW CustomerDatasetModel (5) .
MESSAGE oCustomer:Customer:Name
    VIEW-AS ALERT-BOX.
    
 oCustomersOfBBB = NEW CustomerDatasetModel ("BBB") .
 
 MESSAGE oCustomersOfBBB:Customer:Name SKIP 
         oCustomersOfBBB:Customer:SalesRep
     VIEW-AS ALERT-BOX.



oCustomer = NEW CustomerDatasetModel (-1) .

MESSAGE oCustomer:Customer:NameWhenAvailable("<unknown>")
    VIEW-AS ALERT-BOX.

