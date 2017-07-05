/*------------------------------------------------------------------------
    File        : OrderBusinessEntity
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mikef
    Created     : Wed Jul 05 09:36:44 CEST 2017
    Notes       : 
  ----------------------------------------------------------------------*/

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Progress.Lang.*.
USING Consultingwerk.OERA.* FROM PROPATH.
USING Consultingwerk.Assertion.* FROM PROPATH.

@Test.
CLASS TrainingSamples.BusinessLogik.Order.UnitTests.OrderBusinessEntity: 

    {TrainingSamples/BusinessLogik/Order/dsOrder.i}

    @Test.
    METHOD PUBLIC VOID TestItemNameQuery1 ():
                
        DEFINE VARIABLE oRequest AS IFetchDataRequest NO-UNDO . 
        
        /* ***************************  Main Block  *************************** */
        
        oRequest = NEW FetchDataRequest ("eOrder") . 
        oRequest:Queries = "for each eOrder where eOrder.KlantenNo = 81 and eOrder.ItemName = 'Hockey Stick'" .
        
        
        ServiceInterface:FetchData("TrainingSamples.BusinessLogik.Order.OrderBusinessEntity",
                                   oRequest, OUTPUT DATASET dsOrder) .
                  
        FIND ITEM WHERE ITEM.ItemName = "Hockey Stick" .          
                                   
        FOR EACH eOrder ON ERROR UNDO, THROW: 
            DISPL eOrder.KlantenNo eOrder.OrderNum eOrder.OrderStatus eOrder.Salesrep
                    
                   CAN-FIND (OrderLine WHERE OrderLine.OrderNum = eOrder.OrderNum  
                                         AND OrderLine.ItemNum  = ITEM.ItemNum)
                   . 
                   
            IF NOT CAN-FIND (OrderLine WHERE OrderLine.OrderNum = eOrder.OrderNum  
                                         AND OrderLine.ItemNum  = ITEM.ItemNum) THEN 
                UNDO, THROW NEW AppError (SUBSTITUTE ("Order &1 does not contain the Hockey Stick", 
                                                      eOrder.OrderNum), 0) .
                   
        end .                            

        FIND eOrder WHERE eOrder.OrderNum = 2 NO-ERROR  .
        
        IF NOT AVAILABLE eOrder THEN 
            UNDO, THROW NEW AssertException ("Order 2 not returned but was expected", 0) . 
        
        FIND eOrder WHERE eOrder.OrderNum = 123 NO-ERROR .  

        IF NOT AVAILABLE eOrder THEN 
            UNDO, THROW NEW AssertException ("Order 123 not returned but was expected", 0) . 

    END METHOD.

END CLASS.
