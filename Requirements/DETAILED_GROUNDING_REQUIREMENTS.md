Act as a Senior LV/MV Grounding Engineer, Protection Engineer, and Expert Spreadsheet Architect.

Continue development of my existing Grounding Calculator using the attached workbook and all grounding, protection, NEC, IEEE, cable, transformer, and manufacturer reading material already provided in this project.

## Critical preservation rule

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

## Scope

- LV systems: up to 1,000 V
- MV systems: above 1 kV through 35 kV
- AC and applicable DC grounding
- PV, BESS, industrial, commercial, utility-interactive and standalone systems
- Exclude HV transmission grounding
- Do not hard-code Heber 2 values into the generic calculator

## Required calculator functions

### 1. System-grounding model

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

### 2. Fault-current calculations

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

### 3. Cable-charging and ungrounded-system calculations

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

### 4. Grounding-transformer and NGR sizing

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

### 5. Soil-resistivity calculations

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

### 6. Ground-electrode calculations

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

### 7. IEEE 80 grounding-grid study

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

### 8. EGC, GEC and bonding-conductor calculations

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

### 9. Parallel fault-current path calculation

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

### 10. MV cable shield and sheath grounding

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

### 11. Equipment-specific grounding

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

### 12. Ground-fault protection and coordination

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

### 13. Surge-arrester and insulation-coordination checks

Calculate or evaluate:

- Grounded versus ungrounded arrester application
- MCOV suitability
- Temporary overvoltage duty
- Healthy-phase voltage rise during an SLG fault
- Cable insulation level
- Transformer BIL
- Arrester protective margin
- Grounding-method impact on insulation stress

### 14. Testing and commissioning

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

### 15. Sensitivity and design optimization

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

## Workbook architecture

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

## Formula and database requirements

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

## Standards and references

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

## Required results

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

## Diagrams and reports

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

## Verification requirements

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