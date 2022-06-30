$TITLE Dynamic CGE Model Welfare Calculations

* ------------------------------------------------------------------------------
* Step 1: Define welfare and post-simulation variables
* ------------------------------------------------------------------------------



parameter
pbar_ss_ref
wbar_ss_ref
pkbar_ss_ref
zval_ss_ref
zval_ss_pol
cfull_ss_ref
cfull_ss_pol
util_ss_ref
util_ss_pol

pbar_ref
wbar_ref
pkbar_ref
rbar_ref
rbarn_ref
disc
disc_ss
disc_r
disc_r_ss
betat
udisc
disc_p
disc_p_ss

zval_ref
zval_pol
cfull_ref
cfull_pol
util_ref
util_pol

pvwealth_ref
pvwealth_pol
util_d_ref
util_d_pol

esector
esector_pct
seds_q_pol

gdp_ref
gdp_d_ref
gdp_r_ref
gdp
gdp_d
gdp_r
gdp_r_pct

ev_reduce
evtot_reduce
ev_wealth

etot_ss_ref
etot_ref
pve_ref
pve
pvreduce
pvreduce_pct

disc_pol
disc_pol_ss
;





* Define reference case prices

pbar_ss_ref(r) = pbar_ss.l(r);
wbar_ss_ref(r) = wbar_ss.l(r);
pkbar_ss_ref(r) = pkbar_ss.l(r);

pbar_ref(r,t) = pbar.l(r,t);
wbar_ref(r,t) = wbar.l(r,t);
pkbar_ref(r,t) = pkbar.l(r,t);

* Define discount rates

rbarn_ref(r,t) = rbarn.l(r,t);
disc(r,tfirstpol(tpol)) = 1;
loop(tpol,
disc(r,tpol)$(not tfirstpol(tpol)) = disc(r,tpol-1)*(1+rbarn_ref(r,tpol-1));
);
disc_ss(r,tlastpol) = disc(r,tlastpol)*(1+rbarn0);

betat(tpol(t)) = beta**(ord(t)-ipol);

udisc = beta*(1+gr)**(1-sigma);


rbar_ref(r,t) = rbar.l(r,t);
disc_r(r,tfirstpol(tpol)) = 1;
loop(tpol,
disc_r(r,tpol)$(not tfirstpol(tpol)) = disc_r(r,tpol-1)*(1+rbar_ref(r,tpol-1));
);
disc_r_ss(r,tlastpol) = disc_r(r,tlastpol)*(1+rbar0);

* Calculate full expenditure and present value of reference case wealth


zval_ss_ref(r) = pbar_ss_ref(r)*cbar_ss.l(r)+ leis_ss.l(r)*wbar_ss_ref(r) ;
zval_ref(r,t) = pbar_ref(r,t)*cbar.l(r,t) + leis.l(r,t)*wbar_ref(r,t) ;
pvwealth_ref(r) = sum(tpol,zval_ref(r,tpol)/disc(r,tpol)) + sum(tlastpol,(zval_ss_ref(r)*(1+gf)**nt)/disc_ss(r,tlastpol))/(1-((1+gf)/(1+rbarn0)));


* Calculate reference case utility

cfull_ss_ref(r) = (cbar_ss.l(r)**((eta(r)-1)/(eta(r))) + (alpha_leis(r)**(1/eta(r)))*(leis_ss.l(r)**((eta(r)-1)/(eta(r)))))**(eta(r)/(eta(r)-1));
cfull_ref(r,t) = (cbar.l(r,t)**((eta(r)-1)/(eta(r))) + (alpha_leis(r)**(1/eta(r)))*(leis.l(r,t)**((eta(r)-1)/(eta(r)))))**(eta(r)/(eta(r)-1));
util_ss_ref(r) = (1/(1-sigma))*(cfull_ss_ref(r)/hhtot(r))**(1-sigma) ;
util_ref(r,t) = (1/(1-sigma))*(cfull_ref(r,t)/hhtot(r))**(1-sigma) ;
util_d_ref(r) =  sum(tpol,util_ref(r,tpol)*betat(tpol)) + ((util_ss_ref(r))*(((1+gr)**(1-sigma))**nt)*(beta**(nt+1-ipol)))/(1-udisc);


* Calculate reference case GDP

gdp_ref(r,t) = sum(i,cons.l(i,r,t)*pc.l(i,r,t) + inv.l(i,r,t)*pi.l(i,r,t) + (g_fed(i,r,t)*(1+sum(margins,g_fed0_mr(i,margins,r))))*pgf.l(i,r,t) + (g_reg(i,r,t)*(1+sum(margins,g_reg0_mr(i,margins,r))))*pgr.l(i,r,t) + (ex.l(i,r,t)-g_f.l(i,r,t))*(pf(i,t)/exch.l(t)));
gdp_d_ref(r,t) = sum(i,c0(i,r)*pc.l(i,r,t) + i0(i,r)*pi.l(i,r,t) + (g_fed0(i,r)*(1+sum(margins,g_fed0_mr(i,margins,r))))*pgf.l(i,r,t) + (g_reg0(i,r)*(1+sum(margins,g_reg0_mr(i,margins,r))))*pgr.l(i,r,t) + (ex0(i,r)-g0_f(i,r))*(pf(i,t)/exch.l(t)))/
sum(i,c0(i,r)*pc0(i,r) + i0(i,r)*pi0(i,r) + (g_fed0(i,r)*(1+sum(margins,g_fed0_mr(i,margins,r))))*pgf0(i,r) + (g_reg0(i,r)*(1+sum(margins,g_reg0_mr(i,margins,r))))*pgr0(i,r) + (ex0(i,r)-g0_f(i,r))*(pf0));
gdp_r_ref(r,t) = gdp_ref(r,t)/gdp_d_ref(r,t);



* Calculate reference case present values

etot_ss_ref(r) = etot_ss.l(r);
etot_ref(r,t) = etot.l(r,t);

pve_ref(r) = sum(tpol,(etot_ref(r,tpol))/disc_r(r,tpol)) +   (sum(tlastpol,(etot_ss_ref(r)*(1+gr)**(nt))/disc_r_ss(r,tlastpol)))/(1-((1+gr)/(1 + rbar0)));






* ------------------------------------------------------------------------------
* Step 2: Define welfare model
* ------------------------------------------------------------------------------

positive variable
lambw_tt
;

variable
lambw(*,t)
cw(*,t)
lw(*,t)
cfullw(*,t)
zvalw(*,t)
cw_tt(*)
lw_tt(*)
cfullw_tt(*)
zvalw_tt(*)
pvwealth_new(*)
ev(*)
utilw(*,t)
utilw_tt(*)
util_new(*)
;

equations
w_euler(*,t)
w_euler_tc(*,t)
w_hh_foc_c(*,t)
w_hh_foc_l(*,t)
w_hh_cfull(*,t)
w_hh_zval(*,t)
w_hh_foc_c_tc(*)
w_hh_foc_l_tc(*)
w_hh_cfull_tc(*)
w_hh_zval_tc(*)
w_pvwlth(*)
w_ev(*)
w_util(*,t)
w_util_tt(*)
w_util_new(*)
w_obj(*)
;

w_euler(r,t)$(not tlast(t))..  lambw(r,t) =e= beta*(lambw(r,t+1)/(1+gp))*(1+rbarn_ref(r,t));
w_euler_tc(r,tlast).. lambw(r,tlast) =e= beta*(lambw_tt(r)/(1+gp))*(1+rbarn_ref(r,tlast));

w_hh_foc_c(r,t).. cw(r,t) =e= hhtot(r)*(((lambw(r,t)/((1+gp)**(ord(t)-1)))*pbar_ref(r,t))**(-1/sigma))*(1+alpha_leis(r)*(pbar_ref(r,t)/wbar_ref(r,t))**(eta(r)-1))**(((1/sigma)-eta(r))/(eta(r)-1));
w_hh_foc_l(r,t).. lw(r,t) =e= cw(r,t)*alpha_leis(r)*(pbar_ref(r,t)/wbar_ref(r,t))**(eta(r));
w_hh_cfull(r,t).. cfullw(r,t) =e= (cw(r,t)**((eta(r)-1)/(eta(r))) + (alpha_leis(r)**(1/eta(r)))*(lw(r,t)**((eta(r)-1)/(eta(r)))))**(eta(r)/(eta(r)-1));
w_hh_zval(r,t).. zvalw(r,t) =e= pbar_ref(r,t)*cw(r,t)+ wbar_ref(r,t)*lw(r,t);

w_hh_foc_c_tc(r).. cw_tt(r) =e= hhtot(r)*(((lambw_tt(r)/((1+gp)**(nt)))*(pbar_ss_ref(r)*(1+gp)**nt))**(-1/sigma))*(1+alpha_leis(r)*((pbar_ss_ref(r)/wbar_ss_ref(r)))**(eta(r)-1))**(((1/sigma)-eta(r))/(eta(r)-1));
w_hh_foc_l_tc(r).. lw_tt(r) =e= cw_tt(r)*alpha_leis(r)*((pbar_ss_ref(r)/wbar_ss_ref(r)))**(eta(r));
w_hh_cfull_tc(r).. cfullw_tt(r) =e= (cw_tt(r)**((eta(r)-1)/(eta(r))) + (alpha_leis(r)**(1/eta(r)))*(lw_tt(r)**((eta(r)-1)/(eta(r)))))**(eta(r)/(eta(r)-1));
w_hh_zval_tc(r).. zvalw_tt(r) =e= (pbar_ss_ref(r)*(1+gp)**nt)*cw_tt(r) + (wbar_ss_ref(r)*(1+gp)**nt)*lw_tt(r);


w_pvwlth(r).. pvwealth_new(r) =e= sum(tpol,zvalw(r,tpol)/disc(r,tpol)) + sum(tlastpol,(zvalw_tt(r))/disc_ss(r,tlastpol))/(1-((1+gf)/(1+rbarn0)));
w_ev(r).. ev(r) =e= pvwealth_new(r)-pvwealth_ref(r);

w_util(r,t).. utilw(r,t) =e= (1/(1-sigma))*(cfullw(r,t)/hhtot(r))**(1-sigma) ;
w_util_tt(r).. utilw_tt(r) =e= (1/(1-sigma))*(cfullw_tt(r)/hhtot(r))**(1-sigma) ;
w_util_new(r).. util_new(r) =e= sum(tpol,utilw(r,tpol)*betat(tpol)) + ((utilw_tt(r))*(beta**(nt+1-ipol)))/(1-udisc);


w_obj(r).. util_new(r)-util_d_pol(r) =e= 0;



model welfare /
w_euler,
w_euler_tc,
w_hh_foc_c,
w_hh_foc_l,
w_hh_cfull,
w_hh_zval,
w_hh_foc_c_tc,
w_hh_foc_l_tc,
w_hh_cfull_tc,
w_hh_zval_tc,
w_pvwlth,
w_ev,
w_util,
w_util_tt,
w_util_new,
w_obj.lambw_tt /
;

* Initialize variables

lambw_tt.l(r) = lambda_ss.l(r)*((1+gr)**(-sigma))**(nt);
lambw.l(r,t) = lambda.l(r,t);
cw.l(r,t) = cbar.l(r,t);
lw.l(r,t) = leis.l(r,t);
cfullw.l(r,t) = (cw.l(r,t)**((eta(r)-1)/(eta(r))) + (alpha_leis(r)**(1/eta(r)))*(lw.l(r,t)**((eta(r)-1)/(eta(r)))))**(eta(r)/(eta(r)-1));
zvalw.l(r,t) = pbar_ref(r,t)*cw.l(r,t) + wbar_ref(r,t)*lw.l(r,t);
cw_tt.l(r) = cbar_ss.l(r)*(1+gr)**(nt);
lw_tt.l(r) = leis_ss.l(r)*(1+gr)**(nt);
cfullw_tt.l(r) = (cw_tt.l(r)**((eta(r)-1)/(eta(r))) + (alpha_leis(r)**(1/eta(r)))*(lw_tt.l(r)**((eta(r)-1)/(eta(r)))))**(eta(r)/(eta(r)-1));
zvalw_tt.l(r) = pbar_ss_ref(r)*(1+gp)**(nt)*cw_tt.l(r) + wbar_ss_ref(r)*(1+gp)**(nt)*lw_tt.l(r);
pvwealth_new.l(r) = pvwealth_ref(r);
ev.l(r) = 0;
utilw.l(r,t) = util_ref(r,t);
utilw_tt.l(r) = util_ss_ref(r)*(((1+gr)**(1-sigma))**nt) ;
util_new.l(r) = util_d_ref(r);



