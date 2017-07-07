/*------------------------------------------------------------------------
    File        : OrderViewerControl
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner
    Created     : 07.07.2017 10:00:57
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.SmartComponents.Base.*           FROM PROPATH .
USING Consultingwerk.SmartComponents.Enum.*           FROM PROPATH .
USING Consultingwerk.SmartComponents.Implementation.* FROM PROPATH .
USING Consultingwerk.Util.*                           FROM PROPATH .
USING Progress.Lang.*                                 FROM PROPATH .

CLASS TrainingSamples.Gui.OrderViewerControl 
    INHERITS SmartViewerControl: 
    
    DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.

    DEFINE PRIVATE VARIABLE eOrder_WarehouseNum_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_WarehouseNum AS Infragistics.Win.UltraWinEditors.UltraNumericEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_ShipToID_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_ShipToID AS Infragistics.Win.UltraWinEditors.UltraNumericEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_SalesRep_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_SalesRep AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_OrderStatus_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_OrderStatus AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_Creditcard_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_Creditcard AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_BillToID_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_BillToID AS Infragistics.Win.UltraWinEditors.UltraNumericEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE smartBusinessEntityBindingSource1 AS Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityBindingSource NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_Ordernum_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_Ordernum AS Infragistics.Win.UltraWinEditors.UltraNumericEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_KlantenNo_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_OrderDate_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_OrderDate AS Infragistics.Win.UltraWinEditors.UltraDateTimeEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_ShipDate_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_ShipDate AS Infragistics.Win.UltraWinEditors.UltraDateTimeEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_PromiseDate_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_PromiseDate AS Infragistics.Win.UltraWinEditors.UltraDateTimeEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_Carrier_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_Carrier AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_Instructions_Label AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
    DEFINE PRIVATE VARIABLE eOrder_Instructions AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE smartBusinessEntityLookup1 AS Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityLookup NO-UNDO.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the OrderViewerControl class
        Notes:   
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderViewerControl ():
                
        SUPER().
        InitializeComponent().
        
        &IF NOT PROVERSION BEGINS "10.2":U AND NOT PROVERSION BEGINS "11.0" &THEN
        THIS-OBJECT:ComponentsCollection:Add (THIS-OBJECT:components).
        &ENDIF
                
        THIS-OBJECT:SetControlEnabled(smartBusinessEntityLookup1, ControlEnabledEnum:Add) .                
                
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
        DEFINE VARIABLE tableDesc2 AS Progress.Data.TableDesc NO-UNDO.
        tableDesc2 = NEW Progress.Data.TableDesc("eOrder":U).
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
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance19 AS Infragistics.Win.Appearance NO-UNDO.
        appearance19 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance20 AS Infragistics.Win.Appearance NO-UNDO.
        appearance20 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance21 AS Infragistics.Win.Appearance NO-UNDO.
        appearance21 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance22 AS Infragistics.Win.Appearance NO-UNDO.
        appearance22 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance23 AS Infragistics.Win.Appearance NO-UNDO.
        appearance23 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance24 AS Infragistics.Win.Appearance NO-UNDO.
        appearance24 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance25 AS Infragistics.Win.Appearance NO-UNDO.
        appearance25 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance26 AS Infragistics.Win.Appearance NO-UNDO.
        appearance26 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE editorButton1 AS Infragistics.Win.UltraWinEditors.EditorButton NO-UNDO.
        editorButton1 = NEW Infragistics.Win.UltraWinEditors.EditorButton("ShowLookupDialog":U).
        THIS-OBJECT:smartBusinessEntityBindingSource1 = NEW Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityBindingSource(THIS-OBJECT:components).
        THIS-OBJECT:eOrder_Ordernum_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eOrder_Ordernum = NEW Infragistics.Win.UltraWinEditors.UltraNumericEditor().
        THIS-OBJECT:eOrder_KlantenNo_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eOrder_OrderDate_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eOrder_OrderDate = NEW Infragistics.Win.UltraWinEditors.UltraDateTimeEditor().
        THIS-OBJECT:eOrder_ShipDate_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eOrder_ShipDate = NEW Infragistics.Win.UltraWinEditors.UltraDateTimeEditor().
        THIS-OBJECT:eOrder_PromiseDate_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eOrder_PromiseDate = NEW Infragistics.Win.UltraWinEditors.UltraDateTimeEditor().
        THIS-OBJECT:eOrder_Carrier_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eOrder_Carrier = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eOrder_Instructions_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eOrder_Instructions = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eOrder_SalesRep_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eOrder_SalesRep = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eOrder_BillToID_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eOrder_BillToID = NEW Infragistics.Win.UltraWinEditors.UltraNumericEditor().
        THIS-OBJECT:eOrder_ShipToID_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eOrder_ShipToID = NEW Infragistics.Win.UltraWinEditors.UltraNumericEditor().
        THIS-OBJECT:eOrder_OrderStatus_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eOrder_OrderStatus = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eOrder_WarehouseNum_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eOrder_WarehouseNum = NEW Infragistics.Win.UltraWinEditors.UltraNumericEditor().
        THIS-OBJECT:eOrder_Creditcard_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eOrder_Creditcard = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:smartBusinessEntityLookup1 = NEW Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityLookup().
        CAST(THIS-OBJECT:smartBusinessEntityBindingSource1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eOrder_Ordernum, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eOrder_OrderDate, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eOrder_ShipDate, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eOrder_PromiseDate, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eOrder_Carrier, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eOrder_Instructions, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eOrder_SalesRep, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eOrder_BillToID, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eOrder_ShipToID, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eOrder_OrderStatus, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eOrder_WarehouseNum, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eOrder_Creditcard, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:smartBusinessEntityLookup1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT, System.ComponentModel.ISupportInitialize):BeginInit().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* smartBusinessEntityBindingSource1 */
        /*  */
        THIS-OBJECT:smartBusinessEntityBindingSource1:BindTo = "QUERY":U.
        THIS-OBJECT:smartBusinessEntityBindingSource1:EntityName = "TrainingSamples.BusinessLogik.Order.OrderBusinessEntity":U.
        THIS-OBJECT:smartBusinessEntityBindingSource1:EntityTable = "eOrder":U.
        THIS-OBJECT:smartBusinessEntityBindingSource1:MaxDataGuess = 0.
        THIS-OBJECT:smartBusinessEntityBindingSource1:NoLOBs = FALSE.
        tableDesc2:ChildTables = ?.
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar0 AS Progress.Data.ColumnPropDesc EXTENT 15 NO-UNDO.
        arrayvar0[1] = NEW Progress.Data.ColumnPropDesc("Ordernum":U, "Order Num":U, Progress.Data.DataType:INTEGER).
        arrayvar0[2] = NEW Progress.Data.ColumnPropDesc("KlantenNo":U, "Cust Num":U, Progress.Data.DataType:INTEGER).
        arrayvar0[3] = NEW Progress.Data.ColumnPropDesc("OrderDate":U, "Ordered":U, Progress.Data.DataType:DATE).
        arrayvar0[4] = NEW Progress.Data.ColumnPropDesc("ShipDate":U, "Shipped":U, Progress.Data.DataType:DATE).
        arrayvar0[5] = NEW Progress.Data.ColumnPropDesc("PromiseDate":U, "Promised":U, Progress.Data.DataType:DATE).
        arrayvar0[6] = NEW Progress.Data.ColumnPropDesc("Carrier":U, "Carrier":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[7] = NEW Progress.Data.ColumnPropDesc("Instructions":U, "Instructions":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[8] = NEW Progress.Data.ColumnPropDesc("PO":U, "PO":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[9] = NEW Progress.Data.ColumnPropDesc("Terms":U, "Terms":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[10] = NEW Progress.Data.ColumnPropDesc("SalesRep":U, "Sales Rep":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[11] = NEW Progress.Data.ColumnPropDesc("BillToID":U, "Bill To ID":U, Progress.Data.DataType:INTEGER).
        arrayvar0[12] = NEW Progress.Data.ColumnPropDesc("ShipToID":U, "Ship To ID":U, Progress.Data.DataType:INTEGER).
        arrayvar0[13] = NEW Progress.Data.ColumnPropDesc("OrderStatus":U, "Order Status":U, Progress.Data.DataType:CHARACTER).
        arrayvar0[14] = NEW Progress.Data.ColumnPropDesc("WarehouseNum":U, "Warehouse Num":U, Progress.Data.DataType:INTEGER).
        arrayvar0[15] = NEW Progress.Data.ColumnPropDesc("Creditcard":U, "Credit Card":U, Progress.Data.DataType:CHARACTER).
        tableDesc2:Columns = arrayvar0.
        THIS-OBJECT:smartBusinessEntityBindingSource1:TableSchema = tableDesc2.
        /*  */
        /* eOrder_Ordernum_Label */
        /*  */
        appearance14:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eOrder_Ordernum_Label:Appearance = appearance14.
        THIS-OBJECT:eOrder_Ordernum_Label:AutoSize = TRUE.
        THIS-OBJECT:eOrder_Ordernum_Label:Location = NEW System.Drawing.Point(20, 24).
        THIS-OBJECT:eOrder_Ordernum_Label:Name = "eOrder_Ordernum_Label":U.
        THIS-OBJECT:eOrder_Ordernum_Label:Size = NEW System.Drawing.Size(63, 14).
        THIS-OBJECT:eOrder_Ordernum_Label:TabIndex = 1.
        THIS-OBJECT:eOrder_Ordernum_Label:Text = "Order Num:":U.
        /*  */
        /* eOrder_Ordernum */
        /*  */
        THIS-OBJECT:eOrder_Ordernum:DataBindings:Add(NEW System.Windows.Forms.Binding("Value":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "Ordernum":U, TRUE)).
        THIS-OBJECT:eOrder_Ordernum:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eOrder_Ordernum:Enabled = FALSE.
        THIS-OBJECT:eOrder_Ordernum:Location = NEW System.Drawing.Point(130, 20).
        THIS-OBJECT:eOrder_Ordernum:Name = "eOrder_Ordernum":U.
        THIS-OBJECT:eOrder_Ordernum:Size = NEW System.Drawing.Size(80, 21).
        THIS-OBJECT:eOrder_Ordernum:TabIndex = 2.
        /*  */
        /* eOrder_KlantenNo_Label */
        /*  */
        appearance15:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eOrder_KlantenNo_Label:Appearance = appearance15.
        THIS-OBJECT:eOrder_KlantenNo_Label:AutoSize = TRUE.
        THIS-OBJECT:eOrder_KlantenNo_Label:Location = NEW System.Drawing.Point(20, 50).
        THIS-OBJECT:eOrder_KlantenNo_Label:Name = "eOrder_KlantenNo_Label":U.
        THIS-OBJECT:eOrder_KlantenNo_Label:Size = NEW System.Drawing.Size(58, 14).
        THIS-OBJECT:eOrder_KlantenNo_Label:TabIndex = 3.
        THIS-OBJECT:eOrder_KlantenNo_Label:Text = "Cust Num:":U.
        /*  */
        /* eOrder_OrderDate_Label */
        /*  */
        appearance16:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eOrder_OrderDate_Label:Appearance = appearance16.
        THIS-OBJECT:eOrder_OrderDate_Label:AutoSize = TRUE.
        THIS-OBJECT:eOrder_OrderDate_Label:Location = NEW System.Drawing.Point(20, 76).
        THIS-OBJECT:eOrder_OrderDate_Label:Name = "eOrder_OrderDate_Label":U.
        THIS-OBJECT:eOrder_OrderDate_Label:Size = NEW System.Drawing.Size(49, 14).
        THIS-OBJECT:eOrder_OrderDate_Label:TabIndex = 5.
        THIS-OBJECT:eOrder_OrderDate_Label:Text = "Ordered:":U.
        /*  */
        /* eOrder_OrderDate */
        /*  */
        THIS-OBJECT:eOrder_OrderDate:AutoFillDate = Infragistics.Win.UltraWinMaskedEdit.AutoFillDate:MonthAndYear.
        THIS-OBJECT:eOrder_OrderDate:DataBindings:Add(NEW System.Windows.Forms.Binding("Value":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "OrderDate":U, TRUE)).
        THIS-OBJECT:eOrder_OrderDate:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eOrder_OrderDate:Location = NEW System.Drawing.Point(130, 72).
        THIS-OBJECT:eOrder_OrderDate:Name = "eOrder_OrderDate":U.
        THIS-OBJECT:eOrder_OrderDate:Size = NEW System.Drawing.Size(150, 21).
        THIS-OBJECT:eOrder_OrderDate:TabIndex = 6.
        /*  */
        /* eOrder_ShipDate_Label */
        /*  */
        appearance17:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eOrder_ShipDate_Label:Appearance = appearance17.
        THIS-OBJECT:eOrder_ShipDate_Label:AutoSize = TRUE.
        THIS-OBJECT:eOrder_ShipDate_Label:Location = NEW System.Drawing.Point(20, 102).
        THIS-OBJECT:eOrder_ShipDate_Label:Name = "eOrder_ShipDate_Label":U.
        THIS-OBJECT:eOrder_ShipDate_Label:Size = NEW System.Drawing.Size(49, 14).
        THIS-OBJECT:eOrder_ShipDate_Label:TabIndex = 7.
        THIS-OBJECT:eOrder_ShipDate_Label:Text = "Shipped:":U.
        /*  */
        /* eOrder_ShipDate */
        /*  */
        THIS-OBJECT:eOrder_ShipDate:AutoFillDate = Infragistics.Win.UltraWinMaskedEdit.AutoFillDate:MonthAndYear.
        THIS-OBJECT:eOrder_ShipDate:DataBindings:Add(NEW System.Windows.Forms.Binding("Value":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "ShipDate":U, TRUE)).
        THIS-OBJECT:eOrder_ShipDate:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eOrder_ShipDate:Location = NEW System.Drawing.Point(130, 98).
        THIS-OBJECT:eOrder_ShipDate:Name = "eOrder_ShipDate":U.
        THIS-OBJECT:eOrder_ShipDate:Size = NEW System.Drawing.Size(150, 21).
        THIS-OBJECT:eOrder_ShipDate:TabIndex = 8.
        /*  */
        /* eOrder_PromiseDate_Label */
        /*  */
        appearance18:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eOrder_PromiseDate_Label:Appearance = appearance18.
        THIS-OBJECT:eOrder_PromiseDate_Label:AutoSize = TRUE.
        THIS-OBJECT:eOrder_PromiseDate_Label:Location = NEW System.Drawing.Point(20, 286).
        THIS-OBJECT:eOrder_PromiseDate_Label:Name = "eOrder_PromiseDate_Label":U.
        THIS-OBJECT:eOrder_PromiseDate_Label:Size = NEW System.Drawing.Size(55, 14).
        THIS-OBJECT:eOrder_PromiseDate_Label:TabIndex = 9.
        THIS-OBJECT:eOrder_PromiseDate_Label:Text = "Promised:":U.
        /*  */
        /* eOrder_PromiseDate */
        /*  */
        THIS-OBJECT:eOrder_PromiseDate:AutoFillDate = Infragistics.Win.UltraWinMaskedEdit.AutoFillDate:MonthAndYear.
        THIS-OBJECT:eOrder_PromiseDate:DataBindings:Add(NEW System.Windows.Forms.Binding("Value":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "PromiseDate":U, TRUE)).
        THIS-OBJECT:eOrder_PromiseDate:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eOrder_PromiseDate:Location = NEW System.Drawing.Point(130, 282).
        THIS-OBJECT:eOrder_PromiseDate:Name = "eOrder_PromiseDate":U.
        THIS-OBJECT:eOrder_PromiseDate:Size = NEW System.Drawing.Size(150, 21).
        THIS-OBJECT:eOrder_PromiseDate:TabIndex = 10.
        /*  */
        /* eOrder_Carrier_Label */
        /*  */
        appearance19:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eOrder_Carrier_Label:Appearance = appearance19.
        THIS-OBJECT:eOrder_Carrier_Label:AutoSize = TRUE.
        THIS-OBJECT:eOrder_Carrier_Label:Location = NEW System.Drawing.Point(20, 312).
        THIS-OBJECT:eOrder_Carrier_Label:Name = "eOrder_Carrier_Label":U.
        THIS-OBJECT:eOrder_Carrier_Label:Size = NEW System.Drawing.Size(42, 14).
        THIS-OBJECT:eOrder_Carrier_Label:TabIndex = 11.
        THIS-OBJECT:eOrder_Carrier_Label:Text = "Carrier:":U.
        /*  */
        /* eOrder_Carrier */
        /*  */
        THIS-OBJECT:eOrder_Carrier:DataBindings:Add(NEW System.Windows.Forms.Binding("Text":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "Carrier":U, TRUE)).
        THIS-OBJECT:eOrder_Carrier:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eOrder_Carrier:Location = NEW System.Drawing.Point(130, 308).
        THIS-OBJECT:eOrder_Carrier:Name = "eOrder_Carrier":U.
        THIS-OBJECT:eOrder_Carrier:Size = NEW System.Drawing.Size(150, 21).
        THIS-OBJECT:eOrder_Carrier:TabIndex = 12.
        /*  */
        /* eOrder_Instructions_Label */
        /*  */
        appearance20:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eOrder_Instructions_Label:Appearance = appearance20.
        THIS-OBJECT:eOrder_Instructions_Label:AutoSize = TRUE.
        THIS-OBJECT:eOrder_Instructions_Label:Location = NEW System.Drawing.Point(20, 338).
        THIS-OBJECT:eOrder_Instructions_Label:Name = "eOrder_Instructions_Label":U.
        THIS-OBJECT:eOrder_Instructions_Label:Size = NEW System.Drawing.Size(65, 14).
        THIS-OBJECT:eOrder_Instructions_Label:TabIndex = 13.
        THIS-OBJECT:eOrder_Instructions_Label:Text = "Instructions:":U.
        /*  */
        /* eOrder_Instructions */
        /*  */
        THIS-OBJECT:eOrder_Instructions:DataBindings:Add(NEW System.Windows.Forms.Binding("Text":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "Instructions":U, TRUE)).
        THIS-OBJECT:eOrder_Instructions:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eOrder_Instructions:Location = NEW System.Drawing.Point(130, 334).
        THIS-OBJECT:eOrder_Instructions:Name = "eOrder_Instructions":U.
        THIS-OBJECT:eOrder_Instructions:Size = NEW System.Drawing.Size(150, 21).
        THIS-OBJECT:eOrder_Instructions:TabIndex = 14.
        /*  */
        /* eOrder_SalesRep_Label */
        /*  */
        appearance21:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eOrder_SalesRep_Label:Appearance = appearance21.
        THIS-OBJECT:eOrder_SalesRep_Label:AutoSize = TRUE.
        THIS-OBJECT:eOrder_SalesRep_Label:Location = NEW System.Drawing.Point(20, 129).
        THIS-OBJECT:eOrder_SalesRep_Label:Name = "eOrder_SalesRep_Label":U.
        THIS-OBJECT:eOrder_SalesRep_Label:Size = NEW System.Drawing.Size(60, 14).
        THIS-OBJECT:eOrder_SalesRep_Label:TabIndex = 15.
        THIS-OBJECT:eOrder_SalesRep_Label:Text = "&Sales Rep:":U.
        /*  */
        /* eOrder_SalesRep */
        /*  */
        THIS-OBJECT:eOrder_SalesRep:DataBindings:Add(NEW System.Windows.Forms.Binding("Value":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "SalesRep":U, TRUE)).
        THIS-OBJECT:eOrder_SalesRep:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eOrder_SalesRep:Location = NEW System.Drawing.Point(130, 125).
        THIS-OBJECT:eOrder_SalesRep:Name = "eOrder_SalesRep":U.
        THIS-OBJECT:eOrder_SalesRep:Size = NEW System.Drawing.Size(48, 21).
        THIS-OBJECT:eOrder_SalesRep:TabIndex = 16.
        /*  */
        /* eOrder_BillToID_Label */
        /*  */
        appearance22:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eOrder_BillToID_Label:Appearance = appearance22.
        THIS-OBJECT:eOrder_BillToID_Label:AutoSize = TRUE.
        THIS-OBJECT:eOrder_BillToID_Label:Location = NEW System.Drawing.Point(20, 155).
        THIS-OBJECT:eOrder_BillToID_Label:Name = "eOrder_BillToID_Label":U.
        THIS-OBJECT:eOrder_BillToID_Label:Size = NEW System.Drawing.Size(53, 14).
        THIS-OBJECT:eOrder_BillToID_Label:TabIndex = 17.
        THIS-OBJECT:eOrder_BillToID_Label:Text = "&Bill To ID:":U.
        /*  */
        /* eOrder_BillToID */
        /*  */
        THIS-OBJECT:eOrder_BillToID:DataBindings:Add(NEW System.Windows.Forms.Binding("Value":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "BillToID":U, TRUE)).
        THIS-OBJECT:eOrder_BillToID:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eOrder_BillToID:Location = NEW System.Drawing.Point(130, 151).
        THIS-OBJECT:eOrder_BillToID:Name = "eOrder_BillToID":U.
        THIS-OBJECT:eOrder_BillToID:Size = NEW System.Drawing.Size(78, 21).
        THIS-OBJECT:eOrder_BillToID:TabIndex = 18.
        /*  */
        /* eOrder_ShipToID_Label */
        /*  */
        appearance23:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eOrder_ShipToID_Label:Appearance = appearance23.
        THIS-OBJECT:eOrder_ShipToID_Label:AutoSize = TRUE.
        THIS-OBJECT:eOrder_ShipToID_Label:Location = NEW System.Drawing.Point(20, 181).
        THIS-OBJECT:eOrder_ShipToID_Label:Name = "eOrder_ShipToID_Label":U.
        THIS-OBJECT:eOrder_ShipToID_Label:Size = NEW System.Drawing.Size(61, 14).
        THIS-OBJECT:eOrder_ShipToID_Label:TabIndex = 19.
        THIS-OBJECT:eOrder_ShipToID_Label:Text = "&Ship To ID:":U.
        /*  */
        /* eOrder_ShipToID */
        /*  */
        THIS-OBJECT:eOrder_ShipToID:DataBindings:Add(NEW System.Windows.Forms.Binding("Value":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "ShipToID":U, TRUE)).
        THIS-OBJECT:eOrder_ShipToID:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eOrder_ShipToID:Location = NEW System.Drawing.Point(130, 177).
        THIS-OBJECT:eOrder_ShipToID:Name = "eOrder_ShipToID":U.
        THIS-OBJECT:eOrder_ShipToID:Size = NEW System.Drawing.Size(78, 21).
        THIS-OBJECT:eOrder_ShipToID:TabIndex = 20.
        /*  */
        /* eOrder_OrderStatus_Label */
        /*  */
        appearance24:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eOrder_OrderStatus_Label:Appearance = appearance24.
        THIS-OBJECT:eOrder_OrderStatus_Label:AutoSize = TRUE.
        THIS-OBJECT:eOrder_OrderStatus_Label:Location = NEW System.Drawing.Point(20, 207).
        THIS-OBJECT:eOrder_OrderStatus_Label:Name = "eOrder_OrderStatus_Label":U.
        THIS-OBJECT:eOrder_OrderStatus_Label:Size = NEW System.Drawing.Size(71, 14).
        THIS-OBJECT:eOrder_OrderStatus_Label:TabIndex = 21.
        THIS-OBJECT:eOrder_OrderStatus_Label:Text = "&Order Status:":U.
        /*  */
        /* eOrder_OrderStatus */
        /*  */
        THIS-OBJECT:eOrder_OrderStatus:DataBindings:Add(NEW System.Windows.Forms.Binding("Value":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "OrderStatus":U, TRUE)).
        THIS-OBJECT:eOrder_OrderStatus:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eOrder_OrderStatus:Location = NEW System.Drawing.Point(130, 203).
        THIS-OBJECT:eOrder_OrderStatus:Name = "eOrder_OrderStatus":U.
        THIS-OBJECT:eOrder_OrderStatus:Size = NEW System.Drawing.Size(110, 21).
        THIS-OBJECT:eOrder_OrderStatus:TabIndex = 22.
        /*  */
        /* eOrder_WarehouseNum_Label */
        /*  */
        appearance25:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eOrder_WarehouseNum_Label:Appearance = appearance25.
        THIS-OBJECT:eOrder_WarehouseNum_Label:AutoSize = TRUE.
        THIS-OBJECT:eOrder_WarehouseNum_Label:Location = NEW System.Drawing.Point(20, 233).
        THIS-OBJECT:eOrder_WarehouseNum_Label:Name = "eOrder_WarehouseNum_Label":U.
        THIS-OBJECT:eOrder_WarehouseNum_Label:Size = NEW System.Drawing.Size(92, 14).
        THIS-OBJECT:eOrder_WarehouseNum_Label:TabIndex = 23.
        THIS-OBJECT:eOrder_WarehouseNum_Label:Text = "&Warehouse Num:":U.
        /*  */
        /* eOrder_WarehouseNum */
        /*  */
        THIS-OBJECT:eOrder_WarehouseNum:DataBindings:Add(NEW System.Windows.Forms.Binding("Value":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "WarehouseNum":U, TRUE)).
        THIS-OBJECT:eOrder_WarehouseNum:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eOrder_WarehouseNum:Location = NEW System.Drawing.Point(130, 229).
        THIS-OBJECT:eOrder_WarehouseNum:Name = "eOrder_WarehouseNum":U.
        THIS-OBJECT:eOrder_WarehouseNum:Size = NEW System.Drawing.Size(78, 21).
        THIS-OBJECT:eOrder_WarehouseNum:TabIndex = 24.
        /*  */
        /* eOrder_Creditcard_Label */
        /*  */
        appearance26:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eOrder_Creditcard_Label:Appearance = appearance26.
        THIS-OBJECT:eOrder_Creditcard_Label:AutoSize = TRUE.
        THIS-OBJECT:eOrder_Creditcard_Label:Location = NEW System.Drawing.Point(20, 259).
        THIS-OBJECT:eOrder_Creditcard_Label:Name = "eOrder_Creditcard_Label":U.
        THIS-OBJECT:eOrder_Creditcard_Label:Size = NEW System.Drawing.Size(65, 14).
        THIS-OBJECT:eOrder_Creditcard_Label:TabIndex = 25.
        THIS-OBJECT:eOrder_Creditcard_Label:Text = "&Credit Card:":U.
        /*  */
        /* eOrder_Creditcard */
        /*  */
        THIS-OBJECT:eOrder_Creditcard:DataBindings:Add(NEW System.Windows.Forms.Binding("Value":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "Creditcard":U, TRUE)).
        THIS-OBJECT:eOrder_Creditcard:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eOrder_Creditcard:Location = NEW System.Drawing.Point(130, 255).
        THIS-OBJECT:eOrder_Creditcard:Name = "eOrder_Creditcard":U.
        THIS-OBJECT:eOrder_Creditcard:Size = NEW System.Drawing.Size(110, 21).
        THIS-OBJECT:eOrder_Creditcard:TabIndex = 26.
        /*  */
        /* smartBusinessEntityLookup1 */
        /*  */
        editorButton1:Key = "ShowLookupDialog":U.
        editorButton1:Text = "...":U.
        THIS-OBJECT:smartBusinessEntityLookup1:ButtonsRight:Add(editorButton1).
        THIS-OBJECT:smartBusinessEntityLookup1:DataBindings:Add(NEW System.Windows.Forms.Binding("Value":U, THIS-OBJECT:smartBusinessEntityBindingSource1, "KlantenNo":U, TRUE)).
        THIS-OBJECT:smartBusinessEntityLookup1:Location = NEW System.Drawing.Point(130, 46).
        THIS-OBJECT:smartBusinessEntityLookup1:LookupAdditionalFields = "":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupBrowserExcludeFields = "":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupBrowserFields = "CustNum,Name,City,Country":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupCascade = FALSE.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupControls = "":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupDialogClassName = "":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupDialogExpandLastColumn = TRUE.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupDialogFilterFields = "Name,Country,City":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupDialogFilterOperators = "BEGINSMATCHES,EQ,BEGINSMATCHES":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupDialogOpenQuery = TRUE.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupDialogQuerySort = "":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupDialogQueryString = "":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupDialogTitle = "Lookup":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupEntityName = "TrainingSamples.BusinessLogik.Customer.CustomerBusinessEntity":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupEntityTable = "eCustomer":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupEntityView = "":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupFields = "":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupKeyField = "CustNum":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupKeyValue = "":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupKeyValueColumn = "":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupQuerySort = "":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupQueryString = "FOR EACH eCustomer WHERE eCustomer.CustNum EQ ~"&1~"":U.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupTimerDelay = 750.
        THIS-OBJECT:smartBusinessEntityLookup1:LookupTimerDisabled = FALSE.
        THIS-OBJECT:smartBusinessEntityLookup1:Name = "smartBusinessEntityLookup1":U.
        THIS-OBJECT:smartBusinessEntityLookup1:OwningGrid = ?.
        THIS-OBJECT:smartBusinessEntityLookup1:Size = NEW System.Drawing.Size(150, 21).
        THIS-OBJECT:smartBusinessEntityLookup1:TabIndex = 27.
        /*  */
        /* OrderViewerControl */
        /*  */
        THIS-OBJECT:AutoScaleDimensions = NEW System.Drawing.SizeF(Progress.Util.CastUtil:ToSingle(6), Progress.Util.CastUtil:ToSingle(13)).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:smartBusinessEntityLookup1).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_Ordernum_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_Ordernum).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_KlantenNo_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_OrderDate_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_OrderDate).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_ShipDate_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_ShipDate).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_PromiseDate_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_PromiseDate).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_Carrier_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_Carrier).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_Instructions_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_Instructions).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_SalesRep_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_SalesRep).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_BillToID_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_BillToID).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_ShipToID_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_ShipToID).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_OrderStatus_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_OrderStatus).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_WarehouseNum_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_WarehouseNum).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_Creditcard_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eOrder_Creditcard).
        THIS-OBJECT:Name = "OrderViewerControl":U.
        THIS-OBJECT:Size = NEW System.Drawing.Size(539, 426).
        CAST(THIS-OBJECT:smartBusinessEntityBindingSource1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eOrder_Ordernum, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eOrder_OrderDate, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eOrder_ShipDate, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eOrder_PromiseDate, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eOrder_Carrier, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eOrder_Instructions, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eOrder_SalesRep, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eOrder_BillToID, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eOrder_ShipToID, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eOrder_OrderStatus, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eOrder_WarehouseNum, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eOrder_Creditcard, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:smartBusinessEntityLookup1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT, System.ComponentModel.ISupportInitialize):EndInit().
        THIS-OBJECT:ResumeLayout(FALSE).
        THIS-OBJECT:PerformLayout().
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.



    /*------------------------------------------------------------------------------
        Purpose: Destructor for the OrderViewerControl class
        Notes:   
    ------------------------------------------------------------------------------*/
    DESTRUCTOR PUBLIC OrderViewerControl ( ):

        IF VALID-OBJECT(components) THEN DO:
            CAST(components, System.IDisposable):Dispose().
        END.

    END DESTRUCTOR.

END CLASS.
