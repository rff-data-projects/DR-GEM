$TITLE Regional Disaggregation$



* ------------------------------------------------------------------------------
* Redefine IMPLAN SAM data
* ------------------------------------------------------------------------------

parameter
MAKE0_s__(ind,c,s)
make_pct_s__(ind,c,s)
EXD0_s__(c,s)
EX0_s__(c,s)
Y0_s__(c,s)

GY_FED0_s__(c,s)
GY_REG0_s__(c,s)

USE0_s__(c,ind,s)
IO0_s__(c,cc,s)
PCE0_s__(c,s)
PFI0_s__(c,s)
G_FED0_s__(c,s)
G_REG0_s__(c,s)
G0_s__(c,s)
IMD0_s__(c,s)
IM0_s__(c,s)

GTRANS_FED0_s__(s)
GTRANS_REG0_s__(s)
GGRANT0_s__(s)

FACTOR_s__(f,ind,s) "Factor income by factor f by industry ind in region s"
L0_s__(*,*)
GOS0_s__(*,*)
TOPI0_s__(*,*)

LG_FED0_s__(*) "Labor demand for labor in region s by federal government"
LG_REG0_s__(*) "Labor demand for labor in region s by regional government"

ratiot
TBAL0_s__
;


* ------------------------------------------------------------------------------
* Convert IMPLAN SAM data into model parameters
* ------------------------------------------------------------------------------

MAKE0_s__(ind,c,s) = SAM_FULL_S(ind,c,s)/1000000;
make_pct_s__(ind,c,s)$(sum(cc,MAKE0_s__(ind,cc,s)) gt 0) = MAKE0_s__(ind,c,s)/sum(cc,MAKE0_s__(ind,cc,s));
EX0_s__(c,s) = sum(ind,FEXPORT_FULL_S(ind,c,s))/1000000;
EXD0_s__(c,s) = sum(ind,DEXPORT_FULL_S(ind,c,s))/1000000;
Y0_s__(c,s) = sum(ind,MAKE0_s__(ind,c,s)) + EX0_s__(c,s) + EXD0_s__(c,s);

GY_FED0_s__(c,s) = SAM_FULL_S('s10',c,s)/1000000;
GY_REG0_s__(c,s) = SAM_FULL_S('s13',c,s)/1000000;


USE0_s__(c,ind,s) = SAM_FULL_S(c,ind,s)/1000000 + DIMPORT_FULL_S(c,ind,s)/1000000 + FIMPORT_FULL_S(c,ind,s)/1000000;
USE0_s__(ff_c,gen_ind,s) = USE0_s__(ff_c,gen_ind,s) + sum(govutil,USE0_s__(ff_c,govutil,s));
USE0_s__(ff_c,govutil,s) = 0;
USE0_s__(gen,electd_ind,s) = USE0_s__(gen,electd_ind,s) + sum(govutil,USE0_s__(gen,govutil,s));
USE0_s__(gen,govutil,s) = 0;

loop(c,
IO0_s__(c,cc,s) = sum(ind,USE0_s__(c,ind,s)*make_pct_s__(ind,cc,s));
);


PCE0_s__(c,s) = sum(hh,SAM_FULL_S(c,hh,s))/1000000 + sum(hh,DIMPORT_FULL_S(c,hh,s))/1000000 + sum(hh,FIMPORT_FULL_S(c,hh,s))/1000000;
PFI0_s__(c,s) = SAM_FULL_S(c,'s17',s)/1000000 + DIMPORT_FULL_S(c,'s17',s)/1000000 + FIMPORT_FULL_S(c,'s17',s)/1000000;
G_FED0_s__(c,s) = sum(govf,(SAM_FULL_S(c,govf,s)))/1000000 + sum(govf,(DIMPORT_FULL_S(c,govf,s)))/1000000 + sum(govf,(FIMPORT_FULL_S(c,govf,s)))/1000000;
G_REG0_s__(c,s) = sum(govr,(SAM_FULL_S(c,govr,s)))/1000000 + sum(govr,(DIMPORT_FULL_S(c,govr,s)))/1000000 + sum(govr,(FIMPORT_FULL_S(c,govr,s)))/1000000;

G0_s__(c,s) = sum(ind,USE0_s__(c,ind,s)) + PCE0_s__(c,s) + PFI0_s__(c,s) + G_FED0_s__(c,s) + G_REG0_s__(c,s) ;
IMD0_s__(c,s) = sum(ind,DIMPORT_FULL_S(c,ind,s))/1000000 +  sum(hh,DIMPORT_FULL_S(c,hh,s))/1000000 + DIMPORT_FULL_S(c,'s17',s)/1000000 + sum(govf,(DIMPORT_FULL_S(c,govf,s)))/1000000 + sum(govr,(DIMPORT_FULL_S(c,govr,s)))/1000000;
IM0_s__(c,s) = sum(ind,FIMPORT_FULL_S(c,ind,s))/1000000 + sum(hh,FIMPORT_FULL_S(c,hh,s))/1000000 + FIMPORT_FULL_S(c,'s17',s)/1000000 + sum(govf,(FIMPORT_FULL_S(c,govf,s)))/1000000 + sum(govr,(FIMPORT_FULL_S(c,govr,s)))/1000000;


GTRANS_FED0_s__(s) = sum(hh,SAM_FULL_S(hh,'s10',s))/1000000;
GTRANS_REG0_s__(s) = sum(hh,SAM_FULL_S(hh,'s13',s))/1000000;
GGRANT0_s__(s) = SAM_FULL_S('s13','s10',s)/1000000;

FACTOR_s__(f,ind,s) = SAM_FULL_S(f,ind,s);
L0_s__(c,s) = sum(ind,FACTOR_s__('f1',ind,s)*make_pct_s__(ind,c,s))/1000000;
GOS0_s__(c,s) = sum(ind,FACTOR_s__('f2',ind,s)*make_pct_s__(ind,c,s))/1000000 + sum(ind,FACTOR_s__('f3',ind,s)*make_pct_s__(ind,c,s))/1000000;;
TOPI0_s__(c,s) = sum(ind,FACTOR_s__('f4',ind,s)*make_pct_s__(ind,c,s))/1000000;


LG_FED0_s__(s) = sum(govf,(SAM_FULL_S('cPayroll',govf,s)))/1000000;
LG_REG0_s__(s) = sum(govr,(SAM_FULL_S('cPayroll',govr,s)))/1000000;



ratiot(c) = sum(s,IMD0_s__(c,s))/sum(s,EXD0_s__(c,s));
EXD0_s__(c,s) = ratiot(c)*EXD0_s__(c,s);
TBAL0_s__(c) = sum(s,EXD0_s__(c,s) - IMD0_s__(c,s));
exd0_s__(c,s)$(exd0_s__(c,s) < 0) = 0;
Y0_s__(c,s) = sum(ind,MAKE0_s__(ind,c,s)) + EX0_s__(c,s) + EXD0_s__(c,s);

* ------------------------------------------------------------------------------
* Calculate shares
* ------------------------------------------------------------------------------

parameter
yf0_s__(*,*)
yd0_s__(*,*)
yr0_s__(*,*)
yr0_s_db

xf0_s__(*,*)
xd0_s__(*,*)
xr0_s__(*,*)
xr0_s_db

y0_sh__(*,*)
l0_sh__(*,*)
gos0_sh__(*,*)
topi0_sh__(*,*)

pce0_sh__(*,*)
pfi0_sh__(*,*)
g_fed0_sh__(*,*)
g_reg0_sh__(*,*)


;


yf0_s__(c,s)$(y0_s__(c,s) gt 0) = ex0_s__(c,s)/y0_s__(c,s);
yd0_s__(c,s)$(y0_s__(c,s) gt 0) = exd0_s__(c,s)/y0_s__(c,s);
yr0_s__(c,s) = 1 - yd0_s__(c,s) - yf0_s__(c,s);
yr0_s_db(c,s)$(yr0_s__(c,s) < 0) = yr0_s__(c,s);
yd0_s__(c,s)$(yr0_s__(c,s) < 0) = 1 - yd0_s__(c,s);
exd0_s__(c,s)$(yr0_s__(c,s) < 0) = y0_s__(c,s)*yd0_s__(c,s);
yr0_s__(c,s) = 1 - yd0_s__(c,s) - yf0_s__(c,s);

xf0_s__(c,s)$(G0_s__(c,s) > 0) = IM0_s__(c,s)/G0_s__(c,s);
xd0_s__(c,s)$(G0_s__(c,s) > 0) = IMD0_s__(c,s)/G0_s__(c,s);
xr0_s__(c,s) = 1- xf0_s__(c,s) - xd0_s__(c,s);
xr0_s_db(c,s)$(xr0_s__(c,s) < 0) = xr0_s__(c,s);
xd0_s__(c,s)$(xr0_s__(c,s) < 0) = 1 - xf0_s__(c,s);
xr0_s__(c,s) = 1 - xf0_s__(c,s) - xd0_s__(c,s);




y0_sh__(c,s) = y0_s__(c,s)/sum(ss,y0_s__(c,ss));
l0_sh__(c,s) = l0_s__(c,s)/sum(ss,l0_s__(c,ss));
gos0_sh__(c,s) = gos0_s__(c,s)/sum(ss,gos0_s__(c,ss));
topi0_sh__(c,s) = topi0_s__(c,s)/sum(ss,topi0_s__(c,ss));

TBAL0_s__(c) = sum(s,EXD0_s__(c,s) - IMD0_s__(c,s));


pce0_sh__(c,s)$(sum(ss,pce0_s__(c,ss)) gt 0) = pce0_s__(c,s)/sum(ss,pce0_s__(c,ss));
pfi0_sh__(c,s)$(sum(ss,pfi0_s__(c,ss)) gt 0) = pfi0_s__(c,s)/sum(ss,pfi0_s__(c,ss));
g_fed0_sh__(c,s)$(sum(ss,g_fed0_s__(c,ss)) gt 0) = g_fed0_s__(c,s)/sum(ss,g_fed0_s__(c,ss));
g_reg0_sh__(c,s)$(sum(ss,g_reg0_s__(c,ss)) gt 0) = g_reg0_s__(c,s)/sum(ss,g_reg0_s__(c,ss));

display
ratiot
TBAL0_s__
xr0_s_db
yr0_s_db
xr0_s__
xd0_s__
yd0_s__
xf0_s__
;


