BLOCK-LEVEL ON ERROR UNDO, THROW.

USING TrainingSamples.Services.* FROM PROPATH.
USING Consultingwerk.Framework.* FROM PROPATH.
USING Consultingwerk.Util.* FROM PROPATH.

DEFINE VARIABLE oPriceCalculation AS IPriceCalculation NO-UNDO . 
DEFINE VARIABLE dePrice           AS DECIMAL           NO-UNDO . 

MESSAGE 1 VIEW-AS ALERT-BOX.

/* Application Initialization */
ServiceLoader:LoadFromFile("TrainingSamples/Services/services.xml") .

MESSAGE 2 VIEW-AS ALERT-BOX.

/* good practice :-) */
oPriceCalculation = {Consultingwerk/get-service.i 
        TrainingSamples.Services.IPriceCalculation} . 

MESSAGE 3 VIEW-AS ALERT-BOX.

/* use service */
dePrice = oPriceCalculation:GetSalesPrice(1, 1, 1, TODAY, "EUR") .

MESSAGE dePrice
    VIEW-AS ALERT-BOX.
    