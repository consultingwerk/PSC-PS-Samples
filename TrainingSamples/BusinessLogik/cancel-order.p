/*------------------------------------------------------------------------
    File        : cancel-order.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Jul 04 16:06:19 CEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING TrainingSamples.BusinessLogik.Order.* FROM PROPATH.

DEFINE VARIABLE oOrder AS OrderDatasetModel NO-UNDO . 

/* ***************************  Main Block  *************************** */

oOrder = NEW OrderDatasetModel () . 

oOrder:CancelOrder(NEW CancelOrderParameter (1, "they changed their mind")) .

MESSAGE oOrder:Order:Instructions 
    VIEW-AS ALERT-BOX . 