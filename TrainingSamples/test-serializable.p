/*------------------------------------------------------------------------
    File        : test-serializable.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Jul 04 15:37:21 CEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING TrainingSamples.BusinessLogik.Order.* FROM PROPATH.
USING Consultingwerk.* FROM PROPATH.

DEFINE VARIABLE oCancelOrderParameter AS CancelOrderParameter NO-UNDO . 
DEFINE VARIABLE lcSerialization AS LONGCHAR NO-UNDO . 

FIX-CODEPAGE (lcSerialization) = Codepages:UTF-8 . 

oCancelOrderParameter = NEW CancelOrderParameter 
        (4711, "Customer changed his mind") .
        
lcSerialization =  oCancelOrderParameter:Serialize    () . 

DELETE OBJECT oCancelOrderParameter . 

oCancelOrderParameter = CAST (Consultingwerk.Serializable:DeserializeInstance
                                (lcSerialization),
                              CancelOrderParameter) .         
        
MESSAGE oCancelOrderParameter:OrderNumber SKIP 
        oCancelOrderParameter:CancelationReason  SKIP (2) 
        STRING (lcSerialization)
    VIEW-AS ALERT-BOX . 
          