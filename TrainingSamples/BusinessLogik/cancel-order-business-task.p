/*------------------------------------------------------------------------
    File        : cancel-order-business-task.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Jul 05 17:28:47 CEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING TrainingSamples.BusinessLogik.OrderBusinessTask.* FROM PROPATH.
USING Consultingwerk.OERA.* FROM PROPATH.
USING Consultingwerk.Util.* FROM PROPATH.

{TrainingSamples/BusinessLogik/Order/dsOrder.i}
{TrainingSamples/BusinessLogik/Customer/dsCustomer.i}

DEFINE VARIABLE oParameter AS CancelOrderParameter NO-UNDO .

DO TRANSACTION:          
    FIND FIRST Order WHERE Order.OrderNum = 18 EXCLUSIVE-LOCK . 
    ASSIGN Order.OrderStatus = "Open" .          
    RELEASE Order.          
END.
              
DO ON ERROR UNDO, THROW:    
    oParameter = NEW CancelOrderParameter (18, "Changed their minds") .
    
    ServiceInterface:InvokeTask ("TrainingSamples.BusinessLogik.OrderBusinessTask.OrderBusinessTask",
                                 "CancelOrder",
                                 INPUT-OUTPUT DATASET dsOrder BY-REFERENCE,
                                 INPUT-OUTPUT DATASET dsCustomer BY-REFERENCE,
                                 oParameter) .
    
    FIND FIRST eOrder . 
    FIND FIRST eCustomer . 
    
    DISPL eOrder.OrderNum eOrder.OrderStatus eOrder.Instructions eCustomer.Balance .
    
    CATCH err AS Progress.Lang.Error :
        ErrorHelper:ShowErrorMessage(err) .        
    END CATCH.
END. /* try */

FIND FIRST Order WHERE Order.OrderNum = 18 NO-LOCK . 
MESSAGE Order.OrderStatus VIEW-AS ALERT-BOX .          

