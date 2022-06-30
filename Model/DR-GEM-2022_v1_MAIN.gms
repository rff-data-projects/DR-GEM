$TITLE Dynamic Regional General Equilibrium Model -- DR-GEM

* ------------------------------------------------------------------------------
* Marc Hafstead, YG Chen, Luis Fernandez Intriago
* June 30, 2022
*
* Model and Data Version 1.0
*
* Four year time steps
* Base case only
* Data forthcoming
*       code for use with IMPLAN proprietary data (without data) included
* Program is not executable due to lack of data input
* ------------------------------------------------------------------------------

options decimals = 4;

sets
        t "time periods" /t1*t36/
        tfirst(t) "First time period"
        tlast(t) "Final time period"
        tref(t) /t1/
        tpol(t) /t2*t36/
        tpol1(t) /t2*t6/
        tpol2(t) /t7*t36/
        tfirstpol(tpol)
        tlastpol(tpol)
;

tfirst(t) = yes$(ord(t) eq 1);
tfirstpol(tpol) = yes$(ord(tpol) eq 1);
tlast(t) = yes$(ord(t) eq card(t));
tlastpol(tpol) = yes$(ord(tpol) eq card(tpol));


scalar
pl "period length" /4/
nt "number of periods" /36/
ipol "First period of policy implementation" /2/
ipol2 "Last Period for carbon price increases" /6/
;



* ------------------------------------------------------------------------------
* Step 1: Build the full national dataset
* Note: DR-GEM_datainput_complete.gms includes a missing file because it
*   includes proprietary data that is not open source
* ------------------------------------------------------------------------------

$INCLUDE DR-GEM_datainput_complete.gms


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

* This step currently includes a missing file because it requires proprietary data
*   that is not open source


sets
s "states" /s1*s51/
;
alias(s,ss)
alias(s,sss)

scalar
ns " Number of states" /51/
;


$INCLUDE DR-GEM_load_implan_51.gms

$INCLUDE DR-GEM_impose_51.gms

$INCLUDE DR-GEM_SEDS_51_import.gms

$INCLUDE DR-GEM_disagg_51.gms


* ------------------------------------------------------------------------------
* Step 4: Choose model aggregation
* This file should be modified as required.
* Current aggregation: 18 industries, four regions
* ------------------------------------------------------------------------------

$INCLUDE DR-GEM_aggregation_i22_r4.gms


* ------------------------------------------------------------------------------
* Step 5: Calibrate model
* ------------------------------------------------------------------------------

$INCLUDE DR-GEM_elasticities.gms

$INCLUDE DR-GEM_calibrate_v1.gms

*--------------------------------------------------------------------------
* Step 6: Solve benchmark model; confirm benchmark data replication
* ------------------------------------------------------------------------------


* Define reference case parameters
* Note: In version 1.0, there are no changes to the reference case parameters
*       this implies the reference case is the projection of benchmark levels

parameters
nr_ss
nr

pf_ss
pf

gammax_ss
gammax

alphact_ss
alphacu_ss
alphacv_ss
alphact
alphacu
alphacv

alphae1_ss
alphae2_ss
alphae_e1_ss
alphae_e2_ss
alphav_e_ss
alphav_m_ss
alphae1
alphae2
alphae_e1
alphae_e2
alphav_e
alphav_m

g_fed_ss
g_reg_ss
g_fed
g_reg

;

nr(i,r,t) = nr0(i,r);
nr_ss(i,r) = nr0(i,r);
pf_ss(i) = 1;
pf(i,t) = 1;

gammax_ss(i,r) = gammax0(i,r);
gammax(i,r,t) = gammax0(i,r);

alphact_ss(cju,cjt,r) = alphact0(cju,cjt,r);
alphacu_ss(cjv,cju,r) = alphacu0(cjv,cju,r);
alphacv_ss(j,cjv,r) = alphacv0(j,cjv,r);
alphact(cju,cjt,r,t) = alphact0(cju,cjt,r);
alphacu(cjv,cju,r,t) = alphacu0(cjv,cju,r);
alphacv(j,cjv,r,t) = alphacv0(j,cjv,r);

alphae1_ss(ie1,i,r) = alphae10(ie1,i,r);
alphae2_ss(ie2,i,r) = alphae20(ie2,i,r);
alphae_e1_ss(i,r) = alphae_e10(i,r);
alphae_e2_ss(i,r) = alphae_e20(i,r);
alphav_e_ss(i,r) = alphav_e0(i,r);
alphav_m_ss(i,r) = alphav_m0(i,r);
alphae1(ie1,i,r,t) = alphae10(ie1,i,r);
alphae2(ie2,i,r,t) = alphae20(ie2,i,r);
alphae_e1(i,r,t) = alphae_e10(i,r);
alphae_e2(i,r,t) = alphae_e20(i,r);
alphav_e(i,r,t) = alphav_e0(i,r);
alphav_m(i,r,t) = alphav_m0(i,r);

g_fed_ss(i,r) = g_fed0(i,r);
g_reg_ss(i,r) = g_reg0(i,r);
g_fed(i,r,t) = g_fed0(i,r);
g_reg(i,r,t) = g_reg0(i,r);

* Define carbon tax parameters

parameters
p_e_fed_ss
p_e_fed(*)
p_e_reg_ss(*)
p_e_reg(*,*)

muc_fed "Federal coverage of direct household energy consumption"
mug_fed "Federal coverage of direct government energy consumption"
mu_fed "Federal coverage of direct industry energy consumption"

muc_reg "Regional coverage of direct household energy consumption"
mug_reg "Regional coverage of direct government energy consumption"
mu_reg "Regional coverage of direct industry energy consumption"
;

p_e_fed_ss = 0;
p_e_fed(t) = 0;
p_e_reg_ss(r) = 0;
p_e_reg(r,t) = 0;

muc_fed(j) = 1;
mug_fed(i) = 1;
mu_fed(i,ii) = 1;

muc_reg(j,r) = 1;
mug_reg(i,r) = 1;
mu_reg(i,ii,r) = 1;


$INCLUDE DR-GEM_modelcode_v1.gms
DR_GEM_FULL_LUMP.optfile = 1;



* Numeraire is wage in region 1
w_ss.fx('r1') = 1;
w.fx('r1',t) = 1;


* Define benchmark debugging parameters

parameter
mc_l_db_ss
mc_y_db_ss
mc_ny_db_ss
mc_my_db_ss
mc_ey_db_ss
mc_f_db_ss
bc_db_ss
mc_l_db
mc_y_db
mc_ny_db
mc_my_db
mc_ey_db
mc_f_db
bc_db
kdiff
;




* Solve Base Case in zero iterations

crebate_fed_ss.fx(r) = 0;
crebate_reg_ss.fx(r) = 0;
ggrant_ss.fx(r) = ggrant0(r);

crebate_fed.fx(r,t) = 0;
crebate_reg.fx(r,t) = 0;
ggrant.fx(r,t) = ggrant0(r);


options iterlim = 0;



solve DR_GEM_SS_LUMP using mcp   ;

mc_l_db_ss(r) = ls_ss.l(r) - sum(i,l_ss.l(i,r)) - lg_fed0(r) - lg_reg0(r);
mc_y_db_ss(i,r) = ry_ss.l(i,r) - g_dr_ss.l(i,r);
mc_ny_db_ss(i)$(not i_td(i)) = sum(r,ny_ss.l(i,r)) - sum(r,g_dn_ss.l(i,r)) ;
mc_my_db_ss(i) = sum(r,my_ss.l(i,r)) - sum(r,sum(margins,map_mr(i,margins)*dm_ss.l(margins,r))) ;
mc_ey_db_ss(er) = sum(i_td,sum(r,maper(r,er)*ey_ss.l(i_td,r)) - sum(r,maper(r,er)*g_dn_ss.l(i_td,r)));
bc_db_ss(r) =  wbar_ss.l(r)*ls_ss.l(r) + sum(i,prof_ss.l(i,r)+pr_ss.l(i,r)*nr_ss(i,r))
+ sum(i,(pf_ss(i)/exch_ss.l)*(im0(i,r) - ex0(i,r))) + sum(i_nt,pn_ss.l(i_nt)*(g0_dn(i_nt,r) - exd0(i_nt,r))) + sum(i,pmy_ss.l(i)*(sum(margins,map_mr(i,margins)*dm0(margins,r)) - my0(i,r)))
 +sum(er,maper(r,er)*pe_ss.l(er))*(sum(i_td,g0_dn(i_td,r)) - sum(i_td,exd0(i_td,r)))
 + gtrans_fed0(r) + gtrans_reg0(r) - glump_fed_ss.l(r) - glump_reg_ss.l(r) - pbar_ss.l(r)*cbar_ss.l(r) ;
mc_f_db_ss = sum(r,sum(i,(pf_ss(i)/exch_ss.l)*(im0(i,r)-ex0(i,r)))) + sum(r,sum(i,(pf_ss(i)/exch_ss.l)*(ex_ss.l(i,r)-g_f_ss.l(i,r))));

display
mc_l_db_ss
mc_y_db_ss
mc_ny_db_ss
mc_my_db_ss
mc_ey_db_ss
mc_f_db_ss
bc_db_ss
;

* Note: the test of solving the full model in zero iterations will fail.
*   The residual, however, is very small -3.7e-06 and the model will solve with only 1 crash iteration.

options iterlim = 1;

solve DR_GEM_FULL_LUMP using mcp;

mc_l_db_ss(r) = ls_ss.l(r) - sum(i,l_ss.l(i,r)) - lg_fed0(r) - lg_reg0(r);
mc_y_db_ss(i,r) = ry_ss.l(i,r) - g_dr_ss.l(i,r);
mc_ny_db_ss(i)$(not i_td(i)) = sum(r,ny_ss.l(i,r)) - sum(r,g_dn_ss.l(i,r)) ;
mc_my_db_ss(i) = sum(r,my_ss.l(i,r)) - sum(r,sum(margins,map_mr(i,margins)*dm_ss.l(margins,r))) ;
mc_ey_db_ss(er) = sum(i_td,sum(r,maper(r,er)*ey_ss.l(i_td,r)) - sum(r,maper(r,er)*g_dn_ss.l(i_td,r)));
bc_db_ss(r) =  wbar_ss.l(r)*ls_ss.l(r) + sum(i,prof_ss.l(i,r)+pr_ss.l(i,r)*nr_ss(i,r))
+ sum(i,(pf_ss(i)/exch_ss.l)*(im0(i,r) - ex0(i,r))) + sum(i_nt,pn_ss.l(i_nt)*(g0_dn(i_nt,r) - exd0(i_nt,r))) + sum(i,pmy_ss.l(i)*(sum(margins,map_mr(i,margins)*dm0(margins,r)) - my0(i,r)))
 +sum(er,maper(r,er)*pe_ss.l(er))*(sum(i_td,g0_dn(i_td,r)) - sum(i_td,exd0(i_td,r)))
 + gtrans_fed0(r) + gtrans_reg0(r) - glump_fed_ss.l(r) - glump_reg_ss.l(r) - pbar_ss.l(r)*cbar_ss.l(r) ;
mc_f_db_ss = sum(r,sum(i,(pf_ss(i)/exch_ss.l)*(im0(i,r)-ex0(i,r)))) + sum(r,sum(i,(pf_ss(i)/exch_ss.l)*(ex_ss.l(i,r)-g_f_ss.l(i,r))));

mc_l_db(r,t) = ls.l(r,t) - sum(i,l.l(i,r,t)) - lg_fed0(r) - lg_reg0(r);
mc_y_db(i,r,t) = ry.l(i,r,t) - g_dr.l(i,r,t);
mc_ny_db(i,t)$(not i_td(i)) = sum(r,ny.l(i,r,t)) - sum(r,g_dn.l(i,r,t));
mc_my_db(i,t) = sum(r,my.l(i,r,t)) - sum(r,sum(margins,map_mr(i,margins)*dm.l(margins,r,t))) ;
mc_ey_db(er,t) = sum(i_td,sum(r,maper(r,er)*ey.l(i_td,r,t)) - sum(r,maper(r,er)*g_dn.l(i_td,r,t)));
bc_db(r,t) =  wbar.l(r,t)*ls.l(r,t) + sum(i,prof.l(i,r,t)+pr.l(i,r,t)*nr(i,r,t))
+ sum(i,(pf(i,t)/exch.l(t))*(im0(i,r) - ex0(i,r))) + sum(i_nt,pn.l(i_nt,t)*(g0_dn(i_nt,r) - exd0(i_nt,r))) + sum(i,pmy.l(i,t)*(sum(margins,map_mr(i,margins)*dm0(margins,r)) - my0(i,r)))
 +sum(er,maper(r,er)*pe.l(er,t))*(sum(i_td,g0_dn(i_td,r)) - sum(i_td,exd0(i_td,r)))
 + cpi.l(t)*gtrans_fed0(r) + cpi.l(t)*gtrans_reg0(r) - cpi.l(t)*glump_fed.l(r,t) - cpi.l(t)*glump_reg.l(r,t) - pbar.l(r,t)*cbar.l(r,t) ;
mc_f_db(t) = sum(r,sum(i,(pf(i,t)/exch.l(t))*(im0(i,r) - ex0(i,r)))) + sum(r,sum(i,(pf(i,t)/exch.l(t))*(ex.l(i,r,t)-g_f.l(i,r,t)))) ;


display
mc_l_db_ss
mc_y_db_ss
mc_ny_db_ss
mc_my_db_ss
mc_ey_db_ss
mc_f_db_ss
bc_db_ss
mc_l_db
mc_y_db
mc_ny_db
mc_my_db
mc_ey_db
mc_f_db
bc_db

;




* ------------------------------------------------------------------------------
* Step 7: Save Reference Case Output and Fix Non-Policy Periods
* ------------------------------------------------------------------------------

parameter
seds_q_ref
esector_ref
trans_hh_ref

;


seds_q_ref('ref','ep',r,t) = sum(i_gen,sum(i_refine,(IO.l(i_refine,i_gen,r,t)*(1+sum(margins,io0_mr(i_refine,i_gen,margins,r))))))/seds_p0('ref','ep',r);
seds_q_ref('gas','ep',r,t) = sum(i_gen,sum(i_gas,(IO.l(i_gas,i_gen,r,t)*(1+sum(margins,io0_mr(i_gas,i_gen,margins,r))))))/seds_p0('gas','ep',r);
seds_q_ref('coal','ep',r,t) = sum(i_gen,sum(i_coal,(IO.l(i_coal,i_gen,r,t)*(1+sum(margins,io0_mr(i_coal,i_gen,margins,r))))))/seds_p0('coal','ep',r);
seds_q_ref('elec','res',r,t) = (sum(j_elec,cg.l(j_elec,r,t)))/seds_p0('elec','res',r);
seds_q_ref('elec','com',r,t) = (sum(i_com,sum(i_td,IO.l(i_td,i_com,r,t))) + sum(i_trade,sum(i_td,IO.l(i_td,i_trade,r,t))) + sum(i_td,G_FED(i_td,r,t)+G_REG(i_td,r,t)))/seds_p0('elec','com',r);
seds_q_ref('elec','ind',r,t) = sum(i_ind2,sum(i_td,(IO.l(i_td,i_ind2,r,t)*(1+sum(margins,io0_mr(i_td,i_ind2,margins,r))))))/seds_p0('elec','ind',r);


esector_ref('coal','res',r,t) = 0;
esector_ref('coal','com',r,t) = sum(i_coal,(sum(i_com,mu(i_coal,i_com,r)*((IO.l(i_coal,i_com,r,t))*(1+sum(margins,io0_mr(i_coal,i_com,margins,r))))) + sum(i_trade,mu(i_coal,i_trade,r)*((IO.l(i_coal,i_trade,r,t))*(1+sum(margins,io0_mr(i_coal,i_trade,margins,r))))))*1000);
esector_ref('coal','ind',r,t) = sum(i_coal,sum(i_ind2,mu(i_coal,i_ind2,r)*((IO.l(i_coal,i_ind2,r,t))*(1+sum(margins,io0_mr(i_coal,i_ind2,margins,r)))))*1000);
esector_ref('coal','trans',r,t) = 0;
esector_ref('coal','ep',r,t) = sum(i_coal,sum(i_gen,mu(i_coal,i_gen,r)*((IO.l(i_coal,i_gen,r,t))*(1+sum(margins,io0_mr(i_coal,i_gen,margins,r)))))*1000);

esector_ref('gas','res',r,t) = sum(j_ngd,muc(j_ngd,r)*(cg.l(j_ngd,r,t))*1000);
esector_ref('gas','com',r,t) = sum(i_ngd,(sum(i_com,mu(i_ngd,i_com,r)*(IO.l(i_ngd,i_com,r,t)))+ sum(i_trade,mu(i_ngd,i_trade,r)*(IO.l(i_ngd,i_trade,r,t))))*1000 + mug(i_ngd,r)*(G_FED(i_ngd,r,t)+G_REG(i_ngd,r,t))*1000);
esector_ref('gas','ind',r,t) = sum(i_gas,sum(i_ind2,mu(i_gas,i_ind2,r)*((IO.l(i_gas,i_ind2,r,t))*(1+sum(margins,io0_mr(i_gas,i_ind2,margins,r)))))*1000);
esector_ref('gas','trans',r,t) = sum(i_gas,sum(i_trans,mu(i_gas,i_trans,r)*((IO.l(i_gas,i_trans,r,t))*(1+sum(margins,io0_mr(i_gas,i_trans,margins,r)))))*1000);
esector_ref('gas','ep',r,t) = sum(i_gas,sum(i_gen,mu(i_gas,i_gen,r)*((IO.l(i_gas,i_gen,r,t))*(1+sum(margins,io0_mr(i_gas,i_gen,margins,r)))))*1000);

esector_ref('ref','res',r,t) = sum(j_fueloil,muc(j_fueloil,r)*cg.l(j_fueloil,r,t)*1000);
esector_ref('ref','com',r,t) = sum(i_refine,(sum(i_com,mu(i_refine,i_com,r)*((IO.l(i_refine,i_com,r,t))*(1+sum(margins,io0_mr(i_refine,i_com,margins,r))))) + sum(i_trade,mu(i_refine,i_trade,r)*((IO.l(i_refine,i_trade,r,t))*(1+sum(margins,io0_mr(i_refine,i_refine,margins,r))))))*1000);
esector_ref('ref','ind',r,t) = sum(i_refine,sum(i_ind2,mu(i_refine,i_ind2,r)*((IO.l(i_refine,i_ind2,r,t))*(1+sum(margins,io0_mr(i_refine,i_ind2,margins,r)))))*1000) + sum(i_oil,sum(i_ind2,mu(i_oil,i_ind2,r)*((IO.l(i_oil,i_ind2,r,t))*(1+sum(margins,io0_mr(i_oil,i_ind2,margins,r)))))*1000);
esector_ref('ref','trans',r,t) = sum(i_refine,sum(i_trans,mu(i_refine,i_trans,r)*((IO.l(i_refine,i_trans,r,t))*(1+sum(margins,io0_mr(i_refine,i_trans,margins,r)))))*1000) + sum(j_mvf,muc(j_mvf,r)*cg.l(j_mvf,r,t)*1000) + sum(i_refine,mug(i_refine,r)*G_FED(i_refine,r,t)*(1+sum(margins,g_fed0_mr(i_refine,margins,r)))*1000) + sum(i_refine,mug(i_refine,r)*G_REG(i_refine,r,t)*(1+sum(margins,g_reg0_mr(i_refine,margins,r)))*1000) ;
esector_ref('ref','ep',r,t) = sum(i_refine,sum(i_gen,mu(i_refine,i_gen,r)*((IO.l(i_refine,i_gen,r,t))*(1+sum(margins,io0_mr(i_refine,i_gen,margins,r)))))*1000);


trans_hh_ref('elec',r,t) = sum(trans_sec,seds_q_ref('elec',trans_sec,r,t));
trans_hh_ref('ref',r,t) = sum(j_mvf,cg.l(j_mvf,r,t));






$INCLUDE DR-GEM_welfare.gms

if(ipol > 1,

p.fx(i,r,tref) = p.l(i,r,tref);
pn.fx(i,tref) = pn.l(i,tref);
pmy.fx(i,tref) = pmy.l(i,tref);
exch.fx(tref) = exch.l(tref);
w.fx(r,tref) = w.l(r,tref);
rbar.fx(r,tref) = rbar.l(r,tref);
rbarn.fx(r,tref) = rbarn.l(r,tref);
lambda.fx(r,tref) = lambda.l(r,tref);
lambdak.fx(i,r,tref) = lambdak.l(i,r,tref);

pbar.fx(r,tref) = pbar.l(r,tref);
pkbar.fx(r,tref) = pkbar.l(r,tref);
wbar.fx(r,tref) = wbar.l(r,tref);
pd.fx(i,r,tref) = pd.l(i,r,tref);
pg.fx(i,r,tref) = pg.l(i,r,tref);
py.fx(i,r,tref) = py.l(i,r,tref);
pc.fx(i,r,tref) = pc.l(i,r,tref);
pi.fx(i,r,tref) = pi.l(i,r,tref);
pgf.fx(i,r,tref) = pgf.l(i,r,tref);
pgr.fx(i,r,tref) = pgr.l(i,r,tref);
pio.fx(i,ii,r,tref) = pio.l(i,ii,r,tref);
pm.fx(margins,r,tref) = pm.l(margins,r,tref);
pr.fx(i,r,tref) = pr.l(i,r,tref);
cp.fx(j,r,tref) = cp.l(j,r,tref);
cpv.fx(cjv,r,tref) = cpv.l(cjv,r,tref);
cpumlot.fx(cju,r,tref) = cpumlot.l(cju,r,tref);
cptilde.fx(cjt,r,tref) = cptilde.l(cjt,r,tref);
cphat.fx(cj,r,tref) = cphat.l(cj,r,tref);
ppi.fx(tref) = ppi.l(tref);
cpi.fx(tref) = cpi.l(tref);

cbar.fx(r,tref) = cbar.l(r,tref);
leis.fx(r,tref) = leis.l(r,tref);
ls.fx(r,tref) = ls.l(r,tref);

crev_fed.fx(r,tref) = 0;
crebate_fed.fx(r,tref) = 0;
grev_fed.fx(r,tref) = grev_fed.l(r,tref);
grev_reg.fx(r,tref) = grev_reg.l(r,tref);
glump_fed.fx(r,tref) = glump_fed.l(r,tref);
glump_reg.fx(r,tref) = glump_reg.l(r,tref);
ggrant.fx(r,tref) = ggrant.l(r,tref);


c_cv.fx(j,cjv,r,tref) = c_cv.l(j,cjv,r,tref);
cv_cumlot.fx(cjv,cju,r,tref) = cv_cumlot.l(cjv,cju,r,tref);
cumlot_ctilde.fx(cju,cjt,r,tref) = cumlot_ctilde.l(cju,cjt,r,tref);
ctilde_chat.fx(cjt,cj,r,tref) = ctilde_chat.l(cjt,cj,r,tref);
chat_cbar.fx(cj,r,tref) = chat_cbar.l(cj,r,tref);
cg.fx(j,r,tref) = cg.l(j,r,tref);
cons.fx(i,r,tref) = cons.l(i,r,tref);
pce.fx(i,r,tref) = pce.l(i,r,tref);
ibar.fx(r,tref) = ibar.l(r,tref);
inv.fx(i,r,tref) = inv.l(i,r,tref);
pfi.fx(i,r,tref) = pfi.l(i,r,tref);
g.fx(i,r,tref) = g.l(i,r,tref);
g_d.fx(i,r,tref) = g_d.l(i,r,tref);
g_f.fx(i,r,tref) = g_f.l(i,r,tref);
g_dn.fx(i,r,tref) = g_dn.l(i,r,tref);
g_dr.fx(i,r,tref) = g_dr.l(i,r,tref);
dm.fx(margins,r,tref) = dm.l(margins,r,tref);


cost_e1.fx(ii,rr,tref) = cost_e1.l(ii,rr,tref);
io_ie1.fx(ie1,ii,rr,tref) = io_ie1.l(ie1,ii,rr,tref);
cost_e2.fx(ii,rr,tref) = cost_e2.l(ii,rr,tref);
io_ie2.fx(ie2,ii,rr,tref) = io_ie2.l(ie2,ii,rr,tref);
cost_e.fx(ii,rr,tref) = cost_e.l(ii,rr,tref);
io_e1e.fx(ii,rr,tref) = io_e1e.l(ii,rr,tref);
io_e2e.fx(ii,rr,tref) = io_e2e.l(ii,rr,tref);
cost_m.fx(ii,rr,tref) = cost_m.l(ii,rr,tref);
io_im.fx(im,ii,rr,tref) = io_im.l(im,ii,rr,tref);
cost_l.fx(ii,rr,tref) = cost_l.l(ii,rr,tref);
cost_v.fx(ii,rr,tref) = cost_v.l(ii,rr,tref);
io_ev.fx(ii,rr,tref) = io_ev.l(ii,rr,tref);
io_mv.fx(ii,rr,tref) = io_mv.l(ii,rr,tref);
cost_w.fx(ii,rr,tref) = cost_w.l(ii,rr,tref);
io_lw.fx(ii,rr,tref) = io_lw.l(ii,rr,tref);
io_vw.fx(ii,rr,tref) = io_vw.l(ii,rr,tref);
cost_k.fx(ii,rr,tref) = cost_k.l(ii,rr,tref);
cost_x.fx(ii,rr,tref) = cost_x.l(ii,rr,tref);
io_wx.fx(ii,rr,tref) = io_wx.l(ii,rr,tref);
cost_f.fx(ii,rr,tref) = cost_f.l(ii,rr,tref);
io_ff.fx(i,ii,rr,tref) = io_ff.l(i,ii,rr,tref);
cost_z.fx(ii,rr,tref) = cost_z.l(ii,rr,tref);
io_zy.fx(i_nf,rr,tref) = io_zy.l(i_nf,rr,tref);

zz.fx(ii,rr,tref) = zz.l(ii,rr,tref);
xx.fx(ii,rr,tref) = xx.l(ii,rr,tref);
ff.fx(ii,rr,tref) = ff.l(ii,rr,tref);
ww.fx(ii,rr,tref) = ww.l(ii,rr,tref);
l.fx(ii,rr,tref) = l.l(ii,rr,tref);
io.fx(i,ii,rr,tref) = io.l(i,ii,rr,tref);
k.fx(ii,rr,tref) = k.l(ii,rr,tref);
xir.fx(ii,rr,tref) = xir.l(ii,rr,tref);
f_k.fx(ii,rr,tref) = f_k.l(ii,rr,tref);
acexp.fx(ii,rr,tref) = acexp.l(ii,rr,tref);
y.fx(ii,rr,tref) = y.l(ii,rr,tref);

ry.fx(ii,rr,tref) = ry.l(ii,rr,tref);
ny.fx(ii,rr,tref) = ny.l(ii,rr,tref);
ex.fx(ii,rr,tref) = ex.l(ii,rr,tref);
my.fx(ii,rr,tref) = my.l(ii,rr,tref);

xkinc.fx(ii,rr,tref) = xkinc.l(ii,rr,tref);
prof.fx(ii,rr,tref) = prof.l(ii,rr,tref);
dd.fx(rr,tref) = dd.l(rr,tref);
kdep.fx(ii,rr,tref) = kdep.l(ii,rr,tref);
v.fx(ii,rr,tref) = v.l(ii,rr,tref);

etot.fx(r,tref) = etot.l(r,tref);

);

* ------------------------------------------------------------------------------
* Step 8: Determine policy and run policy simulations
* ------------------------------------------------------------------------------


sets
it "Number of policy iterations" /it1*it5/ 
;

* Set region for carbon pricing policy coverage

sets
r_reg(r) /r4/
nr_reg(r) /r1*r3/
;


* Set price path 
parameter
p_e0
gr_ct
;


gr_ct = 1.02**(pl) - 1;

p_e0('it1') = 5;
p_e0('it2') = 10;
p_e0('it3') = 15;
p_e0('it4') = 20;
p_e0('it5') = 25;



loop(it,


$ontext
* US Federal Carbon Tax


p_e_fed_ss = p_e0(it)*(1+gr_ct)**(ipol2-ipol);
p_e_fed(tref) = 0;
p_e_fed(tpol1) = p_e0(it)*(1+gr_ct)**(ord(t)-ipol);
p_e_fed(tpol2) = p_e0(it)*(1+gr_ct)**(ipol2-ipol);


* Federal grants adjust to close regional government budget constraint

glump_fed_ss.fx(r) = glump_fed_ss.l(r);
glump_reg_ss.fx(r) = glump_reg_ss.l(r);
crebate_fed_ss.lo(r) = 0;
crebate_fed_ss.up(r) = 10;
crebate_reg_ss.fx(r) = 0;
ggrant_ss.lo(r) = 0;
ggrant_ss.up(r) = 10;

glump_fed.fx(r,t) = glump_fed.l(r,t);
glump_reg.fx(r,t) = glump_reg.l(r,t);
crebate_fed.lo(r,t) = 0;
crebate_fed.up(r,t) = 10;
crebate_reg.fx(r,t) = 0;
ggrant.lo(r,t) = 0;
ggrant.up(r,t) = 10;
$offtext

* Regional carbon tax

* Note: Regional lump-sum rebates adjust each period to balance govt budget constraint
* Note: Non-covered regions govts and federal govt adjust lump-sum taxes to balance govt budget constraint

p_e_reg_ss(r_reg) = p_e0(it)*(1+gr_ct)**(11-ipol);
p_e_reg(r_reg,tpol1(t)) =  p_e0(it)*(1+gr_ct)**(ord(t)-ipol);
p_e_reg(r_reg,tpol2(t)) = p_e0(it)*(1+gr_ct)**(ipol2-ipol);

glump_fed_ss.lo(r) = glump_fed0(r)-1;
glump_fed_ss.up(r) = glump_fed0(r)+1;
crebate_fed_ss.fx(r) = 0;

glump_reg_ss.fx(r_reg) = glump_reg_ss.l(r_reg);
crebate_reg_ss.lo(r_reg) = -0.05;
crebate_reg_ss.up(r_reg) = 10;

glump_reg_ss.lo(nr_reg) = glump_reg_ss.l(nr_reg)-0.5;
glump_reg_ss.up(nr_reg) = glump_reg_ss.l(nr_reg)+0.5;
crebate_reg_ss.fx(nr_reg) = 0;

ggrant_ss.fx(r) = ggrant_ss.l(r);


glump_fed.lo(r,t) = glump_fed0(r)-1;
glump_fed.up(r,t) = glump_fed0(r)+1;
crebate_fed.fx(r,t) = 0;

glump_reg.fx(r_reg,t) = glump_reg.l(r_reg,t);
crebate_reg.lo(r_reg,t) = 0;
crebate_reg.up(r_reg,t) = 10;

glump_reg.lo(nr_reg,t) = glump_reg0(nr_reg)-0.5;
glump_reg.up(nr_reg,t) = glump_reg0(nr_reg)+0.5;
crebate_reg.fx(nr_reg,t) = 0;

ggrant.fx(r,t) = ggrant.l(r,t);

cost_k.lo(i_gen,r,t) = .00001;


* Solve model and calculate debugging parameters


options iterlim = 1000;



solve DR_GEM_FULL_LUMP using mcp;



mc_l_db_ss(r) = ls_ss.l(r) - sum(i,l_ss.l(i,r)) - lg_fed0(r) - lg_reg0(r);
mc_y_db_ss(i,r) = ry_ss.l(i,r) - g_dr_ss.l(i,r);
mc_ny_db_ss(i)$(not i_td(i)) = sum(r,ny_ss.l(i,r)) - sum(r,g_dn_ss.l(i,r)) ;
mc_my_db_ss(i) = sum(r,my_ss.l(i,r)) - sum(r,sum(margins,map_mr(i,margins)*dm_ss.l(margins,r))) ;
mc_ey_db_ss(er) = sum(i_td,sum(r,maper(r,er)*ey_ss.l(i_td,r)) - sum(r,maper(r,er)*g_dn_ss.l(i_td,r)));
bc_db_ss(r) =  wbar_ss.l(r)*ls_ss.l(r) + sum(i,prof_ss.l(i,r)+pr_ss.l(i,r)*nr_ss(i,r))
+ sum(i,(pf_ss(i)/exch_ss.l)*(im0(i,r) - ex0(i,r))) + sum(i_nt,pn_ss.l(i_nt)*(g0_dn(i_nt,r) - exd0(i_nt,r))) + sum(i,pmy_ss.l(i)*(sum(margins,map_mr(i,margins)*dm0(margins,r)) - my0(i,r)))
 +sum(er,maper(r,er)*pe_ss.l(er))*(sum(i_td,g0_dn(i_td,r)) - sum(i_td,exd0(i_td,r)))
+ cpi_ss.l*crebate_fed_ss.l(r) + cpi_ss.l*crebate_reg_ss.l(r)
 + cpi_ss.l*gtrans_fed0(r) + cpi_ss.l*gtrans_reg0(r) - cpi_ss.l*glump_fed_ss.l(r) - cpi_ss.l*glump_reg_ss.l(r) - pbar_ss.l(r)*cbar_ss.l(r)  ;
mc_f_db_ss = sum(r,sum(i,(pf_ss(i)/exch_ss.l)*(im0(i,r)-ex0(i,r)))) + sum(r,sum(i,(pf_ss(i)/exch_ss.l)*(ex_ss.l(i,r)-g_f_ss.l(i,r))));

mc_l_db(r,t) = ls.l(r,t) - sum(i,l.l(i,r,t)) - lg_fed0(r) - lg_reg0(r);
mc_y_db(i,r,t) = ry.l(i,r,t) - g_dr.l(i,r,t);
mc_ny_db(i,t)$(not i_td(i)) = sum(r,ny.l(i,r,t)) - sum(r,g_dn.l(i,r,t));
mc_my_db(i,t) = sum(r,my.l(i,r,t)) - sum(r,sum(margins,map_mr(i,margins)*dm.l(margins,r,t))) ;
mc_ey_db(er,t) = sum(i_td,sum(r,maper(r,er)*ey.l(i_td,r,t)) - sum(r,maper(r,er)*g_dn.l(i_td,r,t)));
bc_db(r,t) =  wbar.l(r,t)*ls.l(r,t) + sum(i,prof.l(i,r,t)+pr.l(i,r,t)*nr(i,r,t))
+ sum(i,(pf(i,t)/exch.l(t))*(im0(i,r) - ex0(i,r))) + sum(i_nt,pn.l(i_nt,t)*(g0_dn(i_nt,r) - exd0(i_nt,r))) + sum(i,pmy.l(i,t)*(sum(margins,map_mr(i,margins)*dm0(margins,r)) - my0(i,r)))
 +sum(er,maper(r,er)*pe.l(er,t))*(sum(i_td,g0_dn(i_td,r)) - sum(i_td,exd0(i_td,r)))
+ cpi.l(t)*crebate_fed.l(r,t) + cpi.l(t)*crebate_reg.l(r,t)
 + cpi.l(t)*gtrans_fed0(r) + cpi.l(t)*gtrans_reg0(r) - cpi.l(t)*glump_fed.l(r,t) - cpi.l(t)*glump_reg.l(r,t) - pbar.l(r,t)*cbar.l(r,t) ;
mc_f_db(t) = sum(r,sum(i,(pf(i,t)/exch.l(t))*(im0(i,r) - ex0(i,r)))) + sum(r,sum(i,(pf(i,t)/exch.l(t))*(ex.l(i,r,t)-g_f.l(i,r,t)))) ;

kdiff(i,r,t)$(k0(i,r) > 0) = (k.l(i,r,t) - k_ss.l(i,r))/k_ss.l(i,r);


* Note: Market clearing conditions must be satisfied or there could be a Walras Law error
* Note: Check kdiff for convergence of capital state variablesto steady state levels

display
mc_l_db_ss
mc_y_db_ss
mc_ny_db_ss
mc_ey_db_ss
mc_my_db_ss
mc_f_db_ss
bc_db_ss
mc_l_db
mc_y_db
mc_ny_db
mc_my_db
mc_ey_db
mc_f_db
bc_db
kdiff
;



* ------------------------------------------------------------------------------
* Step 9: Calculate welfare and save policy outputs
* ------------------------------------------------------------------------------


disc_pol(r,tfirstpol(tpol)) = 1;
loop(tpol,
disc_pol(r,tpol)$(not tfirstpol(tpol)) = disc_pol(r,tpol-1)*(1+rbar.l(r,tpol-1));
);
disc_pol_ss(r,tlastpol) = disc_pol(r,tlastpol)*(1+rbar0);


cfull_ss_pol(r) = (cbar_ss.l(r)**((eta(r)-1)/(eta(r))) + (alpha_leis(r)**(1/eta(r)))*(leis_ss.l(r)**((eta(r)-1)/(eta(r)))))**(eta(r)/(eta(r)-1));
cfull_pol(r,t) = (cbar.l(r,t)**((eta(r)-1)/(eta(r))) + (alpha_leis(r)**(1/eta(r)))*(leis.l(r,t)**((eta(r)-1)/(eta(r)))))**(eta(r)/(eta(r)-1));
util_ss_pol(r) = (1/(1-sigma))*(cfull_ss_pol(r)/hhtot(r))**(1-sigma) ;
util_pol(r,t) = (1/(1-sigma))*(cfull_pol(r,t)/hhtot(r))**(1-sigma) ;
util_d_pol(r) =  sum(tpol,util_pol(r,tpol)*betat(tpol)) + ((util_ss_pol(r))*(beta**(nt+1-ipol)))/(1-udisc);


solve welfare using mcp;



pve(r) = sum(tpol,(etot.l(r,tpol))/disc(r,tpol)) +   (sum(tlastpol,(etot_ss.l(r))/disc_ss(r,tlastpol)))/(1-((1)/(1 + rbar0)));
pvreduce(r) = pve_ref(r)-pve(r);
pvreduce_pct(r,it) = 100*pvreduce(r)/pve_ref(r);
ev_reduce(r,it) = -1*ev.l(r)/pvreduce(r);
evtot_reduce(it) = sum(r,-1*ev.l(r))/sum(r,pvreduce(r));
ev_wealth(r,it) = 100*ev.l(r)/pvwealth_ref(r);

seds_q_pol('coal','res',r,t) = 0;
seds_q_pol('coal','com',r,t)$(seds_p0('coal','com',r) > 0) = sum(i_coal,(sum(i_com,((IO.l(i_coal,i_com,r,t)+IO_FF.l(i_coal,i_com,r,t))*(1+sum(margins,io0_mr(i_coal,i_com,margins,r))))) + sum(i_trade,((IO.l(i_coal,i_trade,r,t)+IO_FF.l(i_coal,i_trade,r,t))*(1+sum(margins,io0_mr(i_coal,i_trade,margins,r)))))))/seds_p0('coal','com',r);
seds_q_pol('coal','ind',r,t) = sum(i_coal,sum(i_ind2,((IO.l(i_coal,i_ind2,r,t)+IO_FF.l(i_coal,i_ind2,r,t))*(1+sum(margins,io0_mr(i_coal,i_ind2,margins,r))))))/seds_p0('coal','ind',r);
seds_q_pol('coal','trans',r,t) = 0;
seds_q_pol('coal','ep',r,t) = sum(i_coal,sum(i_gen,((IO.l(i_coal,i_gen,r,t)+IO_FF.l(i_coal,i_gen,r,t))*(1+sum(margins,io0_mr(i_coal,i_gen,margins,r))))))/seds_p0('coal','ep',r);


seds_q_pol('gas','res',r,t) = sum(j_ngd,(sum(i_ngd,gmaxp(i_ngd,j_ngd,r))*cg.l(j_ngd,r,t)))/seds_p0('gas','res',r);
seds_q_pol('gas','com',r,t) = sum(i_ngd,(sum(i_com,(IO.l(i_ngd,i_com,r,t)+IO_FF.l(i_ngd,i_com,r,t)))+ sum(i_trade,(IO.l(i_ngd,i_trade,r,t)+IO_FF.l(i_ngd,i_trade,r,t)))) + (G_FED(i_ngd,r,t)+G_REG(i_ngd,r,t)))/seds_p0('gas','com',r);
seds_q_pol('gas','ind',r,t) = sum(i_gas,sum(i_ind3,((IO.l(i_gas,i_ind3,r,t)+IO_FF.l(i_gas,i_ind3,r,t))*(1+sum(margins,io0_mr(i_gas,i_ind3,margins,r))))))/seds_p0('gas','ind',r)
    + sum(i_ngd,sum(i_ind2,((IO.l(i_ngd,i_ind2,r,t)+IO_FF.l(i_ngd,i_ind2,r,t))*(1+sum(margins,io0_mr(i_ngd,i_ind2,margins,r))))))/seds_p0('gas','ind',r) ;
seds_q_pol('gas','trans',r,t) = sum(i_gas,sum(i_trans,((IO.l(i_gas,i_trans,r,t)+IO_FF.l(i_gas,i_trans,r,t))*(1+sum(margins,io0_mr(i_gas,i_trans,margins,r))))))/seds_p0('gas','trans',r);
seds_q_pol('gas','ep',r,t) = sum(i_gas,sum(i_gen,((IO.l(i_gas,i_gen,r,t)+IO_FF.l(i_gas,i_gen,r,t))*(1+sum(margins,io0_mr(i_gas,i_gen,margins,r))))))/seds_p0('gas','ep',r);

seds_q_pol('ref','res',r,t) = sum(j_fueloil,sum(i_refine,gmaxp(i_refine,j_fueloil,r))*cg.l(j_fueloil,r,t))/seds_p0('ref','res',r);
seds_q_pol('ref','com',r,t) = sum(i_refine,(sum(i_com,((IO.l(i_refine,i_com,r,t)+IO_FF.l(i_refine,i_com,r,t))*(1+sum(margins,io0_mr(i_refine,i_com,margins,r))))) + sum(i_trade,((IO.l(i_refine,i_trade,r,t)+IO_FF.l(i_refine,i_trade,r,t))*(1+sum(margins,io0_mr(i_refine,i_refine,margins,r)))))))/seds_p0('ref','com',r);
seds_q_pol('ref','ind',r,t) = sum(i_refine,sum(i_ind2,((IO.l(i_refine,i_ind2,r,t)+IO_FF.l(i_refine,i_ind2,r,t))*(1+sum(margins,io0_mr(i_refine,i_ind2,margins,r))))))/seds_p0('ref','ind',r) ;
seds_q_pol('ref','trans',r,t) = (sum(i_refine,sum(i_trans,((IO.l(i_refine,i_trans,r,t)+IO_FF.l(i_refine,i_trans,r,t))*(1+sum(margins,io0_mr(i_refine,i_trans,margins,r)))))) + sum(j_mvf,cg.l(j_mvf,r,t)) + sum(i_refine,G_FED(i_refine,r,t)*(1+sum(margins,g_fed0_mr(i_refine,margins,r)))) + sum(i_refine,G_REG(i_refine,r,t)*(1+sum(margins,g_reg0_mr(i_refine,margins,r)))))/seds_p0('ref','trans',r) ;
seds_q_pol('ref','ep',r,t) = sum(i_refine,sum(i_gen,((IO.l(i_refine,i_gen,r,t)+IO_FF.l(i_refine,i_gen,r,t))*(1+sum(margins,io0_mr(i_refine,i_gen,margins,r))))))/seds_p0('ref','ep',r);

seds_q_pol('elec','res',r,t) = sum(j_elec,cg.l(j_elec,r,t))/seds_p0('elec','res',r);
seds_q_pol('elec','com',r,t) = (sum(i_com,sum(i_td,IO.l(i_td,i_com,r,t))) + sum(i_trade,sum(i_td,IO.l(i_td,i_trade,r,t))) + sum(i_td,G_FED(i_td,r,t)+G_REG(i_td,r,t)))/seds_p0('elec','com',r);
seds_q_pol('elec','ind',r,t) = (sum(i_ind2,sum(i_td,IO.l(i_td,i_ind2,r,t)*(1+sum(margins,io0_mr(i_td,i_ind2,margins,r))))))/seds_p0('elec','ind',r);
seds_q_pol('elec','trans',r,t) = (sum(j_mvelec,cg.l(j_mvelec,r,t)) )/seds_p0('elec','trans',r);



esector('coal','res',r,t) = 0;
esector('coal','com',r,t) = sum(i_coal,(sum(i_com,mu(i_coal,i_com,r)*((IO.l(i_coal,i_com,r,t))*(1+sum(margins,io0_mr(i_coal,i_com,margins,r))))) + sum(i_trade,mu(i_coal,i_trade,r)*((IO.l(i_coal,i_trade,r,t))*(1+sum(margins,io0_mr(i_coal,i_trade,margins,r))))))*1000);
esector('coal','ind',r,t) = sum(i_coal,sum(i_ind2,mu(i_coal,i_ind2,r)*((IO.l(i_coal,i_ind2,r,t))*(1+sum(margins,io0_mr(i_coal,i_ind2,margins,r)))))*1000);
esector('coal','manuf',r,t) = sum(i_coal,sum(i_ind,mu(i_coal,i_ind,r)*((IO.l(i_coal,i_ind,r,t)+IO_FF.l(i_coal,i_ind,r,t))*(1+sum(margins,io0_mr(i_coal,i_ind,margins,r)))))*1000);
esector('coal','refine',r,t) = sum(i_coal,sum(i_refine,mu(i_coal,i_refine,r)*((IO.l(i_coal,i_refine,r,t)+IO_FF.l(i_coal,i_refine,r,t))*(1+sum(margins,io0_mr(i_coal,i_refine,margins,r)))))*1000);
esector('coal','ag',r,t) = sum(i_coal,sum(i_ag,mu(i_coal,i_ag,r)*((IO.l(i_coal,i_ag,r,t)+IO_FF.l(i_coal,i_ag,r,t))*(1+sum(margins,io0_mr(i_coal,i_ag,margins,r)))))*1000);
esector('coal','cons',r,t) = sum(i_coal,sum(i_constr,mu(i_coal,i_constr,r)*((IO.l(i_coal,i_constr,r,t)+IO_FF.l(i_coal,i_constr,r,t))*(1+sum(margins,io0_mr(i_coal,i_constr,margins,r)))))*1000);
esector('coal','mine',r,t) = sum(i_coal,sum(i_mine,mu(i_coal,i_mine,r)*((IO.l(i_coal,i_mine,r,t)+IO_FF.l(i_coal,i_mine,r,t))*(1+sum(margins,io0_mr(i_coal,i_mine,margins,r)))))*1000);
esector('coal','trans',r,t) = 0;
esector('coal','ep',r,t) = sum(i_coal,sum(i_gen,mu(i_coal,i_gen,r)*((IO.l(i_coal,i_gen,r,t))*(1+sum(margins,io0_mr(i_coal,i_gen,margins,r)))))*1000);

esector('gas','res',r,t) = sum(j_ngd,muc(j_ngd,r)*(cg.l(j_ngd,r,t))*1000);
esector('gas','com',r,t) = sum(i_ngd,(sum(i_com,mu(i_ngd,i_com,r)*(IO.l(i_ngd,i_com,r,t)))+ sum(i_trade,mu(i_ngd,i_trade,r)*(IO.l(i_ngd,i_trade,r,t))))*1000 + mug(i_ngd,r)*(G_FED(i_ngd,r,t)+G_REG(i_ngd,r,t))*1000);
esector('gas','ind',r,t) = sum(i_gas,sum(i_ind2,mu(i_gas,i_ind2,r)*((IO.l(i_gas,i_ind2,r,t)+IO_FF.l(i_gas,i_ind2,r,t))*(1+sum(margins,io0_mr(i_gas,i_ind2,margins,r)))))*1000)+ sum(i_ngd,sum(i_ind2,mu(i_ngd,i_ind2,r)*((IO.l(i_ngd,i_ind2,r,t)+IO_FF.l(i_ngd,i_ind2,r,t))*(1+sum(margins,io0_mr(i_ngd,i_ind2,margins,r)))))*1000);
esector('gas','manuf',r,t) = sum(i_gas,sum(i_ind,mu(i_gas,i_ind,r)*((IO.l(i_gas,i_ind,r,t)+IO_FF.l(i_gas,i_ind,r,t))*(1+sum(margins,io0_mr(i_gas,i_ind,margins,r)))))*1000);
esector('gas','refine',r,t) = sum(i_gas,sum(i_refine,mu(i_gas,i_refine,r)*((IO.l(i_gas,i_refine,r,t)+IO_FF.l(i_gas,i_refine,r,t))*(1+sum(margins,io0_mr(i_gas,i_refine,margins,r)))))*1000);
esector('gas','ag',r,t) = sum(i_ngd,sum(i_ag,mu(i_ngd,i_ag,r)*((IO.l(i_ngd,i_ag,r,t)+IO_FF.l(i_ngd,i_ag,r,t))*(1+sum(margins,io0_mr(i_ngd,i_ag,margins,r)))))*1000);
esector('gas','cons',r,t) = sum(i_ngd,sum(i_constr,mu(i_ngd,i_constr,r)*((IO.l(i_ngd,i_constr,r,t)+IO_FF.l(i_ngd,i_constr,r,t))*(1+sum(margins,io0_mr(i_ngd,i_constr,margins,r)))))*1000);
esector('gas','mine',r,t) = sum(i_gas,sum(i_mine,mu(i_gas,i_mine,r)*((IO.l(i_gas,i_mine,r,t)+IO_FF.l(i_gas,i_mine,r,t))*(1+sum(margins,io0_mr(i_gas,i_mine,margins,r)))))*1000);
esector('gas','trans',r,t) = sum(i_gas,sum(i_trans,mu(i_gas,i_trans,r)*((IO.l(i_gas,i_trans,r,t))*(1+sum(margins,io0_mr(i_gas,i_trans,margins,r)))))*1000);
esector('gas','ep',r,t) = sum(i_gas,sum(i_gen,mu(i_gas,i_gen,r)*((IO.l(i_gas,i_gen,r,t))*(1+sum(margins,io0_mr(i_gas,i_gen,margins,r)))))*1000);

esector('ref','res',r,t) = sum(j_fueloil,muc(j_fueloil,r)*cg.l(j_fueloil,r,t)*1000);
esector('ref','com',r,t) = sum(i_refine,(sum(i_com,mu(i_refine,i_com,r)*((IO.l(i_refine,i_com,r,t))*(1+sum(margins,io0_mr(i_refine,i_com,margins,r))))) + sum(i_trade,mu(i_refine,i_trade,r)*((IO.l(i_refine,i_trade,r,t))*(1+sum(margins,io0_mr(i_refine,i_refine,margins,r))))))*1000);
esector('ref','ind',r,t) = sum(i_refine,sum(i_ind2,mu(i_refine,i_ind2,r)*((IO.l(i_refine,i_ind2,r,t))*(1+sum(margins,io0_mr(i_refine,i_ind2,margins,r)))))*1000) ;
esector('ref','manuf',r,t) = sum(i_refine,sum(i_ind,mu(i_refine,i_ind,r)*((IO.l(i_refine,i_ind,r,t)+IO_FF.l(i_refine,i_ind,r,t))*(1+sum(margins,io0_mr(i_refine,i_ind,margins,r)))))*1000) ;
esector('ref','refine',r,t) = sum(i_refine,sum(i_refine2,mu(i_refine,i_refine2,r)*((IO.l(i_refine,i_refine2,r,t)+IO_FF.l(i_refine,i_refine2,r,t))*(1+sum(margins,io0_mr(i_refine,i_refine2,margins,r)))))*1000) ;
esector('ref','ag',r,t) = sum(i_refine,sum(i_ag,mu(i_refine,i_ag,r)*((IO.l(i_refine,i_ag,r,t)+IO_FF.l(i_refine,i_ag,r,t))*(1+sum(margins,io0_mr(i_refine,i_ag,margins,r)))))*1000) ;
esector('ref','cons',r,t) = sum(i_refine,sum(i_constr,mu(i_refine,i_constr,r)*((IO.l(i_refine,i_constr,r,t)+IO_FF.l(i_refine,i_constr,r,t))*(1+sum(margins,io0_mr(i_refine,i_constr,margins,r)))))*1000) ;
esector('ref','mine',r,t) = sum(i_refine,sum(i_mine,mu(i_refine,i_mine,r)*((IO.l(i_refine,i_mine,r,t)+IO_FF.l(i_refine,i_mine,r,t))*(1+sum(margins,io0_mr(i_refine,i_mine,margins,r)))))*1000) ;
esector('ref','trans',r,t) = sum(i_refine,sum(i_trans,mu(i_refine,i_trans,r)*((IO.l(i_refine,i_trans,r,t))*(1+sum(margins,io0_mr(i_refine,i_trans,margins,r)))))*1000) + sum(j_mvf,muc(j_mvf,r)*cg.l(j_mvf,r,t)*1000) + sum(i_refine,mug(i_refine,r)*G_FED(i_refine,r,t)*(1+sum(margins,g_fed0_mr(i_refine,margins,r)))*1000) + sum(i_refine,mug(i_refine,r)*G_REG(i_refine,r,t)*(1+sum(margins,g_reg0_mr(i_refine,margins,r)))*1000) ;
esector('ref','ep',r,t) = sum(i_refine,sum(i_gen,mu(i_refine,i_gen,r)*((IO.l(i_refine,i_gen,r,t))*(1+sum(margins,io0_mr(i_refine,i_gen,margins,r)))))*1000);

esector_pct(it,fuel,sec,r,tpol1)$(esector_ref(fuel,sec,r,tpol1) > 0) = esector(fuel,sec,r,tpol1)/esector_ref(fuel,sec,r,tpol1)-1;

gdp(r,t) = sum(i,cons.l(i,r,t)*pc.l(i,r,t) + inv.l(i,r,t)*pi.l(i,r,t) + (g_fed(i,r,t)*(1+sum(margins,g_fed0_mr(i,margins,r))))*pgf.l(i,r,t) + (g_reg(i,r,t)*(1+sum(margins,g_reg0_mr(i,margins,r))))*pgr.l(i,r,t) + (ex.l(i,r,t)-g_f.l(i,r,t))*(pf(i,t)/exch.l(t)));
gdp_d(r,t) = sum(i,c0(i,r)*pc.l(i,r,t) + i0(i,r)*pi.l(i,r,t) + (g_fed0(i,r)*(1+sum(margins,g_fed0_mr(i,margins,r))))*pgf.l(i,r,t) + (g_reg0(i,r)*(1+sum(margins,g_reg0_mr(i,margins,r))))*pgr.l(i,r,t) + (ex0(i,r)-g0_f(i,r))*(pf(i,t)/exch.l(t)))/
sum(i,c0(i,r)*pc0(i,r) + i0(i,r)*pi0(i,r) + (g_fed0(i,r)*(1+sum(margins,g_fed0_mr(i,margins,r))))*pgf0(i,r) + (g_reg0(i,r)*(1+sum(margins,g_reg0_mr(i,margins,r))))*pgr0(i,r) + (ex0(i,r)-g0_f(i,r))*(pf0));
gdp_r(r,t) = gdp(r,t)/gdp_d(r,t);

gdp_r_pct(r,it,tpol1) = gdp_r(r,tpol1)/gdp_r_ref(r,tpol1) - 1;


display
ev_reduce
evtot_reduce
ev_wealth
pvreduce_pct
esector_pct



);




