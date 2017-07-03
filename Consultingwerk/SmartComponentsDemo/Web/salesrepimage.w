/*------------------------------------------------------------------------

File: salesrepimage.w
Purpose:    Returns SalesRep Images from the small or large BLOB field
            in the SalesRep table to the browser

Description: 

http://server/cgi-bin/cgiip.exe/WService=SmartWeb/Consultingwerk/SmartComponentsDemo/Web/salesrepimage.w?salesrep=BBB
http://server/cgi-bin/cgiip.exe/WService=SmartWeb/Consultingwerk/SmartComponentsDemo/Web/salesrepimage.w?salesrep=BBB&size=large


Author: 

Created: Sat Oct 24 11:57:59 CEST 2015

------------------------------------------------------------------------*/

/* Create an unnamed pool to store all the widgets created 
by this procedure. This is a good default which assures
that this procedure's triggers and internal procedures
will execute in this procedure's storage, and that proper
cleanup will occur on deletion of the procedure. */

USING Consultingwerk.OERA.* FROM PROPATH.

CREATE WIDGET-POOL.

/* ***************************  Definitions  ************************** */

/* Parameters Definitions ---                                           */

/* Local Variable Definitions ---                                       */



/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Procedure
&Scoped-define DB-AWARE no

/* ************************* Included-Libraries *********************** */

{src/web2/wrap-cgi.i}
{Consultingwerk/SmartComponentsDemo/OERA/Sports2000/dsSalesRep.i}


/* ************************  Main Code Block  *********************** */

/* Process the latest Web event. */
RUN process-web-request.

/* **********************  Internal Procedures  *********************** */

&IF DEFINED(EXCLUDE-outputHeader) = 0 &THEN
PROCEDURE outputHeader :
/*------------------------------------------------------------------------------
  Purpose:     Output the MIME header, and any "cookie" information needed 
               by this procedure.  
  Parameters:  <none>
  Notes:       In the event that this Web object is state-aware, this is
               a good place to set the webState and webTimeout attributes.
------------------------------------------------------------------------------*/


  output-content-type ("text/html":U).

END PROCEDURE.
&ENDIF

&IF DEFINED(EXCLUDE-process-web-request) = 0 &THEN
PROCEDURE process-web-request :
/*------------------------------------------------------------------------------
  Purpose:     Process the web request.
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/

    DEFINE VARIABLE cSalesRep AS CHARACTER        NO-UNDO .
    DEFINE VARIABLE cSize     AS CHARACTER        NO-UNDO .
    DEFINE VARIABLE oRequest  AS FetchDataRequest NO-UNDO . 
    DEFINE VARIABLE mObject   AS MEMPTR           NO-UNDO . 

    ASSIGN cSalesRep = get-field ("salesrep":U) 
           cSize     = get-field ("size":U). 

    oRequest = NEW FetchDataRequest ("eSalesRep":U, 
                                     SUBSTITUTE ("for each eSalesRep where eSalesrep.SalesRep = &1":U, QUOTER (cSalesRep))) .
                                     
    IF cSize = "large":U THEN 
        oRequest:CustomContext = "IncludeLargeImages":U .
    ELSE 
        oRequest:CustomContext = "IncludeSmallImages":U .                                     

    ServiceInterface:FetchData ("Consultingwerk.SmartComponentsDemo.OERA.Sports2000.SalesRepBusinessEntity":U,
                                oRequest,
                                OUTPUT DATASET dsSalesRep) .
                                
    FIND FIRST eSalesRep NO-ERROR .
    
    IF AVAILABLE eSalesRep THEN DO:
        IF cSize = "large":U THEN
            COPY-LOB FROM eSalesRep.LargeImage TO mObject .
        ELSE  
            COPY-LOB FROM eSalesRep.SmallImage TO mObject . 
    END.        
    ELSE DO:
        IF cSize = "large":U THEN
            COPY-LOB FROM FILE "Consultingwerk/SmartComponentsDemo/Web/photo_portrait_256.png":U TO mObject .
        ELSE  
            COPY-LOB FROM FILE "Consultingwerk/SmartComponentsDemo/Web/photo_portrait_32.png":U TO mObject . 
    END.
        
    output-content-type ("image/png":U).

    {&OUT-LONG} mObject .             
                       
    SET-SIZE (mObject) = 0 .                                                         


END PROCEDURE.
&ENDIF
