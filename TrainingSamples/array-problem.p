
/*------------------------------------------------------------------------
    File        : array-problem.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Jul 04 17:20:27 CEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

DEFINE VARIABLE cValues AS CHARACTER NO-UNDO EXTENT .

/* ***************************  Main Block  *************************** */

EXTENT (cValues) = 4 .

EXTENT (cValues) = ? . // Required due to missing capability to resize an 
                       // array without loosing values 

EXTENT (cValues) = 5 . 


