$TITLE CREATION OF REGIONAL DATASET

* ------------------------------------------------------------------------------
* Step 1: Build a full national dataset consistent with model identities
* ------------------------------------------------------------------------------

$INCLUDE DR-GEM_datainput_complete.gms
* Proprietary dat files not included in directory

* ------------------------------------------------------------------------------
* Step 2: Parameterize the model
* ------------------------------------------------------------------------------

$INCLUDE DR-GEM_parameters.gms

* ------------------------------------------------------------------------------
* Step 3a: Reconcile national dataset with parameters and model identities
* ------------------------------------------------------------------------------

$INCLUDE DR-GEM_wash_US.gms


* ------------------------------------------------------------------------------
* Step 3b: Downscale national data to states in consistent manner
* ------------------------------------------------------------------------------



sets
s "states" /s1*s51/
;
alias(s,ss)
alias(s,sss)

scalar
ns " Number of states" /51/
;


$INCLUDE DR-GEM_load_implan_51.gms
* Proprietary dat files not included in directory

$INCLUDE DR-GEM_impose_51.gms

$INCLUDE DR-GEM_SEDS_51_import.gms

$INCLUDE DR-GEM_disagg_51.gms

execute_unload "DR-GEM_data.gdx";