GROUNDING CALCULATOR v11 — VBA / RIBBON INSTALLATION
====================================================

The audited calculator is intentionally supplied as .xlsx so the engineering workbook remains transparent and does not falsely claim an embedded/compiled VBA project.

To create the controlled macro-enabled working copy in Microsoft Excel Desktop:

1. Open Calculator/Engineering_Calculator_GROUNDING_MASTER_FINAL_AUDITED_v11.xlsx.
2. Save As: Excel Macro-Enabled Workbook (*.xlsm).
3. Press Alt+F11.
4. File > Import File... and import VBA/Grounding_OneClickReport_v11.bas.
5. Debug > Compile VBAProject.
6. Run GND_SetupProductionWorkbook once.
7. Test GND_RefreshAndValidate, GND_ExportSummaryPDF and GND_ExportFullReportPDF.

Optional Ribbon tab:
- Ribbon_XML/customUI14.xml is for Office 2010+ custom UI.
- Ribbon_XML/customUI.xml is the legacy Office 2007 schema.
- Embed ONE appropriate XML file into the .xlsm with a trusted Office Ribbon/custom-UI editor.
- The XML callbacks match the public GND_Ribbon* procedures in the BAS module.

Important:
- The VBA module does NOT rewrite engineering formulas, databases, dropdowns, or calculation engines.
- It only recalculates, navigates, applies print-page setup, warns on unresolved project release status, prints, and exports PDFs.
- PDF/Print execution must be qualified in Microsoft Excel Desktop after import.
- Do not rename report sheets without updating the VBA report sheet arrays.

There is no .das file because .das is not a standard VBA module format. The source module is .bas.
