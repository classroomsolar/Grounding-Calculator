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

## 0. About this file

- This is the **only** project document for this calculator. It replaces every earlier README, prompt, handoff and requirement document; everything still needed from them is written here.
- Governing specification: **Master Prompt V5.0** (Integrated Electrical PV Design Engineering Platform, 9 November 2026). Give the AI both this file and the Master Prompt at the start of every session. If the two ever disagree, the Master Prompt wins.
- The calculator is part of **one integrated public website** (Master Prompt Sections 2, 43, 80): its own route/page, shared project data, shared equipment database, shared reports.
- Reply to the owner in **Hinglish** (simple Hindi–English). Write code, reports and documents in English.
- The owner is an electrical / PV design engineer, not a software developer. The AI does the research, design, coding, testing, debugging and documentation itself (Master Prompt Sections 1–4).


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
- [ ] Engineering audit (Section 72): methods, editions, equations, assumptions, units, correction factors, limits, source applicability, independent results, unsupported conditions, false PASS results.
- [ ] Software audit: logic, architecture, types, validation, error handling, edge cases, duplication, hard-coded values, feature preservation.
- [ ] Data audit: units, types, sources, revisions, duplicates, conflicts, missing values, overrides.
- [ ] Integration audit: schemas, IDs, dependencies, STALE results, unit and method compatibility with connected calculators.
- [ ] UI/UX audit: workflow, labels, units, help, warnings, responsiveness (desktop/tablet/mobile), WCAG 2.2 AA accessibility, diagram accuracy, persistence.
- [ ] Security audit: authentication, authorisation, private/public separation, secrets, input validation, dependencies.
- [ ] Requirements coverage audit: every ID in Section 2 traced to code and tests.
- [ ] Research register and benchmark matrix (Section 11): relevant calculators, manufacturer tools and papers actually reviewed (count only real sources).

## 7. Process to follow to finish everything

This is the Master Prompt V5.0 development process applied to this calculator. Follow it for every task.

### 7.1 Rules that never change (Master Prompt Sections 5, 6, 27, 34)
- Never invent a standard, clause, formula, coefficient, equipment rating, curve, clearing time, test result or repository state. Missing critical input → **INPUT REQUIRED**; never a guessed value.
- Every numerical result comes from a deterministic, tested calculation engine — never from AI text.
- Every result shows a status: PASS, FAIL, REVIEW REQUIRED, INPUT REQUIRED, NOT APPLICABLE, NOT VERIFIED, NOT SUPPORTED or STALE. Never PASS when inputs, sources, methods or validation are missing. Every warning says what is wrong, why it matters, which input to check and how to fix it.
- Never claim "complete", "100 %", "certified" or "compliant" without the evidence of Section 8 of this file.
- Preserve working calculations and verified results; change a validated method only with a documented reason and tests (Sections 52, 58).
- No paid service, subscription or usage-based dependency without the owner's approval (Section 84). No credentials, secrets or private data in code or Git (Sections 6, 60, 82).

### 7.2 Execution cycle for every task (Master Prompt Section 7)
**A Inspect** existing code, data, tests and behaviour → **B Research** primary standards, editions, manufacturer documents, papers and benchmark tools → **C Design** inputs, outputs, units, equations, sequence, error states, tests → **D Implement** the deterministic engine first, then UI, diagrams, data and integration, in small reversible changes → **E Test** (unit, golden, independent, boundary, invalid input, regression, UI, export, security, end-to-end) → **F Audit and fix** (separate engineering and software reviews; repeat until no critical/high defect) → **G Improve** (low-risk improvements; scope expansion only with approval) → **H Report** (files changed, tests run, results, limitations, next step). Do not stop after a plan, a draft or a good-looking screen.

### 7.3 Phases (Master Prompt Section 62)
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

### 7.4 Engineering rules for every engine (Master Prompt Sections 28–33, 46–48)
- Before coding: master specification (purpose, inputs with units and sources, outputs, standard and edition, equations, assumptions, valid range, warnings, test cases) and data-dictionary entries with stable names (no "Value1", "Factor2").
- Engine: defined inputs/outputs/units, equations with variable definitions, source references (standard, edition, clause/table/equation), assumptions, valid range, input validation, numerical precision/convergence, version ID; identical results for identical inputs; handles zero/negative/huge/tiny/missing values; never shows a failed calculation as a normal result; separate from the UI.
- Units: one central unit service; SI internally; feet/inches and metric display; never mix units silently; full precision internally, round only for display.
- Assumptions classified CONFIRMED / DEFAULT / ENGINEERING ASSUMPTION / NEEDS USER CONFIRMATION / REFERENCE-DERIVED. Show DATABASE VALUE, USER OVERRIDE and VALUE USED IN CALCULATION for every overridable value, with an audit trail.
- Equipment data only from the Master Engineering Database (Section 44), auto-populated from the selected record, with the database revision stored with every result.
- Traceability chain for every important result: user input → database value → intermediate values → correction factors → equation/method → final result, with the limit used, status, warnings, sources and engine version.
- Results passed to other calculators go through typed, versioned contracts; changed upstream inputs mark downstream results **STALE** (Sections 47–50). Never propagate a result whose study case, topology, voltage level or assumptions do not match.

### 7.5 Testing rules (Master Prompt Sections 66–71)
- Golden tests with source of expected values; independent hand calculations or separate scripts (never only against code that shares the implementation); tolerances justified, never chosen to make a test pass.
- Boundary, invalid-input, unit-conversion, unsupported-case and regression tests; end-to-end tests for every applicable project type P1–P5.
- Challenge campaign toward **200 meaningful cases** designed to make the calculator fail; report the real number completed.
- Every reported defect: reproduce → trace UI → validation → lookup → calculation → result → saved state → fix the root cause → add a regression test → rerun all golden tests.

### 7.6 Working method
- GitHub is the home of the code (Section 60): tag the known-good state before work, feature branch, small commits, pull request for engineering/data/security changes, tests run before merge, tagged releases with rollback points.
- Work in controlled batches (Section 61); after each batch give the delivery report of Section 87 (requested, done, requirement IDs, preserved, files changed, sources, tests run with results, remaining gaps, next step).
- Keep these records up to date in the repository (Section 85): REQUIREMENTS.md (traceability for every ID in Section 2), MASTER_SPECIFICATION.md, DATA_DICTIONARY.md, DECISIONS.md, SOURCE_REGISTER.md, TEST_MATRIX.md, ISSUES.md, PROGRESS.md, CHANGELOG.md.
- Ask the owner only when a decision changes safety, correctness, scope, cost, privacy or is irreversible (Section 5). The only open items the Master Prompt leaves to the owner are: jurisdiction and code editions to target first, hosting provider and budget, which calculator becomes the first fully verified reference module, whether 35 kV stays the MV limit (Appendix F) — plus approval of production releases and paid services.

### 7.7 Calculator-specific rules carried over from the earlier documents
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
- **Every requirement in Section 2** is implemented, or marked NOT APPLICABLE / NOT SUPPORTED with a written reason, with evidence in REQUIREMENTS.md (file, function, test). Status per requirement follows Section 57 (IMPLEMENTED — NOT VERIFIED → SOFTWARE TESTED → ENGINEERING VALIDATED → DEPLOYED → APPROVED).
- **Module completion checklist (Master Prompt Section 94) fully satisfied:** scope documented; existing behaviour preserved; methods and standard editions verified or flagged; deterministic engine separated from UI; inputs/outputs/units/assumptions/overrides/limits traceable; equipment data from the Master Database with revision recorded; golden and independent checks pass within justified tolerances; boundary, invalid-input, unsupported-case and regression tests pass; engineering and software reviews recorded; integration and STALE control work; UI and diagrams match the engine; reports and exports reproduce the screen; security and privacy satisfied; limitations disclosed; no known critical or high-severity defect.
- **Website acceptance (Section 95):** works on the public domain over HTTPS; its route opens directly and after refresh; desktop, tablet and mobile; private projects stay private; save/load/scenarios/recovery work; tested through the real public URL.
- **Reports and exports (Sections 77–78):** PDF calculation package, CSV, JSON (and schedules where applicable) containing inputs, units, equipment and database revision, method and standard edition, intermediate values, results with status, assumptions, warnings, sources and engine version — identical to the screen.
- **Honest status:** a final delivery report (Section 87) states exactly what is complete, what is not, and why.


## 9. Plugins and tools

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


## 10. First task and first reply

1. Reply in Hinglish: confirm that Master Prompt V5.0 governs and that this is **Grounding_Calculator**; say what you can and cannot access.
2. Do Phase 0 only (read-only): inventory, current state of every requirement in Section 2 with evidence, risks, batch plan for Phases 1–3, and the single best next task.
3. Wait for the owner to approve the Phase 0 report, then work through Sections 4, 5 and 6 using the process of Section 7 until Section 8 is true.
