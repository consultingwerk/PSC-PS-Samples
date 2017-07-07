/*------------------------------------------------------------------------
    File        : MigratedViewerCCS
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner
    Created     : 07.07.2017 16:16:08
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.SmartComponents.Base.*           FROM PROPATH .
USING Consultingwerk.SmartComponents.Enum.*           FROM PROPATH .
USING Consultingwerk.SmartComponents.Implementation.* FROM PROPATH .
USING Consultingwerk.Util.*                           FROM PROPATH .
USING Progress.Lang.*                                 FROM PROPATH .

CLASS Demo.MigratedViewerCCS 
    INHERITS SmartViewerControl: 
    
    DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.

    DEFINE PRIVATE VARIABLE smartBusinessEntityBindingSource1 AS Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityBindingSource NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_CustNum_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_CustNum AS Infragistics.Win.UltraWinEditors.UltraNumericEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Balance_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Balance AS Infragistics.Win.UltraWinEditors.UltraNumericEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Name_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Name AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_CreditLimit_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_CreditLimit AS Infragistics.Win.UltraWinEditors.UltraNumericEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Address_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Address AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Discount_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Discount AS Infragistics.Win.UltraWinEditors.UltraNumericEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Address2_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Address2 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Terms_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Terms AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_City_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_City AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_PostalCode_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_PostalCode AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Country_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Country AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_State_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_State AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Contact_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Contact AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_EmailAddress_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_EmailAddress AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Fax_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Fax AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Phone_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Phone AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_SalesRep_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_SalesRep AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Comments_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eCustomer_Comments AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE RECT_1 AS Infragistics.Win.Misc.UltraGroupBox NO-UNDO.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the MigratedViewerCCS class
        Notes:   
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC MigratedViewerCCS ():
                
        SUPER().
        InitializeComponent().
        
        &IF NOT PROVERSION BEGINS "10.2":U AND NOT PROVERSION BEGINS "11.0" &THEN
        THIS-OBJECT:ComponentsCollection:Add (THIS-OBJECT:components).
        &ENDIF
                
    END CONSTRUCTOR.

    /**
     * Purpose: Initializes the Visual Design
     * Notes:
     */
    @InitializeComponent.
    METHOD PRIVATE VOID InitializeComponent ():
        
        /* NOTE: The following method is automatically generated.
        
        We strongly suggest that the contents of this method only be modified using the
        Visual Designer to avoid any incompatible modifications.
        
        Modifying the contents of this method using a code editor will invalidate any support for this file. */
        THIS-OBJECT:components = NEW System.ComponentModel.Container().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE tableDesc1 AS Progress.Data.TableDesc NO-UNDO.
        tableDesc1 = NEW Progress.Data.TableDesc("eCustomer":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance1 AS Infragistics.Win.Appearance NO-UNDO.
        appearance1 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance2 AS Infragistics.Win.Appearance NO-UNDO.
        appearance2 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance3 AS Infragistics.Win.Appearance NO-UNDO.
        appearance3 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance4 AS Infragistics.Win.Appearance NO-UNDO.
        appearance4 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance5 AS Infragistics.Win.Appearance NO-UNDO.
        appearance5 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance6 AS Infragistics.Win.Appearance NO-UNDO.
        appearance6 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance7 AS Infragistics.Win.Appearance NO-UNDO.
        appearance7 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance8 AS Infragistics.Win.Appearance NO-UNDO.
        appearance8 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance9 AS Infragistics.Win.Appearance NO-UNDO.
        appearance9 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance10 AS Infragistics.Win.Appearance NO-UNDO.
        appearance10 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance11 AS Infragistics.Win.Appearance NO-UNDO.
        appearance11 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance12 AS Infragistics.Win.Appearance NO-UNDO.
        appearance12 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance13 AS Infragistics.Win.Appearance NO-UNDO.
        appearance13 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance14 AS Infragistics.Win.Appearance NO-UNDO.
        appearance14 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance15 AS Infragistics.Win.Appearance NO-UNDO.
        appearance15 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance16 AS Infragistics.Win.Appearance NO-UNDO.
        appearance16 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance17 AS Infragistics.Win.Appearance NO-UNDO.
        appearance17 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance18 AS Infragistics.Win.Appearance NO-UNDO.
        appearance18 = NEW Infragistics.Win.Appearance().
        THIS-OBJECT:smartBusinessEntityBindingSource1 = NEW Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityBindingSource(THIS-OBJECT:components).
        THIS-OBJECT:eCustomer_CustNum_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_CustNum = NEW Infragistics.Win.UltraWinEditors.UltraNumericEditor().
        THIS-OBJECT:eCustomer_Balance_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_Balance = NEW Infragistics.Win.UltraWinEditors.UltraNumericEditor().
        THIS-OBJECT:eCustomer_Name_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_Name = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eCustomer_CreditLimit_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_CreditLimit = NEW Infragistics.Win.UltraWinEditors.UltraNumericEditor().
        THIS-OBJECT:eCustomer_Address_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_Address = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eCustomer_Discount_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_Discount = NEW Infragistics.Win.UltraWinEditors.UltraNumericEditor().
        THIS-OBJECT:eCustomer_Address2_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_Address2 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eCustomer_Terms_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_Terms = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eCustomer_City_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_City = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eCustomer_PostalCode_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_PostalCode = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eCustomer_Country_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_Country = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eCustomer_State_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_State = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eCustomer_Contact_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_Contact = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eCustomer_EmailAddress_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_EmailAddress = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eCustomer_Fax_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_Fax = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eCustomer_Phone_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_Phone = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eCustomer_SalesRep_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_SalesRep = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eCustomer_Comments_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eCustomer_Comments = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:RECT_1 = NEW Infragistics.Win.Misc.UltraGroupBox().
        CAST(THIS-OBJECT:smartBusinessEntityBindingSource1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_CustNum, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_Balance, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_Name, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_CreditLimit, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_Address, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_Discount, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_Address2, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_Terms, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_City, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_PostalCode, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_Country, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_State, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_Contact, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_EmailAddress, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_Fax, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_Phone, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_SalesRep, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eCustomer_Comments, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:RECT_1, System.ComponentModel.ISupportInitialize):BeginInit().
        THIS-OBJECT:RECT_1:SuspendLayout().
        CAST(THIS-OBJECT, System.ComponentModel.ISupportInitialize):BeginInit().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* smartBusinessEntityBindingSource1 */
        /*  */
        THIS-OBJECT:smartBusinessEntityBindingSource1:BindTo = "QUERY":U.
        THIS-OBJECT:smartBusinessEntityBindingSource1:EntityJoin = "yes":U.
        THIS-OBJECT:smartBusinessEntityBindingSource1:EntityName = "Consultingwerk.SmartComponentsDemo.OERA.Sports2000.CustomerBusinessEntity":U.
        THIS-OBJECT:smartBusinessEntityBindingSource1:EntityTable = "eCustomer":U.
        THIS-OBJECT:smartBusinessEntityBindingSource1:EntityView = "eSalesrep":U.
        THIS-OBJECT:smartBusinessEntityBindingSource1:MaxDataGuess = 0.
        THIS-OBJECT:smartBusinessEntityBindingSource1:NoLOBs = FALSE.
        tableDesc1:ChildTables = ?.
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar0 AS Progress.Data.ColumnPropDesc EXTENT 43 NO-UNDO.
        arrayvar0[1] = NEW Progress.Data.ColumnPropDesc("CustNum":U, "Cust Num":U, Progress.Data.DataType:INTEGER).
        arrayvar0[2] = NEW Progress.Data.ColumnPropDesc("Country":U, "Country":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[3] = NEW Progress.Data.ColumnPropDesc("Name":U, "Name":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[4] = NEW Progress.Data.ColumnPropDesc("Address":U, "Address":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[5] = NEW Progress.Data.ColumnPropDesc("Address2":U, "Address2":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[6] = NEW Progress.Data.ColumnPropDesc("City":U, "City":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[7] = NEW Progress.Data.ColumnPropDesc("State":U, "State":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[8] = NEW Progress.Data.ColumnPropDesc("PostalCode":U, "Postal Code":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[9] = NEW Progress.Data.ColumnPropDesc("Contact":U, "Contact":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[10] = NEW Progress.Data.ColumnPropDesc("Phone":U, "Phone":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[11] = NEW Progress.Data.ColumnPropDesc("SalesRep":U, "Sales Rep":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[12] = NEW Progress.Data.ColumnPropDesc("CreditLimit":U, "Credit Limit":U, Progress.Data.DataType:DECIMAL).
        arrayvar0[13] = NEW Progress.Data.ColumnPropDesc("Balance":U, "Balance":U, Progress.Data.DataType:DECIMAL).
        arrayvar0[14] = NEW Progress.Data.ColumnPropDesc("Terms":U, "Terms":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[15] = NEW Progress.Data.ColumnPropDesc("Discount":U, "Discount":U, Progress.Data.DataType:INTEGER).
        arrayvar0[16] = NEW Progress.Data.ColumnPropDesc("Comments":U, "Comments":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[17] = NEW Progress.Data.ColumnPropDesc("Fax":U, "Fax":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[18] = NEW Progress.Data.ColumnPropDesc("EmailAddress":U, "Email":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[19] = NEW Progress.Data.ColumnPropDesc("Flags":U, "Notes":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[20] = NEW Progress.Data.ColumnPropDesc("SmartRecordKey":U, "SmartRecordKey":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[21] = NEW Progress.Data.ColumnPropDesc("SmartAttachments":U, "Attachments":U, Progress.Data.DataType:LOGICAL).
        arrayvar0[22] = NEW Progress.Data.ColumnPropDesc("SmartComments":U, "Comments":U, Progress.Data.DataType:LOGICAL).
        arrayvar0[23] = NEW Progress.Data.ColumnPropDesc("SmartCopiedFrom":U, "SmartCopiedFrom":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[24] = NEW Progress.Data.ColumnPropDesc("RepName":U, "Rep Name":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[25] = NEW Progress.Data.ColumnPropDesc("Region":U, "Region":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[26] = NEW Progress.Data.ColumnPropDesc("MonthQuota01":U, "Month Quota":U, Progress.Data.DataType:INTEGER).
        arrayvar0[27] = NEW Progress.Data.ColumnPropDesc("MonthQuota02":U, "MonthQuota02":U, Progress.Data.DataType:INTEGER).
        arrayvar0[28] = NEW Progress.Data.ColumnPropDesc("MonthQuota03":U, "MonthQuota03":U, Progress.Data.DataType:INTEGER).
        arrayvar0[29] = NEW Progress.Data.ColumnPropDesc("MonthQuota04":U, "MonthQuota04":U, Progress.Data.DataType:INTEGER).
        arrayvar0[30] = NEW Progress.Data.ColumnPropDesc("MonthQuota05":U, "MonthQuota05":U, Progress.Data.DataType:INTEGER).
        arrayvar0[31] = NEW Progress.Data.ColumnPropDesc("MonthQuota06":U, "MonthQuota06":U, Progress.Data.DataType:INTEGER).
        arrayvar0[32] = NEW Progress.Data.ColumnPropDesc("MonthQuota07":U, "MonthQuota07":U, Progress.Data.DataType:INTEGER).
        arrayvar0[33] = NEW Progress.Data.ColumnPropDesc("MonthQuota08":U, "MonthQuota08":U, Progress.Data.DataType:INTEGER).
        arrayvar0[34] = NEW Progress.Data.ColumnPropDesc("MonthQuota09":U, "MonthQuota09":U, Progress.Data.DataType:INTEGER).
        arrayvar0[35] = NEW Progress.Data.ColumnPropDesc("MonthQuota10":U, "MonthQuota10":U, Progress.Data.DataType:INTEGER).
        arrayvar0[36] = NEW Progress.Data.ColumnPropDesc("MonthQuota11":U, "MonthQuota11":U, Progress.Data.DataType:INTEGER).
        arrayvar0[37] = NEW Progress.Data.ColumnPropDesc("MonthQuota12":U, "MonthQuota12":U, Progress.Data.DataType:INTEGER).
        arrayvar0[38] = NEW Progress.Data.ColumnPropDesc("SmallImage":U, "SmallImage":U, Progress.Data.DataType:BLOB).
        arrayvar0[39] = NEW Progress.Data.ColumnPropDesc("LargeImage":U, "LargeImage":U, Progress.Data.DataType:BLOB).
        arrayvar0[40] = NEW Progress.Data.ColumnPropDesc("Email":U, "E-Mail":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[41] = NEW Progress.Data.ColumnPropDesc("PhoneMobile":U, "Mobile Phone":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[42] = NEW Progress.Data.ColumnPropDesc("PhoneOffice":U, "Office Phone":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[43] = NEW Progress.Data.ColumnPropDesc("PhonePrivate":U, "Private Phone":U, Progress.Data.DataType:CHARACTER).
        tableDesc1:Columns = arrayvar0.
        THIS-OBJECT:smartBusinessEntityBindingSource1:TableSchema = tableDesc1.
        /*  */
        /* eCustomer_CustNum_Label */
        /*  */
        appearance1:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_CustNum_Label:Appearance = appearance1.
        THIS-OBJECT:eCustomer_CustNum_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_CustNum_Label:Location = NEW System.Drawing.Point(5, 14).
        THIS-OBJECT:eCustomer_CustNum_Label:Name = "eCustomer_CustNum_Label":U.
        THIS-OBJECT:eCustomer_CustNum_Label:Size = NEW System.Drawing.Size(58, 14).
        THIS-OBJECT:eCustomer_CustNum_Label:TabIndex = 1.
        THIS-OBJECT:eCustomer_CustNum_Label:Text = "Cust Num:":U.
        /*  */
        /* eCustomer_CustNum */
        /*  */
        THIS-OBJECT:eCustomer_CustNum:DataBindings:Add(NEW System.Windows.Forms.Binding("Value":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "CustNum":U, TRUE)).
        THIS-OBJECT:eCustomer_CustNum:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_CustNum:Location = NEW System.Drawing.Point(65, 10).
        THIS-OBJECT:eCustomer_CustNum:Name = "eCustomer_CustNum":U.
        THIS-OBJECT:eCustomer_CustNum:Size = NEW System.Drawing.Size(45, 21).
        THIS-OBJECT:eCustomer_CustNum:TabIndex = 2.
        /*  */
        /* eCustomer_Balance_Label */
        /*  */
        appearance2:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_Balance_Label:Appearance = appearance2.
        THIS-OBJECT:eCustomer_Balance_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_Balance_Label:Location = NEW System.Drawing.Point(305, 14).
        THIS-OBJECT:eCustomer_Balance_Label:Name = "eCustomer_Balance_Label":U.
        THIS-OBJECT:eCustomer_Balance_Label:Size = NEW System.Drawing.Size(48, 14).
        THIS-OBJECT:eCustomer_Balance_Label:TabIndex = 3.
        THIS-OBJECT:eCustomer_Balance_Label:Text = "Balance:":U.
        /*  */
        /* eCustomer_Balance */
        /*  */
        THIS-OBJECT:eCustomer_Balance:DataBindings:Add(NEW System.Windows.Forms.Binding("Value":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "Balance":U, TRUE)).
        THIS-OBJECT:eCustomer_Balance:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_Balance:Location = NEW System.Drawing.Point(365, 10).
        THIS-OBJECT:eCustomer_Balance:Name = "eCustomer_Balance":U.
        THIS-OBJECT:eCustomer_Balance:NumericType = Infragistics.Win.UltraWinEditors.NumericType:Double.
        THIS-OBJECT:eCustomer_Balance:Size = NEW System.Drawing.Size(101, 21).
        THIS-OBJECT:eCustomer_Balance:TabIndex = 4.
        THIS-OBJECT:eCustomer_Balance:TabNavigation = Infragistics.Win.UltraWinMaskedEdit.MaskedEditTabNavigation:NextControl.
        /*  */
        /* eCustomer_Name_Label */
        /*  */
        appearance3:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_Name_Label:Appearance = appearance3.
        THIS-OBJECT:eCustomer_Name_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_Name_Label:Location = NEW System.Drawing.Point(5, 35).
        THIS-OBJECT:eCustomer_Name_Label:Name = "eCustomer_Name_Label":U.
        THIS-OBJECT:eCustomer_Name_Label:Size = NEW System.Drawing.Size(38, 14).
        THIS-OBJECT:eCustomer_Name_Label:TabIndex = 5.
        THIS-OBJECT:eCustomer_Name_Label:Text = "Name:":U.
        /*  */
        /* eCustomer_Name */
        /*  */
        THIS-OBJECT:eCustomer_Name:DataBindings:Add(NEW System.Windows.Forms.Binding("Text":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "Name":U, TRUE)).
        THIS-OBJECT:eCustomer_Name:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_Name:Location = NEW System.Drawing.Point(65, 31).
        THIS-OBJECT:eCustomer_Name:Name = "eCustomer_Name":U.
        THIS-OBJECT:eCustomer_Name:Size = NEW System.Drawing.Size(160, 21).
        THIS-OBJECT:eCustomer_Name:TabIndex = 6.
        /*  */
        /* eCustomer_CreditLimit_Label */
        /*  */
        appearance4:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_CreditLimit_Label:Appearance = appearance4.
        THIS-OBJECT:eCustomer_CreditLimit_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_CreditLimit_Label:Location = NEW System.Drawing.Point(305, 35).
        THIS-OBJECT:eCustomer_CreditLimit_Label:Name = "eCustomer_CreditLimit_Label":U.
        THIS-OBJECT:eCustomer_CreditLimit_Label:Size = NEW System.Drawing.Size(65, 14).
        THIS-OBJECT:eCustomer_CreditLimit_Label:TabIndex = 7.
        THIS-OBJECT:eCustomer_CreditLimit_Label:Text = "Credit Limit:":U.
        /*  */
        /* eCustomer_CreditLimit */
        /*  */
        THIS-OBJECT:eCustomer_CreditLimit:DataBindings:Add(NEW System.Windows.Forms.Binding("Value":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "CreditLimit":U, TRUE)).
        THIS-OBJECT:eCustomer_CreditLimit:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_CreditLimit:Location = NEW System.Drawing.Point(365, 31).
        THIS-OBJECT:eCustomer_CreditLimit:Name = "eCustomer_CreditLimit":U.
        THIS-OBJECT:eCustomer_CreditLimit:NumericType = Infragistics.Win.UltraWinEditors.NumericType:Double.
        THIS-OBJECT:eCustomer_CreditLimit:Size = NEW System.Drawing.Size(80, 21).
        THIS-OBJECT:eCustomer_CreditLimit:TabIndex = 8.
        THIS-OBJECT:eCustomer_CreditLimit:TabNavigation = Infragistics.Win.UltraWinMaskedEdit.MaskedEditTabNavigation:NextControl.
        /*  */
        /* eCustomer_Address_Label */
        /*  */
        appearance5:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_Address_Label:Appearance = appearance5.
        THIS-OBJECT:eCustomer_Address_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_Address_Label:Location = NEW System.Drawing.Point(5, 56).
        THIS-OBJECT:eCustomer_Address_Label:Name = "eCustomer_Address_Label":U.
        THIS-OBJECT:eCustomer_Address_Label:Size = NEW System.Drawing.Size(49, 14).
        THIS-OBJECT:eCustomer_Address_Label:TabIndex = 9.
        THIS-OBJECT:eCustomer_Address_Label:Text = "Address:":U.
        /*  */
        /* eCustomer_Address */
        /*  */
        THIS-OBJECT:eCustomer_Address:DataBindings:Add(NEW System.Windows.Forms.Binding("Text":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "Address":U, TRUE)).
        THIS-OBJECT:eCustomer_Address:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_Address:Location = NEW System.Drawing.Point(65, 52).
        THIS-OBJECT:eCustomer_Address:Name = "eCustomer_Address":U.
        THIS-OBJECT:eCustomer_Address:Size = NEW System.Drawing.Size(185, 21).
        THIS-OBJECT:eCustomer_Address:TabIndex = 10.
        /*  */
        /* eCustomer_Discount_Label */
        /*  */
        appearance6:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_Discount_Label:Appearance = appearance6.
        THIS-OBJECT:eCustomer_Discount_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_Discount_Label:Location = NEW System.Drawing.Point(305, 56).
        THIS-OBJECT:eCustomer_Discount_Label:Name = "eCustomer_Discount_Label":U.
        THIS-OBJECT:eCustomer_Discount_Label:Size = NEW System.Drawing.Size(51, 14).
        THIS-OBJECT:eCustomer_Discount_Label:TabIndex = 11.
        THIS-OBJECT:eCustomer_Discount_Label:Text = "Discount:":U.
        /*  */
        /* eCustomer_Discount */
        /*  */
        THIS-OBJECT:eCustomer_Discount:DataBindings:Add(NEW System.Windows.Forms.Binding("Value":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "Discount":U, TRUE)).
        THIS-OBJECT:eCustomer_Discount:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_Discount:Location = NEW System.Drawing.Point(365, 52).
        THIS-OBJECT:eCustomer_Discount:Name = "eCustomer_Discount":U.
        THIS-OBJECT:eCustomer_Discount:Size = NEW System.Drawing.Size(38, 21).
        THIS-OBJECT:eCustomer_Discount:TabIndex = 12.
        /*  */
        /* eCustomer_Address2_Label */
        /*  */
        appearance7:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_Address2_Label:Appearance = appearance7.
        THIS-OBJECT:eCustomer_Address2_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_Address2_Label:Location = NEW System.Drawing.Point(5, 77).
        THIS-OBJECT:eCustomer_Address2_Label:Name = "eCustomer_Address2_Label":U.
        THIS-OBJECT:eCustomer_Address2_Label:Size = NEW System.Drawing.Size(55, 14).
        THIS-OBJECT:eCustomer_Address2_Label:TabIndex = 13.
        THIS-OBJECT:eCustomer_Address2_Label:Text = "Address2:":U.
        /*  */
        /* eCustomer_Address2 */
        /*  */
        THIS-OBJECT:eCustomer_Address2:DataBindings:Add(NEW System.Windows.Forms.Binding("Text":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "Address2":U, TRUE)).
        THIS-OBJECT:eCustomer_Address2:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_Address2:Location = NEW System.Drawing.Point(65, 73).
        THIS-OBJECT:eCustomer_Address2:Name = "eCustomer_Address2":U.
        THIS-OBJECT:eCustomer_Address2:Size = NEW System.Drawing.Size(185, 21).
        THIS-OBJECT:eCustomer_Address2:TabIndex = 14.
        /*  */
        /* eCustomer_Terms_Label */
        /*  */
        appearance8:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_Terms_Label:Appearance = appearance8.
        THIS-OBJECT:eCustomer_Terms_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_Terms_Label:Location = NEW System.Drawing.Point(305, 77).
        THIS-OBJECT:eCustomer_Terms_Label:Name = "eCustomer_Terms_Label":U.
        THIS-OBJECT:eCustomer_Terms_Label:Size = NEW System.Drawing.Size(39, 14).
        THIS-OBJECT:eCustomer_Terms_Label:TabIndex = 15.
        THIS-OBJECT:eCustomer_Terms_Label:Text = "Terms:":U.
        /*  */
        /* eCustomer_Terms */
        /*  */
        THIS-OBJECT:eCustomer_Terms:DataBindings:Add(NEW System.Windows.Forms.Binding("Text":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "Terms":U, TRUE)).
        THIS-OBJECT:eCustomer_Terms:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_Terms:Location = NEW System.Drawing.Point(365, 73).
        THIS-OBJECT:eCustomer_Terms:Name = "eCustomer_Terms":U.
        THIS-OBJECT:eCustomer_Terms:Size = NEW System.Drawing.Size(110, 21).
        THIS-OBJECT:eCustomer_Terms:TabIndex = 16.
        /*  */
        /* eCustomer_City_Label */
        /*  */
        appearance9:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_City_Label:Appearance = appearance9.
        THIS-OBJECT:eCustomer_City_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_City_Label:Location = NEW System.Drawing.Point(5, 98).
        THIS-OBJECT:eCustomer_City_Label:Name = "eCustomer_City_Label":U.
        THIS-OBJECT:eCustomer_City_Label:Size = NEW System.Drawing.Size(27, 14).
        THIS-OBJECT:eCustomer_City_Label:TabIndex = 17.
        THIS-OBJECT:eCustomer_City_Label:Text = "City:":U.
        /*  */
        /* eCustomer_City */
        /*  */
        THIS-OBJECT:eCustomer_City:DataBindings:Add(NEW System.Windows.Forms.Binding("Text":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "City":U, TRUE)).
        THIS-OBJECT:eCustomer_City:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_City:Location = NEW System.Drawing.Point(65, 94).
        THIS-OBJECT:eCustomer_City:Name = "eCustomer_City":U.
        THIS-OBJECT:eCustomer_City:Size = NEW System.Drawing.Size(135, 21).
        THIS-OBJECT:eCustomer_City:TabIndex = 18.
        /*  */
        /* eCustomer_PostalCode_Label */
        /*  */
        appearance10:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_PostalCode_Label:Appearance = appearance10.
        THIS-OBJECT:eCustomer_PostalCode_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_PostalCode_Label:Location = NEW System.Drawing.Point(5, 119).
        THIS-OBJECT:eCustomer_PostalCode_Label:Name = "eCustomer_PostalCode_Label":U.
        THIS-OBJECT:eCustomer_PostalCode_Label:Size = NEW System.Drawing.Size(69, 14).
        THIS-OBJECT:eCustomer_PostalCode_Label:TabIndex = 19.
        THIS-OBJECT:eCustomer_PostalCode_Label:Text = "Postal Code:":U.
        /*  */
        /* eCustomer_PostalCode */
        /*  */
        THIS-OBJECT:eCustomer_PostalCode:DataBindings:Add(NEW System.Windows.Forms.Binding("Text":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "PostalCode":U, TRUE)).
        THIS-OBJECT:eCustomer_PostalCode:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_PostalCode:Location = NEW System.Drawing.Point(65, 115).
        THIS-OBJECT:eCustomer_PostalCode:Name = "eCustomer_PostalCode":U.
        THIS-OBJECT:eCustomer_PostalCode:Size = NEW System.Drawing.Size(78, 21).
        THIS-OBJECT:eCustomer_PostalCode:TabIndex = 20.
        /*  */
        /* eCustomer_Country_Label */
        /*  */
        appearance11:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_Country_Label:Appearance = appearance11.
        THIS-OBJECT:eCustomer_Country_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_Country_Label:Location = NEW System.Drawing.Point(5, 140).
        THIS-OBJECT:eCustomer_Country_Label:Name = "eCustomer_Country_Label":U.
        THIS-OBJECT:eCustomer_Country_Label:Size = NEW System.Drawing.Size(47, 14).
        THIS-OBJECT:eCustomer_Country_Label:TabIndex = 21.
        THIS-OBJECT:eCustomer_Country_Label:Text = "Country:":U.
        /*  */
        /* eCustomer_Country */
        /*  */
        THIS-OBJECT:eCustomer_Country:DataBindings:Add(NEW System.Windows.Forms.Binding("Text":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "Country":U, TRUE)).
        THIS-OBJECT:eCustomer_Country:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_Country:Location = NEW System.Drawing.Point(65, 136).
        THIS-OBJECT:eCustomer_Country:Name = "eCustomer_Country":U.
        THIS-OBJECT:eCustomer_Country:Size = NEW System.Drawing.Size(110, 21).
        THIS-OBJECT:eCustomer_Country:TabIndex = 22.
        THIS-OBJECT:eCustomer_Country:ValueChanged:Subscribe(THIS-OBJECT:eCustomer_Country_ValueChanged).
        /*  */
        /* eCustomer_State_Label */
        /*  */
        appearance12:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_State_Label:Appearance = appearance12.
        THIS-OBJECT:eCustomer_State_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_State_Label:Location = NEW System.Drawing.Point(5, 159).
        THIS-OBJECT:eCustomer_State_Label:Name = "eCustomer_State_Label":U.
        THIS-OBJECT:eCustomer_State_Label:Size = NEW System.Drawing.Size(34, 14).
        THIS-OBJECT:eCustomer_State_Label:TabIndex = 23.
        THIS-OBJECT:eCustomer_State_Label:Text = "State:":U.
        /*  */
        /* eCustomer_State */
        /*  */
        THIS-OBJECT:eCustomer_State:DataBindings:Add(NEW System.Windows.Forms.Binding("Text":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "State":U, TRUE)).
        THIS-OBJECT:eCustomer_State:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_State:Location = NEW System.Drawing.Point(65, 155).
        THIS-OBJECT:eCustomer_State:Name = "eCustomer_State":U.
        THIS-OBJECT:eCustomer_State:Size = NEW System.Drawing.Size(110, 21).
        THIS-OBJECT:eCustomer_State:TabIndex = 24.
        /*  */
        /* eCustomer_Contact_Label */
        /*  */
        appearance13:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_Contact_Label:Appearance = appearance13.
        THIS-OBJECT:eCustomer_Contact_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_Contact_Label:Location = NEW System.Drawing.Point(5, 219).
        THIS-OBJECT:eCustomer_Contact_Label:Name = "eCustomer_Contact_Label":U.
        THIS-OBJECT:eCustomer_Contact_Label:Size = NEW System.Drawing.Size(46, 14).
        THIS-OBJECT:eCustomer_Contact_Label:TabIndex = 25.
        THIS-OBJECT:eCustomer_Contact_Label:Text = "Contact:":U.
        /*  */
        /* eCustomer_Contact */
        /*  */
        THIS-OBJECT:eCustomer_Contact:DataBindings:Add(NEW System.Windows.Forms.Binding("Text":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "Contact":U, TRUE)).
        THIS-OBJECT:eCustomer_Contact:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_Contact:Location = NEW System.Drawing.Point(65, 215).
        THIS-OBJECT:eCustomer_Contact:Name = "eCustomer_Contact":U.
        THIS-OBJECT:eCustomer_Contact:Size = NEW System.Drawing.Size(160, 21).
        THIS-OBJECT:eCustomer_Contact:TabIndex = 26.
        /*  */
        /* eCustomer_EmailAddress_Label */
        /*  */
        appearance14:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_EmailAddress_Label:Appearance = appearance14.
        THIS-OBJECT:eCustomer_EmailAddress_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_EmailAddress_Label:Location = NEW System.Drawing.Point(5, 240).
        THIS-OBJECT:eCustomer_EmailAddress_Label:Name = "eCustomer_EmailAddress_Label":U.
        THIS-OBJECT:eCustomer_EmailAddress_Label:Size = NEW System.Drawing.Size(36, 14).
        THIS-OBJECT:eCustomer_EmailAddress_Label:TabIndex = 27.
        THIS-OBJECT:eCustomer_EmailAddress_Label:Text = "Email:":U.
        /*  */
        /* eCustomer_EmailAddress */
        /*  */
        THIS-OBJECT:eCustomer_EmailAddress:DataBindings:Add(NEW System.Windows.Forms.Binding("Text":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "EmailAddress":U, TRUE)).
        THIS-OBJECT:eCustomer_EmailAddress:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_EmailAddress:Location = NEW System.Drawing.Point(65, 236).
        THIS-OBJECT:eCustomer_EmailAddress:Name = "eCustomer_EmailAddress":U.
        THIS-OBJECT:eCustomer_EmailAddress:Size = NEW System.Drawing.Size(260, 21).
        THIS-OBJECT:eCustomer_EmailAddress:TabIndex = 28.
        /*  */
        /* eCustomer_Fax_Label */
        /*  */
        appearance15:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_Fax_Label:Appearance = appearance15.
        THIS-OBJECT:eCustomer_Fax_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_Fax_Label:Location = NEW System.Drawing.Point(5, 261).
        THIS-OBJECT:eCustomer_Fax_Label:Name = "eCustomer_Fax_Label":U.
        THIS-OBJECT:eCustomer_Fax_Label:Size = NEW System.Drawing.Size(26, 14).
        THIS-OBJECT:eCustomer_Fax_Label:TabIndex = 29.
        THIS-OBJECT:eCustomer_Fax_Label:Text = "Fax:":U.
        /*  */
        /* eCustomer_Fax */
        /*  */
        THIS-OBJECT:eCustomer_Fax:DataBindings:Add(NEW System.Windows.Forms.Binding("Text":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "Fax":U, TRUE)).
        THIS-OBJECT:eCustomer_Fax:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_Fax:Location = NEW System.Drawing.Point(65, 257).
        THIS-OBJECT:eCustomer_Fax:Name = "eCustomer_Fax":U.
        THIS-OBJECT:eCustomer_Fax:Size = NEW System.Drawing.Size(110, 21).
        THIS-OBJECT:eCustomer_Fax:TabIndex = 30.
        /*  */
        /* eCustomer_Phone_Label */
        /*  */
        appearance16:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_Phone_Label:Appearance = appearance16.
        THIS-OBJECT:eCustomer_Phone_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_Phone_Label:Location = NEW System.Drawing.Point(5, 282).
        THIS-OBJECT:eCustomer_Phone_Label:Name = "eCustomer_Phone_Label":U.
        THIS-OBJECT:eCustomer_Phone_Label:Size = NEW System.Drawing.Size(40, 14).
        THIS-OBJECT:eCustomer_Phone_Label:TabIndex = 31.
        THIS-OBJECT:eCustomer_Phone_Label:Text = "Phone:":U.
        /*  */
        /* eCustomer_Phone */
        /*  */
        THIS-OBJECT:eCustomer_Phone:DataBindings:Add(NEW System.Windows.Forms.Binding("Text":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "Phone":U, TRUE)).
        THIS-OBJECT:eCustomer_Phone:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_Phone:Location = NEW System.Drawing.Point(65, 278).
        THIS-OBJECT:eCustomer_Phone:Name = "eCustomer_Phone":U.
        THIS-OBJECT:eCustomer_Phone:Size = NEW System.Drawing.Size(110, 21).
        THIS-OBJECT:eCustomer_Phone:TabIndex = 32.
        /*  */
        /* eCustomer_SalesRep_Label */
        /*  */
        appearance17:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_SalesRep_Label:Appearance = appearance17.
        THIS-OBJECT:eCustomer_SalesRep_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_SalesRep_Label:Location = NEW System.Drawing.Point(5, 303).
        THIS-OBJECT:eCustomer_SalesRep_Label:Name = "eCustomer_SalesRep_Label":U.
        THIS-OBJECT:eCustomer_SalesRep_Label:Size = NEW System.Drawing.Size(60, 14).
        THIS-OBJECT:eCustomer_SalesRep_Label:TabIndex = 33.
        THIS-OBJECT:eCustomer_SalesRep_Label:Text = "Sales Rep:":U.
        /*  */
        /* eCustomer_SalesRep */
        /*  */
        THIS-OBJECT:eCustomer_SalesRep:DataBindings:Add(NEW System.Windows.Forms.Binding("Text":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "SalesRep":U, TRUE)).
        THIS-OBJECT:eCustomer_SalesRep:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_SalesRep:Location = NEW System.Drawing.Point(65, 299).
        THIS-OBJECT:eCustomer_SalesRep:Name = "eCustomer_SalesRep":U.
        THIS-OBJECT:eCustomer_SalesRep:Size = NEW System.Drawing.Size(48, 21).
        THIS-OBJECT:eCustomer_SalesRep:TabIndex = 34.
        /*  */
        /* eCustomer_Comments_Label */
        /*  */
        appearance18:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eCustomer_Comments_Label:Appearance = appearance18.
        THIS-OBJECT:eCustomer_Comments_Label:AutoSize = TRUE.
        THIS-OBJECT:eCustomer_Comments_Label:Location = NEW System.Drawing.Point(5, 339).
        THIS-OBJECT:eCustomer_Comments_Label:Name = "eCustomer_Comments_Label":U.
        THIS-OBJECT:eCustomer_Comments_Label:Size = NEW System.Drawing.Size(62, 14).
        THIS-OBJECT:eCustomer_Comments_Label:TabIndex = 35.
        THIS-OBJECT:eCustomer_Comments_Label:Text = "Comments:":U.
        /*  */
        /* eCustomer_Comments */
        /*  */
        THIS-OBJECT:eCustomer_Comments:DataBindings:Add(NEW System.Windows.Forms.Binding("Text":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "Comments":U, TRUE)).
        THIS-OBJECT:eCustomer_Comments:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eCustomer_Comments:Location = NEW System.Drawing.Point(65, 335).
        THIS-OBJECT:eCustomer_Comments:Name = "eCustomer_Comments":U.
        THIS-OBJECT:eCustomer_Comments:Size = NEW System.Drawing.Size(410, 21).
        THIS-OBJECT:eCustomer_Comments:TabIndex = 36.
        /*  */
        /* RECT_1 */
        /*  */
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_CustNum_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_CustNum).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Balance_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Balance).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Name_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Name).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_CreditLimit_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_CreditLimit).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Address_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Address).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Discount_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Discount).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Address2_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Address2).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Terms_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Terms).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_City_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_City).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_PostalCode_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_PostalCode).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Country_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Country).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_State_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_State).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Contact_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Contact).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_EmailAddress_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_EmailAddress).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Fax_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Fax).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Phone_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Phone).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_SalesRep_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_SalesRep).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Comments_Label).
        THIS-OBJECT:RECT_1:Controls:Add(THIS-OBJECT:eCustomer_Comments).
        THIS-OBJECT:RECT_1:Location = NEW System.Drawing.Point(0, 0).
        THIS-OBJECT:RECT_1:Name = "RECT_1":U.
        THIS-OBJECT:RECT_1:Size = NEW System.Drawing.Size(530, 405).
        THIS-OBJECT:RECT_1:TabIndex = 38.
        /*  */
        /* MigratedViewerCCS */
        /*  */
        THIS-OBJECT:AutoScaleDimensions = NEW System.Drawing.SizeF(Progress.Util.CastUtil:ToSingle(6), Progress.Util.CastUtil:ToSingle(13)).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:RECT_1).
        THIS-OBJECT:Name = "MigratedViewerCCS":U.
        THIS-OBJECT:Size = NEW System.Drawing.Size(704, 549).
        CAST(THIS-OBJECT:smartBusinessEntityBindingSource1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_CustNum, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_Balance, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_Name, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_CreditLimit, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_Address, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_Discount, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_Address2, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_Terms, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_City, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_PostalCode, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_Country, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_State, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_Contact, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_EmailAddress, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_Fax, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_Phone, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_SalesRep, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eCustomer_Comments, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:RECT_1, System.ComponentModel.ISupportInitialize):EndInit().
        THIS-OBJECT:RECT_1:ResumeLayout(FALSE).
        THIS-OBJECT:RECT_1:PerformLayout().
        CAST(THIS-OBJECT, System.ComponentModel.ISupportInitialize):EndInit().
        THIS-OBJECT:ResumeLayout(FALSE).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Event handler or the ValueChanged event of the eCustomer_Country
        Notes:
        @param sender The reference to the control that raised the event
        @param e The System.EventArgs with the data for this event
    ------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID eCustomer_Country_ValueChanged (sender AS System.Object, e AS System.EventArgs):

        /* Trigger code from ON VALUE-CHANGED OF Customer.Country IN FRAME DEFAULT-FRAME 
           C:\Work\SmartComponents4NET\117_64\ABL\Demo\c-customer.w - 07.07.2017 16:15:58 
        */

        DEFINE VARIABLE Customer_Country AS Consultingwerk.Windows.LegacyGuiMigration.Widgets.IWidgetFacade NO-UNDO .
        DEFINE VARIABLE Customer_State AS Consultingwerk.Windows.LegacyGuiMigration.Widgets.IWidgetFacade NO-UNDO .
    
        Customer_Country = Consultingwerk.Windows.LegacyGuiMigration.Widgets.Infragistics.InfragisticsWidgetFactory:FromControl (THIS-OBJECT:eCustomer_Country) .
        Customer_State = Consultingwerk.Windows.LegacyGuiMigration.Widgets.Infragistics.InfragisticsWidgetFactory:FromControl (THIS-OBJECT:eCustomer_State) .
    
        DO WITH FRAME DEFAULT-FRAME:
            
            IF Customer_Country:SCREEN-VALUE = "USA" THEN 
                Customer_State:VISIBLE = TRUE .
            ELSE 
                Customer_State:VISIBLE = FALSE .
        END.

    END METHOD.



    /*------------------------------------------------------------------------------
        Purpose: Destructor for the MigratedViewerCCS class
        Notes:   
    ------------------------------------------------------------------------------*/
    DESTRUCTOR PUBLIC MigratedViewerCCS ( ):

        IF VALID-OBJECT(components) THEN DO:
            CAST(components, System.IDisposable):Dispose().
        END.

    END DESTRUCTOR.

END CLASS.
