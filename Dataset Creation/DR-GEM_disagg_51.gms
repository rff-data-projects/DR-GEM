$TITLE State Disaggregation Module -- 51 States$


* ------------------------------------------------------------------------------
* Redefine parameters over set "in"
* ------------------------------------------------------------------------------

parameter
Y0_s_(*,*)
EXD0_s_(*,*)
EX0_s_(*,*)

GY_FED0_s_(*,*)
GY_REG0_s_(*,*)

L0_s_(*,*)
GOS0_s_(*,*)
TOPI0_s_(*,*)

IO0_s_(*,*,*)
PCE0_s_(*,*)
PFI0_s_(*,*)
G_FED0_s_(*,*)
G_REG0_s_(*,*)

G0_s_(*,*)
IM0_s_(*,*)
IMD0_s_(*,*)
G0_D_s_(*,*)


TBAL0_s_

yf0_s_(*,*)
yd0_s_(*,*)
yr0_s_(*,*)
yr0_s_db2


xf0_s_(*,*)
xd0_s_(*,*)
xr0_s_(*,*)
xr0_s_db2


;

* Non oil-gas

Y0_s_(c,s)$(not sameas(c,'c3'))  = Y0_s__(c,s);
EX0_s_(c,s)$(not sameas(c,'c3'))  = EX0_s__(c,s);
EXD0_s_(c,s)$(not sameas(c,'c3'))  = EXD0_s__(c,s);

GY_FED0_s_(c,s)$(not sameas(c,'c3'))  = GY_FED0_s__(c,s);
GY_REG0_s_(c,s)$(not sameas(c,'c3'))  = GY_REG0_s__(c,s);

L0_s_(c,s)$(not sameas(c,'c3')) = L0_s__(c,s);
TOPI0_s_(c,s)$(not sameas(c,'c3')) = TOPI0_s__(c,s);
GOS0_s_(c,s)$(not sameas(c,'c3')) = GOS0_s__(c,s);

IO0_s_(cc,c,s)$(not sameas(c,'c3') and not sameas(cc,'c3')) = IO0_s__(cc,c,s);

PCE0_s_(c,s)$(not sameas(c,'c3')) = PCE0_s__(c,s);
PFI0_s_(c,s)$(not sameas(c,'c3')) = PFI0_s__(c,s);
G_FED0_s_(c,s)$(not sameas(c,'c3')) = G_FED0_s__(c,s);
G_REG0_s_(c,s)$(not sameas(c,'c3')) = G_REG0_s__(c,s);

G0_s_(c,s)$(not sameas(c,'c3')) = G0_s__(c,s);
IM0_s_(c,s)$(not sameas(c,'c3')) = IM0_s__(c,s);
IMD0_s_(c,s)$(not sameas(c,'c3')) = IMD0_s__(c,s);
G0_D_s_(c,s)$(not sameas(c,'c3')) = G0_s__(c,s) - IM0_s__(c,s);





* Oil/Gas, generation, and vehicle production
* Note: most of this data will be redefined based on SEDS data and is just a placeholder

Y0_s_(og,s) = sum(mapog(og,c), shr_og_prod(og) * Y0_s__(c,s));
EX0_s_('c3a',s) = 0.35*EX0_s__('c3',s);
EX0_s_('c3b',s) = 0.65*EX0_s__('c3',s);




GY_FED0_s_(og,s) = sum(mapog(og,c), shr_og_prod(og) * GY_FED0_s__(c,s));
GY_REG0_s_(og,s) = sum(mapog(og,c), shr_og_prod(og) * GY_REG0_s__(c,s));

L0_s_(og,s) = sum(mapog(og,c), shr_og_prod(og) * L0_s__(c,s));
TOPI0_s_(og,s) = sum(mapog(og,c), shr_og_prod(og) * TOPI0_s__(c,s));
GOS0_s_(og,s) = sum(mapog(og,c), shr_og_prod(og) * GOS0_s__(c,s));


IO0_s_(og,cc,s)$(not sameas(cc,'c3')) = sum(mapog(og,c), shr_og_prod(og) * IO0_s__(c,cc,s));
IO0_s_(cc,og,s)$(not sameas(cc,'c3')) = sum(mapog(og,c), shr_og_prod(og) * IO0_s__(cc,c,s));
IO0_s_('c3b',cc,s) = IO0_s__('c3',cc,s);
IO0_s_('c3b','c18',s) = 0;
IM0_s_('c3b',s) = 0.1*sum(in,IO0_s_('c3b',in,s));
IMD0_s_('c3b',s) = xr0_s__('c3',s)/(xr0_s__('c3',s)+xd0_s__('c3',s))*0.9*sum(in,IO0_s_('c3b',in,s));

IO0_s_('c3a',cc,s) = 0;
IO0_s_('c3a','c18',s) = IO0_s__('c3','c18',s);
IM0_s_('c3a',s) = 0.47*sum(in,IO0_s_('c3a',in,s));
IMD0_s_('c3a',s) = xr0_s__('c3',s)/(xr0_s__('c3',s)+xd0_s__('c3',s))*0.53*sum(in,IO0_s_('c3a',in,s));



PCE0_s_(og,s) = 0;
PFI0_s_(og,s) = 0;
G_FED0_s_(og,s) = 0;
G_REG0_s_(og,s) = 0;
G0_s_(og,s) = sum(in,IO0_s_(og,in,s));
G0_D_s_(og,s) = G0_s_(og,s) - IM0_s_(og,s);



Y0_s_(egen,s) = sum(mapgen(egen,c), shr_gen_prod(egen) * Y0_s__(c,s));
GY_FED0_s_(egen,s) = sum(mapgen(egen,c), shr_gen_prod(egen) * GY_FED0_s__(c,s));
GY_REG0_s_(egen,s) = sum(mapgen(egen,c), shr_gen_prod(egen) * GY_REG0_s__(c,s));
EXD0_s_(egen,s) = Y0_s_(egen,s) + GY_FED0_s_(egen,s) + GY_REG0_s_(egen,s);

L0_s_(egen,s) = sum(mapgen(egen,c), shr_gen_om(egen) * L0_s__(c,s));
TOPI0_s_(egen,s) = sum(mapgen(egen,c), shr_gen_om(egen) * TOPI0_s__(c,s));
GOS0_s_(egen,s) = sum(mapgen(egen,c), shr_gen_om(egen) * GOS0_s__(c,s));

IO0_s_(cc,egen,s)$(not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapgen(egen,c), shr_gen_om(egen) * IO0_s__(cc,c,s));
IO0_s_(in_e,egen,s) = 0;
IO0_s_('c4','c7a',s) = IO0_s__('c4','c7',s);
IO0_s_('c3b','c7b',s) = IO0_s__('c3','c7',s);
IO0_s_('c18',egen,s) = sum(mapgen(egen,c), shr_gen_om(egen) * IO0_s__('c18',c,s));
IO0_s_(egen,in,s) = 0;
IO0_s_(egen,'c8',s) = sum(mapgen(egen,c), shr_gen_prod(egen) * IO0_s__(c,'c8',s));

IM0_s_(egen,s) = 0;
IMD0_s_(egen,s) = 0;

PCE0_s_(egen,s) = 0;
PFI0_s_(egen,s) = 0;
G_FED0_s_(egen,s) = 0;
G_REG0_s_(egen,s) = 0;
G0_s_(egen,s) = sum(in,IO0_s_(egen,in,s));
G0_D_s_(egen,s) = G0_s_(egen,s) - IM0_s_(egen,s);


IM0_s_('c8',s) = 0;
IMD0_s_('c8',s) = 0;
G0_s_('c8',s) = PCE0_s_('c8',s) + PFI0_s_('c8',s) + G_FED0_s_('c8',s) + G_REG0_s_('c8',s) + sum(in,IO0_s_('c8',in,s));
G0_D_s_('c8',s) = G0_s_('c8',s);

Y0_s_(mv,s) = sum(mapmv(mv,c), shr_mv_prod(mv) * Y0_s__(c,s));
L0_s_(mv,s) = sum(mapmv(mv,c), shr_mv_prod(mv) * L0_s__(c,s));
TOPI0_s_(mv,s) = sum(mapmv(mv,c), shr_mv_prod(mv) * TOPI0_s__(c,s));
GOS0_s_(mv,s) = sum(mapmv(mv,c), shr_mv_prod(mv) * GOS0_s__(c,s));
PCE0_s_(mv,s) = sum(mapmv(mv,c), shr_mv_prod(mv) * PCE0_s__(c,s));
PFI0_s_(mv,s) = sum(mapmv(mv,c), shr_mv_prod(mv) * PFI0_s__(c,s));
G_FED0_s_(mv,s) = sum(mapmv(mv,c), shr_mv_prod(mv) * G_FED0_s__(c,s));
G_REG0_s_(mv,s) = sum(mapmv(mv,c), shr_mv_prod(mv) * G_REG0_s__(c,s));
GY_FED0_s_(mv,s) = sum(mapmv(mv,c), shr_mv_prod(mv) * GY_FED0_s__(c,s));
GY_REG0_s_(mv,s) = sum(mapmv(mv,c), shr_mv_prod(mv) * GY_REG0_s__(c,s));

EX0_s_(mv,s) = sum(mapmv(mv,c), shr_mv_prod(mv) * EX0_s__(c,s));
IO0_s_(mv,cc,s)$(not sameas(cc,'c31') and not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapmv(mv,c), shr_mv_prod(mv) * IO0_s__(c,cc,s));
IO0_s_(cc,mv,s)$(not sameas(cc,'c31') and not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapmv(mv,c), shr_mv_prod(mv) * IO0_s__(cc,c,s));
IO0_s_(mv,mv,s) = sum(mapmv(mv,c), shr_mv_prod(mv) * IO0_s__(c,c,s));

IM0_s_(mv,s) = xf0_s__('c31',s)*(PCE0_s_(mv,s) + PFI0_s_(mv,s) + G_FED0_s_(mv,s) + G_REG0_s_(mv,s) + sum(in,IO0_s_(mv,in,s)));
IMD0_s_(mv,s) = xr0_s__('c31',s)*(PCE0_s_(mv,s) + PFI0_s_(mv,s) + G_FED0_s_(mv,s) + G_REG0_s_(mv,s) + sum(in,IO0_s_(mv,in,s)));
G0_s_(mv,s) = (PCE0_s_(mv,s) + PFI0_s_(mv,s) + G_FED0_s_(mv,s) + G_REG0_s_(mv,s) + sum(in,IO0_s_(mv,in,s)));
G0_D_s_(mv,s) = G0_s_(mv,s) - IM0_s_(mv,s);


TBAL0_s_(in) = sum(s,EXD0_s_(in,s) - IMD0_s_(in,s));




* ------------------------------------------------------------------------------
* Input SEDS output data and calculate output and input shares
* ------------------------------------------------------------------------------

display
y0_s_
;

parameters
y0_s
y0_sh
l0_s
l0_sh
elec_cons_db
elec_gen_db
;


y0_s_(in_coal,s) = seds_prod('coal',s);
y0_s_(in_gas,s) = seds_prod('gas',s);
y0_s_(in_oil,s) = seds_prod('crude',s);
y0_s_(in_ngd,s) = (seds_q('gas','res',s) + seds_q('gas','com',s))  ;
y0_s_(in_refine,s) = refinery_oil_input_share(s)*refiner_oil_input;
y0_s_(in_td,s) = sum(sec,seds_ex('elec',sec,s));
y0_s_(in_gen,s) = elec_gen(in_gen,s);


elec_cons_db(s) = sum(sec,seds_ex('elec',sec,s));
elec_gen_db(s) = sum(in_gen,elec_gen(in_gen,s));


y0_s(n,s) = sum(in, mapind(in,n) * y0_s_(in,s));

display
elec_cons
elec_cons_db
elec_gen_tot
elec_gen_db
;




y0_sh(n,s) = y0_s(n,s)/sum(ss,y0_s(n,ss));
l0_s(n,s) = sum(in,mapind(in,n) * l0_s_(in,s));
l0_sh(n,s) = l0_s(n,s)/sum(ss,l0_s(n,ss));


* ------------------------------------------------------------------------------
* Use SEDS data to alter FGD for energy goods; disaggregate FGD
* ------------------------------------------------------------------------------

parameter
pce0_s
pce0_sh
pce0s
pfi0_s
pfi0_sh
pfi0s
g_fed0_s
g_fed0_sh
g_fed0s
g_reg0_s
g_reg0_sh
g_reg0s
;


PCE0_s_(in_oil,s) = 0;
PCE0_s_(in_gas,s) = 0;
PCE0_s_(in_coal,s) = 0;
PCE0_s_(in_gen,s) = 0;
PCE0_s_(in_td,s) = seds_ex('elec','res',s) + seds_ex('elec','trans',s);
PCE0_s_(in_ngd,s) = seds_ex('gas','res',s);
PCE0_s_(in_refine,s) = seds_ex('ref','res',s) + trans_res_share*seds_ex('ref','trans',s);

PCE0_s(n,s) = sum(in, mapind(in,n) * pce0_s_(in,s));

pce0_sh(n,s)$(pce00(n) > 0) = pce0_s(n,s)/sum(ss,pce0_s(n,ss));
pce0s(n,s) = pce00(n)*pce0_sh(n,s);

pfi0_s_(in_oil,s) = 0;
pfi0_s_(in_gas,s) = 0;
pfi0_s_(in_coal,s) = 0;
pfi0_s_(in_gen,s) = 0;
pfi0_s_(in_td,s) = 0;
pfi0_s_(in_ngd,s) = 0;
pfi0_s_(in_refine,s) = 0;

pfi0_s(n,s) = sum(in, mapind(in,n) * pfi0_s_(in,s));

pfi0_sh(n,s)$(pfi00(n) > 0) = pfi0_s(n,s)/sum(ss,pfi0_s(n,ss));
pfi0s(n,s) = pfi00(n)*pfi0_sh(n,s);


g_fed0_s_(in_oil,s) = 0;
g_fed0_s_(in_gas,s) = 0;
g_fed0_s_(in_coal,s) = 0;
g_fed0_s_(in_gen,s) = 0;
g_fed0_s_(in_td,s) = seds_ex('elec','com',s);
g_fed0_s_(in_ngd,s) = seds_ex('gas','com',s);
g_fed0_s_(in_refine,s) = seds_ex('ref','trans',s);

g_fed0_s(n,s) = sum(in, mapind(in,n) * g_fed0_s_(in,s));

g_fed0_sh(n,s)$(g_fed00(n) > 0) = g_fed0_s(n,s)/sum(ss,g_fed0_s(n,ss));
g_fed0s(n,s) = g_fed00(n)*g_fed0_sh(n,s);


g_reg0_s_(in_oil,s) = 0;
g_reg0_s_(in_gas,s) = 0;
g_reg0_s_(in_coal,s) = 0;
g_reg0_s_(in_gen,s) = 0;
g_reg0_s_(in_td,s) = seds_ex('elec','com',s);
g_reg0_s_(in_ngd,s) = seds_ex('gas','com',s);
g_reg0_s_(in_refine,s) = seds_ex('ref','trans',s);

g_reg0_s(n,s) = sum(in, mapind(in,n) * g_reg0_s_(in,s));

g_reg0_sh(n,s)$(g_reg00(n) > 0) = g_reg0_s(n,s)/sum(ss,g_reg0_s(n,ss));
g_reg0s(n,s) = g_reg00(n)*g_reg0_sh(n,s);


* ------------------------------------------------------------------------------
* Use SEDS data to alter intermediate inputs of energy goods by state
* ------------------------------------------------------------------------------

parameters
IO0_s
IO0_sh
IO0s
;

IO0s(n,nn,s) = IO00(n,nn)*Y0_sh(nn,s);


IO0s(n_coal,n_ind,s) = IO00(n_coal,n_ind)*seds_ex('coal','ind',s)/sum(ss,seds_ex('coal','ind',ss));
IO0s(n_coal,n_com,s) = IO00(n_coal,n_com)*seds_ex('coal','com',s)/sum(ss,seds_ex('coal','com',ss));
IO0s(n_coal,n_gen,s) = IO00(n_coal,n_gen)*seds_ex('coal','ep',s)/sum(ss,seds_ex('coal','ep',ss));
IO0s(n_coal,n_refine,s) = IO00(n_coal,n_refine)*refinery_oil_input_share(s);

IO0s(n_oil,n_oil,s) = IO00(n_oil,n_oil)*seds_prod('crude',s)/sum(ss,seds_prod('crude',ss));
IO0s(n_oil,n_refine,s) = refinery_oil_input_share(s)*IO00(n_oil,n_refine);

IO0s(n_gas,n_ind,s) = IO00(n_gas,n_ind)*seds_ex('gas','ind',s)/sum(ss,seds_ex('gas','ind',ss));
IO0s(n_gas,n_gas,s) = IO00(n_gas,n_gas)*seds_prod('gas',s)/sum(ss,seds_prod('gas',ss));
IO0s(n_gas,n_gen,s) = IO00(n_gas,n_gen)*seds_ex('gas','ep',s)/sum(ss,seds_ex('gas','ep',ss));
IO0s(n_gas,n_ngd,s) = IO00(n_gas,n_ngd)*((seds_q('gas','res',s) + seds_q('gas','com',s))/sum(ss,seds_q('gas','res',ss) + seds_q('gas','com',ss)));
IO0s(n_gas,n_refine,s) = refinery_gas_input_share(s)*IO00(n_gas,n_refine);
IO0s(n_gas,n_trans,s) = IO00(n_gas,n_trans)*seds_ex('gas','trans',s)/sum(ss,seds_ex('gas','trans',ss));



IO0s(n_ngd,n_com,s) = IO00(n_ngd,n_com)*seds_ex('gas','com',s)/sum(ss,seds_ex('gas','com',ss));

IO0s(n_gen,n_td,s) = IO00(n_gen,n_td)*Y0_s(n_gen,s)/sum(ss,Y0_s(n_gen,ss)) ;

IO0s(n_td,n_ind,s) = IO00(n_td,n_ind)*seds_ex('elec','ind',s)/sum(ss,seds_ex('elec','ind',ss));
IO0s(n_td,n_com,s) = IO00(n_td,n_com)*seds_ex('elec','com',s)/sum(ss,seds_ex('elec','com',ss));
IO0s(n_td,n_refine,s) = refinery_oil_input_share(s)*IO00(n_td,n_refine) ;


IO0s(n_refine,n_ind,s) = IO00(n_refine,n_ind)*seds_ex('ref','ind',s)/sum(ss,seds_ex('ref','ind',ss));
IO0s(n_refine,n_coal,s) = IO00(n_refine,n_coal)*seds_prod('coal',s)/sum(ss,seds_prod('coal',ss));
IO0s(n_refine,n_refine,s) = refinery_oil_input_share(s)*IO00(n_refine,n_refine);
IO0s(n_refine,n_gen,s) = IO00(n_refine,n_gen)*seds_ex('ref','ep',s)/sum(ss,seds_ex('ref','ep',ss));
IO0s(n_refine,n_td,s) = IO00(n_refine,n_td)*seds_ex('ref','ep',s)/sum(ss,seds_ex('ref','ep',ss));
IO0s(n_refine,n_com,s) = IO00(n_refine,n_com)*seds_ex('ref','com',s)/sum(ss,seds_ex('ref','com',ss));
IO0s(n_refine,n_trans,s) = IO00(n_refine,n_trans)*seds_ex('ref','trans',s)/sum(ss,seds_ex('ref','trans',ss));


seds_ex('gas','ind',s) = sum(n_gas,(sum(n_ind,IO0s(n_gas,n_ind,s)) + sum(n_gas2,IO0s(n_gas,n_gas2,s)) + sum(n_refine,IO0s(n_gas,n_refine,s)) )*(1+sum(margins,io00_mr(n_gas,margins))) ) ;
seds_q('gas','ind',s) = seds_ex('gas','ind',s)/seds_p00('gas','ind');

mu_sector_q_('gas','ind') = esector00_('gas','ind')/sum(s,seds_q('gas','ind',s));

seds_ex('gas','trans',s) = sum(n_trans,sum(n_gas,IO0s(n_gas,n_trans,s)*(1+sum(margins,io00_mr(n_gas,margins)))));
seds_q('gas','trans',s) = seds_ex('gas','trans',s)/seds_p00('gas','trans');

mu_sector_q_('gas','trans') = esector00_('gas','trans')/sum(s,seds_q('gas','trans',s));

seds_ex('ref','ind',s) = sum(n_refine, (sum(n_ind,IO0s(n_refine,n_ind,s)) + sum(n_refine2,IO0s(n_refine,n_refine2,s)) + sum(n_coal,IO0s(n_refine,n_coal,s)) )*(1+sum(margins,io00_mr(n_refine,margins))) ) ;
seds_q('ref','ind',s) = seds_ex('ref','ind',s)/seds_p00('ref','ind');


mu_sector_q_('ref','ind') = esector00_('ref','ind')/sum(s,seds_q('ref','ind',s));


* ------------------------------------------------------------------------------

* ------------------------------------------------------------------------------
* Disaggregate columns of SAM using output shares only
* ------------------------------------------------------------------------------

parameters
IOM0s(n,nn,s)
L0s(n,s)
K0s(n,s)
GOS0s(n,s)
GOS0s_db(n,s)
TOPI0s(n,s)
NR0s(n,s)
NRP0s(n,s)
Y0s(n,s)
Y0s_db
GY_FED0s(n,s)
GY_REG0s(n,s)
GY0s_db
;

NR0s(n,s) = NR00(n)*y0_sh(n,s);
NRP0s(n,s) = NRP00(n)*y0_sh(n,s);
IOM0s(nn,n,s) = sum(margins,io00_mr(nn,margins)*IO0s(nn,n,s));
L0s(n,s) = L00(n)*y0_sh(n,s);
K0s(n,s) = K00(n)*y0_sh(n,s);
GOS0s(n,s) = GOS00(n)*y0_sh(n,s);
TOPI0s(n,s) = TOPI00(n)*y0_sh(n,s);



Y0s(n,s) = L0s(n,s)*(1+tau_p00) + GOS0s(n,s) + TOPI0s(n,s) + sum(nn,IO0s(nn,n,s)+IOM0s(nn,n,s)) + NRP0s(n,s);
Y0s_db(n,s) = Y00(n)*y0_sh(n,s) - Y0s(n,s);

IO0s(n_gen,n_td,s) = Y0s(n_gen,s);


GOS0s(n,s) = Y0s(n,s) - L0s(n,s)*(1+tau_p00) - TOPI0s(n,s) - sum(nn,IO0s(nn,n,s)+IOM0s(nn,n,s)) - NRP0s(n,s) ;

GOS0s_db(n,s) = GOS00(n)*y0_sh(n,s) - GOS0s(n,s);

GY_FED0s(n,s)$(GY_FED00(n) > 0) = GY_FED00(n)*(sum(in, mapind(in,n) * gy_fed0_s_(in,s)))/(sum(ss,sum(in, mapind(in,n) * gy_fed0_s_(in,ss))));
GY_REG0s(n,s)$(GY_REG00(n) > 0)  = GY_REG00(n)*(sum(in, mapind(in,n) * gy_reg0_s_(in,s)))/(sum(ss,sum(in, mapind(in,n) * gy_reg0_s_(in,ss))));
GY0s_db(n) = GY_FED00(n) + GY_REG00(n) - sum(s,GY_FED0s(n,s)+GY_REG0s(n,s));

display
Y0s_db
GOS0s_db
GY0s_db
;

parameters
k0s
ks0s_db
ibar0s_db
;

K0s(n,s) = (1-tau_k00-tau_kr00)*GOS0s(n,s)/(rbar0 + (1-tau_k00-tau_kr00)*delta00);
ks0s_db(n) = sum(s,k0s(n,s))- K00(n);
ibar0s_db(s) = sum(n,delta00*k0s(n,s)) - sum(n,PFI0s(n,s)*(1+sum(margins,pfi00_mr(n,margins))));

display
ks0s_db
ibar0s_db
;

pfi0s(n,s) = pfi00(n)*sum(nn,k0s(nn,s))/sum(nn,k00(nn));

ibar0s_db(s) = sum(n,delta00*k0s(n,s)) - sum(n,PFI0s(n,s)*(1+sum(margins,pfi00_mr(n,margins))));

display
k0s
ks0s_db
ibar0s_db
;



* ------------------------------------------------------------------------------
* Calculate margin demands/supply based by state
* ------------------------------------------------------------------------------

parameter
md0s(margins,n,s)
MY0s(n,s)
MY0s_bn
;

md0s(margins,n,s) = pce00_mr(n,margins)*pce0s(n,s) + pfi00_mr(n,margins)*pfi0s(n,s)
+g_fed00_mr(n,margins)*g_fed0s(n,s) + g_reg00_mr(n,margins)*g_reg0s(n,s) + io00_mr(n,margins)*sum(nn,IO0s(n,nn,s));

MY0s(n,s) = sum(margins,map_mr00(n,margins) * sum(nn,md0s(margins,nn,s)));

MY0s_bn(n,s) =MY00(n)*(sum(margins,sum(nn,md0s(margins,nn,s))))/(sum(margins,sum(nn,sum(ss,md0s(margins,nn,ss)))));

display
MY0s
MY0s_bn
;

* ------------------------------------------------------------------------------
* Calculate foreign exports and imports by state
* ------------------------------------------------------------------------------


parameter
ex0_s
ex0_sh
ex0s
ex0s_db
rex0s
;

EX0_s_(in_coal,s) = EX0_(in_coal)*(y0_s_(in_coal,s)/sum(ss,y0_s_(in_coal,ss)));
EX0_s_(in_oil,s) = EX0_(in_oil)*(y0_s_(in_oil,s)/sum(ss,y0_s_(in_oil,ss)));
EX0_s_(in_gas,s) = EX0_(in_gas)*(y0_s_(in_gas,s)/sum(ss,y0_s_(in_gas,ss)));
EX0_s_(in_ngd,s) = EX0_(in_ngd)*(y0_s_(in_ngd,s)/sum(ss,y0_s_(in_ngd,ss)));
EX0_s_(in_refine,s) = EX0_(in_refine)*(y0_s_(in_refine,s)/sum(ss,y0_s_(in_refine,ss)));
EX0_s_(in_td,s) = 0;
EX0_s_(in_gen,s) = 0;

ex0_s(n,s) = sum(in, mapind(in,n) * ex0_s_(in,s));

ex0_sh(n,s)$(ex00(n) > 0) = ex0_s(n,s)/sum(ss,ex0_s(n,ss));

ex0s(n,s) = ex00(n)*ex0_sh(n,s);
ex0s_db(n) = sum(s,ex0s(n,s)) - ex00(n);
rex0s(n,s)$(y0s(n,s)+gy_fed0s(n,s)+gy_reg0s(n,s) - ex0s(n,s) < 0) = ex0s(n,s) - (y0s(n,s)+gy_fed0s(n,s)+gy_reg0s(n,s));

display
ex0s
ex0s_db
rex0s
;



parameter
im0_s
im0_sh
xf0_s

;
im0_s(n,s) = sum(in, mapind(in,n) * im0_s_(in,s));
im0_sh(n,s)$(im00(n) > 0) = im0_s(n,s)/sum(ss,im0_s(n,ss));
xf0_s(n,s) = im0_s(n,s)/sum(in, mapind(in,n) * G0_s_(in,s));

xf0_s(n_td,s) = 0;
xf0_s(n_gen,s) = 0;

display
xf0_s
;

parameters
g0s(n,s)
g0s_d(n,s)
g0s_f(n,s)
im0s_db
im0tot
im0s
im0s_bn
g0s_db(n)
g0s_d_db(n)
;


g0s(n,s) = pce0s(n,s) + pfi0s(n,s) + g_fed0s(n,s) + g_reg0s(n,s) + sum(nn,IO0s(n,nn,s));

g0s_f(n,s) = g0s(n,s)*xf0_s(n,s);

im0tot(n) = sum(s,g0s_f(n,s));
im0s(n,s) = (g0s_f(n,s)/im0tot(n))*im00(n);
im0s_bn(n,s) = im00(n)*(g0s(n,s)/sum(ss,g0s(n,ss)));

xf0_s(n,s)$(g0s(n,s) > 0) = im0s(n,s)/g0s(n,s);
g0s_f(n,s) = g0s(n,s)*xf0_s(n,s);
g0s_d(n,s) = g0s(n,s)*(1-xf0_s(n,s));
im0tot(n) = sum(s,im0s(n,s));
im0s_db(n) = im0tot(n) - im00(n);

g0s_db(n) = sum(s,g0s(n,s)) - g00(n);
g0s_d_db(n) = sum(s,g0s_d(n,s)) - g00_d(n);


display
im0s
im0s_bn
im0s_db
xf0_s
g0s_db
g0s_d_db
;


* ------------------------------------------------------------------------------
* Calculate domestic exports and imports by state
* ------------------------------------------------------------------------------

parameter
tbal0s
exd0s_net
exd0s_gen
;


exd0s_net(n,s) = y0s(n,s)+gy_fed0s(n,s)+gy_reg0s(n,s) - ex0s(n,s) - my0s(n,s) - g0s_d(n,s);
tbal0s(n) = sum(s,exd0s_net(n,s));

exd0s_gen(n_gen,s) = y0s(n_gen,s) - g0s_d(n_gen,s);

display
tbal0s
exd0s_net
exd0s_gen
;

parameter
ddt1(n,s)
ddt2(n,s)
ddt(n,s)
imd0_s
xd0_s
xr0_s
g0s_dr
g0s_dn
xr0s
xd0s


exd0s
exd0s_db
mc0s_db
my0s_db
tbal_td
tbal_td_es
exd0es
mc0es_db
g0_td_es
g0_dr_td_es

;


ddt1(n,s) = g0s_d(n,s);
ddt2(n,s) = y0s(n,s)+gy_fed0s(n,s)+gy_reg0s(n,s) - ex0s(n,s) ;
ddt(n,s) = min(ddt1(n,s),ddt2(n,s));

imd0_s(n,s) = sum(in, mapind(in,n) * imd0_s_(in,s));
xd0_s(n,s) = imd0_s(n,s)/sum(in, mapind(in,n) * G0_D_s_(in,s));
xd0_s(n,s)$(y0s(n,s) + gy_fed0s(n,s) + gy_reg0s(n,s) = 0) = 1;
xr0_s(n,s) = 1 - xd0_s(n,s);

g0s_dr(n,s) = xr0_s(n,s)*ddt(n,s);
xr0s(n,s)$(g0s_d(n,s) > 0 ) = g0s_dr(n,s)/g0s_d(n,s);
xd0s(n,s) = 1 - xr0s(n,s);
g0s_dn(n,s) = g0s_d(n,s) - g0s_dr(n,s);

* National Fossil Fuel Markets

g0s_dn(n_ff,s) = g0s_d(n_ff,s);
g0s_dr(n_ff,s) = 0;
xr0s(n_ff,s) = 0;
xd0s(n_ff,s) = 1;

* Own-region generation only

g0s_dn(n_gen,s) = 0;
g0s_dr(n_gen,s) = g0s_d(n_gen,s);
xr0s(n_gen,s) = 1;
xd0s(n_gen,s) = 0;

* T/D trade

g0s_dr(n_td,s)$(elec_dexports_(s) > 0) = g0s_d(n_td,s);
g0s_dn(n_td,s)$(elec_dexports_(s) > 0) = 0;
xr0s(n_td,s)$(elec_dexports_(s) > 0) = 1;
xd0s(n_td,s)$(elec_dexports_(s) > 0) = 0;

g0s_dr(n_td,s)$(elec_dimports_(s) > 0) = ddt2(n_td,s);
g0s_dn(n_td,s)$(elec_dimports_(s) > 0) = g0s_d(n_td,s) - g0s_dr(n_td,s);
xr0s(n_td,s)$(elec_dimports_(s) > 0) = g0s_dr(n_td,s)/g0s_d(n_td,s);
xd0s(n_td,s)$(elec_dimports_(s) > 0) = g0s_dn(n_td,s)/g0s_d(n_td,s);

g0s_dr(n_td,s)$(elec_dimports_(s) = 0 and elec_dexports_(s) = 0) = g0s_d(n_td,s);
g0s_dn(n_td,s)$(elec_dimports_(s) = 0 and elec_dexports_(s) = 0) = 0;
xr0s(n_td,s)$(elec_dimports_(s) = 0 and elec_dexports_(s) = 0)  = 1;
xd0s(n_td,s)$(elec_dimports_(s) = 0 and elec_dexports_(s) = 0)  = 0;

exd0s(n,s)$(my00(n) = 0) = ddt2(n,s) - g0s_dr(n,s);

mc0s_db(n,s)$(my00(n) = 0) = y0s(n,s)+gy_fed0s(n,s)+gy_reg0s(n,s) - ex0s(n,s) - exd0s(n,s) - g0s_dr(n,s);


exd0s_db(n)$(my00(n) > 0) = sum(s,ddt2(n,s) - g0s_dr(n,s));


exd0s(n,s)$(my00(n) > 0) = (ddt2(n,s) - g0s_dr(n,s))*(1-my00(n)/exd0s_db(n));
my0s(n,s)$(my00(n) > 0) = (ddt2(n,s) - g0s_dr(n,s)) - exd0s(n,s);
my0s_db(n) = sum(s,my0s(n,s)) - my00(n);

mc0s_db(n,s)$(my00(n) > 0) = y0s(n,s)+gy_fed0s(n,s)+gy_reg0s(n,s) - ex0s(n,s) - exd0s(n,s) - g0s_dr(n,s) - my0s(n,s);

tbal_td = sum(n_td,sum(s,g0s_dn(n_td,s))) - sum(n_td,sum(s,exd0s(n_td,s)));

tbal_td_es(es) = sum(s,mapes(s,es)*sum(n_td,g0s_dn(n_td,s))) - sum(s,mapes(s,es)*sum(n_td,exd0s(n_td,s)));

* Update labor for three states to get perfect interconnect trade balance


scalar m; m = 0;
scalar mflg; mflg = 0;


while( (m<15) ,
m = m+1;

L0s(n_td,'s5') = L0s(n_td,'s5') + tbal_td_es('es3');
L0s(n_td,'s44') = L0s(n_td,'s44') + tbal_td_es('es2');
L0s(n_td,'s33') = L0s(n_td,'s33') + tbal_td_es('es1');

Y0s(n_td,s) = L0s(n_td,s)*(1+tau_p00) + GOS0s(n_td,s) + TOPI0s(n_td,s) + sum(nn,IO0s(nn,n_td,s)+IOM0s(nn,n_td,s)) + NRP0s(n_td,s);
GOS0s(n_td,s) = Y0s(n_td,s) - L0s(n_td,s)*(1+tau_p00) - TOPI0s(n_td,s) - sum(nn,IO0s(nn,n_td,s)+IOM0s(nn,n_td,s)) - NRP0s(n_td,s) ;


exd0s(n_td,s) = Y0s(n_td,s) - g0s_dr(n_td,s);
tbal_td_es(es) = sum(s,mapes(s,es)*sum(n_td,g0s_dn(n_td,s))) - sum(s,mapes(s,es)*sum(n_td,exd0s(n_td,s)));
mflg = smax(es,tbal_td_es(es));

);



exd0es(es) = - tbal_td_es(es);

mc0es_db(es) = sum(s,mapes(s,es)*sum(n_td,g0s_dn(n_td,s))) - sum(s,mapes(s,es)*sum(n_td,exd0s(n_td,s))) + exd0es(es);

g0_td_es(es) = sum(s,mapes(s,es)*sum(n_td,g0s_d(n_td,s)));
g0_dr_td_es(es) = sum(s,mapes(s,es)*sum(n_td,g0s_dr(n_td,s))) + sum(s,mapes(s,es)*sum(n_td,exd0s(n_td,s))) ;

display
ddt1
ddt2
ddt
xr0s
exd0s
g0s_d
my00
exd0s_db
my0s_db
mc0s_db
tbal_td
tbal_td_es
exd0es
mc0es_db
g0_td_es
g0_dr_td_es
exd0s
*mr0s
;

* ------------------------------------------------------------------------------
* Government variables
* ------------------------------------------------------------------------------


parameters
gtrans_fed0s(*)
gtrans_reg0s(*)
ggrant0s(*)

lg_fed0s
lg_reg0s
;

gtrans_fed0s(s) = gtrans_fed00*(gtrans_fed0_s__(s)/sum(ss,gtrans_fed0_s__(ss)));
gtrans_reg0s(s) = gtrans_reg00*(gtrans_reg0_s__(s)/sum(ss,gtrans_reg0_s__(ss)));
ggrant0s(s) = ggrant00*(ggrant0_s__(s)/sum(ss,ggrant0_s__(s)));

lg_fed0s(s) = LG_FED00*(lg_fed0_s__(s)/sum(ss,lg_fed0_s__(ss)));
lg_reg0s(s) = LG_reg00*(lg_reg0_s__(s)/sum(ss,lg_reg0_s__(ss)));

* ------------------------------------------------------------------------------
* Verify state budget constraints
* ------------------------------------------------------------------------------

parameters

kdep0s
xkinc0s
prof0s

cbar0s
ibar0s
gbar_fed0s
gbar_reg0s

gexp_fed0s
gexp_reg0s

grev_fed0s
grev_reg0s
glump_fed0s
glump_reg0s

bop0s
adj0s
adj0s_sum
LS0s
bc0s
bc0s_db

;




KDEP0s(n,s) = ((delta00+gr)*K0s(n,s))/(gr+deltat00);
XKINC0s(n,s) = GOS0s(n,s);

PROF0s(n,s) = (1-tau_k00-tau_kr00)*XKINC0s(n,s) + (tau_k00+tau_kr00)*deltat00*KDEP0s(n,s) - (delta00+gr)*K0s(n,s);

CBAR0s(s) = sum(n,PCE0s(n,s)*(1+sum(margins,pce00_mr(n,margins))));
IBAR0s(s) = sum(n,PFI0s(n,s)*(1+sum(margins,pfi00_mr(n,margins))));
GBAR_FED0s(n,s) = G_FED0s(n,s)*(1+sum(margins,g_fed00_mr(n,margins)));
GBAR_REG0s(n,s) = G_REG0s(n,s)*(1+sum(margins,g_reg00_mr(n,margins)));


gexp_fed0s(s) = LG_FED0s(s)*(1+tau_p00) + sum(n,GBAR_FED0s(n,s)) + GGRANT0s(s) + GTRANS_FED0s(s);
gexp_reg0s(s) = LG_REG0s(s)*(1+tau_p00) + sum(n,GBAR_REG0s(n,s)) + GTRANS_REG0s(s);

GREV_FED0s(s) = (tau_l00 + tau_p00)*(sum(n,L0s(n,s)) + LG_FED0s(s) + LG_REG0s(s))  +  sum(n,tau_k00*XKINC0s(n,s)) - sum(n,tau_k00*deltat00*KDEP0s(n,s)) + sum(n,GY_FED0s(n,s));
GREV_REG0s(s) = (tau_lr00)*(sum(n,L0s(n,s))  + LG_FED0s(s) + LG_REG0s(s)) + sum(n,tau_kr00*XKINC0s(n,s)) - sum(n,tau_kr00*deltat00*KDEP0s(n,s)) + sum(n,TOPI0s(n,s))  + sum(n,GY_REG0s(n,s)) + GGRANT0s(s) ;

GLUMP_FED0s(s) = LG_FED0s(s)*(1+tau_p00) + sum(n,GBAR_FED0s(n,s)) + GGRANT0s(s) + GTRANS_FED0s(s) - GREV_FED0s(s);
GLUMP_REG0s(s) = GEXP_REG0s(s) - GREV_REG0s(s);



bop0s(s) = sum(n,im0s(n,s)) - sum(n,ex0s(n,s));
ADJ0s(s) = sum(n,G0s_DN(n,s))-sum(n,exd0s(n,s));
adj0s_sum = sum(s,ADJ0s(s));


LS0s(s) = sum(n,L0s(n,s)) + LG_FED0s(s) + LG_REG0s(s);

bc0s(s) = (1-tau_l00-tau_lr00)*LS0s(s) + sum(n,PROF0s(n,s)+NRP0s(n,s)) + GTRANS_FED0s(s) + GTRANS_REG0s(s) + BOP0s(s) + ADJ0s(s) - CBAR0s(s) - GLUMP_FED0s(s) - GLUMP_REG0s(s) + sum(n,sum(margins,md0s(margins,n,s))) - sum(n,my0s(n,s))   ;

bc0s_db(s) = ibar0s(s) - sum(n,delta00*K0s(n,s));

display
adj0s
adj0s_sum
bop0s
bc0s
bc0s_db
ibar0s_db
glump_fed0s
glump_reg0s
;


* ------------------------------------------------------------------------------
* Define population shares
* ------------------------------------------------------------------------------

parameter
popshare_import(s_seds)
;


$CALL GDXXRW.EXE import_popshare.xlsx par=popshare_import rng=A1:B51 rdim = 1 cdim=0




$GDXIN import_popshare.gdx
$onUNDF
$LOAD popshare_import
$GDXIN



parameter
hhtot_(*)
hh_share_(*)
;


hhtot_(s) = sum(s_seds,popshare_import(s_seds)*mapstate(s_seds,s));
hh_share_(s) = hhtot_(s);

* ------------------------------------------------------------------------------
* Emissions Factors
* ------------------------------------------------------------------------------


parameter
esector00s(fuel,sec,s)
esector0s
esector_db_ss
esector_db_s
mu_sector_s
mu_sector_q_s
mu_s
muc_s
mug_s
seds_ex_db_s
;

esector00s(fuel,sec,s) = esector00_s_(fuel,sec,s);

mu_sector_q_s(fuel,sec,s)$(seds_q(fuel,sec,s) > 0) = esector00s(fuel,sec,s)/seds_q(fuel,sec,s);

mu_sector_s(fuel,sec,s)$(seds_ex(fuel,sec,s) gt 0) = esector00s(fuel,sec,s)/seds_ex(fuel,sec,s);


mu_s(n,nn,s) = 0;
muc_s(n,s) = 0;
mug_s(n,s) = 0;


* Natural Gas
mu_s(n_gas,n_ind2,s) = mu_sector_s('gas','ind',s);
mu_s(n_gas,n_gen_gas,s) = mu_sector_s('gas','ep',s);
mu_s(n_gas,n_ngd,s) = 0;
mu_s(n_gas,n_trans,s) = mu_sector_s('gas','trans',s);

* Coal
mu_s(n_coal,n_ind2,s) = mu_sector_s('coal','ind',s);
mu_s(n_coal,n_gen_coal,s) = mu_sector_s('coal','ep',s);
mu_s(n_coal,n_com,s) = mu_sector_s('coal','com',s);

* Natural Gas Distribution
mu_s(n_ngd,n_com,s) = mu_sector_s('gas','com',s);
muc_s(n_ngd,s) = mu_sector_s('gas','res',s);
mug_s(n_ngd,s) = mu_sector_s('gas','com',s);

* Refined Products
mu_s(n_refine,n_ind2,s) = mu_sector_s('ref','ind',s);
mu_s(n_refine,n_gen_gas,s) = mu_sector_s('ref','ep',s);
mu_s(n_refine,n_com,s) = mu_sector_s('ref','com',s);
mu_s(n_refine,n_trans,s) = mu_sector_s('ref','trans',s);
muc_s(n_refine,s) = (seds_ex('ref','res',s)/PCE0s(n_refine,s)*(1+sum(margins,pce00_mr(n_refine,margins))))*mu_sector_s('ref','res',s) + (1-(seds_ex('ref','res',s)/PCE0s(n_refine,s)*(1+sum(margins,pce00_mr(n_refine,margins)))))*mu_sector_s('ref','trans',s);
mug_s(n_refine,s) = mu_sector_s('ref','trans',s);



esector0s('coal','res',s) = 0;
esector0s('coal','com',s) = sum(n_coal,sum(n_com,mu_s(n_coal,n_com,s)*IO0s(n_coal,n_com,s)*(1+sum(margins,io00_mr(n_coal,margins))))*1000);
esector0s('coal','ind',s) = sum(n_coal,sum(n_ind2,mu_s(n_coal,n_ind2,s)*IO0s(n_coal,n_ind2,s)*(1+sum(margins,io00_mr(n_coal,margins))))*1000);
esector0s('coal','trans',s) = 0;
esector0s('coal','ep',s) = sum(n_coal,sum(n_gen,mu_s(n_coal,n_gen,s)*IO0s(n_coal,n_gen,s)*(1+sum(margins,io00_mr(n_coal,margins))))*1000);

esector0s('gas','res',s) = sum(n_ngd,muc_s(n_ngd,s)*PCE0s(n_ngd,s)*(1+sum(margins,pce00_mr(n_ngd,margins)))*1000);
esector0s('gas','com',s) = sum(n_ngd,sum(n_com,mu_s(n_ngd,n_com,s)*IO0s(n_ngd,n_com,s)*(1+sum(margins,io00_mr(n_ngd,margins))))*1000 + mug_s(n_ngd,s)*(G_FED0s(n_ngd,s)*(1+sum(margins,g_fed00_mr(n_ngd,margins)))+G_REG0s(n_ngd,s)*(1+sum(margins,g_reg00_mr(n_ngd,margins))))*1000);
esector0s('gas','ind',s) = sum(n_gas,sum(n_ind2,mu_s(n_gas,n_ind2,s)*IO0s(n_gas,n_ind2,s)*(1+sum(margins,io00_mr(n_gas,margins))))*1000);
esector0s('gas','trans',s) = sum(n_gas,sum(n_trans,mu_s(n_gas,n_trans,s)*IO0s(n_gas,n_trans,s)*(1+sum(margins,io00_mr(n_gas,margins))))*1000);
esector0s('gas','ep',s) = sum(n_gas,sum(n_gen,mu_s(n_gas,n_gen,s)*IO0s(n_gas,n_gen,s)*(1+sum(margins,io00_mr(n_gas,margins))))*1000);

esector0s('ref','res',s) = (seds_ex('ref','res',s)/sum(n_refine,PCE0s(n_refine,s)*(1+sum(margins,pce00_mr(n_refine,margins)))))*mu_sector_('ref','res')*sum(n_refine,PCE0s(n_refine,s)*(1+sum(margins,pce00_mr(n_refine,margins)))*1000);
esector0s('ref','com',s) = sum(n_refine,sum(n_com,mu_s(n_refine,n_com,s)*IO0s(n_refine,n_com,s)*(1+sum(margins,io00_mr(n_refine,margins))))*1000);
esector0s('ref','ind',s) = sum(n_refine,sum(n_ind2,mu_s(n_refine,n_ind2,s)*IO0s(n_refine,n_ind2,s)*(1+sum(margins,io00_mr(n_refine,margins))))*1000) ;
esector0s('ref','trans',s) = sum(n_refine,sum(n_trans,mu_s(n_refine,n_trans,s)*IO0s(n_refine,n_trans,s)*(1+sum(margins,io00_mr(n_refine,margins))))*1000) + (1-(seds_ex('ref','res',s)/sum(n_refine,PCE0s(n_refine,s)*(1+sum(margins,pce00_mr(n_refine,margins))))))*mu_sector_s('ref','trans',s)*sum(n_refine,PCE0s(n_refine,s)*(1+sum(margins,pce00_mr(n_refine,margins)))*1000) + sum(n_refine,mug_s(n_refine,s)*(G_FED0s(n_refine,s)*(1+sum(margins,g_fed00_mr(n_refine,margins)))+G_REG0s(n_refine,s)*(1+sum(margins,g_reg00_mr(n_refine,margins))))*1000) ;
esector0s('ref','ep',s) = sum(n_refine,sum(n_gen,mu_s(n_refine,n_gen,s)*IO0s(n_refine,n_gen,s)*(1+sum(margins,io00_mr(n_refine,margins))))*1000);


esector_db_s(fuel,sec) = sum(s,esector00s(fuel,sec,s))*1000 - sum(s,esector0s(fuel,sec,s));
esector_db_ss(fuel,sec) = sum(s,esector00s(fuel,sec,s)*1000) ;
seds_ex_db_s('gas','ind',s) = sum(n_ind2, sum(n_gas,io0s(n_gas,n_ind2,s)*(1+sum(margins,io00_mr(n_gas,margins)))*1000)) - sum(n_ngd, sum(n_gas,io0s(n_gas,n_ngd,s)*(1+sum(margins,io00_mr(n_gas,margins)))*1000)) - seds_ex('gas','ind',s)*1000;


seds_ex_db_s('ref','ind',s) = sum(n_refine, (sum(n_ind,IO0s(n_refine,n_ind,s)) + sum(n_refine2,IO0s(n_refine,n_refine2,s)) + sum(n_coal,IO0s(n_refine,n_coal,s)) )*(1+sum(margins,io00_mr(n_refine,margins))) )  - sum(n_refine,sum(n_ind2,IO0s(n_refine,n_ind2,s)*(1+sum(margins,io00_mr(n_refine,margins))))) ;

display
esector0s
esector_db_s
esector_db_ss
esector00_
seds_ex_db_s
seds_ex00
IO00
seds_ex
;

display
esector_db_s
mu_sector_
mu_sector_s
mu_sector_q_
mu_sector_q_s
;
