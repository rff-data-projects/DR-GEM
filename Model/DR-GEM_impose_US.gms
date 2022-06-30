$TITLE Impose: SAM to Model Parameters -- US version$

* ------------------------------------------------------------------------------
* Define sets
* ------------------------------------------------------------------------------

sets
ind(RS_All0) industries /ind1*ind59/
c(RS_All0) commodity /c1*c58/
ins(RS_All0) institutions /s1*s18/
hh(ins) household /s1*s9/
govf(ins) federal government /s10*s12/
govr(ins) regional government /s13*s15/
f(RS_All0) /f1*f4/


govutil(ind) "Government Utility Industry" /ind59/
ff_ind(ind) "Fossil Fuel Industries" /ind3*ind4/
gen_ind(ind) "Generation industries" /ind7/
electd_ind(ind) "Electric T/D industries" /ind8/

ff_c(c) "Fossil Fuel Commodities" /c3*c4/
gen(c) "Generation Commodity" /c7/
whole(c) "wholesale trade" /c35/
retail(c) "retail trade" /c36/
trans(c) "Transportation industries" /c37*c44/
in_m(c) "Margin industries" /c35*c44/

;


ALIAS (ind,indd);
ALIAS (c,cc);
alias (trans,trans2)


* ------------------------------------------------------------------------------
* Define model parameters
* ------------------------------------------------------------------------------

parameter
USE0_DN__(c,ind)  "Use of national commodity c by industry ind"
USE0_F__(c,ind)   "Use of foreign commodity c by industry ind"
USE0__(c,ind)  "Total use of commodity c by industry ind"

MAKE0__(ind,c)   "Industry ind production of commodity c"
make_pct__(ind,c)


PCE0_DN__(c)
PCE0_F__(c)
PCE0__(c)

PFI0_DN__(c)
PFI0_F__(c)
PFI0__(c)

G_FED0_DN__(c)
G_FED0_F__(c)
G_FED0__(c)

G_REG0_DN__(c)
G_REG0_F__(c)
G_REG0__(c)

GY_FED0__(c)
GY_REG0__(c)

GTRANS_FED0_
GTRANS_REG0_
GGRANT0_

FACTOR__(f,ind)
LG_FED0_
LG_REG0_

EX0__(c)


;

* ------------------------------------------------------------------------------
* Convert IMPLAN SAM data into model parameters
* ------------------------------------------------------------------------------


USE0_DN__(c,ind) = SAM_FULL(c,ind)/1000000;
USE0_F__(c,ind) = FIMPORT_FULL(c,ind)/1000000;

USE0__(c,ind) = USE0_DN__(c,ind) + USE0_F__(c,ind);

MAKE0__(ind,c) = SAM_FULL(ind,c);

make_pct__(ind,c)$(sum(cc,MAKE0__(ind,cc)) gt 0) = MAKE0__(ind,c)/sum(cc,MAKE0__(ind,cc));

PFI0_DN__(c) = SAM_FULL(c,'s17')/1000000;
PFI0_F__(c) = FIMPORT_FULL(c,'s17')/1000000;
PFI0__(c) = PFI0_DN__(c) + PFI0_F__(c);

PCE0_DN__(c) = sum(hh,SAM_FULL(c,hh))/1000000;
PCE0_F__(c) = sum(hh,FIMPORT_FULL(c,hh))/1000000;
PCE0__(c) = PCE0_DN__(c) + PCE0_F__(c);

G_FED0_DN__(c) = sum(govf,(SAM_FULL(c,govf)))/1000000;
G_FED0_F__(c) = sum(govf,(FIMPORT_FULL(c,govf)))/1000000;
G_FED0__(c) = G_FED0_DN__(c) + G_FED0_F__(c);


G_REG0_DN__(c) = sum(govr,(SAM_FULL(c,govr)))/1000000;
G_REG0_F__(c) = sum(govr,(FIMPORT_FULL(c,govr)))/1000000;
G_REG0__(c) = G_REG0_DN__(c) + G_REG0_F__(c);


GY_FED0__(c) = SAM_FULL('s10',c)/1000000;
GY_REG0__(c) = SAM_FULL('s13',c)/1000000;

GTRANS_FED0_ = sum(hh,SAM_FULL(hh,'s10'))/1000000;
GTRANS_REG0_ = sum(hh,SAM_FULL(hh,'s13'))/1000000;
GGRANT0_ = SAM_FULL('s13','s10')/1000000;

FACTOR__(f,ind) = SAM_FULL(f,ind);
LG_FED0_ = sum(govf,(SAM_FULL('cPayroll',govf)))/1000000;
LG_REG0_ = sum(govr,(SAM_FULL('cPayroll',govr)))/1000000;

EX0__(c) = sum(ind,FEXPORT_FULL(ind,c))/1000000;




* ------------------------------------------------------------------------------
* Convert Raw Industry Accounts into Commodity Accounts
* ------------------------------------------------------------------------------

parameter
IO0__
IO0_F__
IO0_DN__
L0__
TOPI0__
GOS0__
;

* Assign government utility use of fossil fuels to generation and government
* utility use of generation to transmission

USE0_DN__(ff_c,gen_ind) = USE0_DN__(ff_c,gen_ind) + sum(govutil,USE0_DN__(ff_c,govutil));
USE0_DN__(ff_c,govutil) = 0;
USE0_DN__(gen,electd_ind) = USE0_DN__(gen,electd_ind) + sum(govutil,USE0_DN__(gen,govutil));
USE0_DN__(gen,govutil) = 0;


USE0_F__(ff_c,gen_ind) = USE0_F__(ff_c,gen_ind) + sum(govutil,USE0_F__(ff_c,govutil));
USE0_F__(ff_c,govutil) = 0;
USE0_F__(gen,electd_ind) = USE0_F__(gen,electd_ind) + sum(govutil,USE0_F__(gen,govutil));
USE0_F__(gen,govutil) = 0;

USE0__(c,ind) = USE0_DN__(c,ind) + USE0_F__(c,ind);

make_pct__(ind,c)$(sum(cc,MAKE0__(ind,cc)) gt 0) = MAKE0__(ind,c)/sum(cc,MAKE0__(ind,cc));

loop(c,
IO0__(c,cc) = sum(ind,USE0__(c,ind)*make_pct__(ind,cc));
IO0_F__(c,cc) = sum(ind,USE0_F__(c,ind)*make_pct__(ind,cc));
IO0_DN__(c,cc) = sum(ind,USE0_DN__(c,ind)*make_pct__(ind,cc));
);

L0__(c) = sum(ind,FACTOR__('f1',ind)*make_pct__(ind,c))/1000000;
TOPI0__(c) = sum(ind,FACTOR__('f4',ind)*make_pct__(ind,c))/1000000;
GOS0__(c) = sum(ind,FACTOR__('f2',ind)*make_pct__(ind,c))/1000000 + sum(ind,FACTOR__('f3',ind)*make_pct__(ind,c))/1000000;;

* ------------------------------------------------------------------------------
* Adjust labor factor to avoid negative GOS/K
* ------------------------------------------------------------------------------

L0__('c8') = L0__('c8') + L0__('c9')*0.1;
L0__('c9') = L0__('c9') - L0__('c9')*0.1;
L0__('c56') = L0__('c56') + L0__('c57')*0.1;
L0__('c57') = L0__('c57') - L0__('c57')*0.1;

* ------------------------------------------------------------------------------
* Adjust direct fossil fuel inputs in energy industries
* ------------------------------------------------------------------------------

IO0__('c4','c3') = 0;
IO0__('c4','c9') = 0;
IO0__('c4','c18') = 0;

IO0__('c18','c3') = 0;
IO0__('c18','c9') = 0;

* ------------------------------------------------------------------------------
* Debug parameters to calculate total expenditures/revenues
* ------------------------------------------------------------------------------

parameter
db_io
db_l
db_gos
db_topi
db_io_f
db_pce
db_pfi
db_govf
db_govr
db_ex
db_ex_db
db_pce_f
db_pfi_f
db_govf_f
db_govr_f

db_l_hh
db_l_govf
db_l_govr

db_gos_hh
db_gos_cap
db_gos_prof
db_gos_govf
db_gos_govr

db_topi_govf
db_topi_govr

db_hh_govf
db_hh_govr

db_prof_hh
db_prof_govf
db_prof_govr

db_cap_prof
db_govf_l
db_govr_l
db_govf_hh
db_govr_hh
db_govf_govf
db_govf_govr
db_govr_govr
db_y_govf
db_y_govr
;

db_io = sum(c,sum(cc,IO0__(c,cc)));
db_io_f = sum(c,sum(cc,IO0_F__(c,cc)));
db_l = sum(c,L0__(c));
db_gos = sum(c,GOS0__(c));
db_topi = sum(c,TOPI0__(c));

db_pce = sum(c,PCE0__(c));
db_pfi = sum(c,PFI0__(c));
db_govf = sum(c,g_fed0__(c));
db_govr = sum(c,g_reg0__(c));
db_ex = sum(c,EX0__(c));
db_ex_db = sum(c,sum(ins,FEXPORT_FULL(ins,c)))/1000000;

db_pce_f = sum(c,PCE0_F__(c));
db_pfi_f = sum(c,PFI0_F__(c));
db_govf_f = sum(c,g_fed0_f__(c));
db_govr_F = sum(c,g_reg0_f__(c));

db_l_hh = sum(hh,SAM_FULL(hh,'f1'))/1000000;
db_l_govf = sum(govf,SAM_FULL(govf,'f1'))/1000000;
db_l_govr = sum(govr,SAM_FULL(govr,'f1'))/1000000;

db_gos_hh =  sum(hh,SAM_FULL(hh,'f2')+SAM_FULL(hh,'f3'))/1000000;
db_gos_prof = SAM_FULL('s16','f3')/1000000;
db_gos_cap =  (SAM_FULL('s17','f2')+SAM_FULL('s17','f3'))/1000000;
db_gos_govf = sum(govf,SAM_FULL(govf,'f2'))/1000000 + sum(govf,SAM_FULL(govf,'f3'))/1000000;
db_gos_govr = sum(govr,SAM_FULL(govr,'f2'))/1000000 + sum(govr,SAM_FULL(govr,'f3'))/1000000;

db_topi_govf = sum(govf,SAM_FULL(govf,'f4'))/1000000;
db_topi_govr = sum(govr,SAM_FULL(govr,'f4'))/1000000;

db_hh_govf = sum(govf,sum(hh,SAM_FULL(govf,hh)))/1000000;
db_hh_govr = sum(govr,sum(hh,SAM_FULL(govr,hh)))/1000000;

db_prof_hh = sum(hh,SAM_FULL(hh,'s16'))/1000000;
db_prof_govf = sum(govf,SAM_FULL(govf,'s16'))/1000000;
db_prof_govr = sum(govr,SAM_FULL(govr,'s16'))/1000000;

db_cap_prof = SAM_FULL('s17','s16')/1000000;

db_govf_l = lg_fed0_;
db_govr_l = lg_reg0_;

db_govf_hh = GTRANS_FED0_;
db_govr_hh = GTRANS_REG0_;
db_govf_govr = GGRANT0_;



db_y_govf = sum(c,GY_FED0__(c));
db_y_govr = sum(c,GY_REG0__(c));


display
db_io
db_l
db_gos
db_topi
db_io_f
db_pce
db_pfi
db_govf
db_govr
db_ex
db_ex_db
db_pce_f
db_pfi_f
db_govf_f
db_govr_f
db_l_hh
db_l_govf
db_l_govr
db_gos_hh
db_gos_cap
db_gos_prof
db_gos_govf
db_gos_govr
db_topi_govf
db_topi_govr
db_hh_govf
db_hh_govr
db_prof_hh
db_prof_govf
db_prof_govr
db_cap_prof
db_govf_l
db_govr_l
db_govf_hh
db_govr_hh
db_govf_govr
db_y_govf
db_y_govr


;







