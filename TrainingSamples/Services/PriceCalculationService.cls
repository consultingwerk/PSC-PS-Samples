
BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.Exceptions.* FROM PROPATH.
USING TrainingSamples.Services.*  FROM PROPATH.

CLASS TrainingSamples.Services.PriceCalculationService 
    IMPLEMENTS IPriceCalculation: 

    CONSTRUCTOR PUBLIC PriceCalculationService ():
        SUPER ().

        MESSAGE "Constructor PriceCalculationService" VIEW-AS ALERT-BOX.
        
    END CONSTRUCTOR.

    METHOD PUBLIC DECIMAL GetSalesPrice (piItemNum AS INTEGER, 
                                         piCustNum AS INTEGER, 
                                         piQty AS INTEGER, 
                                         pdtSalesDate AS DATE, 
                                         pcCurrencySymbol AS CHARACTER):
        
        FIND Item WHERE Item.ItemNum = piItemNum NO-ERROR .
        
        IF NOT AVAILABLE Item THEN
            UNDO, THROW NEW Exception ("Invalid item", 0) . 
                     
        RETURN Item.Price . 
        
    END METHOD.

END CLASS.