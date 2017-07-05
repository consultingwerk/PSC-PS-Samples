/*------------------------------------------------------------------------
    File        : IPriceCalculation
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mikef
    Created     : Wed Jul 05 11:00:27 CEST 2017
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

INTERFACE TrainingSamples.Services.IPriceCalculation:  

    METHOD PUBLIC DECIMAL GetSalesPrice (piItemNum AS INTEGER, 
                                         piCustNum AS INTEGER, 
                                         piQty AS INTEGER, 
                                         pdtSalesDate AS DATE,
                                         pcCurrencySymbol AS CHARACTER).

END INTERFACE.
