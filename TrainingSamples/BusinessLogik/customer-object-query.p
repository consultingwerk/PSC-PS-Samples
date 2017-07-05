
/*------------------------------------------------------------------------
    File        : customer-object-query.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Jul 04 17:23:29 CEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.Util.* FROM PROPATH .
USING TrainingSamples.BusinessLogik.Customer.* FROM PROPATH.

DEFINE VARIABLE oCustomerQuery AS CustomerQuery NO-UNDO . 

/* ***************************  Main Block  *************************** */

oCustomerQuery = NEW CustomerQuery (4) .
oCustomerQuery
        :And (NEW CustomerQuery():City:Eq("Boston"):OR:City:Eq("Köln"))
        :And
        :Balance:Gt(1000.0)
        :And
        :Country:Eq("USA") .

MESSAGE oCustomerQuery:ToQueryString(TRUE)
    VIEW-AS ALERT-BOX.
