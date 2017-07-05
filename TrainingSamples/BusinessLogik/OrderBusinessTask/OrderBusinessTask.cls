/*------------------------------------------------------------------------
    File        : OrderBusinessTask
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mikef
    Created     : Wed Jul 05 17:08:25 CEST 2017
    Notes       : 
  ----------------------------------------------------------------------*/

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH .
USING Progress.Lang.*       FROM PROPATH .
USING TrainingSamples.BusinessLogik.OrderBusinessTask.* FROM PROPATH.
USING Consultingwerk.Util.* FROM PROPATH.

CLASS TrainingSamples.BusinessLogik.OrderBusinessTask.OrderBusinessTask 
    IMPLEMENTS IBusinessService: 

    {TrainingSamples/BusinessLogik/Order/dsOrder.i}
    {TrainingSamples/BusinessLogik/Customer/dsCustomer.i}

    /*------------------------------------------------------------------------------
       Purpose:
       Notes:
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID CancelOrder (INPUT-OUTPUT DATASET dsOrder,
                                    INPUT-OUTPUT DATASET dsCustomer,
                                    poParameter AS CancelOrderParameter):
        
        DEFINE VARIABLE deTotalOrderValue AS DECIMAL NO-UNDO.
        
        DEFINE VARIABLE oRequest AS IFetchDataRequest NO-UNDO . 
        
        DO TRANSACTION:
            oRequest = NEW FetchDataRequest ("eOrder,eOrderLine", 
                                             SUBSTITUTE ("for each eOrder where eOrder.OrderNum = &1",
                                                         QUOTER (poParameter:OrderNumber))) .
            
            ServiceInterface:FetchData ("TrainingSamples.BusinessLogik.Order.OrderBusinessEntity", 
                                        oRequest, OUTPUT DATASET dsOrder) .                           
                                                         
            FIND FIRST eOrder . /* why not just fail, when not available? */                                                     
            
            oRequest = NEW FetchDataRequest ("eCustomer", 
                                             SUBSTITUTE ("for each eCustomer where eCustomer.CustNum = &1",
                                                         QUOTER (eOrder.KlantenNo))) .
        
    /* Disabled validation, to allow repeated usage ....  
          IF eOrder.OrderStatus <> "Ordered" THEN 
                UNDO, THROW NEW AppError ("Cannot cancel this order because of it's order status.", 0) .  */
                
            DatasetHelper:SetTrackingChanges(DATASET dsOrder:HANDLE, TRUE) .  
        
            ASSIGN eOrder.OrderStatus = "Cancelled" 
                   eOrder.Instructions = "Cancelled because of: " + poParameter:CancelationReason . 
    
            FIND order WHERE order.ordernum = poParameter:OrderNumber NO-LOCK . 
            MESSAGE "before" order.orderstatus 
                VIEW-AS ALERT-BOX.   
         
            ServiceInterface:SaveChanges("TrainingSamples.BusinessLogik.Order.OrderBusinessEntity",
                                         INPUT-OUTPUT DATASET dsOrder) .  
        
            FIND order WHERE order.ordernum = poParameter:OrderNumber NO-LOCK . 
            MESSAGE "after" order.orderstatus 
                VIEW-AS ALERT-BOX.
                    
            DatasetHelper:ThrowDatasetErrors(DATASET dsOrder:HANDLE) .
                    
            FOR EACH eOrderLine:
                ASSIGN deTotalOrderValue = deTotalOrderValue + eOrderLine.ExtendedPrice .
            END.
            
            MESSAGE deTotalOrderValue
                VIEW-AS ALERT-BOX.
    
            FIND FIRST eOrder .
    
            ServiceInterface:FetchData ("TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity", 
                                        oRequest, OUTPUT DATASET dsCustomer) .                           
            
            FIND FIRST eCustomer . 
            
            DatasetHelper:SetTrackingChanges(DATASET dsCustomer:HANDLE, TRUE) .  
    
            ASSIGN eCustomer.Balance = eCustomer.Balance - deTotalOrderValue .
    
            ServiceInterface:SaveChanges("TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity",
                                         INPUT-OUTPUT DATASET dsCustomer) .  
    
            DatasetHelper:ThrowDatasetErrors(DATASET dsCustomer:HANDLE) .
        END.

    END METHOD.

END CLASS.
