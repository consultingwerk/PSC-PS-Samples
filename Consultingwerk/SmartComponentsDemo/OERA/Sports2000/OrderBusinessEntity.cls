/**********************************************************************
 * Copyright (C) 2006-2013 by Consultingwerk Ltd. ("CW") -            *
 * www.consultingwerk.de and other contributors as listed             *
 * below.  All Rights Reserved.                                       *
 *                                                                    *
 *  Software is distributed on an "AS IS", WITHOUT WARRANTY OF ANY    *
 *   KIND, either express or implied.                                 *
 *                                                                    *
 *  Contributors:                                                     *
 *                                                                    *
 **********************************************************************/ 
/*------------------------------------------------------------------------
    File        : OrderBusinessEntity
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner / Consultingwerk Ltd.
    Created     : Wed Feb 24 22:26:16 CET 2010
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

{Consultingwerk/products.i}

USING Consultingwerk.*                                     FROM PROPATH .
USING Consultingwerk.BPM.*                                 FROM PROPATH .
USING Consultingwerk.OERA.*                                FROM PROPATH .
USING Consultingwerk.OERA.BusinessEntity                   FROM PROPATH .
USING Consultingwerk.OERA.Enum.*                           FROM PROPATH . 
USING Consultingwerk.SmartComponentsDemo.OERA.Sports2000.* FROM PROPATH .
USING Consultingwerk.SmartFramework.*                      FROM PROPATH . 
USING Consultingwerk.Util.*                                FROM PROPATH .
USING Progress.Lang.*                                      FROM PROPATH .

@BusinessEntityTable (name="eOrder", MandatoryColumns="OrderDate,CustNum", ReadOnlyColumns="Ordernum") . 

@BusinessEntityView (name="order", isdefault="true", entitytable="eOrder", entityview="eCustomer",
                     listcolumns="Ordernum,OrderDate,CustNum,eCustomer.Name,OrderStatus",
                     viewercolumns="Ordernum,OrderDate,CustNum,eCustomer.Name,OrderStatus,Carrier,Instructions,PO,Terms") .

CLASS Consultingwerk.SmartComponentsDemo.OERA.Sports2000.OrderBusinessEntity 
    INHERITS SmartBusinessEntity: 

    {Consultingwerk/SmartComponentsDemo/OERA/Sports2000/dsOrder.i}

    /*------------------------------------------------------------------------------
            Purpose:                                                                        
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderBusinessEntity ():
        SUPER (DATASET dsOrder:HANDLE).

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Sends an Order to OpenEdge BPM / Savvion for Approval                                                                        
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    @InvokeMethod (template="invoke-receive-dataset") . 
    METHOD PUBLIC VOID ApproveOrder (INPUT-OUTPUT DATASET dsOrder,
                                     poApproveOrderParameter AS ApproveOrderParameter):
        
&IF DEFINED (OpenEdgeBPM) NE 0 &THEN
        DEFINE VARIABLE oRequest   AS Consultingwerk.OERA.FetchDataRequest NO-UNDO .
        DEFINE VARIABLE oBpmServer AS OpenEdge.Lang.BPM.IBizLogicAPI       NO-UNDO .  
        DEFINE VARIABLE oValues    AS ListNameValuePair                    NO-UNDO .      
        DEFINE VARIABLE cMessages  AS CHARACTER                            NO-UNDO .
        DEFINE VARIABLE deTotal    AS DECIMAL                              NO-UNDO .               
          
        DEFINE VARIABLE oNumericFormat       AS NumericFormat                     NO-UNDO . 
        
        ASSIGN oNumericFormat = SessionHelper:GetNumericFormat()
               SESSION:NUMERIC-FORMAT = "AMERICAN":U .
               
        ASSIGN oRequest = NEW Consultingwerk.OERA.FetchDataRequest ("eOrder,eOrderLine":U,
                                                                    SUBSTITUTE ("FOR EACH eOrder WHERE eOrder.OrderNum = &1":U, 
                                                                                poApproveOrderParameter:OrderNum),
                                                                    1) .

        THIS-OBJECT:FetchData (oRequest) .

        FIND FIRST eOrder .

        IF eOrder.OrderStatus <> "Ordered":U THEN 
            UNDO, THROW NEW AppError ("Order status must be ~"Ordered~" if you want to submit the order for approval.", 0) . 

        IF NOT CAN-FIND (FIRST eOrderLine OF eOrder) THEN  
            UNDO, THROW NEW AppError ("Order must have at least one OrderLine before submission for approval.", 0) . 
        
        /* Compute Total Order */
        FOR EACH eOrderLine OF eOrder:
            ASSIGN deTotal = deTotal + eOrderLine.Qty * eOrderLine.Price . 
        END.
        
        /* Prepare DataSlot Values for new Process Instance */
        oValues = NEW ListNameValuePair () .
        
        oValues:Add ("eOrder_OrderNum", STRING (eOrder.OrderNum)) . 
        oValues:Add ("eOrder_CustNum", STRING (eOrder.CustNum)) .        
        oValues:Add ("eOrder_OrderDate", OpenEdge.Lang.TimeStamp:ToISODateFromABL(eOrder.OrderDate)) .
        oValues:Add ("eOrder_PromiseDate", BPMHelper:DateTimeToSavvion(eOrder.PromiseDate)) .
        oValues:Add ("eOrder_Amount", BPMHelper:DecimalToSavvion(deTotal)) .                         
        
        poApproveOrderParameter:ProcessInstanceName = BPMHelper:CreateProcessInstance ("Sports2000OrderApproval",
                                                                                       "Medium",
                                                                                       oValues:ToArray()) .

        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsOrder:HANDLE, TRUE) . 
        
        ASSIGN eOrder.OrderStatus  = "Approval Pending" .
        
        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsOrder:HANDLE, FALSE) .
        
        THIS-OBJECT:SaveChanges() .
        
        cMessages = Consultingwerk.Util.DatasetHelper:DatasetErrorStrings (DATASET dsOrder:HANDLE) .
        
        IF cMessages > "":U THEN 
            UNDO, THROW NEW AppError (cMessages, 0) .
        
        FINALLY:
            SessionHelper:SetNumericFormat (oNumericFormat) .
            
            Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsOrder:HANDLE, FALSE) .                  
        END FINALLY. 
&ENDIF
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:                                                                        
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID FetchData( INPUT poFetchDataRequest AS Consultingwerk.OERA.IFetchDataRequest ):

/*                                                                                   */
/*        /* Mike Fechner, Consultingwerk Ltd. 17.05.2010                                  */
/*           Anpassen QueryString, discount <= 20 */                                 */
/*                                                                                   */
/*        DEFINE VARIABLE iIndex AS INTEGER NO-UNDO.                                       */
/*        ASSIGN iIndex = LOOKUP ("eOrder", poFetchDataRequest:Tables) .                   */
/*                                                                                           */
/*        IF poFetchDataRequest:Queries MATCHES "*66*" THEN                                */
/*          UNDO, THROW NEW AppError ("Kunde 66 ist gesperrt!", 0) .                       */
/*                                                                                           */
/*        MESSAGE poFetchDataRequest:Tables SKIP iIndex                                    */
/*                skip "eOrder" ENTRY (iIndex, poFetchDataRequest:Queries) SKIP            */
/*                "alle" poFetchDataRequest:Queries                                        */
/*            VIEW-AS ALERT-BOX.                                                     */
/*                                                                                   */
/*        DEFINE VARIABLE oRequest AS Consultingwerk.OERA.FetchDataRequests NO-UNDO .*/
/*        oRequest = NEW Consultingwerk.OERA.FetchDataRequests                       */
/*                (poFetchDataRequest:Tables,                                        */
/*                 ENTRY (1, poFetchDataRequest:Queries) + " AnD ShipDate <> ? " ,   */
/*                 poFetchDataRequest:Requests,                                      */
/*                 poFetchDataRequest:NumRecords,                                    */
/*                 poFetchDataRequest:Context) .                                     */
/*                                                                                   */
/*                                                                                           */
        SUPER:FetchData(INPUT poFetchDataRequest).

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:                                                                        
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID FindRecid (INPUT-OUTPUT DATASET-HANDLE hDataset,
                                  poParameter AS GetRecidParameter):
        
        CAST (THIS-OBJECT:DataAccessObject, 
              OrderDataAccess):FindRecid (poParameter) .
        
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:                                                                        
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID ReceiveData ():
                
        IF THIS-OBJECT:RequestType = RequestTypeEnum:SaveChanges THEN DO ON ERROR UNDO, THROW:
        
            FOR EACH eOrderLine ON ERROR UNDO, THROW:
            
                THIS-OBJECT:FetchChildTableRecords (BUFFER eItem:HANDLE) .
                
            END.
        END.
        
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Ships an order by setting the Order.OrderStatus field, a ship date   
                 and instructions as passed in                                                                       
        Notes:                                  
        @param dsOrder INPUT-OUTPUT DATASET To return modified Order record to consumer
        @param poShipOrderParameter Parameter object with OrderNumer, ShipDate and Instructions                                      
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID ShipOrder (INPUT-OUTPUT DATASET dsOrder,
                                  poShipOrderParameter AS ShipOrderParameter):
        
        DEFINE VARIABLE oRequest  AS Consultingwerk.OERA.FetchDataRequest NO-UNDO .
        DEFINE VARIABLE cMessages AS CHARACTER                            NO-UNDO.

        /* Define Query */               
        ASSIGN oRequest = NEW Consultingwerk.OERA.FetchDataRequest ("eOrder",
                                                                    SUBSTITUTE ("FOR EACH eOrder WHERE eOrder.OrderNum = &1", poShipOrderParameter:OrderNum),
                                                                    ?,
                                                                    1,
                                                                    "":U) .

        /* Get data from data access object*/
        THIS-OBJECT:FetchData (oRequest) .

        /* access and modify data */
        FIND FIRST eOrder .
    
        THIS-OBJECT:TrackingChanges = TRUE .     

        ASSIGN eOrder.Instructions = poShipOrderParameter:Instructions 
               eOrder.ShipDate     = poShipOrderParameter:ShipDate 
               eOrder.OrderStatus  = "Shipped" .
        
        IF poShipOrderParameter:SalesRep > "":U THEN 
            eOrder.SalesRep = poShipOrderParameter:SalesRep .
        
        THIS-OBJECT:TrackingChanges = FALSE .     
        
        /* Save data using data access object */
        THIS-OBJECT:SaveChanges() .
        
        cMessages = Consultingwerk.Util.DatasetHelper:DatasetErrorStrings(DATASET dsOrder:HANDLE) .
        
        IF cMessages > "":U THEN 
            UNDO, THROW NEW AppError (cMessages, 0) .
        
        FINALLY:
            Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsOrder:HANDLE, FALSE) .                    
        END FINALLY. 

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose:                                                                        
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC VOID ValidateData ():

        FOR EACH eOrder:
            Consultingwerk.OERA.Validate:IsNotUnknown (BUFFER eOrder:HANDLE, "OrderDate", "Order date may not be empty") .
        END.
          
        FOR EACH eOrderLine:
            FIND eOrderLineBefore 
                 WHERE ROWID(eOrderLineBefore) = BUFFER eOrderLine:BEFORE-ROWID NO-ERROR.
            IF AVAILABLE eOrderLineBefore THEN
            DO:  
              /* If the customer doubled the quantity ordered, then
                   increase the discount by 20%. */
              IF  eOrderLine.Qty >= (eOrderLineBefore.Qty * 2) 
              AND eOrderLine.Discount = eOrderLineBefore.Discount THEN 
                eOrderLine.Discount = eOrderLineBefore.Discount * 1.2.
            
              ELSE IF eOrderLine.Qty <= (eOrderLineBefore.Qty * .5) THEN 
              DO:
                  Consultingwerk.Util.DatasetHelper:SetErrorString 
                        (BUFFER eOrderLine:HANDLE,
                         "Qty" + CHR (1) + "Line " + string(eOrderLine.LineNum) + 
                         ": You can't drop the Qty that much!") .
              END.
            END.  
        END.


    END METHOD.

END CLASS.
