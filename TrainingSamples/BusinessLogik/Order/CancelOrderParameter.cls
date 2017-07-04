/*------------------------------------------------------------------------
    File        : CancelOrderParameter
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mikef
    Created     : Tue Jul 04 15:31:07 CEST 2017
    Notes       : 
  ----------------------------------------------------------------------*/

BLOCK-LEVEL ON ERROR UNDO, THROW.
USING Consultingwerk.JsonSerializable.
USING Progress.Lang.*.
USING TrainingSamples.BusinessLogik.Order.* FROM PROPATH . 

CLASS TrainingSamples.BusinessLogik.Order.CancelOrderParameter 
    INHERITS JsonSerializable: 

    DEFINE PROPERTY OrderNumber AS INTEGER NO-UNDO 
    GET . SET . 
    
    DEFINE PROPERTY CancelationReason AS CHARACTER NO-UNDO 
    GET . SET .

    CONSTRUCTOR PUBLIC CancelOrderParameter ():
        SUPER ().
        
        THIS-OBJECT:AddSerializableProperties(GET-CLASS (CancelOrderParameter)) .
    END CONSTRUCTOR.

    CONSTRUCTOR PUBLIC CancelOrderParameter (piOrderNum AS INTEGER, 
                                             pcCancelReason AS CHARACTER):
        THIS-OBJECT () .
        
        ASSIGN THIS-OBJECT:OrderNumber = piOrderNum 
               THIS-OBJECT:CancelationReason = pcCancelReason .
    END CONSTRUCTOR . 

END CLASS.
