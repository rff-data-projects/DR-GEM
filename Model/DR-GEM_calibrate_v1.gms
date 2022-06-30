$TITLE Dynamic Regional General Equilibrium Model(DR-GEM) Model Calibration

* Model version 1.0
* 6/30/2022


* ------------------------------------------------------------------------------
* Step 1: Verify aggregated data satisfies model constraints
* ------------------------------------------------------------------------------


parameter
xf0(*,*) "Foreign demand ratio for good i"
IM0(*,*)  "Imports of foreign good i"
BOP0(*)  "Balance of payments"

xr0(*,*)
ratio_dn
;

xf0(i,r)$(g0(i,r) > 0) = g0_f(i,r)/g0(i,r);

IM0(i,r) = G0_F(i,r);
BOP0(r) = sum(i,IM0(i,r)-EX0(i,r));

xr0(i,r)$(g0_d(i,r) > 0) = G0_DR(i,r)/G0_D(i,r);

ratio_dn(i)$(sum(r,exd0(i,r)) gt 0) = sum(rr,G0_DN(i,rr))/sum(rr,EXD0(i,rr));

display
ratio_dn
xf0
xr0
;


parameter
C0  "Consumption expenditures (net of margins) on good i"
I0 "Total Investment expenditures on good i"

CBAR0  "Total consumption expenditures"
IBAR0 "Total investment expenditures"
GBAR_FED0 "Total federal government expenditures on good i"
GBAR_REG0 "Total regional government expenditures on good i"
;

C0(i,r) = PCE0(i,r)*(1+sum(margins,pce0_mr(i,margins,r)));
I0(i,r) = PFI0(i,r)*(1+sum(margins,pfi0_mr(i,margins,r)));

CBAR0(r) = sum(i,C0(i,r));
IBAR0(r) = sum(i,I0(i,r));
GBAR_FED0(i,r) = G_FED0(i,r)*(1+sum(margins,g_fed0_mr(i,margins,r)));
GBAR_REG0(i,r) = G_REG0(i,r)*(1+sum(margins,g_reg0_mr(i,margins,r)));






parameters
pkbar0(*)  "Price of new capital"
xi0(*,*) "Share of investment spending allocated to good i"
ACEXP0(*,*) "Adjustment cost expenditures"
F_K0(*,*) "Marginal return to capital"
KDEP0(*,*) "Depreciated capital stock"
XKINC0(*,*) "Capital Income"
PROF0(*,*) "Profits"
PROF0b "Profits (gross of investment expenditures"
v0(*,*) "Value of Firm"
v_db(*,*)
;

xi0(i,r) = (I0(i,r))/sum(ii,I0(ii,r));
pkbar0(r) = sum(i,xi0(i,r)) ;

ACEXP0(i,r) = 0 ;
F_K0(i,r)$(K0(i,r) gt 0) = (LAMBDAK0(i,r)*(rbar0+delta)  )/((1-tau_y0(i,r))*(1-tau_k0-tau_kr0(r)));

KDEP0(i,r) = ((delta+gr)*K0(i,r))/(gr+deltat);
XKINC0(i,r) = GOS0(i,r);

PROF0(i,r) = (1-tau_k0-tau_kr0(r))*XKINC0(i,r) + (tau_k0+tau_kr0(r))*deltat*KDEP0(i,r) - (delta+gr)*K0(i,r);
PROF0b(i,r) = (1-tau_k0-tau_kr0(r))*XKINC0(i,r) + (tau_k0+tau_kr0(r))*deltat*KDEP0(i,r);

v0(i,r) = lambdak0(i,r)*k0(i,r) + dd0(r)*kdep0(i,r);
v_db(i,r) = (1-tau_k0-tau_kr0(r))*(GOS0(i,r) - delta*k0(i,r))/rbar0;



display
v0
v_db
;


* Government expenditures

parameters
GEXP_FED0
GEXP_REG0
;

GEXP_FED0 = sum(r,LG_FED0(r)*(1+tau_p0) + sum(i,GBAR_FED0(i,r)) + GGRANT0(r) + GTRANS_FED0(r));
GEXP_REG0(r) = LG_REG0(r)*(1+tau_p0) + sum(i,GBAR_REG0(i,r)) + GTRANS_REG0(r);

* Government finance

parameters
GREV_FED0
GREV_REG0
GLUMP_FED0
GLUMP_REG0
;


GREV_FED0(r) = (tau_l0 + tau_p0)*(sum(i,L0(i,r)) + LG_FED0(r) + LG_REG0(r))  +  sum(i,tau_k0*XKINC0(i,r)) - sum(i,tau_k0*deltat*KDEP0(i,r)) + sum(i,GY_FED0(i,r));
GREV_REG0(r) = (tau_lr0(r))*(sum(i,L0(i,r))  + LG_FED0(r) + LG_REG0(r)) + sum(i,tau_kr0(r)*XKINC0(i,r)) - sum(i,tau_kr0(r)*deltat*KDEP0(i,r)) + sum(i,tau_y0(i,r)*Y0(i,r))  + sum(i,GY_REG0(i,r)) + GGRANT0(r) ;

GLUMP_FED0(r) = LG_FED0(r)*(1+tau_p0) + sum(i,GBAR_FED0(i,r)) + GGRANT0(r) + GTRANS_FED0(r) - GREV_FED0(r);
GLUMP_REG0(r) = GEXP_REG0(r) - GREV_REG0(r);

display
gexp_fed0
gexp_reg0
glump_fed0
glump_reg0
;


* ------------------------------------------------------------------------------
* Step 6: Verify budget constraint and domestic trade balance
* ------------------------------------------------------------------------------


parameter
adj0
adj0_sum
adj0m
adj0m_sum
adj0_db
adj0_db2
r0
r_db
save0
LS0
bc0
wealth0
vtot0
bc0_db
;

ADJ0(r) = sum(i,G0_DN(i,r))+sum(margins,dm0(margins,r))-sum(i,EXD0(i,r))-sum(i,my0(i,r));
adj0_sum = sum(r,ADJ0(r));

adj0m(r) = sum(margins,dm0(margins,r)) - sum(i,my0(i,r));
adj0m_sum = sum(r,adj0m(r));

r0(r) = sum(i,prof0(i,r))/sum(i,v0(i,r));

r_db(r) = rbar0/(1-tau_k0-tau_kr0(r));

save0(r) = sum(i,r0(r)*v0(i,r)) - sum(i,prof0(i,r));

LS0(r) = sum(i,L0(i,r)) + LG_FED0(r) + LG_REG0(r);

bc0(r) = (1-tau_l0-tau_lr0(r))*LS0(r) + sum(i,PROF0(i,r)+NRP0(i,r)) + GTRANS_FED0(r) + GTRANS_REG0(r) + BOP0(r) + ADJ0(r) - CBAR0(r) - GLUMP_FED0(r) - GLUMP_REG0(r) ;

wealth0(r) = (CBAR0(r) + GLUMP_FED0(r) + GLUMP_REG0(r) - (1-tau_l0-tau_lr0(r))*LS0(r) - sum(i,NRP0(i,r)) - GTRANS_FED0(r) - GTRANS_REG0(r) - BOP0(r) - ADJ0(r))/r0(r);
vtot0(r) = sum(i,v0(i,r));

bc0_db(r) = ibar0(r) - sum(i,delta*k0(i,r));

adj0_db(r) = adj0(r)-adj0m(r) - sum(s,mapregion(s,r) * adj0s(s));

adj0_db2(r) = sum(i_nt,g0_dn(i_nt,r)-exd0(i_nt,r)) +sum(margins,dm0(margins,r))-sum(i,my0(i,r)) + sum(i_td,g0_dn(i_td,r)-exd0(i_td,r));

display
adj0
adj0_sum
adj0m
adj0m_sum
adj0_db
adj0_db2
bop0
bc0
bc0_db
cbar0
save0
r0
r_db
rbar0
wealth0
vtot0
;




* ------------------------------------------------------------------------------
* Step 8: Calibrate implicit model parameters
* ------------------------------------------------------------------------------

* Note: This section assumes unitary price levels for all goods


* Armington Composite

parameters
p0(i,r)
pe0(er)
pn0(i)
pmy0(i)
pf0

pg0(*,*)
alphag_d0(*,*)
alphag_f0(*,*)
gammag0(*,*)

pd0(i,r)
alphar_n0(*,*)
alphar_r0(*,*)
alphar_e0(*,*)
gammar0(*,*)

pc0(*,*)
pi0(*,*)
pgf0(*,*)
pgr0(*,*)
pio0(*,*,*)
pm0(*,*)

pe0_db(r)
;

p0(i,r) = 1;
pe0(er) = 1;
pn0(i) = 1;
pd0(i,r) = 1;
pmy0(i) = 1;
pf0 = 1;


pd0(i,r)$(not i_td(i)) = (1-xr0(i,r))*pn0(i) + xr0(i,r)*p0(i,r);
alphar_n0(i,r)$(xr0(i,r) > 0 and not i_td(i) ) = (pn0(i)/pd0(i,r))*(1-xr0(i,r))**(1/sig_rn(i,r));
alphar_r0(i,r)$(xr0(i,r) > 0 and not i_td(i)) = (p0(i,r)/pd0(i,r))*(xr0(i,r))**(1/sig_rn(i,r));

alphar_n0(i,r)$(xr0(i,r) = 0 and not i_td(i)) = 1;
alphar_r0(i,r)$(xr0(i,r) = 0 and not i_td(i)) = 0;
alphar_e0(i,r)$(not i_td(i)) = 0;

pd0(i_td,r)$(xr0(i_td,r) > 0) = (1-xr0(i_td,r))*sum(er,maper(r,er)*pe0(er)) + xr0(i_td,r)*p0(i_td,r);
alphar_n0(i_td,r) = 0;
alphar_e0(i_td,r)$(xr0(i_td,r) > 0) = (sum(er,maper(r,er)*pe0(er))/pd0(i_td,r))*(1-xr0(i_td,r))**(1/sig_rn(i_td,r));
alphar_r0(i_td,r)$(xr0(i_td,r) > 0) = (p0(i_td,r)/pd0(i_td,r))*(xr0(i_td,r))**(1/sig_rn(i_td,r));

gammar0(i,r) = alphar_n0(i,r) + alphar_r0(i,r) + alphar_e0(i,r);
alphar_n0(i,r) = alphar_n0(i,r)/gammar0(i,r);
alphar_r0(i,r) = alphar_r0(i,r)/gammar0(i,r);
alphar_e0(i,r) = alphar_e0(i,r)/gammar0(i,r);

pe0_db(r) = sum(er,maper(r,er)*pe0(er));


pg0(i,r) = (1-xf0(i,r))*pd0(i,r) + xf0(i,r)*pf0;
alphag_d0(i,r) = (pd0(i,r)/pg0(i,r))*(1-xf0(i,r))**(1/sig_f(i,r));
alphag_f0(i,r) = (pf0/pg0(i,r))*(xf0(i,r))**(1/sig_f(i,r));
gammag0(i,r) = alphag_d0(i,r) + alphag_f0(i,r);
alphag_d0(i,r) = alphag_d0(i,r)/gammag0(i,r);
alphag_f0(i,r) = alphag_f0(i,r)/gammag0(i,r);


pm0(margins,r) = sum(i,map_mr(i,margins)*pmy0(i) );
pc0(i,r) = (1/(1+sum(margins,pce0_mr(i,margins,r))))*pg0(i,r) + sum(margins,pce0_mr(i,margins,r)*pm0(margins,r))/(1+sum(margins,pce0_mr(i,margins,r)));
pi0(i,r) = (1/(1+sum(margins,pfi0_mr(i,margins,r))))*pg0(i,r) + sum(margins,pfi0_mr(i,margins,r)*pm0(margins,r))/(1+sum(margins,pfi0_mr(i,margins,r)));
pgf0(i,r) = (1/(1+sum(margins,g_fed0_mr(i,margins,r))))*pg0(i,r) + sum(margins,g_fed0_mr(i,margins,r)*pm0(margins,r))/(1+sum(margins,g_fed0_mr(i,margins,r)));
pgr0(i,r) = (1/(1+sum(margins,g_reg0_mr(i,margins,r))))*pg0(i,r) + sum(margins,g_reg0_mr(i,margins,r)*pm0(margins,r))/(1+sum(margins,g_reg0_mr(i,margins,r)));
pio0(i,ii,r) = (1/(1+sum(margins,io0_mr(i,ii,margins,r))))*pg0(i,r) + sum(margins,io0_mr(i,ii,margins,r)*pm0(margins,r))/(1+sum(margins,io0_mr(i,ii,margins,r)));


display
alphar_e0
xr0
;


* Disaggregate intermediate inputs into fixed share inputs and variable inputs

parameters
io0_ff(*,*,*)
iom0_ff(*,*,*)
ff0(*,*)
cost_f0(*,*)
;

io0_ff(i,ii,r) = 0;
iom0_ff(i,ii,r) = 0;
ff0(i,r) = 0;
cost_f0(i,r) = 1;

* Set services (commercial, transportation, OOH) as fixed share inputs for material industries
$ontext
io0_ff(is,im,r) = io0(is,im,r);
iom0_ff(is,im,r) = iom0(is,im,r);
io0(is,im,r) = 0;
iom0(is,im,r) = 0;

* Set materials as fixed share inputs for energy industries

io0_ff(im,i_ff,r) = io0(im,i_ff,r);
iom0_ff(im,i_ff,r) = iom0(im,i_ff,r);
io0(im,i_ff,r) = 0;
iom0(im,i_ff,r) = 0;


io0_ff(im,i_gen,r) = io0(im,i_gen,r);
iom0_ff(im,i_gen,r) = iom0(im,i_gen,r);
io0(im,i_gen,r) = 0;
iom0(im,i_gen,r) = 0;




io0_ff(im,i_ngd,r) = io0(im,i_ngd,r);
iom0_ff(im,i_ngd,r) = iom0(im,i_ngd,r);
io0(im,i_ngd,r) = 0;
iom0(im,i_ngd,r) = 0;

io0_ff(im,i_refine,r) = io0(im,i_refine,r);
iom0_ff(im,i_refine,r) = iom0(im,i_refine,r);
io0(im,i_refine,r) = 0;
iom0(im,i_refine,r) = 0;

io0_ff(im,i_td,r) = io0(im,i_td,r);
iom0_ff(im,i_td,r) = iom0(im,i_td,r);
io0(im,i_td,r) = 0;
iom0(im,i_td,r) = 0;


* Set oil/gas input to refining/ngd as a fixed share input

io0_ff(i_oil,i_refine,r) = io0(i_oil,i_refine,r);
iom0_ff(i_oil,i_refine,r) = iom0(i_oil,i_refine,r);
io0(i_oil,i_refine,r) = 0;
iom0(i_oil,i_refine,r) = 0;

io0_ff(i_gas,i_ngd,r) = io0(i_gas,i_ngd,r);
iom0_ff(i_gas,i_ngd,r) = iom0(i_gas,i_ngd,r);
io0(i_gas,i_ngd,r) = 0;
iom0(i_gas,i_ngd,r) = 0;


io0_ff(i_gas,i_gas,r) = io0(i_gas,i_gas,r);
iom0_ff(i_gas,i_gas,r) = iom0(i_gas,i_gas,r);
io0(i_gas,i_gas,r) = 0;
iom0(i_gas,i_gas,r) = 0;
$offtext

ff0(i,r) = sum(ii,io0_ff(ii,i,r)+iom0_ff(ii,i,r));
cost_f0(i,r)$(ff0(i,r) gt 0) = sum(ii,pio0(ii,i,r)*(io0_ff(ii,i,r)+iom0_ff(ii,i,r))/ff0(i,r));

display
ff0
;

* Energy and Material Composites


parameters
ee10(*,*)
cost_e10(*,*)
io_ie10(*,*,*)
alphae10(*,*,*)
gammae1(*,*)

ee20(*,*)
cost_e20(*,*)
io_ie20(*,*,*)
alphae20(*,*,*)
gammae2(*,*)
;

ee10(i,r) = sum(ie1,(IOM0(ie1,i,r)+IO0(ie1,i,r)));
io_ie10(ie1,i,r)$(y0(i,r) gt 0 and ee10(i,r) gt 0) = (IOM0(ie1,i,r)+IO0(ie1,i,r)) / ee10(i,r);
cost_e10(i,r)$(y0(i,r) gt 0 and ee10(i,r) gt 0)  = sum(ie1,pio0(ie1,i,r)*io_ie10(ie1,i,r));

io_ie10(ie1,i,r)$(y0(i,r) = 0 or ee10(i,r) = 0) = 0;
cost_e10(i,r)$(y0(i,r) = 0 or ee10(i,r) = 0) = 1;


alphae10(ie1,i,r)$(ee10(i,r) gt 0) = (pio0(ie1,i,r)/cost_e10(i,r))*(io_ie10(ie1,i,r))**(1/sig_e1(i,r));
gammae1(i,r)$(ee10(i,r) gt 0) = sum(ie1,alphae10(ie1,i,r));
alphae10(ie1,i,r)$(ee10(i,r) gt 0) = alphae10(ie1,i,r)/gammae1(i,r);

ee20(i,r) = sum(ie2,(IOM0(ie2,i,r)+IO0(ie2,i,r)));
io_ie20(ie2,i,r)$(y0(i,r) gt 0 and ee20(i,r) gt 0) = (IOM0(ie2,i,r)+IO0(ie2,i,r)) / ee20(i,r);
cost_e20(i,r)$(y0(i,r) gt 0 and ee20(i,r) gt 0)  = sum(ie2,pio0(ie2,i,r)*io_ie20(ie2,i,r));

io_ie20(ie2,i,r)$(y0(i,r) = 0 or ee20(i,r) = 0) = 0;
cost_e20(i,r)$(y0(i,r) = 0 or ee20(i,r) = 0) = 1;


alphae20(ie2,i,r)$(ee20(i,r) gt 0) = (pio0(ie2,i,r)/cost_e20(i,r))*(io_ie20(ie2,i,r))**(1/sig_e2(i,r));
gammae2(i,r)$(ee20(i,r) gt 0) = sum(ie2,alphae20(ie2,i,r));
alphae20(ie2,i,r)$(ee20(i,r) gt 0) = alphae20(ie2,i,r)/gammae2(i,r);



parameters
ee0(*,*)
cost_e0(*,*)
io_e1e0(*,*)
io_e2e0(*,*)
alphae_e10(*,*)
alphae_e20(*,*)
gammae(*,*)

mm0(*,*)
cost_m0(*,*)
io_im0(*,*,*)
alpham(*,*,*)
gammam(*,*)
;


ee0(i,r) = ee10(i,r) + ee20(i,r);
io_e1e0(i,r)$(y0(i,r) gt 0 and ee0(i,r) gt 0) = ee10(i,r) / ee0(i,r);
io_e2e0(i,r)$(y0(i,r) gt 0 and ee0(i,r) gt 0) = ee20(i,r) / ee0(i,r);

cost_e0(i,r)$(y0(i,r) gt 0 and ee0(i,r) gt 0)  = cost_e10(i,r)*io_e1e0(i,r) + cost_e20(i,r)*io_e2e0(i,r); ;

io_e1e0(i,r)$(y0(i,r) = 0 or ee0(i,r) = 0) = 0;
io_e2e0(i,r)$(y0(i,r) = 0 or ee0(i,r) = 0) = 0;
cost_e0(i,r)$(y0(i,r) = 0 or ee0(i,r) = 0) = 1;




alphae_e10(i,r)$(ee0(i,r) gt 0) = (cost_e10(i,r)/cost_e0(i,r))*(io_e1e0(i,r))**(1/sig_e(i,r));
alphae_e20(i,r)$(ee0(i,r) gt 0) = (cost_e20(i,r)/cost_e0(i,r))*(io_e2e0(i,r))**(1/sig_e(i,r));
gammae(i,r)$(ee0(i,r) gt 0) = alphae_e10(i,r) + alphae_e20(i,r);
alphae_e10(i,r)$(ee0(i,r) gt 0) = alphae_e10(i,r)/gammae(i,r);
alphae_e20(i,r)$(ee0(i,r) gt 0) = alphae_e20(i,r)/gammae(i,r);

alphae_e10(i,r)$(ee10(i,r) = 0 and ee0(i,r) gt 0) = 0;
alphae_e20(i,r)$(ee10(i,r) = 0 and ee0(i,r) gt 0) = 1;
alphae_e10(i,r)$(ee20(i,r) = 0 and ee0(i,r) gt 0) = 1;
alphae_e20(i,r)$(ee20(i,r) = 0 and ee0(i,r) gt 0) = 0;

alphae_e10(i,r)$(ee0(i,r) = 0) = 0;
alphae_e20(i,r)$(ee0(i,r) = 0) = 0;


display
ee10
ee20
ee0
io_ie20
io_e1e0
io_e2e0
;


mm0(i,r) = sum(imm,(IOM0(imm,i,r)+IO0(imm,i,r)));
io_im0(im,i,r)$(y0(i,r) gt 0  and mm0(i,r) gt 0) = (IOM0(im,i,r)+IO0(im,i,r)) / mm0(i,r);
cost_m0(i,r)$(y0(i,r) gt 0 and mm0(i,r) gt 0)  = sum(im,pio0(im,i,r)*io_im0(im,i,r));

io_im0(im,i,r)$(y0(i,r) = 0 or mm0(i,r) = 0) = 0;
cost_m0(i,r)$(y0(i,r) = 0 or mm0(i,r) = 0) = 1;

alpham(im,i,r)$(mm0(i,r) gt 0) = (pio0(im,i,r)/cost_m0(i,r))*(io_im0(im,i,r))**(1/sig_m(i,r));
gammam(i,r)$(mm0(i,r) gt 0) = sum(im,alpham(im,i,r));
alpham(im,i,r)$(mm0(i,r) gt 0) = alpham(im,i,r)/gammam(i,r);

* Intermediate Input Composite VV(E,M)

parameters
vv0(*,*)
io_ev0(*,*)
io_mv0(*,*)
cost_v0(*,*)
alphav_e0(*,*)
alphav_m0(*,*)
gammav(*,*)
;


vv0(i,r) = ee0(i,r) + mm0(i,r);
io_ev0(i,r)$(y0(i,r) gt 0 and vv0(i,r) gt 0) = ee0(i,r)/vv0(i,r);
io_mv0(i,r)$(y0(i,r) gt 0 and vv0(i,r) gt 0) = mm0(i,r)/vv0(i,r);


io_ev0(i,r)$(y0(i,r) = 0 or vv0(i,r) = 0) = 0;
io_mv0(i,r)$(y0(i,r) = 0 or vv0(i,r) = 0) = 0;



cost_v0(i,r) = cost_e0(i,r)*io_ev0(i,r) + cost_m0(i,r)*io_mv0(i,r);

alphav_e0(i,r)$(ee0(i,r) gt 0 and mm0(i,r) gt 0) = (cost_e0(i,r)/cost_v0(i,r))*(io_ev0(i,r))**(1/sig_v(i,r));
alphav_m0(i,r)$(ee0(i,r) gt 0 and mm0(i,r) gt 0) = (cost_m0(i,r)/cost_v0(i,r))*(io_mv0(i,r))**(1/sig_v(i,r));

alphav_e0(i,r)$(ee0(i,r) = 0 and vv0(i,r) gt 0) = 0;
alphav_m0(i,r)$(ee0(i,r) = 0 and vv0(i,r) gt 0) = 1;
alphav_e0(i,r)$(mm0(i,r) = 0 and vv0(i,r) gt 0) = 1;
alphav_m0(i,r)$(mm0(i,r) = 0 and vv0(i,r) gt 0) = 0;

gammav(i,r)$(vv0(i,r) gt 0) = alphav_e0(i,r)+alphav_m0(i,r);
alphav_e0(i,r)$(vv0(i,r) gt 0) = alphav_e0(i,r)/gammav(i,r);
alphav_m0(i,r)$(vv0(i,r) gt 0) = alphav_m0(i,r)/gammav(i,r);

alphav_e0(i,r)$(vv0(i,r) = 0) = 1/2;
alphav_m0(i,r)$(vv0(i,r) = 0) = 1/2;



* Labor - Intermediate Input Composite WW(L,VV)

parameters
cost_l0(*,*)
ww0(*,*)
io_lw0(*,*)
io_vw0(*,*)
cost_w0(*,*)
alphaw_l0(*,*)
alphaw_v0(*,*)
gammaw0(*,*)
xkinc0(*,*)
;

cost_l0(i,r) = 1+tau_p0;


ww0(i,r) = l0(i,r) + vv0(i,r);
io_lw0(i,r)$(y0(i,r) gt 0) = l0(i,r)/ww0(i,r);
io_vw0(i,r)$(y0(i,r) gt 0) = vv0(i,r)/ww0(i,r);
cost_w0(i,r) = cost_l0(i,r)*io_lw0(i,r) + cost_v0(i,r)*io_vw0(i,r);

alphaw_l0(i,r)$(vv0(i,r) gt 0) = (cost_l0(i,r)/cost_w0(i,r))*(io_lw0(i,r))**(1/sig_w(i,r));
alphaw_v0(i,r)$(vv0(i,r) gt 0) = (cost_v0(i,r)/cost_w0(i,r))*(io_vw0(i,r))**(1/sig_w(i,r));

alphaw_l0(i,r)$(vv0(i,r) = 0) = 1;
alphaw_v0(i,r)$(vv0(i,r) = 0) = 0;

gammaw0(i,r) = alphaw_l0(i,r)+alphaw_v0(i,r);
alphaw_l0(i,r) = alphaw_l0(i,r)/gammaw0(i,r);
alphaw_v0(i,r) = alphaw_v0(i,r)/gammaw0(i,r);

display
cost_e0
cost_m0
cost_v0
cost_w0
cost_f0
ee0
mm0
vv0
ww0
ff0
;



* Non-fossil fuel producers

* Capital - Variable Inputs  XX(K,WW)

parameters
yg0(*,*)
pr0(*,*)
cost_k0(*,*)
f_k0(*,*)
xx0(*,*)
io_wx0(*,*)
cost_x0(*,*)
alphax_k0(*,*)
alphax_w0(*,*)
gammax0(*,*)

;

pr0(i_nf,r)$(nr0(i_nf,r) = 0) = 1;
pr0(i_nf,r)$(nr0(i_nf,r) gt 0) = nrp0(i_nf,r)/nr0(i_nf,r);
xkinc0(i_nf,r) = y0(i_nf,r)*(1-tau_y0(i_nf,r)) - cost_w0(i_nf,r)*ww0(i_nf,r) - cost_f0(i_nf,r)*ff0(i_nf,r) - nrp0(i_nf,r);
cost_k0(i_nf,r)$(y0(i_nf,r) gt 0)  = (xkinc0(i_nf,r))/k0(i_nf,r);


xx0(i_nf,r) = k0(i_nf,r) + ww0(i_nf,r);
yg0(i_nf,r) = y0(i_nf,r) + acexp0(i_nf,r);


io_wx0(i_nf,r)$(xx0(i_nf,r) gt 0) = ww0(i_nf,r)/xx0(i_nf,r);
*io_wx0(i_nf,r)$(xx0(i_nf,r) = 0 and yg0(i_nf,r) gt 0) = ww0(i_nf,r)/yg0(i_nf,r);
io_wx0(i_nf,r)$(xx0(i_nf,r) = 0) = 0;


cost_x0(i_nf,r)$((nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) and xx0(i_nf,r) gt 0) = cost_k0(i_nf,r)*(k0(i_nf,r)/xx0(i_nf,r)) + cost_w0(i_nf,r)*(io_wx0(i_nf,r));
cost_x0(i_nf,r)$(nr0(i_nf,r) = 0 and ff0(i_nf,r) = 0  and xx0(i_nf,r) gt 0 and yg0(i_nf,r) gt 0) = cost_k0(i_nf,r)*(k0(i_nf,r)/yg0(i_nf,r)) + cost_w0(i_nf,r)*(ww0(i_nf,r)/yg0(i_nf,r));
cost_x0(i_nf,r)$(nr0(i_nf,r) = 0 and ff0(i_nf,r) = 0  and xx0(i_nf,r) = 0 and yg0(i_nf,r) = 0 ) = 0;


alphax_k0(i_nf,r)$((nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) and xx0(i_nf,r) gt 0) = (cost_k0(i_nf,r)/(cost_x0(i_nf,r)))*(k0(i_nf,r)/(xx0(i_nf,r)))**(1/sig_x(i_nf,r));
alphax_w0(i_nf,r)$((nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) and xx0(i_nf,r) gt 0) = (cost_w0(i_nf,r)/(cost_x0(i_nf,r)))*(ww0(i_nf,r)/(xx0(i_nf,r)))**(1/sig_x(i_nf,r));


alphax_k0(i_nf,r)$(nr0(i_nf,r) = 0 and ff0(i_nf,r) = 0 and xx0(i_nf,r) gt 0 and yg0(i_nf,r) gt 0) = (cost_k0(i_nf,r)/(cost_x0(i_nf,r)))*(k0(i_nf,r)/(yg0(i_nf,r)))**(1/sig_x(i_nf,r));
alphax_w0(i_nf,r)$(nr0(i_nf,r) = 0 and ff0(i_nf,r) = 0 and xx0(i_nf,r) gt 0 and yg0(i_nf,r) gt 0) = (cost_w0(i_nf,r)/(cost_x0(i_nf,r)))*(ww0(i_nf,r)/(yg0(i_nf,r)))**(1/sig_x(i_nf,r));

alphax_k0(i_nf,r)$(nr0(i_nf,r) = 0 and ff0(i_nf,r) = 0  and xx0(i_nf,r) = 0 and yg0(i_nf,r) = 0 ) = 0;
alphax_w0(i_nf,r)$(nr0(i_nf,r) = 0 and ff0(i_nf,r) = 0  and xx0(i_nf,r) = 0 and yg0(i_nf,r) = 0 ) = 0;



gammax0(i_nf,r) = alphax_k0(i_nf,r)+alphax_w0(i_nf,r);
alphax_k0(i_nf,r)$(gammax0(i_nf,r) gt 0) = alphax_k0(i_nf,r)/gammax0(i_nf,r);
alphax_k0(i_nf,r)$(gammax0(i_nf,r) = 0) = 0;

alphax_w0(i_nf,r)$(gammax0(i_nf,r) gt 0) = alphax_w0(i_nf,r)/gammax0(i_nf,r);
alphax_w0(i_nf,r)$(gammax0(i_nf,r) = 0) = 0;


F_K0(i_nf,r)$(K0(i_nf,r) gt 0) = (LAMBDAK0(i_nf,r)*(rbar0+delta)  )/((cost_x0(i_nf,r))*(1-tau_k0-tau_kr0(r)));



display
gammax0
alphax_k0
alphax_w0
cost_k0
cost_x0
f_k0
xkinc0
nr0
ff0
xx0
yg0
k0
gos0
;


* Fixed Share Inputs - ZZ(FF,XX)

parameters
zz0(*,*)
cost_z0(*,*)
gammaz(*,*)
alphaz_f(*,*)
alphaz_x(*,*)
;

zz0(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = ff0(i_nf,r) + xx0(i_nf,r);
gammaz(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = zz0(i_nf,r)/(ff0(i_nf,r)+xx0(i_nf,r));

alphaz_f(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = ff0(i_nf,r)/zz0(i_nf,r);
alphaz_x(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = xx0(i_nf,r)/zz0(i_nf,r);

cost_z0(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = (alphaz_f(i_nf,r)*cost_f0(i_nf,r) + alphaz_x(i_nf,r)*cost_x0(i_nf,r))/gammaz(i_nf,r);

display
zz0
cost_z0
alphaz_f
gammaz
;

* Natural Resources - Non-Resource Specific Inputs YG(R,ZZ)

parameters
io_ry0(*,*)
io_zy0(*,*)
alphay_z0(*,*)
alphay_r0(*,*)
gammay0(*,*)
cost_y0(*,*)
f_z0(*,*)
eta_nr(*,*)
;


io_ry0(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = nr0(i_nf,r)/yg0(i_nf,r);
io_zy0(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = zz0(i_nf,r)/yg0(i_nf,r);
cost_y0(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = cost_z0(i_nf,r)*io_zy0(i_nf,r) + pr0(i_nf,r)*io_ry0(i_nf,r);
cost_y0(i_nf,r)$(nr0(i_nf,r) = 0 and ff0(i_nf,r) = 0) = (1-tau_y0(i_nf,r));

alphay_z0(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = (cost_z0(i_nf,r)/cost_y0(i_nf,r))*(zz0(i_nf,r)/yg0(i_nf,r))**(1/sig_r(i_nf,r));
alphay_r0(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = (pr0(i_nf,r)/cost_y0(i_nf,r))*(nr0(i_nf,r)/yg0(i_nf,r))**(1/sig_r(i_nf,r));


gammay0(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = alphay_z0(i_nf,r)+alphay_r0(i_nf,r);
alphay_z0(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = alphay_z0(i_nf,r)/gammay0(i_nf,r);
alphay_r0(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = alphay_r0(i_nf,r)/gammay0(i_nf,r);

f_z0(i_nf,r)$(nr0(i_nf,r) gt 0) = (gammay0(i_nf,r)**(1/rho_r(i_nf,r)))*((alphay_z0(i_nf,r))*zz0(i_nf,r)**(rho_r(i_nf,r)-1))*(alphay_z0(i_nf,r)*zz0(i_nf,r)**rho_r(i_nf,r) + (alphay_r0(i_nf,r))*nr0(i_nf,r)**rho_r(i_nf,r))**((1-rho_r(i_nf,r))/rho_r(i_nf,r)) ;
f_z0(i_nf,r)$(nr0(i_nf,r) = 0 and ff0(i_nf,r) gt 0) = (gammay0(i_nf,r)**(1/rho_r(i_nf,r)))*((alphay_z0(i_nf,r))*zz0(i_nf,r)**(rho_r(i_nf,r)-1))*(alphay_z0(i_nf,r)*zz0(i_nf,r)**rho_r(i_nf,r) )**((1-rho_r(i_nf,r))/rho_r(i_nf,r)) ;

eta_nr(i_nf,r)$(nr0(i_nf,r) gt 0) = sig_r(i_nf,r)*(alphay_z0(i_nf,r)/alphay_r0(i_nf,r));



* Fossil fuel producers

parameters
io_ky0(*,*)
alphay_k0(*,*)
;



pr0(i_ff,r)$(y0(i_ff,r) > 0) = nrp0(i_ff,r)/nr0(i_ff,r);
xkinc0(i_ff,r) = y0(i_ff,r)*(1-tau_y0(i_ff,r)) - cost_w0(i_ff,r)*ww0(i_ff,r) - cost_f0(i_ff,r)*ff0(i_ff,r) - nrp0(i_ff,r);
cost_k0(i_ff,r)$(y0(i_ff,r) > 0) = (xkinc0(i_ff,r))/k0(i_ff,r);

xx0(i_ff,r) = ww0(i_ff,r);
io_wx0(i_ff,r) = 1;
cost_x0(i_ff,r) = cost_w0(i_ff,r);
zz0(i_ff,r) = ff0(i_ff,r) + xx0(i_ff,r);
yg0(i_ff,r) = y0(i_ff,r) + acexp0(i_ff,r);

gammaz(i_ff,r)$(y0(i_ff,r) > 0) = zz0(i_ff,r)/(ff0(i_ff,r)+xx0(i_ff,r));

alphaz_f(i_ff,r)$(y0(i_ff,r) > 0) = ff0(i_ff,r)/zz0(i_ff,r);
alphaz_x(i_ff,r)$(y0(i_ff,r) > 0)= xx0(i_ff,r)/zz0(i_ff,r);

cost_z0(i_ff,r)$(y0(i_ff,r) > 0) = (alphaz_f(i_ff,r)*cost_f0(i_ff,r) + alphaz_x(i_ff,r)*cost_x0(i_ff,r))/gammaz(i_ff,r);

io_ky0(i_ff,r)$(y0(i_ff,r) > 0) = k0(i_ff,r)/yg0(i_ff,r);
io_ry0(i_ff,r)$(y0(i_ff,r) > 0) = nr0(i_ff,r)/yg0(i_ff,r);
io_zy0(i_ff,r)$(y0(i_ff,r) > 0) = zz0(i_ff,r)/yg0(i_ff,r);
cost_y0(i_ff,r)$(y0(i_ff,r) > 0) = cost_k0(i_ff,r)*io_ky0(i_ff,r) + cost_z0(i_ff,r)*io_zy0(i_ff,r) + pr0(i_ff,r)*io_ry0(i_ff,r);

alphay_k0(i_ff,r)$(y0(i_ff,r) > 0) = (cost_k0(i_ff,r)/cost_y0(i_ff,r))*(k0(i_ff,r)/yg0(i_ff,r))**(1/sig_r(i_ff,r));
alphay_z0(i_ff,r)$(y0(i_ff,r) > 0) = (cost_z0(i_ff,r)/cost_y0(i_ff,r))*(zz0(i_ff,r)/yg0(i_ff,r))**(1/sig_r(i_ff,r));
alphay_r0(i_ff,r)$(y0(i_ff,r) > 0) = (pr0(i_ff,r)/cost_y0(i_ff,r))*(nr0(i_ff,r)/yg0(i_ff,r))**(1/sig_r(i_ff,r));

gammay0(i_ff,r)$(y0(i_ff,r) > 0) = alphay_k0(i_ff,r) + alphay_z0(i_ff,r) + alphay_r0(i_ff,r);
alphay_k0(i_ff,r)$(y0(i_ff,r) > 0) = alphay_k0(i_ff,r)/gammay0(i_ff,r);
alphay_z0(i_ff,r)$(y0(i_ff,r) > 0) = alphay_z0(i_ff,r)/gammay0(i_ff,r);
alphay_r0(i_ff,r)$(y0(i_ff,r) > 0) = alphay_r0(i_ff,r)/gammay0(i_ff,r);

eta_nr(i_ff,r)$(y0(i_ff,r) > 0) = sig_r(i_ff,r)*((alphay_z0(i_ff,r)+alphay_k0(i_ff,r))/alphay_r0(i_ff,r));

F_K0(i_ff,r)$(y0(i_ff,r) gt 0) = (LAMBDAK0(i_ff,r)*(rbar0+delta)  )/((1-tau_y0(i_ff,r))*(1-tau_k0-tau_kr0(r)));
f_z0(i_ff,r)$(y0(i_ff,r) > 0) = (gammay0(i_ff,r)**(1/rho_r(i_ff,r)))*((alphay_z0(i_ff,r))*zz0(i_ff,r)**(rho_r(i_ff,r)-1))*(alphay_k0(i_ff,r)*k0(i_ff,r)**rho_r(i_ff,r) + alphay_z0(i_ff,r)*zz0(i_ff,r)**rho_r(i_ff,r) + (alphay_r0(i_ff,r))*nr0(i_ff,r)**rho_r(i_ff,r))**((1-rho_r(i_ff,r))/rho_r(i_ff,r)) ;


display
cost_k0
cost_z0
cost_y0
tau_y0
alphay_r0
alphay_z0
eta_nr
nr0
pr0
;





* Elasticity of Transformation

parameter
alphay_dr0(*,*)
alphay_dn0(*,*)
alphay_f0(*,*)
alphay_m0(*,*)
alphay_e0(*,*)
py0(*,*)
;



alphay_dr0(i,r)$(y0(i,r) gt 0) = (g0_dr(i,r))/(y0(i,r)+gy_reg0(i,r)+gy_fed0(i,r));
alphay_dn0(i,r)$(y0(i,r) gt 0) = EXD0(i,r)/(y0(i,r)+gy_reg0(i,r)+gy_fed0(i,r));
alphay_f0(i,r)$(y0(i,r) gt 0) = EX0(i,r)/(y0(i,r)+gy_reg0(i,r)+gy_fed0(i,r));
alphay_m0(i,r)$(y0(i,r) gt 0) = my0(i,r)/(y0(i,r)+gy_reg0(i,r)+gy_fed0(i,r));
alphay_e0(i,r) = 0;

py0(i,r) = alphay_dr0(i,r) + alphay_dn0(i,r) + alphay_f0(i,r) + alphay_m0(i,r);

py0(i,r)$(not i_td(i)) = alphay_dr0(i,r) + alphay_dn0(i,r) + alphay_f0(i,r) + alphay_m0(i,r);

alphay_dr0(i_td,r) = (g0_dr(i_td,r))/(y0(i_td,r)+gy_reg0(i_td,r)+gy_fed0(i_td,r));
alphay_dn0(i_td,r) = 0;
alphay_f0(i_td,r) = 0;
alphay_m0(i_td,r) = 0;
alphay_e0(i_td,r) = EXD0(i_td,r)/(y0(i_td,r)+gy_reg0(i_td,r)+gy_fed0(i_td,r));
*alphay_e0(i_td,r) = exd0(i_td,r)/y0(i_td,r);
py0(i_td,r) = alphay_dr0(i_td,r) + alphay_e0(i_td,r);
* + alphay_e0(i_td,r);

display
alphay_dr0
alphay_dn0
alphay_f0
alphay_m0
py0
g0_dn
exd0
;




* Consumer Demand


alias(j,jj)

parameter
gmaxg(i,j,r)
gmax0(i,j,r)
gmaxp(i,j,r)
CG0(j,r)
cp0(j,r)
phat0(*,*)
gmax_c_db
gmax_pce_db
;

gmax00(i,j_fueloil) = 0;
gmaxg(i,j,r)$(sum(jj,gmax00(i,jj)) gt 0) = (gmax00(i,j)/sum(jj,gmax00(i,jj)))*pce0(i,r);

display gmax00
gmaxg
;

gmaxg('i20','j2',r) = pce0('i20',r);
gmaxg(i_refine,j_fueloil,r) = seds_ex0('ref','res',r)/(1+sum(margins,pce0_mr(i_refine,margins,r)));
gmaxg(i_refine,j_mvf,r) = trans_res_share*seds_ex0('ref','trans',r)/(1+sum(margins,pce0_mr(i_refine,margins,r))) ;

gmaxg(i_td,'j16',r) = seds_ex0('elec','res',r)/(1+sum(margins,pce0_mr(i_td,margins,r))) ;
gmaxg(i_td,'j25',r) = seds_ex0('elec','trans',r)/(1+sum(margins,pce0_mr(i_td,margins,r))) ;

gmax0(i,j,r) = gmaxg(i,j,r)*(1+sum(margins,pce0_mr(i,margins,r)));


loop(j,
gmaxp(i,j,r) = (gmax0(i,j,r))/sum(ii,gmax0(ii,j,r));
);

gmax_pce_db(i,r) = sum(j,gmaxg(i,j,r))-pce0(i,r);
gmax_c_db(i,r) = sum(j,gmax0(i,j,r)) - c0(i,r);

cg0(j,r) = sum(i,gmax0(i,j,r));
phat0(i,r) = 1;
cp0(j,r) = sum(i,gmaxp(i,j,r)*phat0(i,r));

display
pce0
gmax0
gmax_pce_db
gmax_c_db
gmaxg
;


* Consumption Nesting


parameters
cv0(*,*)
c_cv0(*,*,*)
cpv0(*,*)
cumlot0(*,*)
cv_cumlot0(*,*,*)
cpumlot0(*,*)
ctilde0(*,*)
cumlot_ctilde0(*,*,*)
cptilde0(*,*)
chat0(*,*)
ctilde_chat0(*,*,*)
cphat0(*,*)
chat_cbar0(*,*)
pbar0(*)
alphacbar(*,*)
gammacbar(*)
alphac(*,*,*)
gammac(*,*)
alphact0(*,*,*)
gammact(*,*)
alphacu0(*,*,*)
gammacu(*,*)
alphacv0(*,*,*)
gammacv(*,*)
;


cv0(cjv,r) = sum(j,cmapv(j,cjv)*cg0(j,r));
c_cv0(j,cjv,r) = (cmapv(j,cjv)*cg0(j,r))/cv0(cjv,r);
cpv0(cjv,r) = sum(j,cmapv(j,cjv)*cp0(j,r)*c_cv0(j,cjv,r));

cumlot0(cju,r) = sum(cjv,cmapu(cjv,cju)*cv0(cjv,r));
cv_cumlot0(cjv,cju,r) = (cmapu(cjv,cju)*cv0(cjv,r))/cumlot0(cju,r);
cpumlot0(cju,r) = sum(cjv,cmapu(cjv,cju)*cpv0(cjv,r)*cv_cumlot0(cjv,cju,r));


ctilde0(cjt,r) = sum(cju,cmapt(cju,cjt)*cumlot0(cju,r));
cumlot_ctilde0(cju,cjt,r) = (cmapt(cju,cjt)*cumlot0(cju,r))/ctilde0(cjt,r);
cptilde0(cjt,r) = sum(cju,cmapt(cju,cjt)*cpumlot0(cju,r)*cumlot_ctilde0(cju,cjt,r));

chat0(cj,r) = sum(cjt,cmap(cjt,cj)*ctilde0(cjt,r));
ctilde_chat0(cjt,cj,r) = (cmap(cjt,cj)*ctilde0(cjt,r))/chat0(cj,r);
cphat0(cj,r) = sum(cjt,cmap(cjt,cj)*cptilde0(cjt,r)*ctilde_chat0(cjt,cj,r));


chat_cbar0(cj,r) = chat0(cj,r)/cbar0(r);
pbar0(r) = sum(cj,cphat0(cj,r)*chat_cbar0(cj,r));

alphacv0(j,cjv,r)$(c_cv0(j,cjv,r) > 0) = (cp0(j,r)/cpv0(cjv,r))*c_cv0(j,cjv,r)**(1/sig_cv(cjv));
gammacv(cjv,r) = sum(j,alphacv0(j,cjv,r));
alphacv0(j,cjv,r)$(gammacv(cjv,r) > 0) = alphacv0(j,cjv,r)/gammacv(cjv,r);

alphacu0(cjv,cju,r)$(cv_cumlot0(cjv,cju,r) > 0) = (cpv0(cjv,r)/cpumlot0(cju,r))*cv_cumlot0(cjv,cju,r)**(1/sig_cu(cju));
gammacu(cju,r) = sum(cjv,alphacu0(cjv,cju,r));
alphacu0(cjv,cju,r)$(gammacu(cju,r) > 0) = alphacu0(cjv,cju,r)/gammacu(cju,r);

alphact0(cju,cjt,r)$(cumlot_ctilde0(cju,cjt,r) > 0) = (cpumlot0(cju,r)/cptilde0(cjt,r))*cumlot_ctilde0(cju,cjt,r)**(1/sig_ct(cjt));
gammact(cjt,r) = sum(cju,alphact0(cju,cjt,r));
alphact0(cju,cjt,r)$(gammact(cjt,r) > 0) = alphact0(cju,cjt,r)/gammact(cjt,r);

alphac(cjt,cj,r)$(ctilde_chat0(cjt,cj,r) > 0) = (cptilde0(cjt,r)/cphat0(cj,r))*ctilde_chat0(cjt,cj,r)**(1/sig_c(cj));
gammac(cj,r) = sum(cjt,alphac(cjt,cj,r));
alphac(cjt,cj,r)$(gammac(cj,r) > 0) = alphac(cjt,cj,r)/gammac(cj,r);

alphacbar(cj,r)$(chat_cbar0(cj,r) > 0) = (cphat0(cj,r)/pbar0(r))*chat_cbar0(cj,r)**(1/sig_cbar);
gammacbar(r) = sum(cj,alphacbar(cj,r));
alphacbar(cj,r)$(gammacbar(r) > 0) = alphacbar(cj,r)/gammacbar(r);

display

cv0
c_cv0
cpv0

cumlot0
cv_cumlot0
cpumlot0


ctilde0
cumlot_ctilde0
cptilde0

chat0
ctilde_chat0
cphat0
;

parameters
pcbar0(*)
pcbar_db(*)
wbar0(*)
;


wbar0(r) = 1 - tau_l0 - tau_lr0(r);

pcbar0(r) = sum(cj,cphat0(cj,r)*chat0(cj,r));
pcbar_db(r) = sum(i,phat0(i,r)*c0(i,r));

display
cbar0
pbar0
pcbar0
pcbar_db
;



parameter
leis0(*)
ht_d(*)
uterm(*)
eta(*)
alpha_leis(*)
cfull0(*)
cfull0_cap(*)
lambda0(*)
pvwealth0(*)
elas_inc(*)
elas_ls_comp(*)
elas_ls_uncomp(*)
elas_ls_frisch(*)
;

*hhtot(r) = 132;

ht_d(r) = LS0(r)/w_l;
leis0(r) = ht_d(r) - LS0(r);
uterm(r) = 1 + (leis0(r)/hhtot(r))/((pbar0(r)/wbar0(r))*((pcbar0(r)/pbar0(r))/hhtot(r)));
eta(r) = (elas_ls*(w_l/(1-w_l)))*uterm(r);
alpha_leis(r) = ((pbar0(r)/(wbar0(r)))**(-eta(r)))*(leis0(r)/hhtot(r))/((pcbar0(r)/pbar0(r))/hhtot(r));
cfull0(r) = ( (pcbar0(r)/pbar0(r))**((eta(r)-1)/eta(r)) + (alpha_leis(r)**(1/eta(r)))*((leis0(r))**((eta(r)-1)/eta(r))) )**(eta(r)/(eta(r)-1));
cfull0_cap(r) =  ( ((pcbar0(r)/pbar0(r))/hhtot(r))**((eta(r)-1)/eta(r)) + (alpha_leis(r)**(1/eta(r)))*((leis0(r)/hhtot(r))**((eta(r)-1)/eta(r))) )**(eta(r)/(eta(r)-1));

lambda0(r)= (cfull0_cap(r)**(-(1-(1-sigma))))*((uterm(r)**(1/(eta(r)-1))))/pbar0(r);
pvwealth0(r) = (pcbar0(r) + wbar0(r)*leis0(r))/(1-(1/(1+rbar0)));



elas_inc(r) = ((uterm(r)-1)/uterm(r));
elas_ls_comp(r) = (eta(r)/uterm(r))/(w_l/(1-w_l));
elas_ls_uncomp(r) = elas_ls_comp(r) - ((uterm(r)-1)/uterm(r));
elas_ls_frisch(r) = elas_ls_comp(r) + (((uterm(r)-1)/uterm(r))/(sigma))/(w_l/(1-w_l)) ;


display
elas_inc
elas_ls_comp
elas_ls_uncomp
elas_ls_frisch
lambda0
hhtot
;




* ------------------------------------------------------------------------------
* Step 9: Debug
* ------------------------------------------------------------------------------


parameter
yg_db
zz_db
xx_db
ff_db
ww_db
f_k_db
f_z_db
f_r_db
zpc_db
c_db
cbar_db
leis_db
py_db
pg_db
pd_db
pc_db
pi_db
pgf_db
pgr_db
pio_db
pm_db
cost_e_db
cost_m_db
cost_v_db
cost_x_db
bc0_db
xkinc_db
fv_k0
fv_kdep0
v_db2
g_dn_db
cpv_db
cpumlot_db
cphat_db
cptilde_db
c_cv_db
cv_cumlot_db
cumlot_ctilde_db
ctilde_chat_db
chat_cbar_db
cg_db
cp_db
;


fv_k0(ii,rr) = (1-tau_k0-tau_kr0(rr))*(cost_x0(ii,rr)*f_k0(ii,rr));
fv_kdep0(ii,rr) = (tau_k0+tau_kr0(rr))*deltat ;
v_db2(ii,rr) = k0(ii,rr)*fv_k0(ii,rr)/(rbar0+delta) + dd0(rr)*kdep0(ii,rr);

yg_db(i_nf,r)$(nr0(i_nf,r) = 0 and ff0(i_nf,r) = 0 and gammax0(i_nf,r) gt 0 and alphax_k0(i_nf,r) = 0 and alphax_w0(i_nf,r) = 0) = 0;
ww_db(i_nf,r)$(nr0(i_nf,r) = 0 and ff0(i_nf,r) = 0 and gammax0(i_nf,r) gt 0 and alphax_k0(i_nf,r) = 0 and alphax_w0(i_nf,r) = 0) = 0;


yg_db(i_nf,r)$(nr0(i_nf,r) = 0 and ff0(i_nf,r) = 0 and gammax0(i_nf,r) gt 0 and alphax_k0(i_nf,r) gt 0 and alphax_w0(i_nf,r) gt 0) = (gammax0(i_nf,r)**(1/rho_x(i_nf,r)))*(alphax_k0(i_nf,r)*k0(i_nf,r)**rho_x(i_nf,r) + alphax_w0(i_nf,r)*ww0(i_nf,r)**rho_x(i_nf,r))**(1/rho_x(i_nf,r)) - yg0(i_nf,r);
ww_db(i_nf,r)$(nr0(i_nf,r) = 0 and ff0(i_nf,r) = 0 and gammax0(i_nf,r) gt 0 and alphax_k0(i_nf,r) gt 0 and alphax_w0(i_nf,r) gt 0) = (1-tau_y0(i_nf,r))*(gammax0(i_nf,r)**(1/rho_x(i_nf,r)))*(alphax_w0(i_nf,r)*ww0(i_nf,r)**(rho_x(i_nf,r)-1))*(alphax_k0(i_nf,r)*k0(i_nf,r)**rho_x(i_nf,r) + alphax_w0(i_nf,r)*ww0(i_nf,r)**rho_x(i_nf,r))**((1-rho_x(i_nf,r))/rho_x(i_nf,r)) - cost_w0(i_nf,r) ;



yg_db(i_nf,r)$(nr0(i_nf,r) gt 0) = (gammay0(i_nf,r)**(1/rho_r(i_nf,r)))*(alphay_z0(i_nf,r)*zz0(i_nf,r)**rho_r(i_nf,r) + alphay_r0(i_nf,r)*nr0(i_nf,r)**rho_r(i_nf,r))**(1/rho_r(i_nf,r)) - yg0(i_nf,r);
yg_db(i_nf,r)$(nr0(i_nf,r) = 0 and ff0(i_nf,r) gt 0) = (gammay0(i_nf,r)**(1/rho_r(i_nf,r)))*(alphay_z0(i_nf,r)*zz0(i_nf,r)**rho_r(i_nf,r))**(1/rho_r(i_nf,r)) - yg0(i_nf,r);
zz_db(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = ((gammay0(i_nf,r)*alphay_z0(i_nf,r))**sig_r(i_nf,r)) * (cost_z0(i_nf,r)/cost_y0(i_nf,r))**(-sig_r(i_nf,r))*yg0(i_nf,r) - zz0(i_nf,r);
xx_db(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = alphaz_x(i_nf,r)*zz0(i_nf,r) - xx0(i_nf,r);
ff_db(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = alphaz_f(i_nf,r)*zz0(i_nf,r) - ff0(i_nf,r);
ww_db(i_nf,r)$(nr0(i_nf,r) gt 0 or ff0(i_nf,r) gt 0) = ((gammax0(i_nf,r)*alphax_w0(i_nf,r))**sig_x(i_nf,r)) * (cost_w0(i_nf,r)/cost_x0(i_nf,r))**(-sig_x(i_nf,r))*xx0(i_nf,r) - ww0(i_nf,r);
*ww_db(i_gen_coal,r) = (gammax0(i_gen_coal,r)**(1/rho_x(i_gen_coal,r)))*(alphax_w0(i_gen_coal,r)*ww0(i_gen_coal,r)**(rho_x(i_gen_coal,r)-1))*(alphax_k0(i_gen_coal,r)*k0(i_gen_coal,r)**rho_x(i_gen_coal,r) + alphax_w0(i_gen_coal,r)*ww0(i_gen_coal,r)**rho_x(i_gen_coal,r))**((1-rho_x(i_gen_coal,r))/rho_x(i_gen_coal,r)) - cost_w0(i_gen_coal,r) ;
f_k_db(i_nf,r)$(y0(i_nf,r) gt 0) = (gammax0(i_nf,r)**(1/rho_x(i_nf,r)))*(alphax_k0(i_nf,r)*k0(i_nf,r)**(rho_x(i_nf,r)-1))*(alphax_k0(i_nf,r)*k0(i_nf,r)**rho_x(i_nf,r) + alphax_w0(i_nf,r)*ww0(i_nf,r)**rho_x(i_nf,r))**((1-rho_x(i_nf,r))/rho_x(i_nf,r)) - f_k0(i_nf,r) ;




f_z_db(i_nf,r)$(nr0(i_nf,r) > 0) = cost_y0(i_nf,r)*(gammay0(i_nf,r)**(1/rho_r(i_nf,r)))*((alphay_z0(i_nf,r))*zz0(i_nf,r)**(rho_r(i_nf,r)-1))*(alphay_z0(i_nf,r)*zz0(i_nf,r)**rho_r(i_nf,r) + (alphay_r0(i_nf,r))*nr0(i_nf,r)**rho_r(i_nf,r))**((1-rho_r(i_nf,r))/rho_r(i_nf,r)) - cost_z0(i_nf,r);
f_z_db(i_nf,r)$(nr0(i_nf,r) = 0 and ff0(i_nf,r) gt 0) = (1-tau_y0(i_nf,r))*(gammay0(i_nf,r)**(1/rho_r(i_nf,r)))*((alphay_z0(i_nf,r))*zz0(i_nf,r)**(rho_r(i_nf,r)-1))*(alphay_z0(i_nf,r)*zz0(i_nf,r)**rho_r(i_nf,r) )**((1-rho_r(i_nf,r))/rho_r(i_nf,r)) - cost_z0(i_nf,r);

f_r_db(i_nf,r)$(nr0(i_nf,r) > 0) = cost_y0(i_nf,r)*(gammay0(i_nf,r)**(1/rho_r(i_nf,r)))*((alphay_r0(i_nf,r))*nr0(i_nf,r)**(rho_r(i_nf,r)-1))*(alphay_z0(i_nf,r)*zz0(i_nf,r)**rho_r(i_nf,r) + (alphay_r0(i_nf,r))*nr0(i_nf,r)**rho_r(i_nf,r))**((1-rho_r(i_nf,r))/rho_r(i_nf,r)) - pr0(i_nf,r);

f_z_db(i_ff,r) = (gammay0(i_ff,r)**(1/rho_r(i_ff,r)))*((alphay_z0(i_ff,r))*zz0(i_ff,r)**(rho_r(i_ff,r)-1))*(alphay_k0(i_ff,r)*k0(i_ff,r)**rho_r(i_ff,r) + alphay_z0(i_ff,r)*zz0(i_ff,r)**rho_r(i_ff,r) + (alphay_r0(i_ff,r))*nr0(i_ff,r)**rho_r(i_ff,r))**((1-rho_r(i_ff,r))/rho_r(i_ff,r)) - f_z0(i_ff,r) ;
xx_db(i_ff,r) = alphaz_x(i_ff,r)*zz0(i_ff,r) - xx0(i_ff,r);
zz_db(i_ff,r) = (1-tau_y0(i_ff,r))*f_z0(i_ff,r) - cost_z0(i_ff,r);
f_r_db(i_ff,r) = (1-tau_y0(i_ff,r))*(gammay0(i_ff,r)**(1/rho_r(i_ff,r)))*((alphay_r0(i_ff,r))*nr0(i_ff,r)**(rho_r(i_ff,r)-1))*(alphay_k0(i_ff,r)*k0(i_ff,r)**rho_r(i_ff,r) + alphay_z0(i_ff,r)*zz0(i_ff,r)**rho_r(i_ff,r) + (alphay_r0(i_ff,r))*nr0(i_ff,r)**rho_r(i_ff,r))**((1-rho_r(i_ff,r))/rho_r(i_ff,r)) - pr0(i_ff,r) ;
f_k_db(i_ff,r) = (gammay0(i_ff,r)**(1/rho_r(i_ff,r)))*(alphay_k0(i_ff,r)*k0(i_ff,r)**(rho_r(i_ff,r)-1))*(alphay_k0(i_ff,r)*k0(i_ff,r)**rho_r(i_ff,r) + alphay_z0(i_ff,r)*zz0(i_ff,r)**rho_r(i_ff,r) + (alphay_r0(i_ff,r))*nr0(i_ff,r)**rho_r(i_ff,r))**((1-rho_r(i_ff,r))/rho_r(i_ff,r)) - f_k0(i_ff,r) ;
yg_db(i_ff,r)$(y0(i_ff,r) > 0) = (gammay0(i_ff,r)**(1/rho_r(i_ff,r)))*(alphay_k0(i_ff,r)*k0(i_ff,r)**rho_r(i_ff,r) + alphay_z0(i_ff,r)*zz0(i_ff,r)**rho_r(i_ff,r) + (alphay_r0(i_ff,r))*nr0(i_ff,r)**rho_r(i_ff,r))**(1/rho_r(i_ff,r)) - yg0(i_ff,r) ;

zpc_db(i,r) = y0(i,r)*(1-tau_y0(i,r)) - (rent0(i,r)*lambdak0(i,r))*k0(i,r) - cost_w0(i,r)*ww0(i,r) - cost_f0(i,r)*ff0(i,r) - pr0(i,r)*nr0(i,r);
*zpc_db(i,r) = y0(i,r)*(1-tau_y0(i,r)) - prof0(i,r) - cost_w0(i,r)*ww0(i,r) - cost_f0(i,r)*ff0(i,r) - pr0(i,r)*nr0(i,r);
xkinc_db(i,r) = rent0(i,r)*lambdak0(i,r)*k0(i,r) - gos0(i,r) ;

cbar_db(r) =  pcbar0(r) - cbar0(r) ;
c_db(r) = (hhtot(r)*((lambda0(r)*pbar0(r))**(-1/sigma))*(1+alpha_leis(r)*(pbar0(r)/wbar0(r))**(eta(r)-1))**(((1/sigma)-eta(r))/(eta(r)-1))) - pcbar0(r)/pbar0(r);
leis_db(r) = (c_db(r))*alpha_leis(r)*(pbar0(r)/wbar0(r))**(eta(r));

py_db(i,r) = py0(i,r) - 1;
pd_db(i,r) = pd0(i,r) - 1;
pg_db(i,r) = pg0(i,r) - 1;
pc_db(i,r) = pc0(i,r) - 1;
pi_db(i,r) = pi0(i,r) - 1;
pgf_db(i,r) = pgf0(i,r) - 1;
pgr_db(i,r) = pgr0(i,r) - 1;
pio_db(i,ii,r) = pio0(i,ii,r) - 1;
pm_db(margins,r) = pm0(margins,r) - 1;

cost_e_db(i,r) = cost_e0(i,r) - 1;
cost_m_db(i,r) = cost_m0(i,r) - 1;
cost_v_db(i,r) = cost_v0(i,r) - 1;

bc0_db(r) = (1-tau_l0-tau_lr0(r))*LS0(r) + sum(i,PROF0(i,r) + NRP0(i,r)) + GTRANS_FED0(r) + GTRANS_REG0(r) + ADJ0(r) + BOP0(r)  - pcbar0(r) - GLUMP_FED0(r) - GLUMP_REG0(r) ;

g_dn_db(i,r)$(not i_ff(i)) = g0_d(i,r)*((gammar0(i,r)*alphar_n0(i,r))**sig_rn(i,r)) * (pn0(i)/pd0(i,r))**(-sig_rn(i,r)) - g0_dn(i,r);

cp_db(j,r) = cp0(j,r) - 1;
cpv_db(cjv,r) = gammacv(cjv,r)**(sig_cv(cjv)/(1-sig_cv(cjv))) *( sum(j,cmapv(j,cjv) * (alphacv0(j,cjv,r)**sig_cv(cjv))*((cp0(j,r))**(1-sig_cv(cjv)))) )**(1/(1-sig_cv(cjv))) - cpv0(cjv,r);
c_cv_db(j,cjv,r) = ((gammacv(cjv,r)*alphacv0(j,cjv,r))**sig_cv(cjv)) * ((cp0(j,r))/cpv0(cjv,r))**(-sig_cv(cjv));
cpumlot_db(cju,r) = gammacu(cju,r)**(sig_cu(cju)/(1-sig_cu(cju))) *( sum(cjv,cmapu(cjv,cju) * (alphacu0(cjv,cju,r)**sig_cu(cju))*((cpv0(cjv,r))**(1-sig_cu(cju)))) )**(1/(1-sig_cu(cju))) - cpumlot0(cju,r);
cv_cumlot_db(cjv,cju,r) = ((gammacu(cju,r)*alphacu0(cjv,cju,r))**sig_cu(cju)) * ((cpv0(cjv,r))/cpumlot0(cju,r))**(-sig_cu(cju));
cptilde_db(cjt,r) = gammact(cjt,r)**(sig_ct(cjt)/(1-sig_ct(cjt))) *( sum(cju,cmapt(cju,cjt) * (alphact0(cju,cjt,r)**sig_ct(cjt))*((cpumlot0(cju,r))**(1-sig_ct(cjt)))) )**(1/(1-sig_ct(cjt))) - cptilde0(cjt,r);
cumlot_ctilde_db(cju,cjt,r) = ((gammact(cjt,r)*alphact0(cju,cjt,r))**sig_ct(cjt)) * ((cpumlot0(cju,r))/cptilde0(cjt,r))**(-sig_ct(cjt));
cphat_db(cj,r) = gammac(cj,r)**(sig_c(cj)/(1-sig_c(cj))) *( sum(cjt,cmap(cjt,cj) * (alphac(cjt,cj,r)**sig_c(cj))*((cptilde0(cjt,r))**(1-sig_c(cj)))) )**(1/(1-sig_c(cj))) - cphat0(cj,r);
ctilde_chat_db(cjt,cj,r) = ((gammac(cj,r)*alphac(cjt,cj,r))**sig_c(cj)) * ((cptilde0(cjt,r))/cphat0(cj,r))**(-sig_c(cj)) ;

chat_cbar_db(cj,r) = ((gammacbar(r)*alphacbar(cj,r))**sig_cbar) * ((cphat0(cj,r))/pbar0(r))**(-sig_cbar) ;

cg_db(j,r) = sum(cjv,cmapv(j,cjv)*c_cv_db(j,cjv,r)*sum(cju,cmapu(cjv,cju)*cv_cumlot_db(cjv,cju,r)*sum(cjt,cmapt(cju,cjt)*cumlot_ctilde_db(cju,cjt,r)*sum(cj,cmap(cjt,cj) * ctilde_chat_db(cjt,cj,r)*chat_cbar_db(cj,r)*cbar0(r) ))))  - cg0(j,r);

c_cv_db(j,cjv,r) = ((gammacv(cjv,r)*alphacv0(j,cjv,r))**sig_cv(cjv)) * ((cp0(j,r))/cpv0(cjv,r))**(-sig_cv(cjv)) - c_cv0(j,cjv,r);
cv_cumlot_db(cjv,cju,r) = ((gammacu(cju,r)*alphacu0(cjv,cju,r))**sig_cu(cju)) * ((cpv0(cjv,r))/cpumlot0(cju,r))**(-sig_cu(cju))  - cv_cumlot0(cjv,cju,r);
cumlot_ctilde_db(cju,cjt,r) = ((gammact(cjt,r)*alphact0(cju,cjt,r))**sig_ct(cjt)) * ((cpumlot0(cju,r))/cptilde0(cjt,r))**(-sig_ct(cjt))  - cumlot_ctilde0(cju,cjt,r);
ctilde_chat_db(cjt,cj,r) = ((gammac(cj,r)*alphac(cjt,cj,r))**sig_c(cj)) * ((cptilde0(cjt,r))/cphat0(cj,r))**(-sig_c(cj)) - ctilde_chat0(cjt,cj,r);
chat_cbar_db(cj,r) = ((gammacbar(r)*alphacbar(cj,r))**sig_cbar) * ((cphat0(cj,r))/pbar0(r))**(-sig_cbar) - chat_cbar0(cj,r);

display
nr0
zz0
yg0
rho_r
gammay0
alphay_z0
alphay_r0
xkinc_db
zpc_db
yg_db
zz_db
xx_db
ff_db
ww_db
f_k_db
f_z_db
f_r_db
cbar_db
c_db
leis_db
py_db
pg_db
pd_db
pc_db
pi_db
pgf_db
pgr_db
pio_db
pm_db
cost_e_db
cost_m_db
cost_v_db
pbar0
cg0
phat0
pcbar0
pcbar_db
cpv_db
cpumlot_db
cphat_db
cptilde_db
c_cv_db
cv_cumlot_db
cumlot_ctilde_db
ctilde_chat_db
chat_cbar_db
cg_db
cp_db
bc0
bc0_db
fv_k0
v_db2
v0
v_db
g_dn_db

;




* ------------------------------------------------------------------------------
* Step 10: Calibrate emissions coefficients
* ------------------------------------------------------------------------------

* ------------------------------------------------------------------------------
* Define new model emissions coefficients
* ------------------------------------------------------------------------------

parameters
mu_sector
mu_sector_q
mu(*,*,*)
muc(*,*)
mug(*,*)

esector0
esector0_db
seds_ex_db2
;

mu_sector(fuel,sec,r)$(seds_ex0(fuel,sec,r) gt 0) = esector00(fuel,sec,r)/seds_ex0(fuel,sec,r);
mu_sector_q(fuel,sec,r)$(seds_q0(fuel,sec,r) gt 0) = esector00(fuel,sec,r)/seds_q0(fuel,sec,r); 

mu(i,ii,r) = 0;
muc(j,r) = 0;
mug(i,r) = 0;



* Natural Gas
mu(i_gas,i_ind2,r) = mu_sector('gas','ind',r);
mu(i_gas,i_gen,r) = mu_sector('gas','ep',r);
mu(i_gas,i_ngd,r) = 0;
mu(i_gas,i_trans,r) = mu_sector('gas','trans',r);

* Coal
mu(i_coal,i_ind2,r) = mu_sector('coal','ind',r);
mu(i_coal,i_gen,r) = mu_sector('coal','ep',r);
mu(i_coal,i_com,r) = mu_sector('coal','com',r);
mu(i_coal,i_trade,r) = mu_sector('coal','com',r);

* Natural Gas Distribution
mu(i_ngd,i_com,r) = mu_sector('gas','com',r);
mu(i_ngd,i_trade,r) = mu_sector('gas','com',r);
muc(j_ngd,r) = sum(i_ngd,gmaxp(i_ngd,j_ngd,r))*mu_sector('gas','res',r);
mug(i_ngd,r) = mu_sector('gas','com',r);

* Refined Products
mu(i_refine,i_ind2,r) = mu_sector('ref','ind',r);
mu(i_refine,i_gen,r) = mu_sector('ref','ep',r);
mu(i_refine,i_com,r) = mu_sector('ref','com',r);
mu(i_refine,i_trade,r) = mu_sector('ref','com',r);
mu(i_refine,i_trans,r) = mu_sector('ref','trans',r);
muc(j_fueloil,r) = sum(i_refine,gmaxp(i_refine,j_fueloil,r))*mu_sector('ref','res',r);
muc(j_mvf,r) = sum(i_refine,gmaxp(i_refine,j_mvf,r))*mu_sector('ref','trans',r);
mug(i_refine,r) = mu_sector('ref','trans',r);


esector0('coal','res',r) = 0;
esector0('coal','com',r) = sum(i_coal,(sum(i_com,mu(i_coal,i_com,r)*((IO0(i_coal,i_com,r)+IO0_FF(i_coal,i_com,r))*(1+sum(margins,io0_mr(i_coal,i_com,margins,r))))) + sum(i_trade,mu(i_coal,i_trade,r)*((IO0(i_coal,i_trade,r)+IO0_FF(i_coal,i_trade,r))*(1+sum(margins,io0_mr(i_coal,i_trade,margins,r))))))*1000);
esector0('coal','ind',r) = sum(i_coal,sum(i_ind2,mu(i_coal,i_ind2,r)*((IO0(i_coal,i_ind2,r)+IO0_FF(i_coal,i_ind2,r))*(1+sum(margins,io0_mr(i_coal,i_ind2,margins,r)))))*1000);
esector0('coal','manuf',r) = sum(i_coal,sum(i_ind,mu(i_coal,i_ind,r)*((IO0(i_coal,i_ind,r)+IO0_FF(i_coal,i_ind,r))*(1+sum(margins,io0_mr(i_coal,i_ind,margins,r)))))*1000);
esector0('coal','refine',r) = sum(i_coal,sum(i_refine,mu(i_coal,i_refine,r)*((IO0(i_coal,i_refine,r)+IO0_FF(i_coal,i_refine,r))*(1+sum(margins,io0_mr(i_coal,i_refine,margins,r)))))*1000);
esector0('coal','ag',r) = sum(i_coal,sum(i_ag,mu(i_coal,i_ag,r)*((IO0(i_coal,i_ag,r)+IO0_FF(i_coal,i_ag,r))*(1+sum(margins,io0_mr(i_coal,i_ag,margins,r)))))*1000);
esector0('coal','cons',r) = sum(i_coal,sum(i_constr,mu(i_coal,i_constr,r)*((IO0(i_coal,i_constr,r)+IO0_FF(i_coal,i_constr,r))*(1+sum(margins,io0_mr(i_coal,i_constr,margins,r)))))*1000);
esector0('coal','mine',r) = sum(i_coal,sum(i_othmine,mu(i_coal,i_othmine,r)*((IO0(i_coal,i_othmine,r)+IO0_FF(i_coal,i_othmine,r))*(1+sum(margins,io0_mr(i_coal,i_othmine,margins,r)))))*1000);
esector0('coal','trans',r) = 0;
esector0('coal','ep',r) = sum(i_coal,sum(i_gen,mu(i_coal,i_gen,r)*((IO0(i_coal,i_gen,r)+IO0_FF(i_coal,i_gen,r))*(1+sum(margins,io0_mr(i_coal,i_gen,margins,r)))))*1000);

esector0('gas','res',r) = sum(j_ngd,muc(j_ngd,r)*(cg0(j_ngd,r))*1000);
esector0('gas','com',r) = sum(i_ngd,(sum(i_com,mu(i_ngd,i_com,r)*(IO0(i_ngd,i_com,r)+IO0_FF(i_ngd,i_com,r)))+ sum(i_trade,mu(i_ngd,i_trade,r)*(IO0(i_ngd,i_trade,r)+IO0_FF(i_ngd,i_trade,r))))*1000 + mug(i_ngd,r)*(G_FED0(i_ngd,r)+G_REG0(i_ngd,r))*1000);
esector0('gas','ind',r) = sum(i_gas,sum(i_ind2,mu(i_gas,i_ind2,r)*((IO0(i_gas,i_ind2,r)+IO0_FF(i_gas,i_ind2,r))*(1+sum(margins,io0_mr(i_gas,i_ind2,margins,r)))))*1000)
    + sum(i_ngd,sum(i_ind2,mu(i_ngd,i_ind2,r)*((IO0(i_ngd,i_ind2,r)+IO0_FF(i_ngd,i_ind2,r))*(1+sum(margins,io0_mr(i_ngd,i_ind2,margins,r)))))*1000);
esector0('gas','manuf',r) = sum(i_gas,sum(i_ind,mu(i_gas,i_ind,r)*((IO0(i_gas,i_ind,r)+IO0_FF(i_gas,i_ind,r))*(1+sum(margins,io0_mr(i_gas,i_ind,margins,r)))))*1000);
esector0('gas','refine',r) = sum(i_gas,sum(i_refine,mu(i_gas,i_refine,r)*((IO0(i_gas,i_refine,r)+IO0_FF(i_gas,i_refine,r))*(1+sum(margins,io0_mr(i_gas,i_refine,margins,r)))))*1000);
esector0('gas','ag',r) = sum(i_gas,sum(i_ag,mu(i_gas,i_ag,r)*((IO0(i_gas,i_ag,r)+IO0_FF(i_gas,i_ag,r))*(1+sum(margins,io0_mr(i_gas,i_ag,margins,r)))))*1000) +
sum(i_ngd,sum(i_ag,mu(i_ngd,i_ag,r)*((IO0(i_ngd,i_ag,r)+IO0_FF(i_ngd,i_ag,r))*(1+sum(margins,io0_mr(i_ngd,i_ag,margins,r)))))*1000);
esector0('gas','cons',r) = sum(i_ngd,sum(i_constr,mu(i_ngd,i_constr,r)*((IO0(i_ngd,i_constr,r)+IO0_FF(i_ngd,i_constr,r))*(1+sum(margins,io0_mr(i_ngd,i_constr,margins,r)))))*1000);
esector0('gas','mine',r) = sum(i_gas,sum(i_othmine,mu(i_gas,i_othmine,r)*((IO0(i_gas,i_othmine,r)+IO0_FF(i_gas,i_othmine,r))*(1+sum(margins,io0_mr(i_gas,i_othmine,margins,r)))))*1000);
esector0('gas','trans',r) = sum(i_gas,sum(i_trans,mu(i_gas,i_trans,r)*((IO0(i_gas,i_trans,r)+IO0_FF(i_gas,i_trans,r))*(1+sum(margins,io0_mr(i_gas,i_trans,margins,r)))))*1000);
esector0('gas','ep',r) = sum(i_gas,sum(i_gen,mu(i_gas,i_gen,r)*((IO0(i_gas,i_gen,r)+IO0_FF(i_gas,i_gen,r))*(1+sum(margins,io0_mr(i_gas,i_gen,margins,r)))))*1000);

esector0('ref','res',r) = sum(j_fueloil,muc(j_fueloil,r)*cg0(j_fueloil,r)*1000);
esector0('ref','com',r) = sum(i_refine,(sum(i_com,mu(i_refine,i_com,r)*((IO0(i_refine,i_com,r)+IO0_FF(i_refine,i_com,r))*(1+sum(margins,io0_mr(i_refine,i_com,margins,r))))) + sum(i_trade,mu(i_refine,i_trade,r)*((IO0(i_refine,i_trade,r)+IO0_FF(i_refine,i_trade,r))*(1+sum(margins,io0_mr(i_refine,i_refine,margins,r))))))*1000);
esector0('ref','ind',r) = sum(i_refine,sum(i_ind2,mu(i_refine,i_ind2,r)*((IO0(i_refine,i_ind2,r)+IO0_FF(i_refine,i_ind2,r))*(1+sum(margins,io0_mr(i_refine,i_ind2,margins,r)))))*1000) ;
esector0('ref','manuf',r) = sum(i_refine,sum(i_ind,mu(i_refine,i_ind,r)*((IO0(i_refine,i_ind,r)+IO0_FF(i_refine,i_ind,r))*(1+sum(margins,io0_mr(i_refine,i_ind,margins,r)))))*1000) ;
esector0('ref','refine',r) = sum(i_refine,sum(i_refine2,mu(i_refine,i_refine2,r)*((IO0(i_refine,i_refine2,r)+IO0_FF(i_refine,i_refine2,r))*(1+sum(margins,io0_mr(i_refine,i_refine2,margins,r)))))*1000) ;
esector0('ref','ag',r) = sum(i_refine,sum(i_ag,mu(i_refine,i_ag,r)*((IO0(i_refine,i_ag,r)+IO0_FF(i_refine,i_ag,r))*(1+sum(margins,io0_mr(i_refine,i_ag,margins,r)))))*1000) ;
esector0('ref','cons',r) = sum(i_refine,sum(i_constr,mu(i_refine,i_constr,r)*((IO0(i_refine,i_constr,r)+IO0_FF(i_refine,i_constr,r))*(1+sum(margins,io0_mr(i_refine,i_constr,margins,r)))))*1000) ;
esector0('ref','mine',r) = sum(i_refine,sum(i_othmine,mu(i_refine,i_othmine,r)*((IO0(i_refine,i_othmine,r)+IO0_FF(i_refine,i_othmine,r))*(1+sum(margins,io0_mr(i_refine,i_othmine,margins,r)))))*1000) ;
esector0('ref','trans',r) = sum(i_refine,sum(i_trans,mu(i_refine,i_trans,r)*((IO0(i_refine,i_trans,r)+IO0_FF(i_refine,i_trans,r))*(1+sum(margins,io0_mr(i_refine,i_trans,margins,r)))))*1000) + sum(j_mvf,muc(j_mvf,r)*cg0(j_mvf,r)*1000) + sum(i_refine,mug(i_refine,r)*G_FED0(i_refine,r)*(1+sum(margins,g_fed0_mr(i_refine,margins,r)))*1000) + sum(i_refine,mug(i_refine,r)*G_REG0(i_refine,r)*(1+sum(margins,g_reg0_mr(i_refine,margins,r)))*1000) ;
esector0('ref','ep',r) = sum(i_refine,sum(i_gen,mu(i_refine,i_gen,r)*((IO0(i_refine,i_gen,r)+IO0_FF(i_refine,i_gen,r))*(1+sum(margins,io0_mr(i_refine,i_gen,margins,r)))))*1000);

esector0_db(fuel,sec,r) = esector00(fuel,sec,r)*1000 - esector0(fuel,sec,r);

esector00(fuel,sec,r) = esector00(fuel,sec,r)*1000;

*seds_ex_db('coal',i_ind2) = sum(r,sum(i_coal,mu(i_coal,i_refine,r)*IO0(i_coal,i_refine,r)*(1+sum(margins,io0_mr(i_coal,i_refine,margins,r))))*1000) - sum(n_refine,sum(n_coal,mu_n(n_coal,n_refine)*io00(n_coal,n_refine)*(1+sum(margins,io00_mr(n_coal,margins,r)))*1000)); ;
*seds_ex_db2('gas','ind',r) = sum(i_gas,sum(i_ind2,(IO0(i_gas,i_ind2,r)*(1+sum(margins,io0_mr(i_gas,i_ind2,margins,r)))))*1000) - seds_ex0('gas','ind',r)*1000;
seds_ex_db2('gas','ind',r) = mu_sector('gas','ind',r)*sum(i_gas,sum(i_ind2,(IO0(i_gas,i_ind2,r)*(1+sum(margins,io0_mr(i_gas,i_ind2,margins,r)))))*1000) - mu_sector('gas','ind',r)*seds_ex0('gas','ind',r)*1000;
*seds_ex_db2('gas','com',r) = sum(i_ngd,(sum(i_com,IO0(i_ngd,i_com,r))+ sum(i_trade,IO0(i_ngd,i_trade,r)))*1000 + (G_FED0(i_ngd,r)+G_REG0(i_ngd,r))*1000) - seds_ex0('gas','com',r)*1000 ;

*seds_ex_db2('gas',i,r) = sum(i_gas,(mu(i_gas,i,r)*IO0(i_gas,i,r)*(1+sum(margins,io0_mr(i_gas,i,margins,r))))*1000);
* - sum(s,mapregion(s,r) * sum(n, mapin(n,i)* sum(n_gas,mu_s(n_gas,n,s)*IO0s(n_gas,n,s)*(1+sum(margins,io00_mr(n_gas,margins,r))) )*1000));
*seds_ex_db('ref',i_refine) = sum(r,sum(i_refine2,mu(i_refine2,i_refine,r)*IO0(i_refine2,i_refine,r)*(1+sum(margins,io0_mr(i_refine2,i_refine,margins,r))))*1000) - sum(n_refine,sum(n_refine2,mu_n(n_refine2,n_refine)*io00(n_refine2,n_refine)*(1+sum(margins,io00_mr(n_refine2,margins,r)))*1000)); ;


*seds_ex_db('gas',ind2,r) =


display
esector0
esector00
esector0_db
seds_ex_db2
seds_ex0
mu_sector_q

;



parameter
E0(*,*) "Emissions by industry i"
ETOT0(*)  "Total emissions (production-based)"
e_y0(*,*)

e_share0
ec_share0
egf_share0
egr_share0
;


E0(i,r) = sum(ii,mu(ii,i,r)*(IO0(ii,i,r)+IOM0(ii,i,r)+IO0_FF(ii,i,r)+IOM0_FF(ii,i,r)));
ETOT0(r) = sum(j,muc(j,r)*Cg0(j,r)) + sum(i,e0(i,r)  + mug(i,r)*(GBAR_FED0(i,r) + GBAR_REG0(i,r)));
e_y0(i,r)$(y0(i,r) > 0) = e0(i,r)/y0(i,r);

e_share0(ii,i,r) = mu(ii,i,r)*(IO0(ii,i,r)+IOM0(ii,i,r))/etot0(r);
ec_share0(j,r) = muc(j,r)*Cg0(j,r)/etot0(r);
egf_share0(i,r) = mug(i,r)*GBAR_FED0(i,r)/etot0(r);
egr_share0(i,r) = mug(i,r)*GBAR_REG0(i,r)/etot0(r);




display
mu_sector
mu
muc
mug
e0
etot0
e_share0
ec_share0
egf_share0
egr_share0
;



parameter
gdp0
gdp0_c
gdp0_i
gdp0_g
gdp0_ex
ey_sector0
;

gdp0_c(r) = sum(i,pce0(i,r)) + sum(margins,sum(i,pce0_mr(i,margins,r)*pce0(i,r)));
gdp0_i(r) = sum(i,(pfi0(i,r))*(1 + sum(margins,pfi0_mr(i,margins,r))));
gdp0_g(r) = sum(i,g_fed0(i,r) + g_reg0(i,r)) + sum(margins,sum(i,g_fed0_mr(i,margins,r)*g_fed0(i,r) + g_reg0_mr(i,margins,r)*g_reg0(i,r))) ;
gdp0_ex(r) = sum(i,ex0(i,r));

gdp0(r) = gdp0_c(r) + gdp0_i(r) + gdp0_g(r) + gdp0_ex(r) - sum(i,im0(i,r));
ey_sector0(fuel,sec,r) = 1000*esector0(fuel,sec,r)/gdp0(r);

display
gdp0
gdp0_c
gdp0_i
gdp0_g
gdp0_ex
ey_sector0
;

parameter
genshare0
;

genshare0(i_gen,r) = y0(i_gen,r)/(sum(i_gen2,y0(i_gen2,r)));


Parameter
seds_elec0
seds_elec0_db
seds_q00_db
;

seds_elec0(ind_sec,r) = sum(i_ind2,sum(i_td,(IO0(i_td,i_ind2,r)*(1+sum(margins,io0_mr(i_td,i_ind2,margins,r))))))/seds_p0('elec','ind',r);
seds_elec0('manuf',r) = sum(i_ind,sum(i_td,(IO0(i_td,i_ind,r)*(1+sum(margins,io0_mr(i_td,i_ind,margins,r))))))/seds_p0('elec','ind',r);
seds_elec0('refine',r) = sum(i_refine,sum(i_td,(IO0(i_td,i_refine,r)*(1+sum(margins,io0_mr(i_td,i_refine,margins,r))))))/seds_p0('elec','ind',r);
seds_elec0('ag',r) = sum(i_ag,sum(i_td,(IO0(i_td,i_ag,r)*(1+sum(margins,io0_mr(i_td,i_ag,margins,r))))))/seds_p0('elec','ind',r);
seds_elec0('cons',r) = sum(i_constr,sum(i_td,(IO0(i_td,i_constr,r)*(1+sum(margins,io0_mr(i_td,i_constr,margins,r))))))/seds_p0('elec','ind',r);
seds_elec0('mine',r) = sum(i_mine,sum(i_td,(IO0(i_td,i_mine,r)*(1+sum(margins,io0_mr(i_td,i_mine,margins,r))))))/seds_p0('elec','ind',r);
seds_elec0_db(ind_sec) = sum(r,seds_elec0(ind_sec,r));
seds_q00_db(fuel,sec) = sum(r,seds_q0(fuel,sec,r));

display seds_elec0
seds_elec0_db
seds_q0
seds_q00
seds_q00_db
io0
;

seds_q0('elec',ind_sec,r) = seds_elec0(ind_sec,r);
seds_q0('elec','manuf',r) = seds_elec0('manuf',r);
seds_q0('elec','refine',r) = seds_elec0('refine',r);
seds_q0('elec','ag',r) = seds_elec0('ag',r);
seds_q0('elec','cons',r) = seds_elec0('cons',r);
seds_q0('elec','mine',r) = seds_elec0('mine',r);


Parameter
seds_q0_db
seds_ff
;

seds_q0_db('coal','res',r) = 0;
seds_q0_db('coal','com',r)$(seds_p0('coal','com',r) > 0) = sum(i_coal,(sum(i_com,((IO0(i_coal,i_com,r)+IO0_FF(i_coal,i_com,r))*(1+sum(margins,io0_mr(i_coal,i_com,margins,r))))) + sum(i_trade,((IO0(i_coal,i_trade,r)+IO0_FF(i_coal,i_trade,r))*(1+sum(margins,io0_mr(i_coal,i_trade,margins,r)))))))/seds_p0('coal','com',r);
seds_q0_db('coal','ind',r) = sum(i_coal,sum(i_ind2,((IO0(i_coal,i_ind2,r)+IO0_FF(i_coal,i_ind2,r))*(1+sum(margins,io0_mr(i_coal,i_ind2,margins,r))))))/seds_p0('coal','ind',r);
seds_q0_db('coal','trans',r) = 0;
seds_q0_db('coal','ep',r) = sum(i_coal,sum(i_gen,((IO0(i_coal,i_gen,r)+IO0_FF(i_coal,i_gen,r))*(1+sum(margins,io0_mr(i_coal,i_gen,margins,r))))))/seds_p0('coal','ep',r);


seds_q0_db('gas','res',r) = sum(j_ngd,(sum(i_ngd,gmaxp(i_ngd,j_ngd,r))*cg0(j_ngd,r)))/seds_p0('gas','res',r);
seds_q0_db('gas','com',r) = sum(i_ngd,(sum(i_com,(IO0(i_ngd,i_com,r)+IO0_FF(i_ngd,i_com,r)))+ sum(i_trade,(IO0(i_ngd,i_trade,r)+IO0_FF(i_ngd,i_trade,r)))) + (G_FED0(i_ngd,r)+G_REG0(i_ngd,r)))/seds_p0('gas','com',r);
seds_q0_db('gas','ind',r) = sum(i_gas,sum(i_ind3,((IO0(i_gas,i_ind3,r)+IO0_FF(i_gas,i_ind3,r))*(1+sum(margins,io0_mr(i_gas,i_ind3,margins,r))))))/seds_p0('gas','ind',r)
    + sum(i_ngd,sum(i_ind2,((IO0(i_ngd,i_ind2,r)+IO0_FF(i_ngd,i_ind2,r))*(1+sum(margins,io0_mr(i_ngd,i_ind2,margins,r))))))/seds_p0('gas','ind',r) ;
seds_q0_db('gas','trans',r) = sum(i_gas,sum(i_trans,((IO0(i_gas,i_trans,r)+IO0_FF(i_gas,i_trans,r))*(1+sum(margins,io0_mr(i_gas,i_trans,margins,r))))))/seds_p0('gas','trans',r);
seds_q0_db('gas','ep',r) = sum(i_gas,sum(i_gen,((IO0(i_gas,i_gen,r)+IO0_FF(i_gas,i_gen,r))*(1+sum(margins,io0_mr(i_gas,i_gen,margins,r))))))/seds_p0('gas','ep',r);

seds_q0_db('ref','res',r) = sum(j_fueloil,sum(i_refine,gmaxp(i_refine,j_fueloil,r))*cg0(j_fueloil,r))/seds_p0('ref','res',r);
seds_q0_db('ref','com',r) = sum(i_refine,(sum(i_com,((IO0(i_refine,i_com,r)+IO0_FF(i_refine,i_com,r))*(1+sum(margins,io0_mr(i_refine,i_com,margins,r))))) + sum(i_trade,((IO0(i_refine,i_trade,r)+IO0_FF(i_refine,i_trade,r))*(1+sum(margins,io0_mr(i_refine,i_refine,margins,r)))))))/seds_p0('ref','com',r);
seds_q0_db('ref','ind',r) = sum(i_refine,sum(i_ind2,((IO0(i_refine,i_ind2,r)+IO0_FF(i_refine,i_ind2,r))*(1+sum(margins,io0_mr(i_refine,i_ind2,margins,r))))))/seds_p0('ref','ind',r) ;
seds_q0_db('ref','trans',r) = (sum(i_refine,sum(i_trans,((IO0(i_refine,i_trans,r)+IO0_FF(i_refine,i_trans,r))*(1+sum(margins,io0_mr(i_refine,i_trans,margins,r)))))) + sum(j_mvf,cg0(j_mvf,r)) + sum(i_refine,G_FED0(i_refine,r)*(1+sum(margins,g_fed0_mr(i_refine,margins,r)))) + sum(i_refine,G_REG0(i_refine,r)*(1+sum(margins,g_reg0_mr(i_refine,margins,r)))))/seds_p0('ref','trans',r) ;
seds_q0_db('ref','ep',r) = sum(i_refine,sum(i_gen,((IO0(i_refine,i_gen,r)+IO0_FF(i_refine,i_gen,r))*(1+sum(margins,io0_mr(i_refine,i_gen,margins,r))))))/seds_p0('ref','ep',r);

seds_q0_db('elec','res',r) = sum(j_elec,cg0(j_elec,r))/seds_p0('elec','res',r);
seds_q0_db('elec','com',r) = (sum(i_com,sum(i_td,IO0(i_td,i_com,r))) + sum(i_trade,sum(i_td,IO0(i_td,i_trade,r))) + sum(i_td,G_FED0(i_td,r)+G_REG0(i_td,r)))/seds_p0('elec','com',r);
seds_q0_db('elec','ind',r) = (sum(i_ind2,sum(i_td,IO0(i_td,i_ind2,r)*(1+sum(margins,io0_mr(i_td,i_ind2,margins,r))))))/seds_p0('elec','ind',r);
seds_q0_db('elec','trans',r) = (sum(j_mvelec,cg0(j_mvelec,r)) )/seds_p0('elec','trans',r);

seds_ff(fuel,sec,r)$(seds_q0_db(fuel,sec,r) > 0) = seds_q0(fuel,sec,r)/seds_q0_db(fuel,sec,r);

display
seds_q0
seds_q0_db
seds_p0
seds_ff

;


