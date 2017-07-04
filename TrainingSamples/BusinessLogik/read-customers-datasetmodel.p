
/*------------------------------------------------------------------------
    File        : read-customers-datasetmodel.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Jul 04 12:21:52 CEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING TrainingSamples.BusinessLogik.Customer.* FROM PROPATH.

DEFINE VARIABLE oCustomer AS CustomerDatasetModel NO-UNDO .

/* ***************************  Main Block  *************************** */

oCustomer = NEW CustomerDatasetModel () . 

oCustomer:Customer:Filter:City:EQ("Boston") .
oCustomer:Customer:Filter:Salesrep:EQ ("HXM"):Run() . 

DO WHILE oCustomer:Customer:Available:

    MESSAGE oCustomer:Customer:CustNum SKIP 
            oCustomer:Customer:Name SKIP 
            oCustomer:Customer:City SKIP 
            oCustomer:Customer:SalesRep
        VIEW-AS ALERT-BOX.

    oCustomer:Customer:GetNext() .
END .


