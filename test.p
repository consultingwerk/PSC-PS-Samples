/*------------------------------------------------------------------------
    File        : test.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Fri Jul 07 13:23:14 CEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH.
USING TrainingSamples.BusinessLogik.Customer.* FROM PROPATH.
USING Consultingwerk.* FROM PROPATH.
USING Consultingwerk.OERA.Enum.* FROM PROPATH.
USING Consultingwerk.Util.* FROM PROPATH.

{TrainingSamples/BusinessLogik/Customer/dsCustomer.i}

DEFINE VARIABLE oRequest   AS IFetchDataRequest      NO-UNDO .
DEFINE VARIABLE oEntity    AS CustomerBusinessEntity NO-UNDO .  
DEFINE VARIABLE i          AS INTEGER                NO-UNDO .
DEFINE VARIABLE oStopWatch AS Stopwatch              NO-UNDO .

/* ***************************  Main Block  *************************** */


ServiceInterface:LoggingLevel = ServiceInterfaceLoggingLevelEnum:Runtime .
DataAccess:LogFetchDataDetails = TRUE .
LogManager:AddCustomLogEntries ("ServiceAdapter,ServiceInterface,DataAccess,KeepAliveService":U) .

LogManager:StartLogging("client.log", "4glmessages") .

oEntity = CAST (ServiceManager:GetBusinessService("TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity"),
                CustomerBusinessEntity) .
oRequest = NEW FetchDataRequest ("eCustomer") . 
oRequest:Queries = SUBSTITUTE ("for each eCustomer where eCustomer.CustNum = &1",
                               1) .
oRequest:Context = "" .

/*oEntity:FetchDataByReference(oRequest,                                */
/*                             OUTPUT DATASET dsCustomer BY-REFERENCE) .*/

ServiceInterface:FetchData("TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity",
                           oRequest, OUTPUT DATASET dsCustomer BY-REFERENCE) .

oRequest = NEW FetchDataRequest ("eCustomer") . 

oStopWatch = NEW Stopwatch ().

DO i = 1 TO 1000:
    
    ASSIGN oRequest:Queries = SUBSTITUTE ("for each eCustomer where eCustomer.CustNum = &1", i) 
           oRequest:Context = "" .
    
/*    oEntity:FetchDataByReference(oRequest,                                */
/*                                 OUTPUT DATASET dsCustomer BY-REFERENCE) .*/
    ServiceInterface:FetchData("TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity",
                               oRequest, OUTPUT DATASET dsCustomer BY-REFERENCE) .
END.    
     
MESSAGE oStopWatch
    VIEW-AS ALERT-BOX.
    