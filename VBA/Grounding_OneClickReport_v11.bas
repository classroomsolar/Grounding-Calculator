Attribute VB_Name = "GroundingOneClickReport_v11"
Option Explicit

Private Const GND_VERSION As String = "v11 FINAL AUDITED"

'=============================
' Public entry points
'=============================
Public Sub GND_SetupProductionWorkbook()
    GND_SetupPageLayout
    GND_RefreshAndValidate
    MsgBox "Grounding Calculator " & GND_VERSION & vbCrLf & _
           "Page layout refreshed. Ribbon XML can be embedded separately if desired.", _
           vbInformation, "Grounding Calculator Setup"
End Sub

Public Sub GND_RefreshAndValidate()
    Dim oldCalc As XlCalculation
    Dim oldScreen As Boolean
    On Error GoTo CleanFail

    oldCalc = Application.Calculation
    oldScreen = Application.ScreenUpdating
    Application.ScreenUpdating = False
    Application.Calculation = xlCalculationAutomatic
    Application.CalculateFullRebuild
    Application.ScreenUpdating = oldScreen
    Application.Calculation = oldCalc

    MsgBox "Recalculation complete." & vbCrLf & _
           "Project grounding release: " & GND_ProjectRelease(), _
           GND_ReleaseMessageStyle(), "Grounding Calculator"
    Exit Sub

CleanFail:
    Application.ScreenUpdating = oldScreen
    Application.Calculation = oldCalc
    MsgBox "Refresh/validation stopped: " & Err.Description, vbExclamation, "Grounding Calculator"
End Sub

Public Sub GND_PrintSummaryReport()
    If Not GND_ConfirmUnreleased() Then Exit Sub
    GND_PrintSheets GND_SummarySheets(), False
End Sub

Public Sub GND_ExportSummaryPDF()
    If Not GND_ConfirmUnreleased() Then Exit Sub
    GND_PrintSheets GND_SummarySheets(), True
End Sub

Public Sub GND_PrintFullReport()
    If Not GND_ConfirmUnreleased() Then Exit Sub
    GND_PrintSheets GND_FullReportSheets(), False
End Sub

Public Sub GND_ExportFullReportPDF()
    If Not GND_ConfirmUnreleased() Then Exit Sub
    GND_PrintSheets GND_FullReportSheets(), True
End Sub

Public Sub GND_OpenInputs()
    GND_ActivateSheet "INPUTS"
End Sub

Public Sub GND_OpenResults()
    GND_ActivateSheet "RESULTS"
End Sub

Public Sub GND_OpenMasterReport()
    GND_ActivateSheet "GND_MASTER_REPORT"
End Sub

Public Sub GND_OpenQA()
    GND_ActivateSheet "GND_QA_FINAL"
End Sub

'=============================
' Ribbon callbacks
'=============================
Public Sub GND_RibbonRefresh(control As IRibbonControl)
    GND_RefreshAndValidate
End Sub

Public Sub GND_RibbonExportFull(control As IRibbonControl)
    GND_ExportFullReportPDF
End Sub

Public Sub GND_RibbonExportSummary(control As IRibbonControl)
    GND_ExportSummaryPDF
End Sub

Public Sub GND_RibbonPrintFull(control As IRibbonControl)
    GND_PrintFullReport
End Sub

Public Sub GND_RibbonInputs(control As IRibbonControl)
    GND_OpenInputs
End Sub

Public Sub GND_RibbonResults(control As IRibbonControl)
    GND_OpenResults
End Sub

Public Sub GND_RibbonReport(control As IRibbonControl)
    GND_OpenMasterReport
End Sub

Public Sub GND_RibbonQA(control As IRibbonControl)
    GND_OpenQA
End Sub

'=============================
' Report package definitions
'=============================
Private Function GND_SummarySheets() As Variant
    GND_SummarySheets = Array( _
        "RESULTS", _
        "GND_MASTER_REPORT", _
        "GND_ACCEPTANCE", _
        "GND_MASTER_REQUIREMENTS", _
        "GND_REPORT_INDEX", _
        "GND_QA_FINAL")
End Function

Private Function GND_FullReportSheets() As Variant
    GND_FullReportSheets = Array( _
        "INPUTS", _
        "RESULTS", _
        "GND_MASTER_REPORT", _
        "GND_REPORT_INDEX", _
        "GND_ACCEPTANCE", _
        "GND_MASTER_REQUIREMENTS", _
        "GND_METHOD_REGISTER", _
        "GND_TOPOLOGY_MATRIX", _
        "GND_ZEROSEQ_ANALYSIS", _
        "GND_SOURCE_CONTRIBUTIONS", _
        "GND_FAULT_CHARGING", _
        "GND_FAULT_DUTY_ADV", _
        "GND_GT_NGR", _
        "GND_GT_NGR_VERIFY", _
        "GND_CONDUCTOR_SIZING", _
        "GND_RETURN_PATH_CLASS", _
        "GND_RETURN_PATH_EXT", _
        "GND_SOIL_QA", _
        "GND_SOIL_MULTILAYER_SENS", _
        "GND_ELECTRODE_ADV", _
        "GND_IEEE80_CURRENT", _
        "B23_GROUND_SAFETY", _
        "GND_GRID_OPTIMIZER", _
        "GND_OPTIMIZER_ADV", _
        "SHIELD_SHEATH_ELEC", _
        "GND_EQUIPMENT_BONDING", _
        "GND_PROTECTION_MATRIX", _
        "GND_TESTING_COMMISSIONING", _
        "GND_FOP_TEST", _
        "GND_BOM", _
        "GND_DIAGRAM", _
        "GND_UNIT_CHECK", _
        "GND_QA_FINAL")
End Function

'=============================
' Printing / PDF helpers
'=============================
Private Sub GND_PrintSheets(ByVal requested As Variant, ByVal exportPDF As Boolean)
    Dim names() As String
    Dim n As Long, i As Long
    Dim previousSheet As Object
    Dim oldScreen As Boolean, oldAlerts As Boolean
    Dim pdfPath As String

    On Error GoTo CleanFail
    Set previousSheet = ActiveSheet
    oldScreen = Application.ScreenUpdating
    oldAlerts = Application.DisplayAlerts
    Application.ScreenUpdating = False
    Application.DisplayAlerts = False

    ReDim names(0 To UBound(requested))
    n = -1
    For i = LBound(requested) To UBound(requested)
        If GND_SheetExists(CStr(requested(i))) Then
            n = n + 1
            names(n) = CStr(requested(i))
        End If
    Next i

    If n < 0 Then Err.Raise vbObjectError + 510, , "No report sheets were found."
    ReDim Preserve names(0 To n)

    ThisWorkbook.Worksheets(names).Select

    If exportPDF Then
        pdfPath = GND_PdfPath(IIf(GND_IsSummaryArray(requested), "Summary", "Full"))
        ActiveSheet.ExportAsFixedFormat _
            Type:=xlTypePDF, _
            Filename:=pdfPath, _
            Quality:=xlQualityStandard, _
            IncludeDocProperties:=True, _
            IgnorePrintAreas:=False, _
            OpenAfterPublish:=True
    Else
        ActiveWindow.SelectedSheets.PrintOut
    End If

CleanExit:
    On Error Resume Next
    previousSheet.Select
    Application.DisplayAlerts = oldAlerts
    Application.ScreenUpdating = oldScreen
    Exit Sub

CleanFail:
    MsgBox "Print/PDF action stopped: " & Err.Description, vbExclamation, "Grounding Calculator"
    Resume CleanExit
End Sub

Private Function GND_IsSummaryArray(ByVal requested As Variant) As Boolean
    On Error Resume Next
    GND_IsSummaryArray = (UBound(requested) - LBound(requested) + 1 <= 6)
End Function

Private Function GND_PdfPath(ByVal packageType As String) As String
    Dim folder As String, base As String
    folder = ThisWorkbook.Path
    If Len(folder) = 0 Then folder = Environ$("USERPROFILE") & "\Documents"
    base = GND_SafeFileName(ThisWorkbook.Name)
    If InStrRev(base, ".") > 0 Then base = Left$(base, InStrRev(base, ".") - 1)
    GND_PdfPath = folder & Application.PathSeparator & _
                  base & "_" & packageType & "_" & Format(Now, "yyyymmdd_hhnnss") & ".pdf"
End Function

Private Function GND_SafeFileName(ByVal s As String) As String
    Dim bad As Variant, i As Long
    bad = Array("\\", "/", ":", "*", "?", """", "<", ">", "|")
    For i = LBound(bad) To UBound(bad)
        s = Replace(s, CStr(bad(i)), "_")
    Next i
    GND_SafeFileName = s
End Function

'=============================
' Release-state helpers
'=============================
Private Function GND_ProjectRelease() As String
    On Error GoTo Fallback
    If GND_SheetExists("GND_MASTER_REPORT") Then
        GND_ProjectRelease = Trim$(CStr(ThisWorkbook.Worksheets("GND_MASTER_REPORT").Range("E69").Value))
        If Len(GND_ProjectRelease) > 0 Then Exit Function
    End If
Fallback:
    GND_ProjectRelease = "UNKNOWN / REVIEW REQUIRED"
End Function

Private Function GND_ConfirmUnreleased() As Boolean
    Dim state As String, ans As VbMsgBoxResult
    state = UCase$(GND_ProjectRelease())

    If state = "PASS" Then
        GND_ConfirmUnreleased = True
        Exit Function
    End If

    ans = MsgBox( _
        "Current project grounding release is: " & state & vbCrLf & vbCrLf & _
        "The workbook may contain unresolved INPUT REQUIRED / REVIEW / EXTERNAL VALIDATION / FAIL items." & vbCrLf & _
        "Continue with print/PDF anyway?", _
        vbExclamation + vbYesNo + vbDefaultButton2, _
        "Grounding Calculator Release Warning")
    GND_ConfirmUnreleased = (ans = vbYes)
End Function

Private Function GND_ReleaseMessageStyle() As VbMsgBoxStyle
    Select Case UCase$(GND_ProjectRelease())
        Case "PASS"
            GND_ReleaseMessageStyle = vbInformation
        Case "FAIL"
            GND_ReleaseMessageStyle = vbCritical
        Case Else
            GND_ReleaseMessageStyle = vbExclamation
    End Select
End Function

'=============================
' Workbook helpers
'=============================
Private Function GND_SheetExists(ByVal sheetName As String) As Boolean
    Dim ws As Worksheet
    On Error Resume Next
    Set ws = ThisWorkbook.Worksheets(sheetName)
    GND_SheetExists = Not ws Is Nothing
    On Error GoTo 0
End Function

Private Sub GND_ActivateSheet(ByVal sheetName As String)
    If GND_SheetExists(sheetName) Then
        ThisWorkbook.Worksheets(sheetName).Activate
    Else
        MsgBox "Sheet not found: " & sheetName, vbExclamation, "Grounding Calculator"
    End If
End Sub

Public Sub GND_SetupPageLayout()
    Dim ws As Worksheet
    Dim nm As Variant
    Dim targets As Variant

    targets = GND_FullReportSheets()
    Application.ScreenUpdating = False
    On Error GoTo CleanExit

    For Each nm In targets
        If GND_SheetExists(CStr(nm)) Then
            Set ws = ThisWorkbook.Worksheets(CStr(nm))
            With ws.PageSetup
                .Zoom = False
                .FitToPagesWide = 1
                .FitToPagesTall = False
                .CenterHorizontally = False
                .Orientation = xlLandscape
                .LeftMargin = Application.InchesToPoints(0.3)
                .RightMargin = Application.InchesToPoints(0.3)
                .TopMargin = Application.InchesToPoints(0.4)
                .BottomMargin = Application.InchesToPoints(0.4)
                .HeaderMargin = Application.InchesToPoints(0.2)
                .FooterMargin = Application.InchesToPoints(0.2)
                .CenterFooter = "Grounding Calculator " & GND_VERSION & "  |  Page &P of &N"
            End With
        End If
    Next nm

CleanExit:
    Application.ScreenUpdating = True
End Sub
