# Grounding_Calculator_prompt
## Grounding & Bonding Design Calculator

| Item | Detail |
|---|---|
| Calculator | **Grounding_Calculator** |
| Status | Existing calculator — continue and complete on the website |
| Website page | `/grounding` (system grounding, conductor sizing, bonding, ground grid, touch/step) |
| Master Prompt V5.0 scope | Group 9 — Grounding and Bonding Design (R186–R210) |
| Project types | P1 utility fixed-tilt, P2 utility single-axis tracker, P3 commercial carport, P4 commercial/industrial rooftop, P5 residential rooftop — applicability recorded per requirement (REQUIRED / CONDITIONAL / NOT APPLICABLE / UNSUPPORTED, Section 19) |
| Revision | Final — 14 November 2026 |

**This is the only .md file for Grounding_Calculator.** It holds only what is specific to this calculator. Everything common to all calculators — owner and language rules, the development process (execution cycle, phases, engineering and testing rules, working method, records), report and output presentation, the module completion checklist, website acceptance and the common tool list — is in **Master Prompt V5.0** (`00_MASTER_PROMPT_V5.0.txt`) and is not repeated here. Give the AI both files. If they disagree, the Master Prompt wins.

Every other .md file of this repository (including `00_INDEX.md` and the original prompt file) is copied word for word in the **Appendix** at the end, so nothing is lost when those files are deleted. Sections 1–11 are the working file; the appendix is reference only.

## 1. What this calculator does

Equipment grounding and grounding electrode conductors, bonding jumpers, PV module-frame, rack, tray, raceway, inverter, transformer, pole and fence grounding and bonding, ground-grid conductor sizing, configuration and spacing, GPR, step, touch and mesh voltage, fault-current distribution, conductor thermal withstand, ground rods, grounding design from **supplied** soil-resistivity values (including uniform and two-layer soil models fitted to them), ground-resistance estimation, return-path assessment, summary and schedules (Group 9, R186–R210). IEEE 80 is the ground-grid method, subject to the adopted edition.

**Scope boundary:** Never build, anywhere in this calculator: generator sources or sizing, HV / EHV equipment or studies (above the 35 kV class), substation engineering, field testing / measurement / commissioning, structural / civil / mechanical calculations, and any financial or cost calculation (equipment prices, CAPEX, OPEX, LCOE, tariffs). BESS is deferred (Master Prompt Section 18): do not build it now, but keep data models ready for it. Everything is built on the public website — no spreadsheets, no VBA, no desktop tools.

## 2. Requirements of this calculator

### 2.1 Functional requirements from Master Prompt V5.0

Every requirement below must end up implemented and verified, or marked NOT APPLICABLE / NOT SUPPORTED with a written reason. "Current state" is the starting point found in the earlier work; confirm it in Phase 0.

**Group 9 — Grounding and Bonding Design (R186–R210, 25 active)**

| ID | Requirement (Master Prompt V5.0, verbatim) | Current state |
|---|---|---|
| R186 | Equipment grounding conductor (EGC) sizing. | Built earlier — verify |
| R187 | Grounding electrode conductor (GEC) sizing. | Built earlier — verify |
| R188 | Bonding-jumper sizing. | Built earlier — verify |
| R189 | PV module-frame grounding and bonding assessment. | Partly built — complete |
| R190 | PV mounting-rack grounding and bonding assessment. | Partly built — complete |
| R191 | Cable-tray grounding and bonding assessment. | Built earlier — verify |
| R192 | Conduit and raceway bonding assessment. | Partly built — complete |
| R193 | Inverter grounding assessment. | Partly built — complete |
| R194 | Transformer grounding assessment. | Partly built — complete |
| R195 | Pole and associated electrical-equipment grounding. | Not built — build new |
| R196 | Fence grounding and bonding assessment. | Built earlier — verify |
| R197 | Ground-grid conductor sizing. | Built earlier — verify |
| R198 | Ground-grid configuration design. | Built earlier — verify |
| R199 | Ground-grid spacing assessment. | Built earlier — verify |
| R200 | Ground-potential-rise (GPR) calculation. | Built earlier — verify |
| R201 | Step-voltage calculation. | Built earlier — verify |
| R202 | Touch-voltage calculation. | Built earlier — verify |
| R203 | Mesh-voltage calculation. | Built earlier — verify |
| R204 | Fault-current distribution assessment. | Built earlier — verify |
| R205 | Grounding-conductor thermal withstand calculation. | Built earlier — verify |
| R206 | Ground-rod arrangement and design assessment. | Built earlier — verify |
| R207 | Grounding design using supplied soil-resistivity values. | Built earlier — verify |
| R208 | Ground-resistance estimation using approved design methods. | Built earlier — verify |
| R209 | Ground-fault return-path assessment. | Built earlier — verify |
| R210 | Grounding and bonding design summary and schedules. | Built earlier — verify |

### 2.2 Additional requirements from this calculator's earlier documents

These came from the earlier README / prompt / requirement documents and are kept because they match Master Prompt V5.0.

| # | Requirement | Matches V5.0 |
|---|---|---|
| D01 | System grounding analyser: solid, ungrounded, HRG/LRG, reactance, GT, zig-zag, transformer connections, zero-sequence path, "NO ZERO-SEQUENCE PATH" warning | R291, R313–R314, R209; Section 35 (no zero-sequence from delta) |
| D02 | Cable charging, ungrounded systems, neutral displacement, TOV, arcing ground | R269 (charging), R223 (TOV exposure) |
| D03 | Uniform, two-layer, multi-layer sensitivity, seasonal sensitivity; soil thermal vs electrical kept separate | R207 |
| D04 | Electrode engine: rods, multiple rods with mutual resistance, rings, grids, plates, Ufer, piles, deep rods, fences | R206, R208, R196 |
| D05 | IEEE 80 grid study: Rg, IG, split factor, decrement, GPR, tolerable touch/step (50/70 kg), mesh, step, surface layer, thermal | R197–R203, R205 |
| D06 | EGC/GEC/bonding jumpers; code minimum vs thermal minimum; parallel EGCs | R186–R188, R205 |
| D07 | Ground-fault current distribution through grid, earth, EGCs, shields, sheaths, armour, tray, steel | R204, R209 |
| D08 | Design optimiser: original vs alternatives with quantified effect | R198–R199 design aids |
| D09 | 28-section grounding study report | R210, Section 77 |
| D10 | Diagrams: grounding one-line, zero-sequence path, grid layout, connection schedules, trip matrix, rod schedule | R210, R416–R417, Section 75 |
| D11 | Grounding: NGR, zig-zag, soil, grid, GPR, touch/step (from the earlier Fault_Current_Studio documents) | Group 9 (R186–R210), R292 |
| D12 | EGC placement/sizing; tray bonding/grounding (from the earlier Cable_Tray_Calculator documents) | R155, R186 |
| D13 | Fault/grounding handoff gates (ground bus, bonding, MV shield scheme) (from the earlier Vault_Calculator documents) | Group 9 |

### 2.3 Engineering method and verification requirements (Master Prompt Part 7)

Apply Master Prompt Section 39 in full, plus:

- Ground-grid calculations against published IEEE 80 worked examples for the adopted edition; record the edition and its applicability limits (uniform / two-layer, grid geometry ranges).
- Body-current assumptions (50 kg / 70 kg), surface-layer derating and clearing time from Fault_Current_Studio protection results — never assumed.
- Fault-current division (split factor) from documented methods and actual return paths; do not infer a zero-sequence source from a delta winding (Section 35).
- Conductor sizing per the selected code edition table, with exact provisions.

### 2.4 Shared engines and connections to other calculators (Sections 23, 45, 49)

- **Owns:** grounding-conductor sizing, bonding assessment, electrode, soil-model, IEEE 80 grid, tolerable-limit and return-path engines.
- **Uses:** SLG fault current, X/R and clearing times from Fault_Current_Studio (never its own fault engine); NGR/grounding-transformer data from MV_Electrical_Design; tray/raceway data from Cable_Tray; equipment records from the Master Database.
- **Gives:** EGC/GEC/bonding sizes to the cable calculators and Cable_Tray; grounding interface to Lightning_Surge_Protection; grid results to Documentation_Schedules_QA (R416, R417).

| Direction | Data | From / to |
|---|---|---|
| In | SLG fault current, X/R, clearing time, source split | Fault_Current_Studio |
| In | NGR / grounding transformer data | the MV calculators (MV_Electrical_Design, Transformer_POI) |
| In | Supplied soil resistivity data, surface layer | Project inputs (owner) |
| In | Tray / raceway / equipment lists | Cable_Tray_Calculator, the DC calculators (PV_String_MPPT, DC_Protection_Combiner, DC_Cable_Connector), the LV AC calculators (Inverter_LV_AC, LV_Interconnection_Metering) |
| Out | EGC/GEC/bonding sizes | the DC calculators (PV_String_MPPT, DC_Protection_Combiner, DC_Cable_Connector), the LV AC calculators (Inverter_LV_AC, LV_Interconnection_Metering), Cable_Tray_Calculator |
| Out | Grid design results, GPR | Documentation_Schedules_QA_Calculator (R416, R417), Fault_Current_Studio (transferred potential interfaces) |

Every connection is a typed, versioned contract; a changed upstream result marks this calculator's dependent results STALE.

## 3. Work already done

**Status:** the previous version of this calculator (retired) implemented and regression-tested (50/50 tests, 34/34 acceptance items) the following. It is rebuilt on the website from this specification.

**Functions specified and previously built:**
- System grounding analyser: solidly grounded, ungrounded, high- and low-resistance, reactance grounding, grounding transformers and zig-zag, wye/delta transformer connections, separately derived systems; neutral availability, zero-sequence source and return path; automatic "NO ZERO-SEQUENCE PATH" warning; grounding-source availability for every switching condition.
- EGC, GEC, system/main/supply-side bonding jumpers, parallel-feeder EGCs: code minimum and thermal (adiabatic I²t) minimum, governing size shown; Cu/Al; length-adjusted impedance.
- Electrodes: single rod, multiple rods with mutual resistance (never "two rods = half"), rod arrays, rings, horizontal conductors, grids, plates, concrete-encased, piles/foundations, deep rods, fence electrodes; credited vs zero-credit sensitivity.
- Soil models from supplied data: uniform, two-layer (upper/lower resistivity, layer depth, fit error), multi-layer sensitivity, seasonal and wet/dry sensitivity; soil thermal and electrical resistivity kept separate.
- IEEE 80 grid study: Rg, symmetrical ground-fault current, decrement factor, split factor, maximum grid current, GPR, surface-layer derating, tolerable touch and step (50 kg and 70 kg), mesh voltage, step voltage, transferred potential, grid conductor thermal duty, margins; total fault, metallic return, earth and grid current kept separate.
- Fault-current distribution through grid, earth, EGCs, neutrals, MV shields, concentric neutrals, conduit, tray, steel, interconnected grids — complex impedance, not resistance-only.
- Equipment grounding and bonding for transformers, inverter skids, switchgear, boards, trays, raceways, pads, steel, fences, gates, bollards, poles, enclosures, PV and tracker structures, combiner boxes; missing bonding paths flagged.
- Design optimiser: original vs alternatives (grid size, spacing, depth, conductor size/material, rods, perimeter electrodes, surface layer, clearing time where legitimately changeable) with quantified effect on Rg, GPR, mesh, step, margins.
- 28-section grounding study report; diagrams: grounding one-line, zero-sequence path, grid layout, connection schedules, rod schedule.
- Input classes: user, database, calculated, code value, manufacturer, assumption. Status hierarchy FAIL > INPUT REQUIRED > REVIEW REQUIRED > PASS.

## 4. Functions still to be added

- [ ] All of the above rebuilt as deterministic website engines (Group 9).
- [ ] R195 pole and associated equipment grounding (not built before).
- [ ] R204, R209 return-path engine fed by real SLG current, X/R and clearing time from Fault_Current_Studio.
- [ ] Grid potential maps where the method supports them (Section 75).

**Requirements with no implementation yet (build new):**

- [ ] R195 Pole and associated electrical-equipment grounding

## 5. Earlier work still to be completed

- [ ] Take fault currents, clearing times and protection results from Fault_Current_Studio only — the earlier built-in fault and protection calculations are not rebuilt here.
- [ ] Cable, tray, box, conduit, pulling and arc-flash functions that the previous version contained belong to their own calculators — not rebuilt here.
- [ ] Grounding transformer / NGR sizing belongs to MV_Electrical_Design (R292–R293); this calculator uses its results.
- [ ] Arrester and insulation-coordination items go to Lightning_Surge_Protection and Transformer_POI.
- [ ] Project-specific values must never be built into the calculator.

**Partly built — complete them:**

- [ ] R189 PV module-frame grounding and bonding assessment
- [ ] R190 PV mounting-rack grounding and bonding assessment
- [ ] R192 Conduit and raceway bonding assessment
- [ ] R193 Inverter grounding assessment
- [ ] R194 Transformer grounding assessment

**Built earlier — rebuild/carry over to the website and prove with tests:**

- [ ] R186 Equipment grounding conductor (EGC) sizing
- [ ] R187 Grounding electrode conductor (GEC) sizing
- [ ] R188 Bonding-jumper sizing
- [ ] R191 Cable-tray grounding and bonding assessment
- [ ] R196 Fence grounding and bonding assessment
- [ ] R197 Ground-grid conductor sizing
- [ ] R198 Ground-grid configuration design
- [ ] R199 Ground-grid spacing assessment
- [ ] R200 Ground-potential-rise (GPR) calculation
- [ ] R201 Step-voltage calculation
- [ ] R202 Touch-voltage calculation
- [ ] R203 Mesh-voltage calculation
- [ ] R204 Fault-current distribution assessment
- [ ] R205 Grounding-conductor thermal withstand calculation
- [ ] R206 Ground-rod arrangement and design assessment
- [ ] R207 Grounding design using supplied soil-resistivity values
- [ ] R208 Ground-resistance estimation using approved design methods
- [ ] R209 Ground-fault return-path assessment
- [ ] R210 Grounding and bonding design summary and schedules

## 6. Checks and audits still to be done

- [ ] IEEE 80 worked examples for the adopted edition; record edition and applicability limits (uniform/two-layer soil, grid geometry ranges).
- [ ] Independent scripts for Rg, mesh and step voltage; body-current and surface-layer factors checked against the standard.
- [ ] Hard tests: zero/blank inputs, extreme soil resistivity, very short/long clearing time, very high/low fault current, no rods / many rods, very small/large grid, missing zero-sequence data, ungrounded delta, grounded wye, HRG, multiple parallel EGCs, Cu vs Al, one- vs two-layer soil — no false PASS.
- [ ] Engineering and software audit; challenge campaign of 200 cases.
- [ ] Plus the standard audits and research register of Master Prompt Sections 11 and 72 (engineering, software, data, integration, UI/UX, security, requirements coverage).

## 7. Phases for this calculator
Phase names, "done when" rules and the process are in Master Prompt Section 62 and Section 7. What each phase means here:

| Phase | Work for this calculator |
|---|---|
| 0 Inventory (read-only) | Write the master specification of every function listed in Section 3 (inputs, outputs, method, standard edition); map R186–R210. |
| 1 Engine | Build the conductor-sizing, bonding, electrode, soil-model, IEEE 80 grid, tolerable-limit and return-path engines. |
| 2 Functional verification | Inputs, units, defaults, overrides, sequence, equations, intermediate values, invalid inputs, lookups, warnings, repeatability |
| 3 Challenge and independent validation | IEEE 80 examples, independent scripts, hard tests, challenge campaign. |
| 4 Customer workflow | Which inputs are visible, auto-filled from the database, inherited from other calculators, optional or advanced |
| 5 UX/UI | Grid layout and potential maps, bonding diagrams, schedules. |
| 6 Integration | Consume Fault_Current_Studio and MV_Electrical_Design results; give EGC sizes to cable calculators and Cable_Tray; grounding interface to Lightning_Surge_Protection. |
| 7 Release | Staging and public-URL tests, monitoring, backup/restore, rollback |

### 7.1 Calculator-specific rules carried over from the earlier documents
- Do not hard-code project-specific values into the generic calculator
- Integration chain: Fault → Protection → Clearing time → Grounding → Conductor thermal → IEEE 80 → Touch/Step
- Easy input → system model → calculations → results → checks → report; auto-populate from database
- Input classes: user, database, calculated, code value, manufacturer, assumption
- Status hierarchy FAIL > INPUT REQUIRED > REVIEW REQUIRED > PASS (use the full Section 34 status set; earlier WARNING → REVIEW REQUIRED, EXTERNAL VALIDATION REQUIRED → NOT VERIFIED)
- Reference database: method, standard, edition, equation location; never fabricate
- US customary and SI; explicit conversions

## 8. Final result — what "finished" looks like

- Verified grounding and bonding design on the website: conductor sizing (code and thermal), bonding of all PV and electrical equipment, electrodes, soil models from supplied data, IEEE 80 grid with touch/step/mesh/GPR, return paths and optimiser.
- 28-section grounding study report, grid layout, schedules — all from engine data.
- Every requirement in section 2 implemented, or marked NOT APPLICABLE / NOT SUPPORTED with a written reason, with evidence — plus the module completion checklist, website acceptance, reports/exports and final delivery report of Master Prompt Sections 57, 77–78, 87, 94 and 95.

## 9. Tools specific to this calculator
The common tool list is in Master Prompt Section 8.

| Purpose | Tool |
|---|---|
| Grounding verification | Python NumPy/SciPy, Wolfram |
| Feature benchmarking only | CDEGS, XGSLab, ETAP Ground Grid documentation |

Benchmark tools are used to compare features and results only — never copy their code, data or methods without checking them (Section 12).

## 10. Kept from the earlier requirement documents
`Requirements/MASTER_GROUNDING_REQUIREMENTS.md` and `Requirements/DETAILED_GROUNDING_REQUIREMENTS.md` were written for the retired Excel workbook. Their functions are in sections 2–3. Items moved to other calculators are listed in section 5 (fault and protection → Fault_Current_Studio; NGR / grounding transformer → MV_Electrical_Design; arresters and insulation coordination → Lightning_Surge_Protection, Transformer_POI). Grounding testing and commissioning tools from those documents are **out of scope** (no field testing / measurement / commissioning). Excel-specific rules (cell colours, sheet order, VBA, `#REF!` checks) no longer apply. Kept here because they are not in sections 1–9:

**28-section grounding study report (R210):** 1 Project information · 2 Basis of design · 3 Applicable standards · 4 System grounding configuration · 5 Input summary · 6 Fault-current assumptions · 7 Protection / clearing time · 8 Soil-resistivity measurements · 9 Soil model · 10 Grounding-electrode / grid design · 11 Ground conductor sizing · 12 Grid-current calculation · 13 Grid resistance · 14 GPR · 15 Tolerable touch voltage · 16 Tolerable step voltage · 17 Calculated mesh voltage · 18 Calculated step voltage · 19 Equipment bonding · 20 MV cable shield grounding · 21 Transformer grounding · 22 PV/BESS grounding where applicable · 23 Design exceptions · 24 PASS / FAIL / INPUT REQUIRED / REVIEW REQUIRED summary · 25 Recommendations · 26 Assumptions · 27 Calculation references · 28 QA / audit trail.

**Diagrams to generate:** system-grounding one-line; zero-sequence / fault-return path; grounding-grid layout; equipment-grounding connection schedule; EGC / shield / sheath path diagram; rod / electrode quantity schedule. (Grounding-transformer/NGR diagram and protection trip matrix come from MV_Electrical_Design and Fault_Current_Studio.)

**Questions the calculator must answer:** what is grounded and why; where fault current flows and how much; what detects and clears the fault and how long it takes; how much current enters the grounding system; whether the conductors survive it; grid resistance; GPR; touch/step voltage; whether the installation is safe; which code / standard requirement applies; what design change is needed if it fails.

**Every result also shows:** governing result, safety margin, controlling input, formula with variable definitions, unit check, standard/reference, assumptions and limitations, required corrective action.

**Scope from those documents:** LV up to 1,000 V and MV above 1 kV through 35 kV; AC and applicable DC grounding; PV, BESS, industrial, commercial, utility-interactive and standalone systems; no HV transmission grounding; no Heber 2 project values in the generic calculator.

**Standards named there (edition to be confirmed):** NEC Article 250 and applicable Articles 690, 705 and MV provisions; IEEE 80; IEEE 81; IEEE 837; IEEE 3003-series grounding guidance.

## 11. Status on 22 Nov 2026
- Previous calculator: retired (50/50 tests, 34/34 acceptance items). Repository: commit `5edfb6a`, 15 Nov 2026 (old workbook, VBA and ribbon files kept as reference).
- Phases 0–7 of section 7: **none started.** Next task: Phase 0.

---

# APPENDIX — all other .md files of this repository (word for word)

The documents below are copied word for word from the repository. Only heading levels were moved down so they fit inside this file.


---

## A1. Master grounding requirements (earlier Excel workbook prompt)


*Superseded where it conflicts with sections 1–9 (no Excel/VBA, no field testing; fault, NGR and arrester work belong to other calculators).*


*Source file: `Requirements/MASTER_GROUNDING_REQUIREMENTS.md`*

This is my **MASTER Grounding Calculator**. Continue development from the exact workbook I provide.

#### CRITICAL PRESERVATION RULE

Do NOT remove, simplify, replace, reset, recreate, or break anything that is already working.

Preserve ALL existing:

- formulas
- calculations
- dropdowns and data validations
- formatting
- conditional formatting
- databases
- tables
- source/reference URLs
- engineering logic
- dashboards
- reports
- charts
- QA/audit sheets
- VBA / one-click reporting compatibility
- existing user-input logic
- existing PASS/FAIL logic
- existing advanced capabilities

Before making changes, **audit the existing workbook**.

Create a **new version** rather than overwriting the baseline workbook.

After development, regression-test the new version against the original workbook.

---

### SCOPE

The calculator is for:

**LV + MV electrical systems only.**

Do NOT expand the calculator into dedicated HV/EHV/UHV transmission engineering.

However, retain any HV theory that is necessary for correct LV/MV engineering, such as insulation, surge, lightning, cable shielding, grounding transients, and equipment withstand concepts.

The objective is to turn this workbook into a professional:

### MASTER LV/MV GROUNDING ENGINEERING & STUDY CALCULATOR

It should support grounding design from basic NEC grounding/bonding calculations through advanced grounding studies.

---

### 1. SYSTEM GROUNDING ANALYZER

Add an engine that can analyze the electrical grounding configuration.

Support at minimum:

- solidly grounded systems
- grounded-wye systems
- delta systems
- ungrounded systems
- corner-grounded delta
- high-resistance grounding
- low-resistance grounding
- resistance grounding
- reactance grounding where applicable
- grounding transformers
- zig-zag grounding transformers
- grounded-wye/delta transformers
- delta/grounded-wye transformers
- delta/delta transformers
- wye/wye transformers
- separately derived systems

Determine where defensible:

- neutral availability
- grounding source
- zero-sequence source
- zero-sequence return path
- ground-fault-current path
- whether a grounding transformer may be required
- system grounding concerns
- neutral-ground bonding requirements/checks

Provide clear:

**PASS / FAIL / INPUT REQUIRED / REVIEW REQUIRED**

status where appropriate.

---

### 2. GROUND-FAULT & FAULT-CURRENT ENGINE

Add calculations for:

- 3-phase faults
- line-to-line faults
- single-line-to-ground faults
- double-line-to-ground faults
- bolted faults
- impedance faults
- arcing/high-impedance fault inputs where defensible

Support:

- positive-sequence impedance Z1
- negative-sequence impedance Z2
- zero-sequence impedance Z0
- fault impedance
- grounding impedance
- neutral impedance
- transformer impedance
- source impedance
- generator contribution
- motor contribution
- inverter contribution where manufacturer data permits

Use symmetrical-component methods where applicable.

Do NOT assume that 3-phase fault current equals line-to-ground fault current.

---

### 3. GROUNDING-CONDUCTOR SIZING ENGINE

Calculate/check:

- equipment grounding conductors
- grounding electrode conductors
- bonding jumpers
- system bonding jumpers
- main bonding jumpers where applicable
- supply-side bonding jumpers
- ground-grid conductors
- grounding-electrode connections
- parallel feeder EGC requirements

Include:

- NEC sizing requirements
- conductor material
- copper/aluminum
- conductor length where relevant
- fault-current magnitude
- clearing time
- thermal withstand
- I²t
- adiabatic/thermal checks where applicable
- minimum permitted conductor size
- calculated thermal size
- governing required size

Show both:

**Code minimum**

and

**Engineering/thermal minimum**

and select the governing requirement.

---

### 4. GROUNDING-ELECTRODE ENGINE

Calculate grounding resistance and related parameters for:

- single ground rod
- multiple ground rods
- parallel rods
- rod arrays
- ground rings
- horizontal conductors
- buried conductors
- grounding grids
- plate electrodes
- concrete-encased electrodes where a defensible calculation method exists
- structural electrodes where appropriate
- deep electrodes

Consider:

- soil resistivity
- rod length
- rod diameter
- conductor length
- burial depth
- electrode spacing
- mutual resistance
- diminishing benefit from closely spaced rods
- electrode geometry

Do NOT simply assume:

two rods = half the resistance.

Account for mutual effects where the selected engineering method permits.

---

### 5. SOIL-RESISTIVITY ENGINE

Add a complete soil-resistivity analysis section.

Support:

- Wenner four-pin method
- electrode spacing
- probe depth
- measured resistance
- apparent resistivity
- correction factors where applicable
- multiple test directions
- multiple test locations
- data-quality checks
- outlier identification
- resistivity-vs-spacing plots
- arithmetic statistics
- geometric statistics where useful
- depth trend interpretation

Support:

- uniform soil model
- one-layer model
- two-layer soil model

For two-layer models determine where defensible:

- upper-layer resistivity
- lower-layer resistivity
- layer depth

Include model-fit/error information.

Never silently invent soil properties.

---

### 6. IEEE 80 GROUND-GRID ENGINE

Build a comprehensive grounding-grid study engine based on the applicable IEEE methodology.

Inputs should support:

- grid length
- grid width
- irregular geometry where practical
- conductor spacing
- conductor burial depth
- conductor diameter/size
- conductor material
- total buried conductor length
- number of ground rods
- rod length
- rod diameter
- rod locations where supported
- soil model
- surface-layer material
- surface-layer resistivity
- surface-layer thickness
- fault current
- X/R ratio where required
- clearing time
- current division
- fault-current growth factor where specified

Calculate where applicable:

- symmetrical ground-fault current
- decrement factor
- current division factor
- maximum grid current
- effective grid conductor length
- grid resistance
- ground potential rise
- surface-layer derating factor
- tolerable body current
- tolerable touch voltage
- tolerable step voltage
- mesh voltage
- calculated step voltage
- conductor thermal capability

Evaluate:

Mesh Voltage ≤ Tolerable Touch Voltage

and

Calculated Step Voltage ≤ Tolerable Step Voltage

with clear engineering status.

---

### 7. TOUCH / STEP / MESH / TRANSFERRED-POTENTIAL ENGINE

Provide dedicated calculations for:

- touch potential
- step potential
- mesh potential
- metal-to-metal touch potential where applicable
- transferred potential
- ground potential rise
- remote-earth reference

Support applicable body-weight criteria, including:

- 50 kg
- 70 kg

where required by the selected methodology.

Account for:

- fault duration
- surface resistivity
- surface-layer thickness
- surface derating
- grid geometry
- grid current

Clearly distinguish:

**Tolerable voltage**

from

**Calculated voltage**.

---

### 8. GROUND-FAULT CURRENT-DISTRIBUTION ENGINE

Where sufficient system data are available, evaluate fault-current division through:

- ground grid
- earth
- equipment grounding conductors
- neutral conductors
- MV cable shields
- concentric neutrals
- metallic conduit
- cable tray
- structural steel
- interconnected grounding grids
- other metallic return paths

Do NOT automatically assume the entire available fault current enters earth.

Calculate or require the applicable grid-current/current-division factor.

---

### 9. MV CABLE GROUNDING & SHIELD ENGINE

Add MV cable grounding calculations/checks for:

- metallic shields
- copper tape shields
- wire shields
- concentric neutrals where applicable
- cable shield grounding
- shield fault-current capability
- shield thermal withstand
- shield grounding conductor
- induced shield/sheath voltage
- circulating current
- sheath losses where applicable

Support:

- single-point bonding
- both-end bonding
- cross-bonding where relevant to the LV/MV scope

Evaluate grounding at:

- switchgear
- transformers
- sectionalizers
- vaults
- splices
- terminations

Clearly distinguish:

**EGC**

from

**MV cable shield**.

Do not automatically treat a cable shield as a full EGC unless the applicable design/code conditions are satisfied.

---

### 10. EQUIPMENT-BONDING ENGINE

Add grounding/bonding checks for:

- transformers
- inverter skids
- MV switchgear
- LV switchgear
- switchboards
- panelboards
- MCCs
- sectionalizers
- reclosers
- vaults
- cable trays
- metallic raceways
- equipment pads
- structural steel
- fences
- gates
- bollards
- poles
- equipment enclosures
- PV structures
- tracker structures
- combiner boxes
- battery/BESS equipment

Determine required grounding/bonding conductors and flag missing bonding paths.

---

### 11. TRANSFORMER-GROUNDING ENGINE

Analyze:

- transformer winding configuration
- vector configuration where supplied
- neutral availability
- neutral grounding
- separately derived system grounding
- zero-sequence behavior
- delta blocking of zero-sequence current
- ground-fault return paths

Support calculations for:

- neutral grounding resistor
- grounding transformer
- zig-zag grounding transformer
- grounding current
- resistor current
- resistor resistance
- resistor voltage
- resistor power/energy duty
- time rating where applicable

Provide warnings where a system appears to lack an intentional grounding/zero-sequence source.

---

### 12. PV / BESS GROUNDING ENGINE

Include grounding analysis for:

- PV arrays
- module structures
- tracker structures
- piles/piers
- combiner boxes
- DC equipment
- inverter equipment
- inverter skids
- integrated transformers
- LV AC side
- MV collector system
- MV switchgear
- BESS equipment
- battery containers
- PCS
- transformers
- auxiliary systems

Analyze:

- DC grounding
- AC grounding
- equipment bonding
- EGC paths
- grounding electrodes
- skid grounding
- structural bonding
- MV shield grounding
- grounding-grid connection

Do not assume inverter fault contribution.

Require manufacturer data or a defensible model.

---

### 13. OCPD / PROTECTION INTERACTION ENGINE

Connect grounding calculations to protection.

Support:

- fuses
- MCCBs
- ICCBs
- LV power circuit breakers
- MV vacuum circuit breakers
- protective relays
- reclosers
- sectionalizers where applicable

Support protection functions including:

- 50
- 51
- 50G
- 51G
- 50N
- 51N
- 67
- 67N
- 87
- 27
- 59
- 59N
- 32
- 46
- 47
- 49
- 81
- 86
- breaker-failure protection where relevant

Calculate/use:

- pickup current
- fault current
- relay operating time
- breaker opening time
- total clearing time
- fuse clearing time
- trip delay

Use actual clearing time in:

- grounding conductor thermal calculations
- IEEE 80 calculations
- touch/step safety calculations

Do NOT assume an arbitrary clearing time when actual protection data are available.

---

### 14. GROUNDING TESTING ENGINE

Add engineering/testing tools for:

- fall-of-potential testing
- 62% method where applicable
- resistance-vs-distance plots
- ground-rod testing
- grounding-grid testing
- continuity testing
- grid-integrity test records
- measured vs calculated ground resistance
- Wenner test processing

Include warnings regarding limitations of each test method.

---

### 15. GROUNDING DESIGN OPTIMIZER

When a design fails, do not only display FAIL.

Determine which design variables can improve the result.

Allow comparison of alternatives involving:

- grid dimensions
- conductor spacing
- conductor burial depth
- conductor size
- conductor material
- number of rods
- rod length
- rod spacing
- perimeter electrodes
- surface-layer resistivity
- surface-layer thickness
- fault clearing time where protection changes are legitimately possible

Show:

**Original Design**

vs.

**Alternative Designs**

and quantify the effect on:

- grid resistance
- GPR
- mesh voltage
- step voltage
- touch margin
- conductor thermal margin

Do not automatically recommend a design change without showing its engineering effect.

---

### INTEGRATION WITH OTHER STUDIES

The Grounding Calculator should be designed to exchange information with other engineering calculators.

Preferred workflow:

FAULT CURRENT CALCULATOR
→ PROTECTION / OCPD
→ CLEARING TIME
→ GROUNDING CALCULATOR
→ CONDUCTOR THERMAL CHECK
→ IEEE 80
→ TOUCH / STEP
→ FINAL DESIGN STATUS

Where possible, structure inputs/outputs so they can later integrate with:

- Fault Current Calculator
- Cable Calculator
- Cable Tray Calculator
- Transformer Calculator
- Protection Coordination Calculator
- Arc Flash Calculator
- MV Cable Calculator
- PV Design Calculator
- BESS Calculator

---

### USER EXPERIENCE

The calculator must remain easy for normal users.

Prefer:

**EASY INPUT**
→ **SYSTEM MODEL**
→ **CALCULATIONS**
→ **RESULTS**
→ **DESIGN CHECKS**
→ **REPORT**

Normal users should NOT have to manually enter values that can be reliably calculated or pulled from a validated database.

Examples:

- conductor properties should auto-populate from conductor selection
- material constants should auto-populate
- standard voltages should use dropdowns
- standard conductor sizes should use dropdowns
- equipment types should use dropdowns
- known engineering constants should not require manual entry

Advanced inputs should remain available in dedicated advanced sections.

---

### INPUT PHILOSOPHY

Every input must be classified as one of:

1. USER INPUT
2. DATABASE VALUE
3. CALCULATED VALUE
4. CODE/STANDARD VALUE
5. MANUFACTURER VALUE
6. ENGINEERING ASSUMPTION

Do not hide engineering assumptions.

If an assumption is required, display it clearly.

If calculation cannot defensibly proceed:

**INPUT REQUIRED**

is preferred over inventing a value.

---

### ENGINEERING STATUS HIERARCHY

Use this hierarchy consistently:

**FAIL**

>

**INPUT REQUIRED**

>

**REVIEW REQUIRED**

>

**PASS**

Do not show PASS when critical required inputs are missing.

---

### REFERENCES / TRACEABILITY

Every major calculation engine must identify:

- calculation method
- governing standard/reference
- edition/year
- equation/reference location where legally and practically possible
- assumptions
- units
- intermediate calculations

Build a reference database for applicable:

- NEC / NFPA
- IEEE
- ANSI
- NEMA
- UL
- manufacturer engineering/application guides

Use only the applicable LV/MV portions.

Do not fabricate code sections, equations, tables, standards, manufacturer data, or source URLs.

---

### UNITS

Support both:

**US customary**

and

**SI**

where practical.

Internally use consistent calculation units and perform explicit conversions.

Prevent mixed-unit calculation errors.

---

### QA / HARD TESTING

After implementation, perform hard tests including:

- zero values
- blank inputs
- minimum values
- maximum practical values
- extremely low soil resistivity
- extremely high soil resistivity
- very short clearing time
- long clearing time
- very high fault current
- low fault current
- no ground rods
- many rods
- very small grid
- very large grid
- missing zero-sequence data
- ungrounded delta system
- grounded-wye system
- HRG system
- multiple parallel EGCs
- copper vs aluminum
- single-layer vs two-layer soil

Check for:

- \#VALUE!
- \#REF!
- \#DIV/0!
- \#N/A
- circular references
- broken named ranges
- broken dropdowns
- invalid formulas
- hidden hard-coded assumptions
- inconsistent units
- false PASS conditions

Regression-test all existing functions after every major development stage.

---

### FINAL REPORTING

Create/maintain a professional Grounding Study Report capable of presenting:

1. Project information
2. Basis of design
3. Applicable standards
4. System grounding configuration
5. Input summary
6. Fault-current assumptions
7. Protection/clearing time
8. Soil-resistivity measurements
9. Soil model
10. Grounding-electrode/grid design
11. Ground conductor sizing
12. Grid-current calculation
13. Grid resistance
14. GPR
15. Tolerable touch voltage
16. Tolerable step voltage
17. Calculated mesh voltage
18. Calculated step voltage
19. Equipment bonding
20. MV cable shield grounding
21. Transformer grounding
22. PV/BESS grounding where applicable
23. Design exceptions
24. PASS / FAIL / INPUT REQUIRED / REVIEW REQUIRED summary
25. Recommendations
26. Assumptions
27. Calculation references
28. QA/audit trail

The report must show enough intermediate engineering information that another qualified engineer can review how the result was obtained.

---

### DEVELOPMENT PHILOSOPHY

Do not turn this into a collection of disconnected formulas.

Build it as an integrated:

**LV/MV Grounding Engineering Study Platform.**

The calculator should answer:

- What is grounded?
- Why is it grounded?
- Where does fault current flow?
- How much fault current flows?
- What detects the fault?
- What clears the fault?
- How long does clearing take?
- How much current enters the grounding system?
- Can the grounding conductors survive it?
- What is the grid resistance?
- What is the GPR?
- What touch/step voltage develops?
- Is the installation safe?
- What code/standard requirement applies?
- What design change is required if it fails?

Use the supplied books, standards, manufacturer literature, engineering references, existing databases, and validated calculation methods to improve the calculator.

Do NOT blindly implement equations from secondary references.

Cross-check important calculations against authoritative standards and, where possible, independent engineering references.

#### MOST IMPORTANT

Preserve everything already working.

Audit first.

Develop incrementally.

Create a new version.

Regression-test continuously.

Do not guess missing engineering data.

Do not hide assumptions.

Do not generate false PASS results.

Keep the front end simple while making the backend engineering as comprehensive as reasonably possible.


---

## A2. Detailed grounding requirements (earlier Excel workbook prompt)


*Superseded where it conflicts with sections 1–9.*


*Source file: `Requirements/DETAILED_GROUNDING_REQUIREMENTS.md`*

Act as a Senior LV/MV Grounding Engineer, Protection Engineer, and Expert Spreadsheet Architect.

Continue development of my existing Grounding Calculator using the attached workbook and all grounding, protection, NEC, IEEE, cable, transformer, and manufacturer reading material already provided in this project.

#### Critical preservation rule

Do not remove, simplify, replace, reset, or break anything already working.

Preserve all existing:

- Formulas and calculation engines
- Databases and source URLs
- Dropdowns and data validation
- Formatting and conditional formatting
- Diagrams and reports
- Named ranges, macros, and automation
- Previously accepted engineering logic

First audit the workbook, identify missing functions, and add only what is missing.

#### Scope

- LV systems: up to 1,000 V
- MV systems: above 1 kV through 35 kV
- AC and applicable DC grounding
- PV, BESS, industrial, commercial, utility-interactive and standalone systems
- Exclude HV transmission grounding
- Do not hard-code Heber 2 values into the generic calculator

#### Required calculator functions

##### 1. System-grounding model

Calculate and evaluate:

- Solidly grounded systems
- Ungrounded systems
- High-resistance grounding
- Low-resistance grounding
- Reactance grounding
- Grounded-wye sources
- Delta systems
- Grounded-wye/delta transformers
- Delta/grounded-wye transformers
- Wye-wye transformers
- Zig-zag grounding transformers
- Grounding banks
- Multiple grounding sources
- Generator and inverter grounding
- Utility, generator, inverter and islanded operating modes
- Grounding-source availability for every switching condition
- Automatic “NO ZERO-SEQUENCE PATH” warning

Trace the complete fault-return path through sources, transformers, neutrals, NGRs, EGCs, shields, earth and grounding grids.

##### 2. Fault-current calculations

Calculate maximum and minimum:

- Three-phase fault
- Single-line-to-ground fault
- Line-to-line fault
- Double-line-to-ground fault
- Positive-, negative- and zero-sequence networks
- Source, transformer, cable, motor, generator and inverter contributions
- Radial and multi-bus systems
- X/R ratio
- DC decrement
- Asymmetrical RMS current
- First-peak current
- Breaker interrupting and close-and-latch duty
- Minimum fault current for relay operation

Never convert three-phase fault current directly into ground-fault current without a valid zero-sequence network.

##### 3. Cable-charging and ungrounded-system calculations

Calculate:

- Phase-to-ground capacitance
- Cable-charging current
- Total system charging current
- First ground-fault capacitive current
- Neutral displacement
- Healthy-phase voltage rise
- Temporary overvoltage
- Resonant/arcing-ground risk
- Effect of spare and de-energized connected cables
- Effect of inverter filters, transformers, arresters and connected equipment where data is available

##### 4. Grounding-transformer and NGR sizing

Calculate and select:

- Zig-zag grounding-transformer rating
- Grounded-wye/closed-delta grounding-transformer rating
- Neutral grounding resistor resistance
- Target ground-fault current
- NGR voltage rating
- Short-time current rating
- Time rating
- Thermal energy and power duty
- Grounding-transformer zero-sequence impedance
- Resistor current versus system-charging current
- Multiple grounding-source current contribution
- Grounding-source loss and switching conditions
- Required CTs, relays and NGR monitoring

Do not recommend an NGR current until the complete charging current and protection requirements are evaluated.

##### 5. Soil-resistivity calculations

Include:

- Wenner four-pin test calculations
- Apparent resistivity using `ρ_a=2πaR`
- Unit conversion and probe-depth correction
- Data-quality and outlier checks
- Directional comparison
- Uniform-soil model
- Two-layer soil model
- Multi-layer sensitivity where justified
- Seasonal moisture sensitivity
- Dry/wet soil sensitivity
- Soil thermal and electrical resistivity kept clearly separate

##### 6. Ground-electrode calculations

Calculate resistance and performance for:

- Single ground rod
- Multiple rods with mutual resistance
- Rod spacing optimization
- Deep rods
- Ground rings
- Rectangular and irregular grids
- Horizontal conductors
- Ground plates
- Concrete-encased electrodes
- Structural steel and piles
- Foundations
- Parallel electrode combinations
- Fence and gate electrodes
- Equipment-local grounding systems

Provide zero-credit and credited-electrode sensitivity where electrode performance is uncertain.

##### 7. IEEE 80 grounding-grid study

Calculate:

- Grid resistance
- Ground-grid current
- Fault-current split factor
- Decrement factor
- Effective fault duration
- Ground-potential rise
- Tolerable touch voltage
- Tolerable step voltage
- Mesh voltage
- Actual step voltage
- Transferred potential
- Surface-layer derating factor
- Crushed-rock/gravel performance
- Body-weight cases
- Conductor spacing and burial-depth effects
- Grid geometry factors
- Rod contribution
- Grid conductor thermal duty
- Pass/fail safety margins

Keep total phase-fault current, metallic return current, earth current and grid current as separate quantities.

##### 8. EGC, GEC and bonding-conductor calculations

Include:

- NEC EGC sizing
- GEC sizing
- Supply-side bonding jumpers
- Equipment bonding jumpers
- Parallel-circuit EGC rules
- Voltage-drop/impedance check
- Adiabatic `I^2t` thermal withstand
- Copper and aluminum conductors
- Insulated and bare conductors
- Maximum allowable clearing time
- Fault-current withstand
- Corrosion and material compatibility
- Length-adjusted impedance
- Minimum code size versus calculated engineering size

##### 9. Parallel fault-current path calculation

Calculate current division through:

- Dedicated EGCs
- Cable shields
- Metallic sheaths
- Armor
- Cable tray
- Ground rings
- Structural steel
- Piles
- Ground rods
- Earth
- Parallel conductors
- Neutral and grounding resistors

Use complex impedance, not resistance-only division when reactance is significant.

##### 10. MV cable shield and sheath grounding

Evaluate:

- Single-point bonding
- Both-end bonding
- Multi-point bonding
- Cross-bonding
- Shield induced voltage
- Shield circulating current
- Shield loss
- Sheath loss
- Ampacity reduction
- Shield short-circuit withstand
- Grounding-lead sizing
- Splice and termination bonding
- CLX/MC armor and integral EGC paths
- Touch voltage at open shield ends

##### 11. Equipment-specific grounding

Provide calculations and connection schedules for:

- Transformers
- Switchgear
- Inverter skids
- BESS equipment
- PV combiners
- Trackers
- CAB messenger systems
- Equipment piles
- Vaults and manholes
- Sectionalizers
- Reclosers
- Cable trays
- Fences and gates
- Bollards
- Weather stations
- Master-controller poles
- Communication/fiber armor
- Surge-protective devices
- Lightning-system interfaces

Clearly distinguish system grounding, equipment grounding, electrode grounding and protection.

##### 12. Ground-fault protection and coordination

Evaluate:

- 50N/51N
- 50G/51G
- 67N/67G
- 59N/59G
- `3V_0` and `3I_0`
- Residual CT connections
- Core-balance CTs
- Broken-delta/open-delta VT schemes
- Restricted earth fault
- Transformer differential protection
- NGR monitoring
- Grounding-transformer protection
- Breaker-failure timing
- Relay pickup sensitivity
- Minimum detectable fault
- Selective feeder tripping
- First-fault alarm versus trip
- Loss-of-grounding-source trip logic
- Inverter anti-islanding and external-trip interfaces
- Complete trip matrix for every operating mode

##### 13. Surge-arrester and insulation-coordination checks

Calculate or evaluate:

- Grounded versus ungrounded arrester application
- MCOV suitability
- Temporary overvoltage duty
- Healthy-phase voltage rise during an SLG fault
- Cable insulation level
- Transformer BIL
- Arrester protective margin
- Grounding-method impact on insulation stress

##### 14. Testing and commissioning

Generate procedures and acceptance fields for:

- Wenner testing
- Fall-of-potential testing
- Clamp-on testing limitations
- Ground-grid impedance measurement
- Point-to-point continuity
- Bond resistance
- Shield-current measurement
- NGR and grounding-transformer testing
- Relay secondary injection
- Trip-time verification
- Visual inspection and torque records
- As-built electrode records

##### 15. Sensitivity and design optimization

Automatically compare:

- Rod quantity, spacing, diameter and depth
- Ring/grid dimensions
- Grid conductor spacing
- Burial depth
- Soil resistivity
- Surface-layer thickness and resistivity
- Fault current
- Clearing time
- Current split
- NGR current
- Grounding-transformer location
- One versus multiple grounding sources
- Seasonal soil conditions
- With and without pile/structural-steel credit

#### Workbook architecture

Use this order:

1. USER INPUTS
2. RESULTS SUMMARY
3. DESIGN CHECKS
4. SYSTEM MODEL
5. GROUNDING DIAGRAM
6. DETAILED CALCULATIONS
7. REPORT
8. DATABASES
9. FORMULA DOCUMENTATION
10. SOURCES
11. QA/QC

All user-editable inputs must be on one clearly organized input sheet:

- Blue cells: dropdown selections
- Yellow cells: manual inputs
- Green cells: calculated/read-only outputs

Backend sheets may be hidden but must remain accessible.

#### Formula and database requirements

- No hard-coded project values inside formulas
- No manual entry outside the input sheet
- Every result must trace back to an input or sourced database value
- Auto-populate conductor, cable, transformer, electrode and material properties from databases
- Allow clearly marked manual overrides
- Show units for every value
- Support SI and U.S. customary units
- Perform dimensional/unit checks
- Show intermediate calculations
- Avoid unsupported Excel functions and unnecessary `@` operators
- Maintain Microsoft Excel compatibility
- Do not fabricate missing manufacturer or standard data
- Mark unavailable calculations as “INPUT REQUIRED” or “EXTERNAL VALIDATION REQUIRED”

#### Standards and references

Use only authenticated information from the supplied material and applicable editions of:

- NEC Article 250 and applicable Articles 690, 705 and MV provisions
- IEEE 80
- IEEE 81
- IEEE 837
- IEEE 3003-series grounding guidance
- Applicable IEEE/ANSI fault and protection standards
- Applicable IEC methods where selected by the user
- Manufacturer cable, transformer, NGR, relay, arrester and grounding-hardware data

Record the exact standard edition, section, table, source document and URL wherever legally and practically available.

#### Required results

Every calculation must produce:

- PASS
- WARNING
- FAIL
- INPUT REQUIRED
- EXTERNAL VALIDATION REQUIRED
- NOT APPLICABLE

Also display:

- Governing result
- Safety margin
- Controlling input
- Applicable formula
- Formula-variable definitions
- Unit verification
- Standard/reference
- Assumptions and limitations
- Required corrective action

#### Diagrams and reports

Automatically generate:

- System-grounding one-line
- Zero-sequence/fault-return path
- Grounding-grid layout
- Equipment-grounding connection schedule
- EGC/shield/sheath path diagram
- Grounding-transformer/NGR diagram
- Protection trip matrix
- Rod/electrode quantity schedule

Provide a professional printable engineering report containing inputs, assumptions, formulas, calculations, results, warnings, diagrams, references and unresolved information.

#### Verification requirements

Before delivery:

1. Audit every existing and new formula.
2. Recalculate representative cases independently.
3. Test solidly grounded, ungrounded, HRG/LRG, delta, grounding-transformer, PV collector and substation-grid examples.
4. Verify minimum and maximum fault cases.
5. Check all units.
6. Check for broken references, Excel errors and hard-coded values.
7. Confirm dropdowns and automatic database population.
8. Confirm that changing any input updates every dependent result.
9. Preserve all previously working functions.
10. Provide a final completed-functions list and a separate remaining-limitations list.

Do not stop after providing recommendations or a plan. Modify and complete the workbook in controlled batches, test every batch, and deliver the updated working calculator.


---

## A3. Calculator prompt files — index (00_INDEX.md, same in all five calculator repos)


*Source file: `00_INDEX.md`*

### Calculator prompt files — index

One file per calculator. Each file is the only document that calculator needs; give it to the AI together with Master Prompt V5.0 (`00_MASTER_PROMPT_V5.0.txt`). Every file has the same sections:

0 About this file · 1 What the calculator does · 2 Requirements (V5.0 requirements verbatim + requirements from the earlier documents + method/verification + connections) · 3 Work already done · 4 Functions still to be added · 5 Earlier work still to be completed · 6 Checks and audits still to be done · 7 Process to follow · 8 Final result · 9 Plugins and tools · 10 First task

**Existing calculators**

| File | Calculator | V5.0 group |
|---|---|---|
| Fault_Current_Studio_prompt.md | Fault current, protection, arc flash, load flow, harmonics | 14 |
| Production_Calculator_prompt.md | Site, resource, shading, tracker, bifacial, plant sizing, energy yield | 1, 16 |
| Cable_Thermal_Calculator_prompt.md | Trench, underground cable, duct bank thermal | 8 |
| Grounding_Calculator_prompt.md | Grounding and bonding | 9 |
| Cable_Tray_Calculator_prompt.md | Conduit, raceway, cable tray, routing, cable pulling | 7 |
| Vault_Calculator_prompt.md | Boxes, enclosures, handholes, vaults | 6 |

**New calculators**

| File | Calculator | V5.0 group |
|---|---|---|
| PV_String_MPPT_Calculator_prompt.md | PV module, string and MPPT design | 2 |
| DC_Protection_Combiner_Calculator_prompt.md | DC protection, fuses, combiner/junction boxes | 3 |
| DC_Cable_Connector_Calculator_prompt.md | DC cables and connectors | 4 |
| Inverter_LV_AC_Calculator_prompt.md | Inverter and LV AC design | 5 |
| Lightning_Surge_Protection_Calculator_prompt.md | Lightning and surge protection | 10 |
| LV_Interconnection_Metering_Calculator_prompt.md | LV interconnection, export control, metering | 11 |
| MV_Electrical_Design_Calculator_prompt.md | Medium-voltage design | 12 |
| Transformer_POI_Calculator_prompt.md | Transformers and POI | 13 |
| Interconnection_Architecture_Calculator_prompt.md | Interconnection architectures | 15 |
| Documentation_Schedules_QA_Calculator_prompt.md | Schedules, BOM, reports, design QA | 17 |

**Shared (used by every calculator)**

| File | Role |
|---|---|
| Engineering_Master_Database_prompt.md | The single equipment database |
| Platform_Website_prompt.md | The website itself: pages, projects, network model, shared engines, security, deployment |

All 428 Master Prompt requirement IDs are covered, each in exactly one file.

**Suggested order:** Engineering_Master_Database → Platform_Website → Fault_Current_Studio → Production_Calculator → Grounding, Cable_Thermal, Cable_Tray, Vault → PV_String_MPPT → DC_Protection_Combiner → DC_Cable_Connector → Inverter_LV_AC → Transformer_POI → MV_Electrical_Design → LV_Interconnection_Metering → Lightning_Surge_Protection → Interconnection_Architecture → Documentation_Schedules_QA.


---

## A4. Original prompt file (as it was before this merge)


*Sections 1–11 above contain all of its calculator-specific content; the common parts are in Master Prompt V5.0. Kept here only so nothing is lost word for word.*


*Source file: `Grounding_Calculator_prompt.md`*

### Grounding_Calculator_prompt
#### Grounding & Bonding Design Calculator

| Item | Detail |
|---|---|
| Calculator | **Grounding_Calculator** |
| Status | Existing calculator — continue and complete on the website |
| Website page | `/grounding` (system grounding, conductor sizing, bonding, ground grid, touch/step) |
| Master Prompt V5.0 scope | Group 9 — Grounding and Bonding Design (R186–R210) |
| Project types | P1 utility fixed-tilt, P2 utility single-axis tracker, P3 commercial carport, P4 commercial/industrial rooftop, P5 residential rooftop — applicability recorded per requirement (REQUIRED / CONDITIONAL / NOT APPLICABLE / UNSUPPORTED, Section 19) |
| Revision | Final — 14 November 2026 |

#### 0. About this file

- This is the **only** project document for this calculator. It replaces every earlier README, prompt, handoff and requirement document; everything still needed from them is written here.
- Governing specification: **Master Prompt V5.0** (Integrated Electrical PV Design Engineering Platform, 9 November 2026). Give the AI both this file and the Master Prompt at the start of every session. If the two ever disagree, the Master Prompt wins.
- The calculator is part of **one integrated public website** (Master Prompt Sections 2, 43, 80): its own route/page, shared project data, shared equipment database, shared reports.
- Reply to the owner in **Hinglish** (simple Hindi–English). Write code, reports and documents in English.
- The owner is an electrical / PV design engineer, not a software developer. The AI does the research, design, coding, testing, debugging and documentation itself (Master Prompt Sections 1–4).


#### 1. What this calculator does

Equipment grounding and grounding electrode conductors, bonding jumpers, PV module-frame, rack, tray, raceway, inverter, transformer, pole and fence grounding and bonding, ground-grid conductor sizing, configuration and spacing, GPR, step, touch and mesh voltage, fault-current distribution, conductor thermal withstand, ground rods, grounding design from **supplied** soil-resistivity values (including uniform and two-layer soil models fitted to them), ground-resistance estimation, return-path assessment, summary and schedules (Group 9, R186–R210). IEEE 80 is the ground-grid method, subject to the adopted edition.

**Scope boundary:** Never build, anywhere in this calculator: generator sources or sizing, HV / EHV equipment or studies (above the 35 kV class), substation engineering, field testing / measurement / commissioning, structural / civil / mechanical calculations, and any financial or cost calculation (equipment prices, CAPEX, OPEX, LCOE, tariffs). BESS is deferred (Master Prompt Section 18): do not build it now, but keep data models ready for it. Everything is built on the public website — no spreadsheets, no VBA, no desktop tools.


#### 2. Requirements of this calculator


##### 2.1 Functional requirements from Master Prompt V5.0

Every requirement below must end up implemented and verified, or marked NOT APPLICABLE / NOT SUPPORTED with a written reason. "Current state" is the starting point found in the earlier work; confirm it in Phase 0.


**Group 9 — Grounding and Bonding Design (R186–R210, 25 active)**

| ID | Requirement (Master Prompt V5.0, verbatim) | Current state |
|---|---|---|
| R186 | Equipment grounding conductor (EGC) sizing. | Built earlier — verify |
| R187 | Grounding electrode conductor (GEC) sizing. | Built earlier — verify |
| R188 | Bonding-jumper sizing. | Built earlier — verify |
| R189 | PV module-frame grounding and bonding assessment. | Partly built — complete |
| R190 | PV mounting-rack grounding and bonding assessment. | Partly built — complete |
| R191 | Cable-tray grounding and bonding assessment. | Built earlier — verify |
| R192 | Conduit and raceway bonding assessment. | Partly built — complete |
| R193 | Inverter grounding assessment. | Partly built — complete |
| R194 | Transformer grounding assessment. | Partly built — complete |
| R195 | Pole and associated electrical-equipment grounding. | Not built — build new |
| R196 | Fence grounding and bonding assessment. | Built earlier — verify |
| R197 | Ground-grid conductor sizing. | Built earlier — verify |
| R198 | Ground-grid configuration design. | Built earlier — verify |
| R199 | Ground-grid spacing assessment. | Built earlier — verify |
| R200 | Ground-potential-rise (GPR) calculation. | Built earlier — verify |
| R201 | Step-voltage calculation. | Built earlier — verify |
| R202 | Touch-voltage calculation. | Built earlier — verify |
| R203 | Mesh-voltage calculation. | Built earlier — verify |
| R204 | Fault-current distribution assessment. | Built earlier — verify |
| R205 | Grounding-conductor thermal withstand calculation. | Built earlier — verify |
| R206 | Ground-rod arrangement and design assessment. | Built earlier — verify |
| R207 | Grounding design using supplied soil-resistivity values. | Built earlier — verify |
| R208 | Ground-resistance estimation using approved design methods. | Built earlier — verify |
| R209 | Ground-fault return-path assessment. | Built earlier — verify |
| R210 | Grounding and bonding design summary and schedules. | Built earlier — verify |

##### 2.2 Additional requirements from this calculator's earlier documents

These came from the earlier README / prompt / requirement documents and are kept because they match Master Prompt V5.0.

| # | Requirement | Matches V5.0 |
|---|---|---|
| D01 | System grounding analyser: solid, ungrounded, HRG/LRG, reactance, GT, zig-zag, transformer connections, zero-sequence path, "NO ZERO-SEQUENCE PATH" warning | R291, R313–R314, R209; Section 35 (no zero-sequence from delta) |
| D02 | Cable charging, ungrounded systems, neutral displacement, TOV, arcing ground | R269 (charging), R223 (TOV exposure) |
| D03 | Uniform, two-layer, multi-layer sensitivity, seasonal sensitivity; soil thermal vs electrical kept separate | R207 |
| D04 | Electrode engine: rods, multiple rods with mutual resistance, rings, grids, plates, Ufer, piles, deep rods, fences | R206, R208, R196 |
| D05 | IEEE 80 grid study: Rg, IG, split factor, decrement, GPR, tolerable touch/step (50/70 kg), mesh, step, surface layer, thermal | R197–R203, R205 |
| D06 | EGC/GEC/bonding jumpers; code minimum vs thermal minimum; parallel EGCs | R186–R188, R205 |
| D07 | Ground-fault current distribution through grid, earth, EGCs, shields, sheaths, armour, tray, steel | R204, R209 |
| D08 | Design optimiser: original vs alternatives with quantified effect | R198–R199 design aids |
| D09 | 28-section grounding study report | R210, Section 77 |
| D10 | Diagrams: grounding one-line, zero-sequence path, grid layout, connection schedules, trip matrix, rod schedule | R210, R416–R417, Section 75 |
| D11 | Grounding: NGR, zig-zag, soil, grid, GPR, touch/step (from the earlier Fault_Current_Studio documents) | Group 9 (R186–R210), R292 |
| D12 | EGC placement/sizing; tray bonding/grounding (from the earlier Cable_Tray_Calculator documents) | R155, R186 |
| D13 | Fault/grounding handoff gates (ground bus, bonding, MV shield scheme) (from the earlier Vault_Calculator documents) | Group 9 |

##### 2.3 Engineering method and verification requirements (Master Prompt Part 7)

Apply Master Prompt Section 39 in full, plus:

- Ground-grid calculations against published IEEE 80 worked examples for the adopted edition; record the edition and its applicability limits (uniform / two-layer, grid geometry ranges).
- Body-current assumptions (50 kg / 70 kg), surface-layer derating and clearing time from Fault_Current_Studio protection results — never assumed.
- Fault-current division (split factor) from documented methods and actual return paths; do not infer a zero-sequence source from a delta winding (Section 35).
- Conductor sizing per the selected code edition table, with exact provisions.


##### 2.4 Shared engines and connections to other calculators (Sections 23, 45, 49)

- **Owns:** grounding-conductor sizing, bonding assessment, electrode, soil-model, IEEE 80 grid, tolerable-limit and return-path engines.
- **Uses:** SLG fault current, X/R and clearing times from Fault_Current_Studio (never its own fault engine); NGR/grounding-transformer data from MV_Electrical_Design; tray/raceway data from Cable_Tray; equipment records from the Master Database.
- **Gives:** EGC/GEC/bonding sizes to the cable calculators and Cable_Tray; grounding interface to Lightning_Surge_Protection; grid results to Documentation_Schedules_QA (R416, R417).

| Direction | Data | From / to |
|---|---|---|
| In | SLG fault current, X/R, clearing time, source split | Fault_Current_Studio |
| In | NGR / grounding transformer data | the MV calculators (MV_Electrical_Design, Transformer_POI) |
| In | Supplied soil resistivity data, surface layer | Project inputs (owner) |
| In | Tray / raceway / equipment lists | Cable_Tray_Calculator, the DC calculators (PV_String_MPPT, DC_Protection_Combiner, DC_Cable_Connector), the LV AC calculators (Inverter_LV_AC, LV_Interconnection_Metering) |
| Out | EGC/GEC/bonding sizes | the DC calculators (PV_String_MPPT, DC_Protection_Combiner, DC_Cable_Connector), the LV AC calculators (Inverter_LV_AC, LV_Interconnection_Metering), Cable_Tray_Calculator |
| Out | Grid design results, GPR | Documentation_Schedules_QA_Calculator (R416, R417), Fault_Current_Studio (transferred potential interfaces) |

Every connection is a typed, versioned contract; a changed upstream result marks this calculator's dependent results STALE.


#### 3. Work already done

**Status:** the previous version of this calculator (retired) implemented and regression-tested (50/50 tests, 34/34 acceptance items) the following. It is rebuilt on the website from this specification.

**Functions specified and previously built:**
- System grounding analyser: solidly grounded, ungrounded, high- and low-resistance, reactance grounding, grounding transformers and zig-zag, wye/delta transformer connections, separately derived systems; neutral availability, zero-sequence source and return path; automatic "NO ZERO-SEQUENCE PATH" warning; grounding-source availability for every switching condition.
- EGC, GEC, system/main/supply-side bonding jumpers, parallel-feeder EGCs: code minimum and thermal (adiabatic I²t) minimum, governing size shown; Cu/Al; length-adjusted impedance.
- Electrodes: single rod, multiple rods with mutual resistance (never "two rods = half"), rod arrays, rings, horizontal conductors, grids, plates, concrete-encased, piles/foundations, deep rods, fence electrodes; credited vs zero-credit sensitivity.
- Soil models from supplied data: uniform, two-layer (upper/lower resistivity, layer depth, fit error), multi-layer sensitivity, seasonal and wet/dry sensitivity; soil thermal and electrical resistivity kept separate.
- IEEE 80 grid study: Rg, symmetrical ground-fault current, decrement factor, split factor, maximum grid current, GPR, surface-layer derating, tolerable touch and step (50 kg and 70 kg), mesh voltage, step voltage, transferred potential, grid conductor thermal duty, margins; total fault, metallic return, earth and grid current kept separate.
- Fault-current distribution through grid, earth, EGCs, neutrals, MV shields, concentric neutrals, conduit, tray, steel, interconnected grids — complex impedance, not resistance-only.
- Equipment grounding and bonding for transformers, inverter skids, switchgear, boards, trays, raceways, pads, steel, fences, gates, bollards, poles, enclosures, PV and tracker structures, combiner boxes; missing bonding paths flagged.
- Design optimiser: original vs alternatives (grid size, spacing, depth, conductor size/material, rods, perimeter electrodes, surface layer, clearing time where legitimately changeable) with quantified effect on Rg, GPR, mesh, step, margins.
- 28-section grounding study report; diagrams: grounding one-line, zero-sequence path, grid layout, connection schedules, rod schedule.
- Input classes: user, database, calculated, code value, manufacturer, assumption. Status hierarchy FAIL > INPUT REQUIRED > REVIEW REQUIRED > PASS.


#### 4. Functions still to be added

- [ ] All of the above rebuilt as deterministic website engines (Group 9).
- [ ] R195 pole and associated equipment grounding (not built before).
- [ ] R204, R209 return-path engine fed by real SLG current, X/R and clearing time from Fault_Current_Studio.
- [ ] Grid potential maps where the method supports them (Section 75).

**Requirements with no implementation yet (build new):**

- [ ] R195 Pole and associated electrical-equipment grounding

#### 5. Earlier work still to be completed

- [ ] Take fault currents, clearing times and protection results from Fault_Current_Studio only — the earlier built-in fault and protection calculations are not rebuilt here.
- [ ] Cable, tray, box, conduit, pulling and arc-flash functions that the previous version contained belong to their own calculators — not rebuilt here.
- [ ] Grounding transformer / NGR sizing belongs to MV_Electrical_Design (R292–R293); this calculator uses its results.
- [ ] Arrester and insulation-coordination items go to Lightning_Surge_Protection and Transformer_POI.
- [ ] Project-specific values must never be built into the calculator.

**Partly built — complete them:**

- [ ] R189 PV module-frame grounding and bonding assessment
- [ ] R190 PV mounting-rack grounding and bonding assessment
- [ ] R192 Conduit and raceway bonding assessment
- [ ] R193 Inverter grounding assessment
- [ ] R194 Transformer grounding assessment

**Built earlier — rebuild/carry over to the website and prove with tests:**

- [ ] R186 Equipment grounding conductor (EGC) sizing
- [ ] R187 Grounding electrode conductor (GEC) sizing
- [ ] R188 Bonding-jumper sizing
- [ ] R191 Cable-tray grounding and bonding assessment
- [ ] R196 Fence grounding and bonding assessment
- [ ] R197 Ground-grid conductor sizing
- [ ] R198 Ground-grid configuration design
- [ ] R199 Ground-grid spacing assessment
- [ ] R200 Ground-potential-rise (GPR) calculation
- [ ] R201 Step-voltage calculation
- [ ] R202 Touch-voltage calculation
- [ ] R203 Mesh-voltage calculation
- [ ] R204 Fault-current distribution assessment
- [ ] R205 Grounding-conductor thermal withstand calculation
- [ ] R206 Ground-rod arrangement and design assessment
- [ ] R207 Grounding design using supplied soil-resistivity values
- [ ] R208 Ground-resistance estimation using approved design methods
- [ ] R209 Ground-fault return-path assessment
- [ ] R210 Grounding and bonding design summary and schedules

#### 6. Checks and audits still to be done

- [ ] IEEE 80 worked examples for the adopted edition; record edition and applicability limits (uniform/two-layer soil, grid geometry ranges).
- [ ] Independent scripts for Rg, mesh and step voltage; body-current and surface-layer factors checked against the standard.
- [ ] Hard tests: zero/blank inputs, extreme soil resistivity, very short/long clearing time, very high/low fault current, no rods / many rods, very small/large grid, missing zero-sequence data, ungrounded delta, grounded wye, HRG, multiple parallel EGCs, Cu vs Al, one- vs two-layer soil — no false PASS.
- [ ] Engineering and software audit; challenge campaign of 200 cases.
- [ ] Engineering audit (Section 72): methods, editions, equations, assumptions, units, correction factors, limits, source applicability, independent results, unsupported conditions, false PASS results.
- [ ] Software audit: logic, architecture, types, validation, error handling, edge cases, duplication, hard-coded values, feature preservation.
- [ ] Data audit: units, types, sources, revisions, duplicates, conflicts, missing values, overrides.
- [ ] Integration audit: schemas, IDs, dependencies, STALE results, unit and method compatibility with connected calculators.
- [ ] UI/UX audit: workflow, labels, units, help, warnings, responsiveness (desktop/tablet/mobile), WCAG 2.2 AA accessibility, diagram accuracy, persistence.
- [ ] Security audit: authentication, authorisation, private/public separation, secrets, input validation, dependencies.
- [ ] Requirements coverage audit: every ID in Section 2 traced to code and tests.
- [ ] Research register and benchmark matrix (Section 11): relevant calculators, manufacturer tools and papers actually reviewed (count only real sources).

#### 7. Process to follow to finish everything

This is the Master Prompt V5.0 development process applied to this calculator. Follow it for every task.

##### 7.1 Rules that never change (Master Prompt Sections 5, 6, 27, 34)
- Never invent a standard, clause, formula, coefficient, equipment rating, curve, clearing time, test result or repository state. Missing critical input → **INPUT REQUIRED**; never a guessed value.
- Every numerical result comes from a deterministic, tested calculation engine — never from AI text.
- Every result shows a status: PASS, FAIL, REVIEW REQUIRED, INPUT REQUIRED, NOT APPLICABLE, NOT VERIFIED, NOT SUPPORTED or STALE. Never PASS when inputs, sources, methods or validation are missing. Every warning says what is wrong, why it matters, which input to check and how to fix it.
- Never claim "complete", "100 %", "certified" or "compliant" without the evidence of Section 8 of this file.
- Preserve working calculations and verified results; change a validated method only with a documented reason and tests (Sections 52, 58).
- No paid service, subscription or usage-based dependency without the owner's approval (Section 84). No credentials, secrets or private data in code or Git (Sections 6, 60, 82).

##### 7.2 Execution cycle for every task (Master Prompt Section 7)
**A Inspect** existing code, data, tests and behaviour → **B Research** primary standards, editions, manufacturer documents, papers and benchmark tools → **C Design** inputs, outputs, units, equations, sequence, error states, tests → **D Implement** the deterministic engine first, then UI, diagrams, data and integration, in small reversible changes → **E Test** (unit, golden, independent, boundary, invalid input, regression, UI, export, security, end-to-end) → **F Audit and fix** (separate engineering and software reviews; repeat until no critical/high defect) → **G Improve** (low-risk improvements; scope expansion only with approval) → **H Report** (files changed, tests run, results, limitations, next step). Do not stop after a plan, a draft or a good-looking screen.

##### 7.3 Phases (Master Prompt Section 62)
| Phase | Work for this calculator | Done when |
|---|---|---|
| 0 Inventory (read-only) | Write the master specification of every function listed in Section 3 (inputs, outputs, method, standard edition); map R186–R210. | Phase 0 report delivered: inventory, current state of every requirement with evidence, risks, batch plan, single best next task |
| 1 Engine | Build the conductor-sizing, bonding, electrode, soil-model, IEEE 80 grid, tolerable-limit and return-path engines. | Every engine has a master specification, version ID, typed contract and test harness, separate from UI |
| 2 Functional verification | Inputs, units, defaults, overrides, sequence, equations, intermediate values, invalid inputs, lookups, warnings, repeatability | All found defects fixed and retested |
| 3 Challenge and independent validation | IEEE 80 examples, independent scripts, hard tests, challenge campaign. | Golden and independent checks pass within justified tolerances; real challenge-case count reported |
| 4 Customer workflow | Which inputs are visible, auto-filled from the database, inherited from other calculators, optional or advanced | Workflow specification written |
| 5 UX/UI | Grid layout and potential maps, bonding diagrams, schedules. | Screens use the shared design system; visuals come from the same data as the calculation |
| 6 Integration | Consume Fault_Current_Studio and MV_Electrical_Design results; give EGC sizes to cable calculators and Cable_Tray; grounding interface to Lightning_Surge_Protection. | End-to-end tests pass; STALE tracking works |
| 7 Release | Staging and public-URL tests, monitoring, backup/restore, rollback | Owner approves the production release |

##### 7.4 Engineering rules for every engine (Master Prompt Sections 28–33, 46–48)
- Before coding: master specification (purpose, inputs with units and sources, outputs, standard and edition, equations, assumptions, valid range, warnings, test cases) and data-dictionary entries with stable names (no "Value1", "Factor2").
- Engine: defined inputs/outputs/units, equations with variable definitions, source references (standard, edition, clause/table/equation), assumptions, valid range, input validation, numerical precision/convergence, version ID; identical results for identical inputs; handles zero/negative/huge/tiny/missing values; never shows a failed calculation as a normal result; separate from the UI.
- Units: one central unit service; SI internally; feet/inches and metric display; never mix units silently; full precision internally, round only for display.
- Assumptions classified CONFIRMED / DEFAULT / ENGINEERING ASSUMPTION / NEEDS USER CONFIRMATION / REFERENCE-DERIVED. Show DATABASE VALUE, USER OVERRIDE and VALUE USED IN CALCULATION for every overridable value, with an audit trail.
- Equipment data only from the Master Engineering Database (Section 44), auto-populated from the selected record, with the database revision stored with every result.
- Traceability chain for every important result: user input → database value → intermediate values → correction factors → equation/method → final result, with the limit used, status, warnings, sources and engine version.
- Results passed to other calculators go through typed, versioned contracts; changed upstream inputs mark downstream results **STALE** (Sections 47–50). Never propagate a result whose study case, topology, voltage level or assumptions do not match.

##### 7.5 Testing rules (Master Prompt Sections 66–71)
- Golden tests with source of expected values; independent hand calculations or separate scripts (never only against code that shares the implementation); tolerances justified, never chosen to make a test pass.
- Boundary, invalid-input, unit-conversion, unsupported-case and regression tests; end-to-end tests for every applicable project type P1–P5.
- Challenge campaign toward **200 meaningful cases** designed to make the calculator fail; report the real number completed.
- Every reported defect: reproduce → trace UI → validation → lookup → calculation → result → saved state → fix the root cause → add a regression test → rerun all golden tests.

##### 7.6 Working method
- GitHub is the home of the code (Section 60): tag the known-good state before work, feature branch, small commits, pull request for engineering/data/security changes, tests run before merge, tagged releases with rollback points.
- Work in controlled batches (Section 61); after each batch give the delivery report of Section 87 (requested, done, requirement IDs, preserved, files changed, sources, tests run with results, remaining gaps, next step).
- Keep these records up to date in the repository (Section 85): REQUIREMENTS.md (traceability for every ID in Section 2), MASTER_SPECIFICATION.md, DATA_DICTIONARY.md, DECISIONS.md, SOURCE_REGISTER.md, TEST_MATRIX.md, ISSUES.md, PROGRESS.md, CHANGELOG.md.
- Ask the owner only when a decision changes safety, correctness, scope, cost, privacy or is irreversible (Section 5). The only open items the Master Prompt leaves to the owner are: jurisdiction and code editions to target first, hosting provider and budget, which calculator becomes the first fully verified reference module, whether 35 kV stays the MV limit (Appendix F) — plus approval of production releases and paid services.

##### 7.7 Calculator-specific rules carried over from the earlier documents
- Do not hard-code project-specific values into the generic calculator
- Integration chain: Fault → Protection → Clearing time → Grounding → Conductor thermal → IEEE 80 → Touch/Step
- Easy input → system model → calculations → results → checks → report; auto-populate from database
- Input classes: user, database, calculated, code value, manufacturer, assumption
- Status hierarchy FAIL > INPUT REQUIRED > REVIEW REQUIRED > PASS (use the full Section 34 status set; earlier WARNING → REVIEW REQUIRED, EXTERNAL VALIDATION REQUIRED → NOT VERIFIED)
- Reference database: method, standard, edition, equation location; never fabricate
- US customary and SI; explicit conversions


#### 8. Final result — what "finished" looks like

- Verified grounding and bonding design on the website: conductor sizing (code and thermal), bonding of all PV and electrical equipment, electrodes, soil models from supplied data, IEEE 80 grid with touch/step/mesh/GPR, return paths and optimiser.
- 28-section grounding study report, grid layout, schedules — all from engine data.
- **Every requirement in Section 2** is implemented, or marked NOT APPLICABLE / NOT SUPPORTED with a written reason, with evidence in REQUIREMENTS.md (file, function, test). Status per requirement follows Section 57 (IMPLEMENTED — NOT VERIFIED → SOFTWARE TESTED → ENGINEERING VALIDATED → DEPLOYED → APPROVED).
- **Module completion checklist (Master Prompt Section 94) fully satisfied:** scope documented; existing behaviour preserved; methods and standard editions verified or flagged; deterministic engine separated from UI; inputs/outputs/units/assumptions/overrides/limits traceable; equipment data from the Master Database with revision recorded; golden and independent checks pass within justified tolerances; boundary, invalid-input, unsupported-case and regression tests pass; engineering and software reviews recorded; integration and STALE control work; UI and diagrams match the engine; reports and exports reproduce the screen; security and privacy satisfied; limitations disclosed; no known critical or high-severity defect.
- **Website acceptance (Section 95):** works on the public domain over HTTPS; its route opens directly and after refresh; desktop, tablet and mobile; private projects stay private; save/load/scenarios/recovery work; tested through the real public URL.
- **Reports and exports (Sections 77–78):** PDF calculation package, CSV, JSON (and schedules where applicable) containing inputs, units, equipment and database revision, method and standard edition, intermediate values, results with status, assumptions, warnings, sources and engine version — identical to the screen.
- **Honest status:** a final delivery report (Section 87) states exactly what is complete, what is not, and why.


#### 9. Plugins and tools

| Capability (Master Prompt Section 8) | Use it for | Example plugin / tool |
|---|---|---|
| Git repository connector | Branches, commits, pull requests, issues, diffs | GitHub connector |
| Coding agent + execution environment | Write code, run builds and tests, debug | Coding agent with terminal (e.g. Claude Code / similar), Node.js, Python |
| Web research and browser | Official standards information, manufacturer datasheets, benchmark tool documentation | Web search, web fetch, browser |
| PDF / OCR document reader | Read code books, datasheets, manuals, papers page by page | PDF reader with OCR |
| Owner's document storage | The owner's books and reference PDFs (for example the NEC books kept in Dropbox) | Google Drive / Dropbox connector |
| Academic research search | Peer-reviewed papers and DOIs | Semantic Scholar / Google Scholar / IEEE Xplore search |
| Independent maths check | Hand-check equations and reference values | Python (NumPy, SciPy, SymPy), Wolfram |
| Browser / UI automation | End-to-end tests on desktop and mobile, downloads, console errors | Playwright (Chromium, Firefox, WebKit) |
| Accessibility check | WCAG 2.2 AA audit | axe-core / Lighthouse |
| UI / diagram design | Wireframes, screen flows, engineering diagrams | Figma or similar design tool |
| Database connector | Schemas, migrations, records, permissions | Connector for the chosen database |
| Hosting / deployment connector | Deployments, logs, domains, rollback | Connector for the chosen host (Wix connector only for the existing live sites) |
| Security analysis | Dependency, secret and code scanning | Dependabot / npm audit / pip-audit, CodeQL, secret scanning |

Use a tool only when it has a real role, check access/permissions/quota/cost first, never claim a tool ran when it did not (Sections 8–9). Do not use Formula Genius or Coursera. When delegation is available, split work into specialist reviews — standards, independent calculation, equipment data, code/architecture, UX, security, testing — and have an independent checker that never sees the builder's code (Section 9).

**Specific to this calculator:**

| Purpose | Tool |
|---|---|
| Grounding verification | Python NumPy/SciPy, Wolfram |
| Feature benchmarking only | CDEGS, XGSLab, ETAP Ground Grid documentation |

Benchmark tools are used to compare features and results only — never copy their code, data or methods without checking them (Section 12).


#### 10. First task and first reply

1. Reply in Hinglish: confirm that Master Prompt V5.0 governs and that this is **Grounding_Calculator**; say what you can and cannot access.
2. Do Phase 0 only (read-only): inventory, current state of every requirement in Section 2 with evidence, risks, batch plan for Phases 1–3, and the single best next task.
3. Wait for the owner to approve the Phase 0 report, then work through Sections 4, 5 and 6 using the process of Section 7 until Section 8 is true.
