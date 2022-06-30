$TITLE State-level SEDS Import$

* ------------------------------------------------------------------------------
* Load raw SEDS data
* ------------------------------------------------------------------------------

* ------------------------------------------------------------------------------
* Define SEDS sets
* ------------------------------------------------------------------------------

SET sec_seds /
residential
commercial
industrial
transportation
electric_power
/

SET fuel_seds /
oil
coal
petroleum
natural_gas
electric_power
/

SET gen_seds /
coal
ngoil
nuke
hydro
solar
wind
other
/


SET    s_seds    /
AL
AK
AZ
AR
CA
CO
CT
DE
DC
FL
GA
HI
ID
IL
IN
IA
KS
KY
LA
ME
MD
MA
MI
MN
MS
MO
MT
NE
NV
NH
NJ
NM
NY
NC
ND
OH
OK
OR
PA
RI
SC
SD
TN
TX
UT
VT
VA
WA
WV
WI
WY

/;


* ------------------------------------------------------------------------------
* Define model sets and mapping sets
* ------------------------------------------------------------------------------


Set mapstate(s_seds,s)    /
AL        .        s1
AK        .        s2
AZ        .        s3
AR        .        s4
CA        .        s5
CO        .        s6
CT        .        s7
DE        .        s8
DC        .        s9
FL        .        s10
GA        .        s11
HI        .        s12
ID        .        s13
IL        .        s14
IN        .        s15
IA        .        s16
KS        .        s17
KY        .        s18
LA        .        s19
ME        .        s20
MD        .        s21
MA        .        s22
MI        .        s23
MN        .        s24
MS        .        s25
MO        .        s26
MT        .        s27
NE        .        s28
NV        .        s29
NH        .        s30
NJ        .        s31
NM        .        s32
NY        .        s33
NC        .        s34
ND        .        s35
OH        .        s36
OK        .        s37
OR        .        s38
PA        .        s39
RI        .        s40
SC        .        s41
SD        .        s42
TN        .        s43
TX        .        s44
UT        .        s45
VT        .        s46
VA        .        s47
WA        .        s48
WV        .        s49
WI        .        s50
WY        .        s51
/;

set es /es1*es3/

Set mapes(s,es)    /
s1        .        es1
s2        .        es3
s3        .        es3
s4        .        es1
s5        .        es3
s6        .        es3
s7        .        es1
s8        .        es1
s9        .        es1
s10        .        es1
s11        .        es1
s12        .        es3
s13        .        es3
s14        .        es1
s15        .        es1
s16        .        es1
s17        .        es1
s18        .        es1
s19        .        es1
s20        .        es1
s21        .        es1
s22        .        es1
s23        .        es1
s24        .        es1
s25        .        es1
s26        .        es1
s27        .        es3
s28        .        es1
s29        .        es3
s30        .        es1
s31        .        es1
s32        .        es3
s33        .        es1
s34        .        es1
s35        .        es1
s36        .        es1
s37        .        es1
s38        .        es3
s39        .        es1
s40        .        es1
s41        .        es1
s42        .        es1
s43        .        es1
s44        .        es2
s45        .        es3
s46        .        es1
s47        .        es1
s48        .        es3
s49        .        es1
s50        .        es1
s51        .        es3
/;


set mapsec(sec_seds,sec) /
residential.res
commercial.com
industrial.ind
transportation.trans
electric_power.ep
/;

set mapfuel(fuel_seds,fuel) /
coal.coal
petroleum.ref
natural_gas.gas
electric_power.elec
oil.crude
/;

set mapgen2(gen_seds,*)
/coal.c7a,ngoil.c7b,nuke.c7c,hydro.c7d,solar.c7e,wind.c7f,other.c7g/
;

* ------------------------------------------------------------------------------
* Import state-level expenditure data
* ------------------------------------------------------------------------------

parameter
seds_ex_import(fuel_seds,sec_seds,s_seds)
seds_ex(fuel,sec,s)

seds_q_import(fuel_seds,sec_seds,s_seds)
seds_q(fuel,sec,s)
seds_q_im(fuel,sec,s)

seds_p(fuel,sec,s)
;


$CALL GDXXRW.EXE import_seds_ex.xlsx par=seds_ex_import rng=A1:D988 rdim = 3 cdim=0


$GDXIN import_seds_ex.gdx
$onUNDF
$LOAD seds_ex_import
$GDXIN


seds_ex(fuel,sec,s)  = sum(fuel_seds,sum(sec_seds,sum(s_seds,seds_ex_import(fuel_seds,sec_seds,s_seds)*mapstate(s_seds,s))*mapsec(sec_seds,sec))*mapfuel(fuel_seds,fuel))/1000000;

seds_ex('elec','trans','s32') = seds_ex('elec','trans','s29');

$CALL GDXXRW.EXE import_seds_q.xlsx par=seds_q_import rng=A1:D988 rdim = 3 cdim=0


$GDXIN import_seds_q.gdx
$onUNDF
$LOAD seds_q_import
$GDXIN


seds_q(fuel,sec,s)  = sum(fuel_seds,sum(sec_seds,sum(s_seds,seds_q_import(fuel_seds,sec_seds,s_seds)*mapstate(s_seds,s))*mapsec(sec_seds,sec))*mapfuel(fuel_seds,fuel))/1000000;
seds_q('elec','trans','s32') = seds_q('elec','trans','s29');
seds_p(fuel,sec,s)$(seds_q(fuel,sec,s) ne 0) = seds_ex(fuel,sec,s)/seds_q(fuel,sec,s);

display
seds_p00
seds_p
;

* ------------------------------------------------------------------------------
* Import state-level fossil fuel production data
* ------------------------------------------------------------------------------

parameter
seds_prod_import(fuel_seds,s_seds)
seds_prod(fuel,s)
;
$CALL GDXXRW.EXE import_seds_prod.xlsx par=seds_prod_import rng=A1:C153 rdim = 2 cdim=0


$GDXIN import_seds_prod.gdx
$onUNDF
$LOAD seds_prod_import
$GDXIN


seds_prod(fuel,s)  = sum(fuel_seds,sum(s_seds,seds_prod_import(fuel_seds,s_seds)*mapstate(s_seds,s))*mapfuel(fuel_seds,fuel))/1000000;


* ------------------------------------------------------------------------------
* Import state-level electricity data
* ------------------------------------------------------------------------------

* dimports/dexports/cons are imported in million kilowatt hours
* imports/exports are imported in million $ expenditures

parameter
elec_imports_import(s_seds)
elec_imports_(s)
elec_exports_import(s_seds)
elec_exports_(s)
elec_gen_import(s_seds,gen_seds)
elec_gen(*,s)
elec_gen_tot(s)
elec_gen_agg
elec_cons_import(s_seds)
elec_cons(s)
elec_cons_agg
elec_cons_agg_db
elec_dimports_import(s_seds)
elec_dimports_(s)
elec_dexports_import(s_seds)
elec_dexports_(s)
elec_vom_import(s_seds,gen_seds)
elec_vom(*,s)
elec_fom_import(s_seds,gen_seds)
elec_fom(*,s)
elec_cap_import(s_seds,gen_seds)
elec_cap(*,s)
;


$CALL GDXXRW.EXE import_elec_imports.xlsx par=elec_imports_import rng=A1:B51 rdim = 1 cdim=0
$CALL GDXXRW.EXE import_elec_exports.xlsx par=elec_exports_import rng=A1:B51 rdim = 1 cdim=0

$CALL GDXXRW.EXE import_elec_dimports_new.xlsx par=elec_dimports_import rng=A1:B51 rdim = 1 cdim=0
$CALL GDXXRW.EXE import_elec_dexports_new.xlsx par=elec_dexports_import rng=A1:B51 rdim = 1 cdim=0
$CALL GDXXRW.EXE import_elec_cons.xlsx par=elec_cons_import rng=A1:B51 rdim = 1 cdim=0


$CALL GDXXRW.EXE import_elec_gen7.xlsx par=elec_gen_import rng=A1:c294 rdim = 2 cdim=0
$CALL GDXXRW.EXE import_elec_cap.xlsx par=elec_cap_import rng=A1:c280 rdim = 2 cdim=0
$CALL GDXXRW.EXE import_elec_fom.xlsx par=elec_fom_import rng=A1:c280 rdim = 2 cdim=0
$CALL GDXXRW.EXE import_elec_vom.xlsx par=elec_vom_import rng=A1:c280 rdim = 2 cdim=0



$GDXIN import_elec_imports.gdx
$onUNDF
$LOAD elec_imports_import
$GDXIN

$GDXIN import_elec_exports.gdx
$onUNDF
$LOAD elec_exports_import
$GDXIN


$GDXIN import_elec_gen7.gdx
$onUNDF
$LOAD elec_gen_import
$GDXIN

$GDXIN import_elec_dimports_new.gdx
$onUNDF
$LOAD elec_dimports_import
$GDXIN

$GDXIN import_elec_dexports_new.gdx
$onUNDF
$LOAD elec_dexports_import
$GDXIN

$GDXIN import_elec_cons.gdx
$onUNDF
$LOAD elec_cons_import
$GDXIN

$GDXIN import_elec_fom.gdx
$onUNDF
$LOAD elec_fom_import
$GDXIN

$GDXIN import_elec_vom.gdx
$onUNDF
$LOAD elec_vom_import
$GDXIN

$GDXIN import_elec_cap.gdx
$onUNDF
$LOAD elec_cap_import
$GDXIN


elec_imports_(s) = sum(s_seds,elec_imports_import(s_seds)*mapstate(s_seds,s))/1000000;
elec_exports_(s) = sum(s_seds,elec_exports_import(s_seds)*mapstate(s_seds,s))/1000000;

elec_gen(in_gen,s) = sum(gen_seds, mapgen2(gen_seds,in_gen) *sum(s_seds,elec_gen_import(s_seds,gen_seds)*mapstate(s_seds,s)))/1000000;
elec_gen_tot(s) = sum(in_gen,elec_gen(in_gen,s));
elec_gen_agg = sum(s,elec_gen_tot(s));
elec_dimports_(s) = sum(s_seds,elec_dimports_import(s_seds)*mapstate(s_seds,s))/1000;
elec_dexports_(s) = sum(s_seds,elec_dexports_import(s_seds)*mapstate(s_seds,s))/1000;
elec_cons(s) = sum(s_seds,elec_cons_import(s_seds)*mapstate(s_seds,s))/1000;
elec_cons_agg = sum(s,elec_cons(s));
elec_cons_agg_db = sum(s,sum(sec,seds_ex('elec',sec,s)));

elec_fom(in_gen,s) = sum(gen_seds, mapgen2(gen_seds,in_gen) *sum(s_seds,elec_fom_import(s_seds,gen_seds)*mapstate(s_seds,s)))/1000000;
elec_vom(in_gen,s) = sum(gen_seds, mapgen2(gen_seds,in_gen) *sum(s_seds,elec_vom_import(s_seds,gen_seds)*mapstate(s_seds,s)))/1000000;
elec_cap(in_gen,s) = sum(gen_seds, mapgen2(gen_seds,in_gen) *sum(s_seds,elec_cap_import(s_seds,gen_seds)*mapstate(s_seds,s)))/1000000;

display
elec_gen_import
elec_gen
elec_gen_tot
elec_cons
elec_dimports_
elec_dexports_
elec_gen_agg
elec_cons_agg
elec_cons_agg_db
elec_imports_
elec_exports_
;

parameter
elec_omcost
elec_omcost_tot
elec_gen_share
elec_om_share
;

elec_omcost(in_gen,s) = elec_fom(in_gen,s)*elec_cap(in_gen,s) + elec_vom(in_gen,s)*elec_gen(in_gen,s);
elec_omcost_tot(in_gen) = sum(s,elec_omcost(in_gen,s));
elec_gen_share(in_gen,s) = elec_gen(in_gen,s)/sum(ss,elec_gen(in_gen,ss));
elec_om_share(in_gen,s) = elec_omcost(in_gen,s)/sum(ss,elec_omcost(in_gen,ss));

display
elec_omcost_tot
elec_gen_share
elec_om_share
;



* ------------------------------------------------------------------------------
* Import state-level refining data
* ------------------------------------------------------------------------------

parameter
refinery_import_share_import(s_seds)
refinery_oil_input_share_import(s_seds)
refinery_gas_input_share_import(s_seds)
refinery_import_share(s)
refinery_oil_input_share(s)
refinery_gas_input_share(s)
;


$CALL GDXXRW.EXE import_refine_oilimport_share.xlsx par=refinery_import_share_import rng=A1:B51 rdim = 1 cdim=0
$CALL GDXXRW.EXE import_refine_oilinput_share.xlsx par=refinery_oil_input_share_import  rng=A1:B51 rdim = 1 cdim=0
$CALL GDXXRW.EXE import_refine_gasinput_share.xlsx par=refinery_gas_input_share_import rng=A1:B51 rdim = 1 cdim=0



$GDXIN import_refine_oilimport_share.gdx
$onUNDF
$LOAD refinery_import_share_import
$GDXIN

$GDXIN import_refine_oilinput_share.gdx
$onUNDF
$LOAD refinery_oil_input_share_import
$GDXIN

$GDXIN import_refine_gasinput_share.gdx
$onUNDF
$LOAD refinery_gas_input_share_import
$GDXIN


refinery_import_share(s) = sum(s_seds,refinery_import_share_import(s_seds)*mapstate(s_seds,s));
refinery_oil_input_share(s) = sum(s_seds,refinery_oil_input_share_import(s_seds)*mapstate(s_seds,s));
refinery_gas_input_share(s) = sum(s_seds,refinery_gas_input_share_import(s_seds)*mapstate(s_seds,s));


* ------------------------------------------------------------------------------
* Load Emissions Data and Calibrate Emissions Factors
* ------------------------------------------------------------------------------

parameter
emissions_import(fuel_seds,sec_seds,s_seds)
esector00_s_(fuel,sec,s)
esector00_db_
;


$CALL GDXXRW.EXE import_state_emissions.xlsx par=emissions_import rng=A1:D749 rdim = 3 cdim=0



$GDXIN import_state_emissions.gdx
$onUNDF
$LOAD emissions_import
$GDXIN


esector00_s_(fuel,sec,s)  = sum(fuel_seds,sum(sec_seds,sum(s_seds,emissions_import(fuel_seds,sec_seds,s_seds)*mapstate(s_seds,s))*mapsec(sec_seds,sec))*mapfuel(fuel_seds,fuel))/1000000;
esector00_s_(fuel,sec,s)$(seds_ex(fuel,sec,s) = 0) = 0;




