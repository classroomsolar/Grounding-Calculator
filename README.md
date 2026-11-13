# Grounding Calculator — Master Engineering Package (Final Audited v11)

A comprehensive, production-grade engineering calculation suite for Low-Voltage (LV) and Medium-Voltage (MV) electrical systems, substation grounding grids, and renewable energy facilities based on **IEEE 80**, **IEEE 81**, **NEC (NFPA 70)**, and **IEC** standards.

---

## 📁 Repository Structure

```
Grounding_Calculator/
├── Calculator/
│   └── Engineering_Calculator_GROUNDING_MASTER_FINAL_AUDITED_v11.xlsx   # Audited Master Workbook
├── VBA/
│   └── Grounding_OneClickReport_v11.bas                                 # One-Click Automated Reporting Module
├── Ribbon_XML/
│   ├── customUI.xml                                                     # Office Ribbon XML (Legacy)
│   ├── customUI14.xml                                                   # Office Ribbon XML (Office 2010+)
│   └── package_manifest.xml                                             # Ribbon Package Manifest
├── Release_Docs/
│   ├── Grounding_Master_FINAL_v11_QA_Summary.txt                         # QA Audit Summary (50/50 Pass)
│   ├── PACKAGE_STATUS.txt                                               # Package Release Status & Baseline Policy
│   ├── README_VBA_RIBBON_INSTALL.txt                                    # Step-by-step Installation Instructions
│   ├── CONTENTS.txt                                                     # Package Manifest
│   └── SHA256SUMS.txt                                                   # Integrity Checksums
└── Requirements/
    ├── MASTER_GROUNDING_REQUIREMENTS.md                                 # Master Scope & Functional Register
    └── DETAILED_GROUNDING_REQUIREMENTS.md                               # Detailed Engineering Specifications
```

---

## ⚡ Core Capabilities & Engineering Scope

- **Standards Compliance:** IEEE 80-2013, IEEE 81, IEEE 142 (Green Book), IEEE 399 (Brown Book), NEC Article 250, NESC.
- **Substation Grid & Safety Limits:**
  - Mesh and step voltage calculations with derated surface layer ($C_s$) resistivity.
  - Body weight thresholds (50 kg and 70 kg models) for tolerable touch and step potentials.
  - Grid conductor sizing based on material thermal capacity and fault clearing time.
- **Multi-Source Fault Current Engine:**
  - Zero-sequence and ground-fault contributions from utility grids, synchronous generators, induction motors, and Inverter-Based Resources (IBR).
  - Extended metallic/earth return-path current division with source-side Neutral Grounding Resistor (NGR) / Grounding Transformer (GT) separation.
  - Point-in-time asymmetrical RMS fault-duty screen with ANSI/IEEE X/R ratio decrements.
- **Soil Resistivity & Testing:**
  - Wenner four-pin apparent resistivity analysis.
  - 3-layer soil sensitivity screening.
  - Fall-of-Potential resistance-vs-distance / 62% test curve validation.
- **Optimization Engine:**
  - Multi-variable optimizer covering fault current, clearing times, split factors, surface layer material, conductor sizing, ground rods/piles credit, and seasonal soil variation.
- **Reporting & Automation:**
  - VBA one-click comprehensive grounding study generation with 28-section report index.
  - Custom Office Ribbon UI integration.

---

## 🔍 Quality Assurance & Integrity

- **Tests Passed:** 50 / 50 regression and hard audit tests pass (`FINAL QA RELEASE = PASS`).
- **Formula Error Scan:** 0 matches for `#REF!`, `#DIV/0!`, `#VALUE!`, `#NAME?`, `#N/A`, `#NUM!`.
- **Integrity Verification:** Checksums for all release artifacts are cataloged in [`Release_Docs/SHA256SUMS.txt`](Release_Docs/SHA256SUMS.txt).
