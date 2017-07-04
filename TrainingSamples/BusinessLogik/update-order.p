
/*------------------------------------------------------------------------
    File        : update-order.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Jul 04 14:03:43 CEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING TrainingSamples.BusinessLogik.Order.* FROM PROPATH.
USING TrainingSamples.BusinessLogik.* FROM PROPATH.
USING Consultingwerk.Util.* FROM PROPATH.

DEFINE VARIABLE oOrder AS OrderDatasetModel NO-UNDO . 

/* ***************************  Main Block  *************************** */

oOrder = NEW OrderDatasetModel () .
oOrder:BatchSize = 5.
oOrder:Order:Fill().

oOrder:TrackingChanges = TRUE .
oOrder:Order:Terms = TermsEnum:Net60 .
oOrder:SaveChanges () . /* Will throw validation errors */

CATCH err AS Progress.Lang.Error :
    ErrorHelper:ShowErrorMessage(err) . 
END CATCH.
