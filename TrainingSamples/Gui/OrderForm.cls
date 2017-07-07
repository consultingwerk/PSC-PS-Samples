/*------------------------------------------------------------------------
    File        : OrderForm
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Mike Fechner
    Created     : 07.07.2017 10:27:45
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING TrainingSamples.Gui.* FROM PROPATH .  
USING Consultingwerk.SmartComponents.Base.* FROM PROPATH .
USING Consultingwerk.Util.*                 FROM PROPATH .
USING Progress.Lang.*                       FROM PROPATH .

CLASS TrainingSamples.Gui.OrderForm INHERITS SmartWindowForm: 

    DEFINE PRIVATE VARIABLE orderViewerControl1 AS TrainingSamples.Gui.OrderViewerControl NO-UNDO.
    DEFINE PRIVATE VARIABLE m_OrderForm_Toolbars_Dock_Area_Top AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
    DEFINE PRIVATE VARIABLE m_OrderForm_Toolbars_Dock_Area_Right AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
    DEFINE PRIVATE VARIABLE m_OrderForm_Toolbars_Dock_Area_Left AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
    DEFINE PRIVATE VARIABLE m_OrderForm_Toolbars_Dock_Area_Bottom AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.
    DEFINE PRIVATE VARIABLE smartBusinessEntityBindingSource2 AS Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityBindingSource NO-UNDO.
    DEFINE PRIVATE VARIABLE smartDataBrowser1 AS Consultingwerk.SmartComponents.Implementation.SmartDataBrowser NO-UNDO.
    DEFINE PRIVATE VARIABLE smartBusinessEntityBindingSource1 AS Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityBindingSource NO-UNDO.
    DEFINE PRIVATE VARIABLE smartBusinessEntityAdapter1 AS Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityAdapter NO-UNDO.
    DEFINE PRIVATE VARIABLE smartDataBrowser2 AS Consultingwerk.SmartComponents.Implementation.SmartDataBrowser NO-UNDO.
    DEFINE PRIVATE VARIABLE smartDatasetChildAdapter1 AS Consultingwerk.SmartComponents.Implementation.SmartDatasetChildAdapter NO-UNDO.
    DEFINE PRIVATE VARIABLE smartToolbarController1 AS Consultingwerk.SmartComponents.Implementation.SmartToolbarController NO-UNDO.
    DEFINE PRIVATE VARIABLE OrderForm_Fill_Panel AS Infragistics.Win.Misc.UltraPanel NO-UNDO.
    DEFINE PRIVATE VARIABLE ultraSplitter1 AS Infragistics.Win.Misc.UltraSplitter NO-UNDO.
    DEFINE PRIVATE VARIABLE ultraTabSharedControlsPage1 AS Infragistics.Win.UltraWinTabControl.UltraTabSharedControlsPage NO-UNDO.
    DEFINE PRIVATE VARIABLE ultraTabPageControl2 AS Infragistics.Win.UltraWinTabControl.UltraTabPageControl NO-UNDO.
    DEFINE PRIVATE VARIABLE ultraTabPageControl1 AS Infragistics.Win.UltraWinTabControl.UltraTabPageControl NO-UNDO.
    DEFINE PRIVATE VARIABLE ultraTabControl1 AS Infragistics.Win.UltraWinTabControl.UltraTabControl NO-UNDO.
    
    /*------------------------------------------------------------------------------
        Purpose: Constructor for the OrderForm class                                                                        
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
	CONSTRUCTOR PUBLIC OrderForm ():
		
        SUPER().
        InitializeComponent().
        
        &IF NOT PROVERSION BEGINS "10.2":U AND NOT PROVERSION BEGINS "11.0" &THEN
        THIS-OBJECT:ComponentsCollection:Add (THIS-OBJECT:components).
        &ENDIF
        
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.

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
        DEFINE VARIABLE buttonTool1 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool1 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("Exit":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool2 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool2 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOAdd":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool3 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool3 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOUpdate":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool4 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool4 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOSave":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool5 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool5 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOCancel":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool6 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool6 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOCopy":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool7 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool7 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIODelete":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ribbonTab1 AS Infragistics.Win.UltraWinToolbars.RibbonTab NO-UNDO.
        ribbonTab1 = NEW Infragistics.Win.UltraWinToolbars.RibbonTab("start":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ribbonGroup1 AS Infragistics.Win.UltraWinToolbars.RibbonGroup NO-UNDO.
        ribbonGroup1 = NEW Infragistics.Win.UltraWinToolbars.RibbonGroup("navigation":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool8 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool8 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationFirst":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool9 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool9 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationPrev":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool10 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool10 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationNext":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool11 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool11 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationLast":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ribbonGroup2 AS Infragistics.Win.UltraWinToolbars.RibbonGroup NO-UNDO.
        ribbonGroup2 = NEW Infragistics.Win.UltraWinToolbars.RibbonGroup("maintenance":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool12 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool12 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOAdd":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool13 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool13 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOUpdate":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool14 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool14 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOSave":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool15 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool15 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOCancel":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool16 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool16 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOCopy":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool17 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool17 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIODelete":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool20 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool20 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationPrev":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool21 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool21 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationNext":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool22 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool22 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOSave":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraToolbar1 AS Infragistics.Win.UltraWinToolbars.UltraToolbar NO-UNDO.
        ultraToolbar1 = NEW Infragistics.Win.UltraWinToolbars.UltraToolbar("NavigationToolbar":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool23 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool23 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationFirst":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool24 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool24 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationPrev":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool25 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool25 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationNext":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool26 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool26 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationLast":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraToolbar2 AS Infragistics.Win.UltraWinToolbars.UltraToolbar NO-UNDO.
        ultraToolbar2 = NEW Infragistics.Win.UltraWinToolbars.UltraToolbar("TableIOToolbar":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool27 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool27 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOAdd":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool28 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool28 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOCopy":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool29 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool29 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOUpdate":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool30 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool30 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOSave":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool31 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool31 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOCancel":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool32 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool32 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIODelete":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraToolbar3 AS Infragistics.Win.UltraWinToolbars.UltraToolbar NO-UNDO.
        ultraToolbar3 = NEW Infragistics.Win.UltraWinToolbars.UltraToolbar("TransactionToolbar":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool33 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool33 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TransactionCommit":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool34 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool34 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TransactionUndo":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool35 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool35 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationFirst":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance25 AS Infragistics.Win.Appearance NO-UNDO.
        appearance25 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE resources AS Progress.Util.ResourceManager NO-UNDO.
        resources = NEW Progress.Util.ResourceManager("TrainingSamples.Gui.OrderForm":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool36 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool36 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationPrev":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance26 AS Infragistics.Win.Appearance NO-UNDO.
        appearance26 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool37 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool37 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationNext":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance27 AS Infragistics.Win.Appearance NO-UNDO.
        appearance27 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool38 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool38 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationLast":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance28 AS Infragistics.Win.Appearance NO-UNDO.
        appearance28 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool39 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool39 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOAdd":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance29 AS Infragistics.Win.Appearance NO-UNDO.
        appearance29 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool40 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool40 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOCopy":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance30 AS Infragistics.Win.Appearance NO-UNDO.
        appearance30 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool41 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool41 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOUpdate":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance31 AS Infragistics.Win.Appearance NO-UNDO.
        appearance31 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool42 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool42 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOSave":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance32 AS Infragistics.Win.Appearance NO-UNDO.
        appearance32 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool43 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool43 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOCancel":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance33 AS Infragistics.Win.Appearance NO-UNDO.
        appearance33 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool44 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool44 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIODelete":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance34 AS Infragistics.Win.Appearance NO-UNDO.
        appearance34 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool45 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool45 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("Exit":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance35 AS Infragistics.Win.Appearance NO-UNDO.
        appearance35 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool46 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool46 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TransactionCommit":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance36 AS Infragistics.Win.Appearance NO-UNDO.
        appearance36 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance37 AS Infragistics.Win.Appearance NO-UNDO.
        appearance37 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE buttonTool47 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool47 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TransactionUndo":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance38 AS Infragistics.Win.Appearance NO-UNDO.
        appearance38 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance39 AS Infragistics.Win.Appearance NO-UNDO.
        appearance39 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraTab1 AS Infragistics.Win.UltraWinTabControl.UltraTab NO-UNDO.
        ultraTab1 = NEW Infragistics.Win.UltraWinTabControl.UltraTab().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraTab2 AS Infragistics.Win.UltraWinTabControl.UltraTab NO-UNDO.
        ultraTab2 = NEW Infragistics.Win.UltraWinTabControl.UltraTab().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance13 AS Infragistics.Win.Appearance NO-UNDO.
        appearance13 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridBand2 AS Infragistics.Win.UltraWinGrid.UltraGridBand NO-UNDO.
        ultraGridBand2 = NEW Infragistics.Win.UltraWinGrid.UltraGridBand("eOrder":U, -1).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn1 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn1 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Ordernum":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn2 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn2 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("KlantenNo":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn3 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn3 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("OrderDate":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn4 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn4 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("ShipDate":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn5 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn5 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("PromiseDate":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn6 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn6 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Carrier":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn7 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn7 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Instructions":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn8 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn8 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("PO":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn9 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn9 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Terms":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn10 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn10 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("SalesRep":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn11 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn11 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("BillToID":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn12 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn12 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("ShipToID":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn13 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn13 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("OrderStatus":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn14 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn14 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("WarehouseNum":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn15 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn15 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Creditcard":U).
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
        DEFINE VARIABLE tableDesc2 AS Progress.Data.TableDesc NO-UNDO.
        tableDesc2 = NEW Progress.Data.TableDesc("eOrder":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE tableDesc1 AS Progress.Data.TableDesc NO-UNDO.
        tableDesc1 = NEW Progress.Data.TableDesc("eOrderLine":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE appearance1 AS Infragistics.Win.Appearance NO-UNDO.
        appearance1 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridBand1 AS Infragistics.Win.UltraWinGrid.UltraGridBand NO-UNDO.
        ultraGridBand1 = NEW Infragistics.Win.UltraWinGrid.UltraGridBand("eOrderLine":U, -1).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn16 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn16 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Ordernum":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn17 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn17 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Linenum":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn18 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn18 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Itemnum":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn19 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn19 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Price":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn20 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn20 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Qty":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn21 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn21 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Discount":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn22 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn22 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("ExtendedPrice":U).
        @VisualDesigner.FormMember (NeedsInitialize="true":U).
        DEFINE VARIABLE ultraGridColumn23 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn23 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("OrderLineStatus":U).
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
        THIS-OBJECT:ultraTabPageControl1 = NEW Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
        THIS-OBJECT:orderViewerControl1 = NEW TrainingSamples.Gui.OrderViewerControl().
        THIS-OBJECT:smartBusinessEntityAdapter1 = NEW Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityAdapter(THIS-OBJECT:components).
        THIS-OBJECT:smartToolbarController1 = NEW Consultingwerk.SmartComponents.Implementation.SmartToolbarController(THIS-OBJECT:components).
        THIS-OBJECT:ultraTabPageControl2 = NEW Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
        THIS-OBJECT:OrderForm_Fill_Panel = NEW Infragistics.Win.Misc.UltraPanel().
        THIS-OBJECT:ultraTabControl1 = NEW Infragistics.Win.UltraWinTabControl.UltraTabControl().
        THIS-OBJECT:ultraTabSharedControlsPage1 = NEW Infragistics.Win.UltraWinTabControl.UltraTabSharedControlsPage().
        THIS-OBJECT:ultraSplitter1 = NEW Infragistics.Win.Misc.UltraSplitter().
        THIS-OBJECT:smartDataBrowser1 = NEW Consultingwerk.SmartComponents.Implementation.SmartDataBrowser().
        THIS-OBJECT:smartBusinessEntityBindingSource1 = NEW Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityBindingSource(THIS-OBJECT:components).
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Left = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Right = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Top = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Bottom = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
        THIS-OBJECT:smartDatasetChildAdapter1 = NEW Consultingwerk.SmartComponents.Implementation.SmartDatasetChildAdapter(THIS-OBJECT:components).
        THIS-OBJECT:smartBusinessEntityBindingSource2 = NEW Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityBindingSource(THIS-OBJECT:components).
        THIS-OBJECT:smartDataBrowser2 = NEW Consultingwerk.SmartComponents.Implementation.SmartDataBrowser().
        THIS-OBJECT:ultraTabPageControl1:SuspendLayout().
        CAST(THIS-OBJECT:orderViewerControl1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:smartBusinessEntityAdapter1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:smartToolbarController1, System.ComponentModel.ISupportInitialize):BeginInit().
        THIS-OBJECT:ultraTabPageControl2:SuspendLayout().
        THIS-OBJECT:OrderForm_Fill_Panel:ClientArea:SuspendLayout().
        THIS-OBJECT:OrderForm_Fill_Panel:SuspendLayout().
        CAST(THIS-OBJECT:ultraTabControl1, System.ComponentModel.ISupportInitialize):BeginInit().
        THIS-OBJECT:ultraTabControl1:SuspendLayout().
        CAST(THIS-OBJECT:smartDataBrowser1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:smartBusinessEntityBindingSource1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:smartDatasetChildAdapter1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:smartBusinessEntityBindingSource2, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:smartDataBrowser2, System.ComponentModel.ISupportInitialize):BeginInit().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* ultraTabPageControl1 */
        /*  */
        THIS-OBJECT:ultraTabPageControl1:Controls:Add(THIS-OBJECT:orderViewerControl1).
        THIS-OBJECT:ultraTabPageControl1:Location = NEW System.Drawing.Point(-10000, -10000).
        THIS-OBJECT:ultraTabPageControl1:Name = "ultraTabPageControl1":U.
        THIS-OBJECT:ultraTabPageControl1:Size = NEW System.Drawing.Size(410, 296).
        /*  */
        /* orderViewerControl1 */
        /*  */
        THIS-OBJECT:orderViewerControl1:AutoScroll = TRUE.
        THIS-OBJECT:orderViewerControl1:Dock = System.Windows.Forms.DockStyle:Fill.
        THIS-OBJECT:orderViewerControl1:FocusControlOnAdd = ?.
        THIS-OBJECT:orderViewerControl1:FocusControlOnUpdate = ?.
        THIS-OBJECT:orderViewerControl1:LinkDataSource = THIS-OBJECT:smartBusinessEntityAdapter1.
        THIS-OBJECT:orderViewerControl1:LinkGroupAssignSource = ?.
        THIS-OBJECT:orderViewerControl1:LinkTableIOSource = THIS-OBJECT:smartToolbarController1.
        THIS-OBJECT:orderViewerControl1:Location = NEW System.Drawing.Point(0, 0).
        THIS-OBJECT:orderViewerControl1:Name = "orderViewerControl1":U.
        THIS-OBJECT:orderViewerControl1:Size = NEW System.Drawing.Size(410, 296).
        THIS-OBJECT:orderViewerControl1:TabIndex = 5.
        /*  */
        /* smartBusinessEntityAdapter1 */
        /*  */
        THIS-OBJECT:smartBusinessEntityAdapter1:DatasetControllerType = "TrainingSamples.BusinessLogik.Order.OrderDatasetController":U.
        THIS-OBJECT:smartBusinessEntityAdapter1:EntityJoin = "NO":U.
        THIS-OBJECT:smartBusinessEntityAdapter1:EntityName = "TrainingSamples.BusinessLogik.Order.OrderBusinessEntity":U.
        THIS-OBJECT:smartBusinessEntityAdapter1:EntityTable = "eOrder":U.
        THIS-OBJECT:smartBusinessEntityAdapter1:EntityView = "eOrderLine":U.
        THIS-OBJECT:smartBusinessEntityAdapter1:FetchLastOnServer = TRUE.
        THIS-OBJECT:smartBusinessEntityAdapter1:ForeignFields = "":U.
        THIS-OBJECT:smartBusinessEntityAdapter1:LinkCommitSource = ?.
        THIS-OBJECT:smartBusinessEntityAdapter1:LinkDataSource = ?.
        THIS-OBJECT:smartBusinessEntityAdapter1:LinkNavigationSource = THIS-OBJECT:smartToolbarController1.
        THIS-OBJECT:smartBusinessEntityAdapter1:NonUpdatableColumns = "":U.
        THIS-OBJECT:smartBusinessEntityAdapter1:QuerySort = "":U.
        THIS-OBJECT:smartBusinessEntityAdapter1:ThrowErrorsFromRetrieveData = FALSE.
        /*  */
        /* smartToolbarController1 */
        /*  */
        THIS-OBJECT:smartToolbarController1:DesignerFlags = 1.
        THIS-OBJECT:smartToolbarController1:DockWithinContainer = THIS-OBJECT.
        THIS-OBJECT:smartToolbarController1:DockWithinContainerBaseType = Progress.Util.TypeHelper:GetType("Consultingwerk.SmartComponents.Base.SmartWindowForm":U).
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar0 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 1 NO-UNDO.
        arrayvar0[1] = buttonTool1.
        THIS-OBJECT:smartToolbarController1:Ribbon:ApplicationMenu:FooterToolbar:NonInheritedTools:AddRange(arrayvar0).
        buttonTool5:InstanceProps:IsFirstInGroup = TRUE.
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar1 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 6 NO-UNDO.
        arrayvar1[1] = buttonTool2.
        arrayvar1[2] = buttonTool3.
        arrayvar1[3] = buttonTool4.
        arrayvar1[4] = buttonTool5.
        arrayvar1[5] = buttonTool6.
        arrayvar1[6] = buttonTool7.
        THIS-OBJECT:smartToolbarController1:Ribbon:ApplicationMenu:ToolAreaLeft:NonInheritedTools:AddRange(arrayvar1).
        ribbonTab1:Caption = "Start":U.
        ribbonGroup1:Caption = "Navigation":U.
        buttonTool8:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool8:InstanceProps:PreferredSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:Large.
        buttonTool9:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool9:InstanceProps:PreferredSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:Large.
        buttonTool10:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool10:InstanceProps:PreferredSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:Large.
        buttonTool11:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool11:InstanceProps:PreferredSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:Large.
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar2 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 4 NO-UNDO.
        arrayvar2[1] = buttonTool8.
        arrayvar2[2] = buttonTool9.
        arrayvar2[3] = buttonTool10.
        arrayvar2[4] = buttonTool11.
        ribbonGroup1:Tools:AddRange(arrayvar2).
        ribbonGroup2:Caption = "Maintenance":U.
        buttonTool12:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool12:InstanceProps:PreferredSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:Large.
        buttonTool13:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool13:InstanceProps:PreferredSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:Large.
        buttonTool14:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool14:InstanceProps:PreferredSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:Large.
        buttonTool15:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool16:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool17:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar3 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 6 NO-UNDO.
        arrayvar3[1] = buttonTool12.
        arrayvar3[2] = buttonTool13.
        arrayvar3[3] = buttonTool14.
        arrayvar3[4] = buttonTool15.
        arrayvar3[5] = buttonTool16.
        arrayvar3[6] = buttonTool17.
        ribbonGroup2:Tools:AddRange(arrayvar3).
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar4 AS Infragistics.Win.UltraWinToolbars.RibbonGroup EXTENT 2 NO-UNDO.
        arrayvar4[1] = ribbonGroup1.
        arrayvar4[2] = ribbonGroup2.
        ribbonTab1:Groups:AddRange(arrayvar4).
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar5 AS Infragistics.Win.UltraWinToolbars.RibbonTab EXTENT 1 NO-UNDO.
        arrayvar5[1] = ribbonTab1.
        THIS-OBJECT:smartToolbarController1:Ribbon:NonInheritedRibbonTabs:AddRange(arrayvar5).
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar6 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 3 NO-UNDO.
        arrayvar6[1] = buttonTool20.
        arrayvar6[2] = buttonTool21.
        arrayvar6[3] = buttonTool22.
        THIS-OBJECT:smartToolbarController1:Ribbon:QuickAccessToolbar:NonInheritedTools:AddRange(arrayvar6).
        THIS-OBJECT:smartToolbarController1:Ribbon:Visible = TRUE.
        THIS-OBJECT:smartToolbarController1:ShowFullMenusDelay = 500.
        THIS-OBJECT:smartToolbarController1:Style = Infragistics.Win.UltraWinToolbars.ToolbarStyle:Office2010.
        ultraToolbar1:DockedColumn = 0.
        ultraToolbar1:DockedRow = 0.
        buttonTool23:InstanceProps:IsFirstInGroup = TRUE.
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar7 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 4 NO-UNDO.
        arrayvar7[1] = buttonTool23.
        arrayvar7[2] = buttonTool24.
        arrayvar7[3] = buttonTool25.
        arrayvar7[4] = buttonTool26.
        ultraToolbar1:NonInheritedTools:AddRange(arrayvar7).
        ultraToolbar1:Text = "Navigation Toolbar":U.
        ultraToolbar2:DockedColumn = 0.
        ultraToolbar2:DockedRow = 1.
        buttonTool27:InstanceProps:IsFirstInGroup = TRUE.
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar8 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 6 NO-UNDO.
        arrayvar8[1] = buttonTool27.
        arrayvar8[2] = buttonTool28.
        arrayvar8[3] = buttonTool29.
        arrayvar8[4] = buttonTool30.
        arrayvar8[5] = buttonTool31.
        arrayvar8[6] = buttonTool32.
        ultraToolbar2:NonInheritedTools:AddRange(arrayvar8).
        ultraToolbar2:Text = "TableIO Toolbar":U.
        ultraToolbar3:DockedColumn = 1.
        ultraToolbar3:DockedRow = 1.
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar9 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 2 NO-UNDO.
        arrayvar9[1] = buttonTool33.
        arrayvar9[2] = buttonTool34.
        ultraToolbar3:NonInheritedTools:AddRange(arrayvar9).
        ultraToolbar3:Text = "Transaction Toolbar":U.
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar10 AS Infragistics.Win.UltraWinToolbars.UltraToolbar EXTENT 3 NO-UNDO.
        arrayvar10[1] = ultraToolbar1.
        arrayvar10[2] = ultraToolbar2.
        arrayvar10[3] = ultraToolbar3.
        THIS-OBJECT:smartToolbarController1:Toolbars:AddRange(arrayvar10).
        appearance25:Image = CAST(resources:GetObject("appearance25.Image":U), System.Object).
        buttonTool35:SharedPropsInternal:AppearancesSmall:Appearance = appearance25.
        buttonTool35:SharedPropsInternal:Caption = "First record":U.
        buttonTool35:SharedPropsInternal:CustomizerCaption = "First":U.
        buttonTool35:SharedPropsInternal:Enabled = FALSE.
        buttonTool35:SharedPropsInternal:ToolTipText = "First record":U.
        appearance26:Image = CAST(resources:GetObject("appearance26.Image":U), System.Object).
        buttonTool36:SharedPropsInternal:AppearancesSmall:Appearance = appearance26.
        buttonTool36:SharedPropsInternal:Caption = "Previous record":U.
        buttonTool36:SharedPropsInternal:CustomizerCaption = "Previous":U.
        buttonTool36:SharedPropsInternal:Enabled = FALSE.
        buttonTool36:SharedPropsInternal:ToolTipText = "Previous record":U.
        appearance27:Image = CAST(resources:GetObject("appearance27.Image":U), System.Object).
        buttonTool37:SharedPropsInternal:AppearancesSmall:Appearance = appearance27.
        buttonTool37:SharedPropsInternal:Caption = "Next record":U.
        buttonTool37:SharedPropsInternal:CustomizerCaption = "Next":U.
        buttonTool37:SharedPropsInternal:Enabled = FALSE.
        buttonTool37:SharedPropsInternal:ToolTipText = "Next record":U.
        appearance28:Image = CAST(resources:GetObject("appearance28.Image":U), System.Object).
        buttonTool38:SharedPropsInternal:AppearancesSmall:Appearance = appearance28.
        buttonTool38:SharedPropsInternal:Caption = "Last record":U.
        buttonTool38:SharedPropsInternal:CustomizerCaption = "Last":U.
        buttonTool38:SharedPropsInternal:Enabled = FALSE.
        buttonTool38:SharedPropsInternal:ToolTipText = "Last record":U.
        appearance29:Image = CAST(resources:GetObject("appearance29.Image":U), System.Object).
        buttonTool39:SharedPropsInternal:AppearancesSmall:Appearance = appearance29.
        buttonTool39:SharedPropsInternal:Caption = "Add record":U.
        buttonTool39:SharedPropsInternal:CustomizerCaption = "Add":U.
        buttonTool39:SharedPropsInternal:Enabled = FALSE.
        buttonTool39:SharedPropsInternal:ToolTipText = "Add record":U.
        appearance30:Image = CAST(resources:GetObject("appearance30.Image":U), System.Object).
        buttonTool40:SharedPropsInternal:AppearancesSmall:Appearance = appearance30.
        buttonTool40:SharedPropsInternal:Caption = "Copy record":U.
        buttonTool40:SharedPropsInternal:CustomizerCaption = "Copy":U.
        buttonTool40:SharedPropsInternal:Enabled = FALSE.
        buttonTool40:SharedPropsInternal:ToolTipText = "Copy record":U.
        appearance31:Image = CAST(resources:GetObject("appearance31.Image":U), System.Object).
        buttonTool41:SharedPropsInternal:AppearancesSmall:Appearance = appearance31.
        buttonTool41:SharedPropsInternal:Caption = "Update record":U.
        buttonTool41:SharedPropsInternal:CustomizerCaption = "Update":U.
        buttonTool41:SharedPropsInternal:Enabled = FALSE.
        buttonTool41:SharedPropsInternal:ToolTipText = "Update record":U.
        appearance32:Image = CAST(resources:GetObject("appearance32.Image":U), System.Object).
        buttonTool42:SharedPropsInternal:AppearancesSmall:Appearance = appearance32.
        buttonTool42:SharedPropsInternal:Caption = "Save changes":U.
        buttonTool42:SharedPropsInternal:CustomizerCaption = "Save":U.
        buttonTool42:SharedPropsInternal:Enabled = FALSE.
        buttonTool42:SharedPropsInternal:ToolTipText = "Save changes":U.
        appearance33:Image = CAST(resources:GetObject("appearance33.Image":U), System.Object).
        buttonTool43:SharedPropsInternal:AppearancesSmall:Appearance = appearance33.
        buttonTool43:SharedPropsInternal:Caption = "Cancel update":U.
        buttonTool43:SharedPropsInternal:CustomizerCaption = "Cancel":U.
        buttonTool43:SharedPropsInternal:Enabled = FALSE.
        buttonTool43:SharedPropsInternal:ToolTipText = "Cancel update":U.
        appearance34:Image = CAST(resources:GetObject("appearance34.Image":U), System.Object).
        buttonTool44:SharedPropsInternal:AppearancesSmall:Appearance = appearance34.
        buttonTool44:SharedPropsInternal:Caption = "Delete record":U.
        buttonTool44:SharedPropsInternal:CustomizerCaption = "Delete":U.
        buttonTool44:SharedPropsInternal:Enabled = FALSE.
        buttonTool44:SharedPropsInternal:ToolTipText = "Delete record":U.
        appearance35:Image = CAST(resources:GetObject("appearance35.Image":U), System.Object).
        buttonTool45:SharedPropsInternal:AppearancesSmall:Appearance = appearance35.
        buttonTool45:SharedPropsInternal:Caption = "&Exit":U.
        buttonTool45:SharedPropsInternal:DisplayStyle = Infragistics.Win.UltraWinToolbars.ToolDisplayStyle:ImageAndText.
        appearance36:Image = CAST(resources:GetObject("appearance36.Image":U), System.Object).
        buttonTool46:SharedPropsInternal:AppearancesLarge:Appearance = appearance36.
        appearance37:Image = CAST(resources:GetObject("appearance37.Image":U), System.Object).
        buttonTool46:SharedPropsInternal:AppearancesSmall:Appearance = appearance37.
        buttonTool46:SharedPropsInternal:Caption = "Commit":U.
        buttonTool46:SharedPropsInternal:CustomizerCaption = "Commit":U.
        buttonTool46:SharedPropsInternal:Enabled = FALSE.
        buttonTool46:SharedPropsInternal:ToolTipText = "Commit transaction":U.
        appearance38:Image = CAST(resources:GetObject("appearance38.Image":U), System.Object).
        buttonTool47:SharedPropsInternal:AppearancesLarge:Appearance = appearance38.
        appearance39:Image = CAST(resources:GetObject("appearance39.Image":U), System.Object).
        buttonTool47:SharedPropsInternal:AppearancesSmall:Appearance = appearance39.
        buttonTool47:SharedPropsInternal:Caption = "Revert":U.
        buttonTool47:SharedPropsInternal:CustomizerCaption = "Revert":U.
        buttonTool47:SharedPropsInternal:Enabled = FALSE.
        buttonTool47:SharedPropsInternal:ToolTipText = "Revert transaction":U.
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar11 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 13 NO-UNDO.
        arrayvar11[1] = buttonTool35.
        arrayvar11[2] = buttonTool36.
        arrayvar11[3] = buttonTool37.
        arrayvar11[4] = buttonTool38.
        arrayvar11[5] = buttonTool39.
        arrayvar11[6] = buttonTool40.
        arrayvar11[7] = buttonTool41.
        arrayvar11[8] = buttonTool42.
        arrayvar11[9] = buttonTool43.
        arrayvar11[10] = buttonTool44.
        arrayvar11[11] = buttonTool45.
        arrayvar11[12] = buttonTool46.
        arrayvar11[13] = buttonTool47.
        THIS-OBJECT:smartToolbarController1:Tools:AddRange(arrayvar11).
        /*  */
        /* ultraTabPageControl2 */
        /*  */
        THIS-OBJECT:ultraTabPageControl2:Controls:Add(THIS-OBJECT:smartDataBrowser2).
        THIS-OBJECT:ultraTabPageControl2:Location = NEW System.Drawing.Point(1, 23).
        THIS-OBJECT:ultraTabPageControl2:Name = "ultraTabPageControl2":U.
        THIS-OBJECT:ultraTabPageControl2:Size = NEW System.Drawing.Size(410, 296).
        /*  */
        /* OrderForm_Fill_Panel */
        /*  */
        /*  */
        /* OrderForm_Fill_Panel.ClientArea */
        /*  */
        THIS-OBJECT:OrderForm_Fill_Panel:ClientArea:Controls:Add(THIS-OBJECT:ultraTabControl1).
        THIS-OBJECT:OrderForm_Fill_Panel:ClientArea:Controls:Add(THIS-OBJECT:ultraSplitter1).
        THIS-OBJECT:OrderForm_Fill_Panel:ClientArea:Controls:Add(THIS-OBJECT:smartDataBrowser1).
        THIS-OBJECT:OrderForm_Fill_Panel:Cursor = System.Windows.Forms.Cursors:Default.
        THIS-OBJECT:OrderForm_Fill_Panel:Dock = System.Windows.Forms.DockStyle:Fill.
        THIS-OBJECT:OrderForm_Fill_Panel:Location = NEW System.Drawing.Point(8, 149).
        THIS-OBJECT:OrderForm_Fill_Panel:Name = "OrderForm_Fill_Panel":U.
        THIS-OBJECT:OrderForm_Fill_Panel:Size = NEW System.Drawing.Size(727, 322).
        THIS-OBJECT:OrderForm_Fill_Panel:TabIndex = 0.
        /*  */
        /* ultraTabControl1 */
        /*  */
        THIS-OBJECT:ultraTabControl1:Controls:Add(THIS-OBJECT:ultraTabSharedControlsPage1).
        THIS-OBJECT:ultraTabControl1:Controls:Add(THIS-OBJECT:ultraTabPageControl1).
        THIS-OBJECT:ultraTabControl1:Controls:Add(THIS-OBJECT:ultraTabPageControl2).
        THIS-OBJECT:ultraTabControl1:Dock = System.Windows.Forms.DockStyle:Fill.
        THIS-OBJECT:ultraTabControl1:Location = NEW System.Drawing.Point(313, 0).
        THIS-OBJECT:ultraTabControl1:Name = "ultraTabControl1":U.
        THIS-OBJECT:ultraTabControl1:SharedControlsPage = THIS-OBJECT:ultraTabSharedControlsPage1.
        THIS-OBJECT:ultraTabControl1:Size = NEW System.Drawing.Size(414, 322).
        THIS-OBJECT:ultraTabControl1:TabIndex = 7.
        ultraTab1:TabPage = THIS-OBJECT:ultraTabPageControl1.
        ultraTab1:Text = "Order Header":U.
        ultraTab2:TabPage = THIS-OBJECT:ultraTabPageControl2.
        ultraTab2:Text = "Order Lines":U.
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar12 AS Infragistics.Win.UltraWinTabControl.UltraTab EXTENT 2 NO-UNDO.
        arrayvar12[1] = ultraTab1.
        arrayvar12[2] = ultraTab2.
        THIS-OBJECT:ultraTabControl1:Tabs:AddRange(arrayvar12).
        /*  */
        /* ultraTabSharedControlsPage1 */
        /*  */
        THIS-OBJECT:ultraTabSharedControlsPage1:Location = NEW System.Drawing.Point(-10000, -10000).
        THIS-OBJECT:ultraTabSharedControlsPage1:Name = "ultraTabSharedControlsPage1":U.
        THIS-OBJECT:ultraTabSharedControlsPage1:Size = NEW System.Drawing.Size(410, 296).
        /*  */
        /* ultraSplitter1 */
        /*  */
        THIS-OBJECT:ultraSplitter1:Location = NEW System.Drawing.Point(307, 0).
        THIS-OBJECT:ultraSplitter1:Name = "ultraSplitter1":U.
        THIS-OBJECT:ultraSplitter1:RestoreExtent = 307.
        THIS-OBJECT:ultraSplitter1:Size = NEW System.Drawing.Size(6, 322).
        THIS-OBJECT:ultraSplitter1:TabIndex = 6.
        /*  */
        /* smartDataBrowser1 */
        /*  */
        THIS-OBJECT:smartDataBrowser1:DataSource = THIS-OBJECT:smartBusinessEntityBindingSource1.
        appearance13:BackColor = System.Drawing.SystemColors:Window.
        appearance13:BorderColor = System.Drawing.SystemColors:InactiveCaption.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Appearance = appearance13.
        ultraGridColumn1:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn1:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:GreaterThanOrEqualTo.
        ultraGridColumn1:Header:Caption = "Order Num ":U.
        ultraGridColumn1:Header:VisiblePosition = 0.
        ultraGridColumn2:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn2:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:GreaterThanOrEqualTo.
        ultraGridColumn2:Header:Caption = "Cust Num ":U.
        ultraGridColumn2:Header:VisiblePosition = 1.
        ultraGridColumn3:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn3:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:GreaterThanOrEqualTo.
        ultraGridColumn3:Header:Caption = "Ordered ":U.
        ultraGridColumn3:Header:VisiblePosition = 2.
        ultraGridColumn4:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn4:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:GreaterThanOrEqualTo.
        ultraGridColumn4:Header:Caption = "Shipped ":U.
        ultraGridColumn4:Header:VisiblePosition = 3.
        ultraGridColumn5:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn5:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:GreaterThanOrEqualTo.
        ultraGridColumn5:Header:Caption = "Promised ":U.
        ultraGridColumn5:Header:VisiblePosition = 4.
        ultraGridColumn6:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn6:Header:Caption = "Carrier ":U.
        ultraGridColumn6:Header:VisiblePosition = 5.
        ultraGridColumn6:Hidden = TRUE.
        ultraGridColumn7:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn7:Header:Caption = "Instructions ":U.
        ultraGridColumn7:Header:VisiblePosition = 6.
        ultraGridColumn7:Hidden = TRUE.
        ultraGridColumn8:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn8:Header:Caption = "PO ":U.
        ultraGridColumn8:Header:VisiblePosition = 7.
        ultraGridColumn8:Hidden = TRUE.
        ultraGridColumn9:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn9:Header:Caption = "Terms ":U.
        ultraGridColumn9:Header:VisiblePosition = 8.
        ultraGridColumn9:Hidden = TRUE.
        ultraGridColumn10:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn10:Header:Caption = "Sales Rep ":U.
        ultraGridColumn10:Header:VisiblePosition = 9.
        ultraGridColumn10:Hidden = TRUE.
        ultraGridColumn11:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn11:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:GreaterThanOrEqualTo.
        ultraGridColumn11:Header:Caption = "Bill To ID ":U.
        ultraGridColumn11:Header:VisiblePosition = 10.
        ultraGridColumn11:Hidden = TRUE.
        ultraGridColumn12:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn12:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:GreaterThanOrEqualTo.
        ultraGridColumn12:Header:Caption = "Ship To ID ":U.
        ultraGridColumn12:Header:VisiblePosition = 11.
        ultraGridColumn12:Hidden = TRUE.
        ultraGridColumn13:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn13:Header:Caption = "Order Status ":U.
        ultraGridColumn13:Header:VisiblePosition = 12.
        ultraGridColumn13:Hidden = TRUE.
        ultraGridColumn14:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn14:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:GreaterThanOrEqualTo.
        ultraGridColumn14:Header:Caption = "Warehouse Num ":U.
        ultraGridColumn14:Header:VisiblePosition = 13.
        ultraGridColumn14:Hidden = TRUE.
        ultraGridColumn15:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn15:Header:Caption = "Credit Card ":U.
        ultraGridColumn15:Header:VisiblePosition = 14.
        ultraGridColumn15:Hidden = TRUE.
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar13 AS System.Object EXTENT 15 NO-UNDO.
        arrayvar13[1] = ultraGridColumn1.
        arrayvar13[2] = ultraGridColumn2.
        arrayvar13[3] = ultraGridColumn3.
        arrayvar13[4] = ultraGridColumn4.
        arrayvar13[5] = ultraGridColumn5.
        arrayvar13[6] = ultraGridColumn6.
        arrayvar13[7] = ultraGridColumn7.
        arrayvar13[8] = ultraGridColumn8.
        arrayvar13[9] = ultraGridColumn9.
        arrayvar13[10] = ultraGridColumn10.
        arrayvar13[11] = ultraGridColumn11.
        arrayvar13[12] = ultraGridColumn12.
        arrayvar13[13] = ultraGridColumn13.
        arrayvar13[14] = ultraGridColumn14.
        arrayvar13[15] = ultraGridColumn15.
        ultraGridBand2:Columns:AddRange(arrayvar13).
        ultraGridBand2:Override:AllowDelete = Infragistics.Win.DefaultableBoolean:False.
        ultraGridBand2:Override:SelectTypeCell = Infragistics.Win.UltraWinGrid.SelectType:None.
        ultraGridBand2:Override:SelectTypeCol = Infragistics.Win.UltraWinGrid.SelectType:None.
        ultraGridBand2:Override:SelectTypeRow = Infragistics.Win.UltraWinGrid.SelectType:SingleAutoDrag.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:BandsSerializer:Add(ultraGridBand2).
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:BorderStyle = Infragistics.Win.UIElementBorderStyle:Solid.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:CaptionVisible = Infragistics.Win.DefaultableBoolean:False.
        appearance14:BackColor = System.Drawing.SystemColors:ActiveBorder.
        appearance14:BackColor2 = System.Drawing.SystemColors:ControlDark.
        appearance14:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
        appearance14:BorderColor = System.Drawing.SystemColors:Window.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:GroupByBox:Appearance = appearance14.
        appearance15:ForeColor = System.Drawing.SystemColors:GrayText.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:GroupByBox:BandLabelAppearance = appearance15.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:GroupByBox:BorderStyle = Infragistics.Win.UIElementBorderStyle:Solid.
        appearance16:BackColor = System.Drawing.SystemColors:ControlLightLight.
        appearance16:BackColor2 = System.Drawing.SystemColors:Control.
        appearance16:BackGradientStyle = Infragistics.Win.GradientStyle:Horizontal.
        appearance16:ForeColor = System.Drawing.SystemColors:GrayText.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:GroupByBox:PromptAppearance = appearance16.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:MaxColScrollRegions = 1.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:MaxRowScrollRegions = 1.
        appearance17:BackColor = System.Drawing.SystemColors:Window.
        appearance17:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:ActiveCellAppearance = appearance17.
        appearance18:BackColor = System.Drawing.SystemColors:Highlight.
        appearance18:ForeColor = System.Drawing.SystemColors:HighlightText.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:ActiveRowAppearance = appearance18.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:AllowAddNew = Infragistics.Win.UltraWinGrid.AllowAddNew:No.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:AllowDelete = Infragistics.Win.DefaultableBoolean:False.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:AllowUpdate = Infragistics.Win.DefaultableBoolean:False.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:BorderStyleCell = Infragistics.Win.UIElementBorderStyle:Dotted.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:BorderStyleRow = Infragistics.Win.UIElementBorderStyle:Dotted.
        appearance19:BackColor = System.Drawing.SystemColors:Window.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:CardAreaAppearance = appearance19.
        appearance20:BorderColor = System.Drawing.Color:Silver.
        appearance20:TextTrimming = Infragistics.Win.TextTrimming:EllipsisCharacter.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:CellAppearance = appearance20.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:CellClickAction = Infragistics.Win.UltraWinGrid.CellClickAction:RowSelect.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:CellPadding = 0.
        appearance21:BackColor = System.Drawing.SystemColors:Control.
        appearance21:BackColor2 = System.Drawing.SystemColors:ControlDark.
        appearance21:BackGradientAlignment = Infragistics.Win.GradientAlignment:Element.
        appearance21:BackGradientStyle = Infragistics.Win.GradientStyle:Horizontal.
        appearance21:BorderColor = System.Drawing.SystemColors:Window.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:GroupByRowAppearance = appearance21.
        appearance22:TextHAlignAsString = "Left":U.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:HeaderAppearance = appearance22.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction:ExternalSortMulti.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:HeaderStyle = Infragistics.Win.HeaderStyle:WindowsXPCommand.
        appearance23:BackColor = System.Drawing.SystemColors:Window.
        appearance23:BorderColor = System.Drawing.Color:Silver.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:RowAppearance = appearance23.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:RowSelectors = Infragistics.Win.DefaultableBoolean:False.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:SelectTypeRow = Infragistics.Win.UltraWinGrid.SelectType:SingleAutoDrag.
        appearance24:BackColor = System.Drawing.SystemColors:ControlLight.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:TemplateAddRowAppearance = appearance24.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:ViewStyleBand = Infragistics.Win.UltraWinGrid.ViewStyleBand:OutlookGroupBy.
        THIS-OBJECT:smartDataBrowser1:Dock = System.Windows.Forms.DockStyle:Left.
        THIS-OBJECT:smartDataBrowser1:Font = NEW System.Drawing.Font("Microsoft Sans Serif":U, Progress.Util.CastUtil:ToSingle(8.25), System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, System.Convert:ToByte(0)).
        THIS-OBJECT:smartDataBrowser1:LinkDataSource = THIS-OBJECT:smartBusinessEntityAdapter1.
        THIS-OBJECT:smartDataBrowser1:Location = NEW System.Drawing.Point(0, 0).
        THIS-OBJECT:smartDataBrowser1:Name = "smartDataBrowser1":U.
        THIS-OBJECT:smartDataBrowser1:SettingsKey = "b7c1f23f-9aa7-dd81-2914-0b37d42c9a9a":U.
        THIS-OBJECT:smartDataBrowser1:Size = NEW System.Drawing.Size(307, 322).
        THIS-OBJECT:smartDataBrowser1:SmartFilterActive = TRUE.
        THIS-OBJECT:smartDataBrowser1:SmartFilterUseMatches = TRUE.
        THIS-OBJECT:smartDataBrowser1:SmartFilterUseOperators = TRUE.
        THIS-OBJECT:smartDataBrowser1:TabIndex = 5.
        THIS-OBJECT:smartDataBrowser1:Text = "smartDataBrowser1":U.
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
        DEFINE VARIABLE arrayvar14 AS Progress.Data.ColumnPropDesc EXTENT 15 NO-UNDO.
        arrayvar14[1] = NEW Progress.Data.ColumnPropDesc("Ordernum":U, "Order Num":U, Progress.Data.DataType:INTEGER).
        arrayvar14[2] = NEW Progress.Data.ColumnPropDesc("KlantenNo":U, "Cust Num":U, Progress.Data.DataType:INTEGER).
        arrayvar14[3] = NEW Progress.Data.ColumnPropDesc("OrderDate":U, "Ordered":U, Progress.Data.DataType:DATE).
        arrayvar14[4] = NEW Progress.Data.ColumnPropDesc("ShipDate":U, "Shipped":U, Progress.Data.DataType:DATE).
        arrayvar14[5] = NEW Progress.Data.ColumnPropDesc("PromiseDate":U, "Promised":U, Progress.Data.DataType:DATE).
        arrayvar14[6] = NEW Progress.Data.ColumnPropDesc("Carrier":U, "Carrier":U, Progress.Data.DataType:CHARACTER).
        arrayvar14[7] = NEW Progress.Data.ColumnPropDesc("Instructions":U, "Instructions":U, Progress.Data.DataType:CHARACTER).
        arrayvar14[8] = NEW Progress.Data.ColumnPropDesc("PO":U, "PO":U, Progress.Data.DataType:CHARACTER).
        arrayvar14[9] = NEW Progress.Data.ColumnPropDesc("Terms":U, "Terms":U, Progress.Data.DataType:CHARACTER).
        arrayvar14[10] = NEW Progress.Data.ColumnPropDesc("SalesRep":U, "Sales Rep":U, Progress.Data.DataType:CHARACTER).
        arrayvar14[11] = NEW Progress.Data.ColumnPropDesc("BillToID":U, "Bill To ID":U, Progress.Data.DataType:INTEGER).
        arrayvar14[12] = NEW Progress.Data.ColumnPropDesc("ShipToID":U, "Ship To ID":U, Progress.Data.DataType:INTEGER).
        arrayvar14[13] = NEW Progress.Data.ColumnPropDesc("OrderStatus":U, "Order Status":U, Progress.Data.DataType:CHARACTER).
        arrayvar14[14] = NEW Progress.Data.ColumnPropDesc("WarehouseNum":U, "Warehouse Num":U, Progress.Data.DataType:INTEGER).
        arrayvar14[15] = NEW Progress.Data.ColumnPropDesc("Creditcard":U, "Credit Card":U, Progress.Data.DataType:CHARACTER).
        tableDesc2:Columns = arrayvar14.
        THIS-OBJECT:smartBusinessEntityBindingSource1:TableSchema = tableDesc2.
        /*  */
        /* m_OrderForm_Toolbars_Dock_Area_Left */
        /*  */
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Left:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Left:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(191)), System.Convert:ToInt32(System.Convert:ToByte(219)), System.Convert:ToInt32(System.Convert:ToByte(255))).
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Left:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Left.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Left:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Left:InitialResizeAreaExtent = 8.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Left:Location = NEW System.Drawing.Point(0, 149).
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Left:Name = "m_OrderForm_Toolbars_Dock_Area_Left":U.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Left:Size = NEW System.Drawing.Size(8, 322).
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Left:ToolbarsManager = THIS-OBJECT:smartToolbarController1.
        /*  */
        /* m_OrderForm_Toolbars_Dock_Area_Right */
        /*  */
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Right:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Right:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(191)), System.Convert:ToInt32(System.Convert:ToByte(219)), System.Convert:ToInt32(System.Convert:ToByte(255))).
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Right:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Right.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Right:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Right:InitialResizeAreaExtent = 8.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Right:Location = NEW System.Drawing.Point(735, 149).
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Right:Name = "m_OrderForm_Toolbars_Dock_Area_Right":U.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Right:Size = NEW System.Drawing.Size(8, 322).
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Right:ToolbarsManager = THIS-OBJECT:smartToolbarController1.
        /*  */
        /* m_OrderForm_Toolbars_Dock_Area_Top */
        /*  */
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Top:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Top:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(191)), System.Convert:ToInt32(System.Convert:ToByte(219)), System.Convert:ToInt32(System.Convert:ToByte(255))).
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Top:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Top.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Top:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Top:Location = NEW System.Drawing.Point(0, 0).
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Top:Name = "m_OrderForm_Toolbars_Dock_Area_Top":U.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Top:Size = NEW System.Drawing.Size(743, 149).
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Top:ToolbarsManager = THIS-OBJECT:smartToolbarController1.
        /*  */
        /* m_OrderForm_Toolbars_Dock_Area_Bottom */
        /*  */
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Bottom:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Bottom:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(191)), System.Convert:ToInt32(System.Convert:ToByte(219)), System.Convert:ToInt32(System.Convert:ToByte(255))).
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Bottom:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Bottom.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Bottom:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Bottom:InitialResizeAreaExtent = 8.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Bottom:Location = NEW System.Drawing.Point(0, 471).
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Bottom:Name = "m_OrderForm_Toolbars_Dock_Area_Bottom":U.
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Bottom:Size = NEW System.Drawing.Size(743, 8).
        THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Bottom:ToolbarsManager = THIS-OBJECT:smartToolbarController1.
        /*  */
        /* smartDatasetChildAdapter1 */
        /*  */
        THIS-OBJECT:smartDatasetChildAdapter1:EntityTable = "eOrderLine":U.
        THIS-OBJECT:smartDatasetChildAdapter1:ForeignFields = "Ordernum,Ordernum":U.
        THIS-OBJECT:smartDatasetChildAdapter1:LinkDataSource = THIS-OBJECT:smartBusinessEntityAdapter1.
        THIS-OBJECT:smartDatasetChildAdapter1:LinkGroupCreateSource = ?.
        THIS-OBJECT:smartDatasetChildAdapter1:LinkNavigationSource = ?.
        THIS-OBJECT:smartDatasetChildAdapter1:NonUpdatableColumns = "":U.
        THIS-OBJECT:smartDatasetChildAdapter1:QuerySort = "":U.
        THIS-OBJECT:smartDatasetChildAdapter1:ThrowErrorsFromRetrieveData = FALSE.
        /*  */
        /* smartBusinessEntityBindingSource2 */
        /*  */
        THIS-OBJECT:smartBusinessEntityBindingSource2:BindTo = "QUERY":U.
        THIS-OBJECT:smartBusinessEntityBindingSource2:EntityName = "TrainingSamples.BusinessLogik.Order.OrderBusinessEntity":U.
        THIS-OBJECT:smartBusinessEntityBindingSource2:EntityTable = "eOrderLine":U.
        THIS-OBJECT:smartBusinessEntityBindingSource2:MaxDataGuess = 0.
        THIS-OBJECT:smartBusinessEntityBindingSource2:NoLOBs = FALSE.
        tableDesc1:ChildTables = ?.
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar15 AS Progress.Data.ColumnPropDesc EXTENT 8 NO-UNDO.
        arrayvar15[1] = NEW Progress.Data.ColumnPropDesc("Ordernum":U, "Order Num":U, Progress.Data.DataType:INTEGER).
        arrayvar15[2] = NEW Progress.Data.ColumnPropDesc("Linenum":U, "Line Num":U, Progress.Data.DataType:INTEGER).
        arrayvar15[3] = NEW Progress.Data.ColumnPropDesc("Itemnum":U, "Item Num":U, Progress.Data.DataType:INTEGER).
        arrayvar15[4] = NEW Progress.Data.ColumnPropDesc("Price":U, "Price":U, Progress.Data.DataType:DECIMAL).
        arrayvar15[5] = NEW Progress.Data.ColumnPropDesc("Qty":U, "Qty":U, Progress.Data.DataType:INTEGER).
        arrayvar15[6] = NEW Progress.Data.ColumnPropDesc("Discount":U, "Discount":U, Progress.Data.DataType:INTEGER).
        arrayvar15[7] = NEW Progress.Data.ColumnPropDesc("ExtendedPrice":U, "Extended Price":U, Progress.Data.DataType:DECIMAL).
        arrayvar15[8] = NEW Progress.Data.ColumnPropDesc("OrderLineStatus":U, "Order Line Status":U, Progress.Data.DataType:CHARACTER).
        tableDesc1:Columns = arrayvar15.
        THIS-OBJECT:smartBusinessEntityBindingSource2:TableSchema = tableDesc1.
        /*  */
        /* smartDataBrowser2 */
        /*  */
        THIS-OBJECT:smartDataBrowser2:DataSource = THIS-OBJECT:smartBusinessEntityBindingSource2.
        appearance1:BackColor = System.Drawing.SystemColors:Window.
        appearance1:BorderColor = System.Drawing.SystemColors:InactiveCaption.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Appearance = appearance1.
        ultraGridColumn16:Header:VisiblePosition = 0.
        ultraGridColumn17:Header:VisiblePosition = 1.
        ultraGridColumn18:Header:VisiblePosition = 2.
        ultraGridColumn19:Header:VisiblePosition = 3.
        ultraGridColumn20:Header:VisiblePosition = 4.
        ultraGridColumn21:Header:VisiblePosition = 5.
        ultraGridColumn22:Header:VisiblePosition = 6.
        ultraGridColumn23:Header:VisiblePosition = 7.
        @VisualDesigner.FormMember (NeedsInitialize="false":U, InitializeArray="true":U).
        DEFINE VARIABLE arrayvar16 AS System.Object EXTENT 8 NO-UNDO.
        arrayvar16[1] = ultraGridColumn16.
        arrayvar16[2] = ultraGridColumn17.
        arrayvar16[3] = ultraGridColumn18.
        arrayvar16[4] = ultraGridColumn19.
        arrayvar16[5] = ultraGridColumn20.
        arrayvar16[6] = ultraGridColumn21.
        arrayvar16[7] = ultraGridColumn22.
        arrayvar16[8] = ultraGridColumn23.
        ultraGridBand1:Columns:AddRange(arrayvar16).
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:BandsSerializer:Add(ultraGridBand1).
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:BorderStyle = Infragistics.Win.UIElementBorderStyle:Solid.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:CaptionVisible = Infragistics.Win.DefaultableBoolean:False.
        appearance2:BackColor = System.Drawing.SystemColors:ActiveBorder.
        appearance2:BackColor2 = System.Drawing.SystemColors:ControlDark.
        appearance2:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
        appearance2:BorderColor = System.Drawing.SystemColors:Window.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:GroupByBox:Appearance = appearance2.
        appearance3:ForeColor = System.Drawing.SystemColors:GrayText.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:GroupByBox:BandLabelAppearance = appearance3.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:GroupByBox:BorderStyle = Infragistics.Win.UIElementBorderStyle:Solid.
        appearance4:BackColor = System.Drawing.SystemColors:ControlLightLight.
        appearance4:BackColor2 = System.Drawing.SystemColors:Control.
        appearance4:BackGradientStyle = Infragistics.Win.GradientStyle:Horizontal.
        appearance4:ForeColor = System.Drawing.SystemColors:GrayText.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:GroupByBox:PromptAppearance = appearance4.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:MaxColScrollRegions = 1.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:MaxRowScrollRegions = 1.
        appearance5:BackColor = System.Drawing.SystemColors:Window.
        appearance5:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:ActiveCellAppearance = appearance5.
        appearance6:BackColor = System.Drawing.SystemColors:Highlight.
        appearance6:ForeColor = System.Drawing.SystemColors:HighlightText.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:ActiveRowAppearance = appearance6.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:BorderStyleCell = Infragistics.Win.UIElementBorderStyle:Dotted.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:BorderStyleRow = Infragistics.Win.UIElementBorderStyle:Dotted.
        appearance7:BackColor = System.Drawing.SystemColors:Window.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:CardAreaAppearance = appearance7.
        appearance8:BorderColor = System.Drawing.Color:Silver.
        appearance8:TextTrimming = Infragistics.Win.TextTrimming:EllipsisCharacter.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:CellAppearance = appearance8.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:CellClickAction = Infragistics.Win.UltraWinGrid.CellClickAction:EditAndSelectText.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:CellPadding = 0.
        appearance9:BackColor = System.Drawing.SystemColors:Control.
        appearance9:BackColor2 = System.Drawing.SystemColors:ControlDark.
        appearance9:BackGradientAlignment = Infragistics.Win.GradientAlignment:Element.
        appearance9:BackGradientStyle = Infragistics.Win.GradientStyle:Horizontal.
        appearance9:BorderColor = System.Drawing.SystemColors:Window.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:GroupByRowAppearance = appearance9.
        appearance10:TextHAlignAsString = "Left":U.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:HeaderAppearance = appearance10.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction:SortMulti.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:HeaderStyle = Infragistics.Win.HeaderStyle:WindowsXPCommand.
        appearance11:BackColor = System.Drawing.SystemColors:Window.
        appearance11:BorderColor = System.Drawing.Color:Silver.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:RowAppearance = appearance11.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:RowSelectors = Infragistics.Win.DefaultableBoolean:False.
        appearance12:BackColor = System.Drawing.SystemColors:ControlLight.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:TemplateAddRowAppearance = appearance12.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:ViewStyleBand = Infragistics.Win.UltraWinGrid.ViewStyleBand:OutlookGroupBy.
        THIS-OBJECT:smartDataBrowser2:Dock = System.Windows.Forms.DockStyle:Fill.
        THIS-OBJECT:smartDataBrowser2:Font = NEW System.Drawing.Font("Microsoft Sans Serif":U, Progress.Util.CastUtil:ToSingle(8.25), System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, System.Convert:ToByte(0)).
        THIS-OBJECT:smartDataBrowser2:LinkDataSource = THIS-OBJECT:smartDatasetChildAdapter1.
        THIS-OBJECT:smartDataBrowser2:Location = NEW System.Drawing.Point(0, 0).
        THIS-OBJECT:smartDataBrowser2:Name = "smartDataBrowser2":U.
        THIS-OBJECT:smartDataBrowser2:SettingsKey = "80770da6-4bfe-db88-2914-e33728792d48":U.
        THIS-OBJECT:smartDataBrowser2:Size = NEW System.Drawing.Size(410, 296).
        THIS-OBJECT:smartDataBrowser2:TabIndex = 0.
        THIS-OBJECT:smartDataBrowser2:Text = "smartDataBrowser2":U.
        /*  */
        /* OrderForm */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(743, 479).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:OrderForm_Fill_Panel).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Left).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Right).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Bottom).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:m_OrderForm_Toolbars_Dock_Area_Top).
        THIS-OBJECT:Name = "OrderForm":U.
        THIS-OBJECT:PrimaryDataSource = THIS-OBJECT:smartBusinessEntityAdapter1.
        THIS-OBJECT:PrimaryDataTarget = THIS-OBJECT:smartBusinessEntityAdapter1.
        THIS-OBJECT:PrimaryNavigationSource = THIS-OBJECT:smartToolbarController1.
        THIS-OBJECT:Text = "Order Maintenance":U.
        THIS-OBJECT:WindowPositionRegistryKey = "OrderForm":U.
        THIS-OBJECT:ultraTabPageControl1:ResumeLayout(FALSE).
        CAST(THIS-OBJECT:orderViewerControl1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:smartBusinessEntityAdapter1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:smartToolbarController1, System.ComponentModel.ISupportInitialize):EndInit().
        THIS-OBJECT:ultraTabPageControl2:ResumeLayout(FALSE).
        THIS-OBJECT:OrderForm_Fill_Panel:ClientArea:ResumeLayout(FALSE).
        THIS-OBJECT:OrderForm_Fill_Panel:ResumeLayout(FALSE).
        CAST(THIS-OBJECT:ultraTabControl1, System.ComponentModel.ISupportInitialize):EndInit().
        THIS-OBJECT:ultraTabControl1:ResumeLayout(FALSE).
        CAST(THIS-OBJECT:smartDataBrowser1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:smartBusinessEntityBindingSource1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:smartDatasetChildAdapter1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:smartBusinessEntityBindingSource2, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:smartDataBrowser2, System.ComponentModel.ISupportInitialize):EndInit().
        THIS-OBJECT:ResumeLayout(FALSE).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
	END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Raises the Shown Event
        Notes:   
        @param e The System.EventArgs with the data for this event
    ------------------------------------------------------------------------------*/
	METHOD PROTECTED OVERRIDE VOID OnShown (e AS System.EventArgs):
		
		SUPER:OnShown (e) .

        Consultingwerk.Util.UserInterfaceHelper:ProcessEvents() .

//        THIS-OBJECT:smartBusinessEntityAdapter1:RetrieveData () .

	END METHOD .



    /*------------------------------------------------------------------------------
        Purpose: Destructor for the OrderForm class 
        Notes:   
    ------------------------------------------------------------------------------*/
    DESTRUCTOR PUBLIC OrderForm ():

    END DESTRUCTOR .

END CLASS.
