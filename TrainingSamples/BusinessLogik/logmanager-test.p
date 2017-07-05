/*------------------------------------------------------------------------
    File        : logmanager-test.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Jul 05 10:09:16 CEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.Util.* FROM PROPATH.

LogManager:StartLogging("TrainingSamples\client.log", "4GLMessages") .

LogManager:AddCustomLogEntries("debug") .

FIND FIRST Customer . 

LogManager:WriteBuffer(BUFFER Customer:HANDLE, FALSE) .
LogManager:WriteBuffer(BUFFER SalesRep:HANDLE, FALSE) .

DEFINE VARIABLE hQuery AS HANDLE NO-UNDO.

hQuery:QUERY-PREPARE ("") .

CATCH err AS Progress.Lang.Error :
    LogManager:WriteMessage(42) .
    LogManager:WriteError(err, "debug") .        
END CATCH.


/* ***************************  Main Block  *************************** */
