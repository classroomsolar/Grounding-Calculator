This is my **MASTER Grounding Calculator**. Continue development from the exact workbook I provide.

## CRITICAL PRESERVATION RULE

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

# SCOPE

The calculator is for:

**LV + MV electrical systems only.**

Do NOT expand the calculator into dedicated HV/EHV/UHV transmission engineering.

However, retain any HV theory that is necessary for correct LV/MV engineering, such as insulation, surge, lightning, cable shielding, grounding transients, and equipment withstand concepts.

The objective is to turn this workbook into a professional:

# MASTER LV/MV GROUNDING ENGINEERING & STUDY CALCULATOR

It should support grounding design from basic NEC grounding/bonding calculations through advanced grounding studies.

---

# 1. SYSTEM GROUNDING ANALYZER

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

# 2. GROUND-FAULT & FAULT-CURRENT ENGINE

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

# 3. GROUNDING-CONDUCTOR SIZING ENGINE

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

# 4. GROUNDING-ELECTRODE ENGINE

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

# 5. SOIL-RESISTIVITY ENGINE

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

# 6. IEEE 80 GROUND-GRID ENGINE

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

# 7. TOUCH / STEP / MESH / TRANSFERRED-POTENTIAL ENGINE

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

# 8. GROUND-FAULT CURRENT-DISTRIBUTION ENGINE

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

# 9. MV CABLE GROUNDING & SHIELD ENGINE

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

# 10. EQUIPMENT-BONDING ENGINE

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

# 11. TRANSFORMER-GROUNDING ENGINE

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

# 12. PV / BESS GROUNDING ENGINE

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

# 13. OCPD / PROTECTION INTERACTION ENGINE

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

# 14. GROUNDING TESTING ENGINE

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

# 15. GROUNDING DESIGN OPTIMIZER

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

# INTEGRATION WITH OTHER STUDIES

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

# USER EXPERIENCE

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

# INPUT PHILOSOPHY

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

# ENGINEERING STATUS HIERARCHY

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

# REFERENCES / TRACEABILITY

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

# UNITS

Support both:

**US customary**

and

**SI**

where practical.

Internally use consistent calculation units and perform explicit conversions.

Prevent mixed-unit calculation errors.

---

# QA / HARD TESTING

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

# FINAL REPORTING

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

# DEVELOPMENT PHILOSOPHY

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

## MOST IMPORTANT

Preserve everything already working.

Audit first.

Develop incrementally.

Create a new version.

Regression-test continuously.

Do not guess missing engineering data.

Do not hide assumptions.

Do not generate false PASS results.

Keep the front end simple while making the backend engineering as comprehensive as reasonably possible.