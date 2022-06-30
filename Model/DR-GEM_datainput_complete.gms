$TITLE DR-GEM Data Build Routine: Full Disaggregation, one national region

* ------------------------------------------------------------------------------
* 06/30/2022
* 
* ------------------------------------------------------------------------------


options decimals = 4;

* ------------------------------------------------------------------------------
* Step 1: Load raw IMPLAN data for US into GAMS and relabel identifiers
* ------------------------------------------------------------------------------

$INCLUDE DR-GEM_load_implan_US.gms

* Includes proprietary data: open source version forthcoming



* ------------------------------------------------------------------------------
* Step 2: Convert raw data into model parameters
* ------------------------------------------------------------------------------

$INCLUDE DR-GEM_impose_US.gms


* ------------------------------------------------------------------------------
* Step 3: Disaggregate Oil&Gas, Electric Generation, and Motor Vehicle Production
* ------------------------------------------------------------------------------

$INCLUDE DR-GEM_disagg.gms


* ------------------------------------------------------------------------------
* Step 4: Import margin data and define margin requirements
* ------------------------------------------------------------------------------

$INCLUDE DR-GEM_margins_import.gms

* ------------------------------------------------------------------------------
* Step 5: Use SEDS to re-assign energy inputs
* ------------------------------------------------------------------------------

$INCLUDE DR-GEM_merge_US_SEDS.gms

* ------------------------------------------------------------------------------
* Step 6: Assign natural resources across sectors
* ------------------------------------------------------------------------------

$INCLUDE DR-GEM_resources_US.gms







