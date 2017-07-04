
/*------------------------------------------------------------------------
    File        : terms.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Jul 04 13:48:23 CEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

FOR EACH Order BREAK BY Order.Terms:
    IF FIRST-OF (Order.Terms) THEN 
        DISPL Order.Terms WITH DOWN .
END.    
    
