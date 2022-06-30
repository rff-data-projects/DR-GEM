$TITLE Dynamic Regional General Equilibrium Model (DR-GEM) Code

* 6/30/22

* DR-GEM model version 1.0
* A dynamic general equilibrium model with multiple regions
* National market assumption for domestic trade flows
* Regional market assumption for domestic trade in electricity
*   (preferences between own region electricity and "electricity region" electricity)
* CET structure for international trade
* Nested CES consumer demand structure
* Nested CES production functions

* See documentation for complete descriptions


** Steady State

* Steady State Complementary Price/Equations
variables
p_ss(*,*)
pn_ss(*)
pe_ss(*)
pmy_ss(*)
exch_ss
w_ss(*)
lambda_ss(*)
lambdak_ss(*,*)

;

* Steady State Secondary Variables

variables
pbar_ss(*)
pkbar_ss(*)
wbar_ss(*)
rbar_ss(*)
pd_ss(*,*)
pg_ss(*,*)
py_ss(*,*)
pc_ss(*,*)
pi_ss(*,*)
pgf_ss(*,*)
pgr_ss(*,*)
pio_ss(*,*,*)
pm_ss(*,*)
pr_ss(*,*)
cp_ss(*,*)
cpv_ss(*,*)
cpumlot_ss(*,*)
cptilde_ss(*,*)
cphat_ss(*,*)

ppi_ss
cpi_ss


crev_fed_ss
grev_fed_ss
glump_fed_ss
crebate_fed_ss
crev_reg_ss
grev_reg_ss(*)
glump_reg_ss(*)
crebate_reg_ss
ggrant_ss(*)

cbar_ss(*)
leis_ss(*)
ls_ss(*)

c_cv_ss(*,*,*)
cv_cumlot_ss(*,*,*)
cumlot_ctilde_ss(*,*,*)
ctilde_chat_ss(*,*,*)
chat_cbar_ss(*,*)
cg_ss(*,*)
c_ss(*,*)
pce_ss(*,*)
ibar_ss(*)
i_ss(*,*)
pfi_ss(*,*)
g_ss(*,*)
g_d_ss(*,*)
g_f_ss(*,*)
g_dn_ss(*,*)
g_dr_ss(*,*)
dm_ss(*,*)

cost_e1_ss(*,*)
io_ie1_ss(*,*,*)
cost_e2_ss(*,*)
io_ie2_ss(*,*,*)
cost_e_ss(*,*)
io_e1e_ss(*,*)
io_e2e_ss(*,*)
cost_m_ss(*,*)
io_im_ss(*,*,*)
cost_l_ss(*,*)
cost_v_ss(*,*)
io_ev_ss(*,*)
io_mv_ss(*,*)
cost_w_ss(*,*)
io_lw_ss(*,*)
io_vw_ss(*,*)
cost_k_ss(*,*)
cost_x_ss(*,*)
io_wx_ss(*,*)
cost_f_ss(*,*)
io_ff_ss(*,*,*)
cost_z_ss(*,*)
io_zy_ss(*,*)

zz_ss(*,*)
xx_ss(*,*)
ff_ss(*,*)
ww_ss(*,*)
l_ss(*,*)
io_ss(*,*,*)
iom_ss(*,*,*)
k_ss(*,*)
f_k_ss(*,*)
acexp_ss(*,*)
y_ss(*,*)
ex_ss(*,*)
ny_ss(*,*)
ry_ss(*,*)
my_ss(*,*)
ey_ss(*,*)
xkinc_ss(*,*)
prof_ss(*,*)
kdep_ss(*,*)
dd_ss(*)
v_ss(*,*)

allow_fed_ss

etot_ss(*)
etot_net_ss(*)


;

* Steady State Equations

* Prices

equations
        ss_pbar(*)
        ss_pkbar(*)
        ss_wbar(*)
        ss_pd(*,*)
        ss_pd_ff(*,*)
        ss_pd_td(*,*)
        ss_pg(*,*)
        ss_py(*,*)
        ss_pc(*,*)
        ss_pi(*,*)
        ss_pgf(*,*)
        ss_pgr(*,*)
        ss_pio(*,*,*)
        ss_pm(*,*)
        ss_pr(*,*)
        ss_pr_ff(*,*)

        ss_cp(*,*)
        ss_cpv(*,*)
        ss_cpumlot(*,*)
        ss_cptilde(*,*)
        ss_cphat(*,*)

        ss_ppi
        ss_cpi
;


ss_pbar(r).. pbar_ss(r) =e= gammacbar(r)**(sig_cbar/(1-sig_cbar)) *( sum(cj, (alphacbar(cj,r)**sig_cbar)*((cphat_ss(cj,r))**(1-sig_cbar))) )**(1/(1-sig_cbar));
ss_pkbar(r).. pkbar_ss(r) =e= sum(i,xi0(i,r)*(pi_ss(i,r)));
ss_wbar(r).. wbar_ss(r) =e= w_ss(r)*(1 - tau_l0 - tau_lr0(r));

ss_pd(i,r)$(not i_ff(i) and not i_td(i)).. pd_ss(i,r) =e= gammar0(i,r)**(sig_rn(i,r)/(1-sig_rn(i,r)))*( (alphar_r0(i,r)**sig_rn(i,r))*((p_ss(i,r))**(1-sig_rn(i,r))) + (alphar_n0(i,r)**sig_rn(i,r))*(pn_ss(i)**(1-sig_rn(i,r)))     )**(1/(1-sig_rn(i,r)));
ss_pd_ff(i_ff,r).. pd_ss(i_ff,r) =e= pn_ss(i_ff);
ss_pd_td(i_td,r).. pd_ss(i_td,r) =e= gammar0(i_td,r)**(sig_rn(i_td,r)/(1-sig_rn(i_td,r)))*( (alphar_r0(i_td,r)**sig_rn(i_td,r))*((p_ss(i_td,r))**(1-sig_rn(i_td,r))) + (alphar_e0(i_td,r)**sig_rn(i_td,r))*(sum(er,maper(r,er)*pe_ss(er))**(1-sig_rn(i_td,r)))     )**(1/(1-sig_rn(i_td,r)));


ss_pg(i,r).. pg_ss(i,r) =e= gammag0(i,r)**(sig_f(i,r)/(1-sig_f(i,r)))*( (alphag_d0(i,r)**sig_f(i,r))*((pd_ss(i,r))**(1-sig_f(i,r))) + (alphag_f0(i,r)**sig_f(i,r))*((pf_ss(i)/exch_ss)**(1-sig_f(i,r)))     )**(1/(1-sig_f(i,r)));
ss_py(i,r).. py_ss(i,r) =e= (alphay_dr0(i,r)*p_ss(i,r)**(1+sig_ex(i,r)) + alphay_dn0(i,r)*pn_ss(i)**(1+sig_ex(i,r))  + alphay_e0(i,r)*(sum(er,maper(r,er)*pe_ss(er)))**(1+sig_ex(i,r))  + alphay_f0(i,r)*(pf_ss(i)/exch_ss)**(1+sig_ex(i,r)) + alphay_m0(i,r)*pmy_ss(i)**(1+sig_ex(i,r)) )**(1/(1+sig_ex(i,r)));


ss_pc(i,r).. pc_ss(i,r) =e= (1/(1+sum(margins,pce0_mr(i,margins,r))))*pg_ss(i,r) + sum(margins,pce0_mr(i,margins,r)*pm_ss(margins,r))/(1+sum(margins,pce0_mr(i,margins,r)));
ss_pi(i,r).. pi_ss(i,r) =e= (1/(1+sum(margins,pfi0_mr(i,margins,r))))*pg_ss(i,r) + sum(margins,pfi0_mr(i,margins,r)*pm_ss(margins,r))/(1+ sum(margins,pfi0_mr(i,margins,r)));
ss_pgf(i,r).. pgf_ss(i,r) =e= (1/(1+sum(margins,g_fed0_mr(i,margins,r))))*pg_ss(i,r) + sum(margins,g_fed0_mr(i,margins,r)*pm_ss(margins,r))/(1+sum(margins,g_fed0_mr(i,margins,r)));
ss_pgr(i,r).. pgr_ss(i,r) =e= (1/(1+sum(margins,g_reg0_mr(i,margins,r))))*pg_ss(i,r) + sum(margins,g_reg0_mr(i,margins,r)*pm_ss(margins,r))/(1+ sum(margins,g_reg0_mr(i,margins,r)));
ss_pio(i,ii,r).. pio_ss(i,ii,r) =e= (1/(1+sum(margins,io0_mr(i,ii,margins,r))))*pg_ss(i,r) + sum(margins,io0_mr(i,ii,margins,r)*pm_ss(margins,r))/(1+sum(margins,io0_mr(i,ii,margins,r)));

ss_pm(margins,r).. pm_ss(margins,r) =e= sum(i,map_mr(i,margins)*pmy_ss(i) );

ss_pr(i_nf,r)$(nr0(i_nf,r) > 0).. pr_ss(i_nf,r) =e= (1-tau_y0(i_nf,r))*py_ss(i_nf,r)*(gammay0(i_nf,r)**(1/rho_r(i_nf,r)))*((alphay_r0(i_nf,r))*nr_ss(i_nf,r)**(rho_r(i_nf,r)-1))*(alphay_z0(i_nf,r)*zz_ss(i_nf,r)**rho_r(i_nf,r) + (alphay_r0(i_nf,r))*nr_ss(i_nf,r)**rho_r(i_nf,r))**((1-rho_r(i_nf,r))/rho_r(i_nf,r));
pr_ss.fx(i_nf,r)$(nr0(i_nf,r) = 0) = 0;
ss_pr_ff(i_ff,r)$(y0(i_ff,r) > 0).. pr_ss(i_ff,r) =e=  (1-tau_y0(i_ff,r))*py_ss(i_ff,r)*(gammay0(i_ff,r)**(1/rho_r(i_ff,r)))*((alphay_r0(i_ff,r))*nr_ss(i_ff,r)**(rho_r(i_ff,r)-1))*(alphay_k0(i_ff,r)*k_ss(i_ff,r)**rho_r(i_ff,r) + alphay_z0(i_ff,r)*zz_ss(i_ff,r)**rho_r(i_ff,r) + (alphay_r0(i_ff,r))*nr_ss(i_ff,r)**rho_r(i_ff,r))**((1-rho_r(i_ff,r))/rho_r(i_ff,r));
pr_ss.fx(i_ff,r)$(y0(i_ff,r) = 0) = 0;

ss_cpi.. cpi_ss =e= sum(j,sum(r,(cp_ss(j,r)+muc(j,r)*(p_e_fed_ss*muc_fed(j)+p_e_reg_ss(r)*muc_reg(j,r))*cpi_ss)*cg0(j,r)))/sum(j,sum(r,cp0(j,r)*cg0(j,r)));
ss_ppi.. ppi_ss =e= sum(i,sum(r,py_ss(i,r)*y0(i,r)))/sum(i,sum(r,py0(i,r)*y0(i,r)));

ss_cp(j,r).. cp_ss(j,r) =e= sum(i_cons,gmaxp(i_cons,j,r)*(pc_ss(i_cons,r)));
ss_cpv(cjv,r).. cpv_ss(cjv,r) =e= gammacv(cjv,r)**(sig_cv(cjv)/(1-sig_cv(cjv))) *( sum(j,  cmapv(j,cjv) * (alphacv_ss(j,cjv,r)**sig_cv(cjv))*((cp_ss(j,r)+muc(j,r)*(p_e_fed_ss*muc_fed(j)+p_e_reg_ss(r)*muc_reg(j,r))*cpi_ss)**(1-sig_cv(cjv)))) )**(1/(1-sig_cv(cjv)));
ss_cpumlot(cju,r).. cpumlot_ss(cju,r) =e= gammacu(cju,r)**(sig_cu(cju)/(1-sig_cu(cju))) *( sum(cjv,  cmapu(cjv,cju) * (alphacu_ss(cjv,cju,r)**sig_cu(cju))*((cpv_ss(cjv,r))**(1-sig_cu(cju)))) )**(1/(1-sig_cu(cju)));
ss_cptilde(cjt,r).. cptilde_ss(cjt,r) =e= gammact(cjt,r)**(sig_ct(cjt)/(1-sig_ct(cjt))) *( sum(cju,cmapt(cju,cjt)*(alphact_ss(cju,cjt,r)**sig_ct(cjt))*((cpumlot_ss(cju,r))**(1-sig_ct(cjt)))) )**(1/(1-sig_ct(cjt)));
ss_cphat(cj,r).. cphat_ss(cj,r) =e= gammac(cj,r)**(sig_c(cj)/(1-sig_c(cj))) *( sum(cjt,cmap(cjt,cj) * (alphac(cjt,cj,r)**sig_c(cj))*((cptilde_ss(cjt,r))**(1-sig_c(cj)))) )**(1/(1-sig_c(cj)));




* Households


equations
        ss_hh_foc_c(*)
        ss_hh_foc_l(*)
        ss_hh_ls(*)
        ss_hheuler(*)
        ss_bc(*)
;

ss_hh_foc_c(r).. cbar_ss(r) =e= hhtot(r)*((lambda_ss(r)*pbar_ss(r))**(-1/sigma))*(1+alpha_leis(r)*((pbar_ss(r)/wbar_ss(r)))**(eta(r)-1))**(((1/sigma)-eta(r))/(eta(r)-1));
ss_hh_foc_l(r).. leis_ss(r) =e= cbar_ss(r)*alpha_leis(r)*((pbar_ss(r)/wbar_ss(r)))**(eta(r));
ss_hh_ls(r).. ls_ss(r) =e= ht_d(r) - leis_ss(r);
ss_hheuler(r).. rbar_ss(r) =e= (1/beta) - 1;


ss_bc(r).. wbar_ss(r)*ls_ss(r) + sum(i,prof_ss(i,r)+pr_ss(i,r)*nr_ss(i,r)) + sum(i,(pf_ss(i)/exch_ss)*(im0(i,r)-ex0(i,r)))
+ cpi_ss*gtrans_fed0(r) + cpi_ss*gtrans_reg0(r) + cpi_ss*crebate_fed_ss(r) + cpi_ss*crebate_reg_ss(r)
 + sum(i_nt,pn_ss(i_nt)*(g0_dn(i_nt,r) - exd0(i_nt,r))) + sum(i,pmy_ss(i)*(sum(margins,map_mr(i,margins)*dm0(margins,r)) - my0(i,r)))
 + sum(er,maper(r,er)*pe_ss(er))*(sum(i_td,g0_dn(i_td,r)) - sum(i_td,exd0(i_td,r)))
- cpi_ss*glump_fed_ss(r) - cpi_ss*glump_reg_ss(r) - pbar_ss(r)*cbar_ss(r)  =g= 0;


* Government

equations
        ss_crev_fed(*)
        ss_crev_reg(*)
        ss_grev_fed(*)
        ss_grev_reg(*)
        ss_glump_fed(*)
        ss_glump_reg(*)
        ss_crebate_fed(*)
        ss_crebate_reg(*)
        ss_ggrant(*)
;


ss_crev_fed(r).. crev_fed_ss(r) =e= sum(j,cg_ss(j,r)*muc(j,r)*muc_fed(j))*(p_e_fed_ss) + sum(i,mug(i,r)*(g_fed_ss(i,r)*(1+sum(margins,g_fed0_mr(i,margins,r)))*mug_fed(i)+g_reg_ss(i,r)*(1+sum(margins,g_reg0_mr(i,margins,r)))*mug_fed(i)) + sum(ii,((io_ss(i,ii,r)+io_ff_ss(i,ii,r))*(1+sum(margins,io0_mr(i,ii,margins,r))))*mu(i,ii,r)*mu_fed(i,ii)))*(p_e_fed_ss) - p_e_fed_ss*sum(i,allow_fed_ss(i,r));
ss_crev_reg(r).. crev_reg_ss(r) =e= sum(j,cg_ss(j,r)*muc(j,r)*muc_reg(j,r))*(p_e_reg_ss(r)) +sum(i, mug(i,r)*(g_fed_ss(i,r)*(1+sum(margins,g_fed0_mr(i,margins,r)))*mug_reg(i,r)+g_reg_ss(i,r)*(1+sum(margins,g_reg0_mr(i,margins,r)))*mug_reg(i,r)) + sum(ii,((io_ss(i,ii,r)+io_ff_ss(i,ii,r))*(1+sum(margins,io0_mr(i,ii,margins,r))))*mu(i,ii,r)*mu_reg(i,ii,r)))*(p_e_reg_ss(r));


ss_grev_fed(r).. grev_fed_ss(r) =e= ((tau_l0+tau_p0)*w_ss(r)*ls_ss(r) + sum(i,tau_k0*(xkinc_ss(i,r))) - sum(i,tau_k0*deltat*kdep_ss(i,r)) + sum(i,py_ss(i,r)*gy_fed0(i,r)) + crev_fed_ss(r)*cpi_ss )/cpi_ss;
ss_grev_reg(r).. grev_reg_ss(r) =e= ((tau_lr0(r))*w_ss(r)*ls_ss(r) + sum(i,tau_kr0(r)*(xkinc_ss(i,r))) - sum(i,tau_kr0(r)*deltat*kdep_ss(i,r)) + sum(i,tau_y0(i,r)*py_ss(i,r)*y_ss(i,r)) + sum(i,py_ss(i,r)*gy_reg0(i,r)) + ggrant_ss(r)*cpi_ss + crev_reg_ss(r)*cpi_ss)/cpi_ss;


ss_glump_fed(r).. glump_fed_ss(r) =e= ((1+tau_p0)*w_ss(r)*lg_fed0(r) + sum(i,(pgf_ss(i,r)+mug(i,r)*(p_e_fed_ss*mug_fed(i)+p_e_reg_ss(r)*mug_reg(i,r))*cpi_ss)*g_fed_ss(i,r)*(1+sum(margins,g_fed0_mr(i,margins,r)))) + ggrant_ss(r)*cpi_ss + cpi_ss*gtrans_fed0(r) + crebate_fed_ss(r)*cpi_ss - grev_fed_ss(r)*cpi_ss )/cpi_ss;
ss_glump_reg(r).. glump_reg_ss(r) =e= ((1+tau_p0)*w_ss(r)*lg_reg0(r) + sum(i,(pgr_ss(i,r)+mug(i,r)*(p_e_fed_ss*mug_fed(i)+p_e_reg_ss(r)*mug_reg(i,r))*cpi_ss)*g_reg_ss(i,r)*(1+sum(margins,g_reg0_mr(i,margins,r)))) + cpi_ss*gtrans_reg0(r) + crebate_reg_ss(r)*cpi_ss - grev_reg_ss(r)*cpi_ss)/cpi_ss;

ss_crebate_fed(r).. crebate_fed_ss(r) =e= (glump_fed_ss(r)*cpi_ss - (1+tau_p0)*w_ss(r)*lg_fed0(r) - sum(i,(pgf_ss(i,r)+mug(i,r)*(p_e_fed_ss*mug_fed(i)+p_e_reg_ss(r)*mug_reg(i,r))*cpi_ss)*g_fed_ss(i,r)*(1+sum(margins,g_fed0_mr(i,margins,r)))) - cpi_ss*gtrans_fed0(r) - ggrant_ss(r)*cpi_ss + grev_fed_ss(r)*cpi_ss)/cpi_ss;
ss_crebate_reg(r).. crebate_reg_ss(r) =e=  (glump_reg_ss(r)*cpi_ss - (1+tau_p0)*w_ss(r)*lg_reg0(r) - sum(i,(pgr_ss(i,r)+mug(i,r)*(p_e_fed_ss*mug_fed(i)+p_e_reg_ss(r)*mug_reg(i,r))*cpi_ss)*g_reg_ss(i,r)*(1+sum(margins,g_reg0_mr(i,margins,r)))) - cpi_ss*gtrans_reg0(r) + grev_reg_ss(r)*cpi_ss)/cpi_ss;

ss_ggrant(r).. ggrant_ss(r) =e= ((1+tau_p0)*w_ss(r)*lg_reg0(r) + sum(i,(pgr_ss(i,r)+mug(i,r)*(p_e_fed_ss*mug_fed(i)+p_e_reg_ss(r)*mug_reg(i,r))*cpi_ss)*g_reg_ss(i,r)*(1+sum(margins,g_reg0_mr(i,margins,r)))) + cpi_ss*gtrans_reg0(r) + crebate_reg_ss(r)*cpi_ss
- (tau_lr0(r))*w_ss(r)*ls_ss(r) - sum(i,tau_kr0(r)*(xkinc_ss(i,r))) + sum(i,tau_kr0(r)*deltat*kdep_ss(i,r)) - sum(i,tau_y0(i,r)*py_ss(i,r)*y_ss(i,r))  - sum(i,py_ss(i,r)*gy_reg0(i,r))  - glump_reg_ss(r)*cpi_ss  )/cpi_ss;



* Final Good Demand

equations
        ss_c_cv(*,*,*)
        ss_cv_cumlot(*,*,*)
        ss_cumlot_ctilde(*,*,*)
        ss_ctilde_chat(*,*,*)
        ss_chat_cbar(*,*)
        ss_cg(*,*)
        ss_c(*,*)
        ss_pce(*,*)
        ss_ibar(*)
        ss_i(*,*)
        ss_pfi(*,*)
        ss_g(*,*)
        ss_g_d(*,*)
        ss_g_f(*,*)
        ss_g_dr(*,*)
        ss_g_dn(*,*)
        ss_g_dn_ff
        ss_g_dn_td
        ss_dm(*,*)
;



ss_c_cv(j,cjv,r).. c_cv_ss(j,cjv,r) =e= ((gammacv(cjv,r)*alphacv_ss(j,cjv,r))**sig_cv(cjv)) * ((cp_ss(j,r)+muc(j,r)*(p_e_fed_ss*muc_fed(j)+p_e_reg_ss(r)*muc_reg(j,r))*cpi_ss)/cpv_ss(cjv,r))**(-sig_cv(cjv));
ss_cv_cumlot(cjv,cju,r).. cv_cumlot_ss(cjv,cju,r) =e= ((gammacu(cju,r)*alphacu_ss(cjv,cju,r))**sig_cu(cju)) * ((cpv_ss(cjv,r))/cpumlot_ss(cju,r))**(-sig_cu(cju));
ss_cumlot_ctilde(cju,cjt,r).. cumlot_ctilde_ss(cju,cjt,r) =e= ((gammact(cjt,r)*alphact_ss(cju,cjt,r))**sig_ct(cjt)) * ((cpumlot_ss(cju,r))/cptilde_ss(cjt,r))**(-sig_ct(cjt));
ss_ctilde_chat(cjt,cj,r).. ctilde_chat_ss(cjt,cj,r) =e= ((gammac(cj,r)*alphac(cjt,cj,r))**sig_c(cj)) * ((cptilde_ss(cjt,r))/cphat_ss(cj,r))**(-sig_c(cj));
ss_chat_cbar(cj,r).. chat_cbar_ss(cj,r) =e= ((gammacbar(r)*alphacbar(cj,r))**sig_cbar) * ((cphat_ss(cj,r))/pbar_ss(r))**(-sig_cbar);
ss_cg(j,r).. cg_ss(j,r) =e= sum(cjv,cmapv(j,cjv)*c_cv_ss(j,cjv,r)*sum(cju,cmapu(cjv,cju)*cv_cumlot_ss(cjv,cju,r)*sum(cjt,cmapt(cju,cjt)*cumlot_ctilde_ss(cju,cjt,r)*sum(cj,cmap(cjt,cj) * ctilde_chat_ss(cjt,cj,r)*chat_cbar_ss(cj,r)*cbar_ss(r) ))) );
ss_c(i,r).. c_ss(i,r) =e= sum(j,gmaxp(i,j,r)*cg_ss(j,r));

ss_pce(i,r).. pce_ss(i,r) =e= c_ss(i,r)/(1+sum(margins,pce0_mr(i,margins,r)));


ss_ibar(r).. ibar_ss(r) =e= sum(i,delta*k_ss(i,r));
ss_i(i,r).. i_ss(i,r) =e= xi0(i,r)*ibar_ss(r);
ss_pfi(i,r).. pfi_ss(i,r) =e= i_ss(i,r)/(1+sum(margins,pfi0_mr(i,margins,r)));


ss_g(i,r).. g_ss(i,r) =e= pce_ss(i,r) + pfi_ss(i,r) + g_fed_ss(i,r) + g_reg_ss(i,r) + sum(ii,io_ss(i,ii,r)+io_ff_ss(i,ii,r)) ;


ss_g_d(i,r).. g_d_ss(i,r) =e= g_ss(i,r)*((gammag0(i,r)*alphag_d0(i,r))**sig_f(i,r)) * (pd_ss(i,r)/pg_ss(i,r))**(-sig_f(i,r));
ss_g_f(i,r).. g_f_ss(i,r) =e= g_ss(i,r)*((gammag0(i,r)*alphag_f0(i,r))**sig_f(i,r)) * ((pf_ss(i)/exch_ss)/pg_ss(i,r))**(-sig_f(i,r));

ss_g_dr(i,r).. g_dr_ss(i,r) =e= g_d_ss(i,r)*((gammar0(i,r)*alphar_r0(i,r))**sig_rn(i,r)) * (p_ss(i,r)/pd_ss(i,r))**(-sig_rn(i,r));
ss_g_dn(i,r)$(not i_ff(i) and not i_td(i)).. g_dn_ss(i,r) =e= g_d_ss(i,r)*((gammar0(i,r)*alphar_n0(i,r))**sig_rn(i,r)) * (pn_ss(i)/pd_ss(i,r))**(-sig_rn(i,r));
ss_g_dn_ff(i_ff,r).. g_dn_ss(i_ff,r) =e= g_d_ss(i_ff,r);
ss_g_dn_td(i_td,r).. g_dn_ss(i_td,r) =e= g_d_ss(i_td,r)*((gammar0(i_td,r)*alphar_e0(i_td,r))**sig_rn(i_td,r)) * (sum(er,maper(r,er)*pe_ss(er))/pd_ss(i_td,r))**(-sig_rn(i_td,r));


ss_dm(margins,r).. dm_ss(margins,r) =e= sum(i,pce0_mr(i,margins,r)*pce_ss(i,r) + pfi0_mr(i,margins,r)*pfi_ss(i,r) +
g_fed0_mr(i,margins,r)*g_fed_ss(i,r) + g_reg0_mr(i,margins,r)*g_reg_ss(i,r)+ sum(ii,io0_mr(i,ii,margins,r)*(io_ss(i,ii,r)+io_ff_ss(i,ii,r))));


* Firms

* Input Demand

equations
        ss_cost_e1(*,*)
        ss_io_ie1(*,*,*)
        ss_cost_e2(*,*)
        ss_io_ie2(*,*,*)
        ss_cost_e(*,*)
        ss_io_e1e(*,*)
        ss_io_e2e(*,*)
        ss_cost_ee2(*,*)
        ss_io_e1e2(*,*)
        ss_io_e2e2(*,*)
        ss_cost_m(*,*)
        ss_io_im(*,*,*)
        ss_cost_l(*,*)
        ss_cost_v(*,*)
        ss_io_ev(*,*)
        ss_io_mv(*,*)
        ss_cost_v2(*,*)
        ss_io_ev2(*,*)
        ss_io_mv2(*,*)
        ss_cost_w(*,*)
        ss_io_lw(*,*)
        ss_io_vw(*,*)
        ss_cost_w2(*,*)
        ss_io_lw2(*,*)
        ss_io_vw2(*,*)

        ss_cost_k(*,*)
        ss_cost_x(*,*)
        ss_cost_x2(*,*)
        ss_cost_x_ff(*,*)
        ss_io_wx(*,*)
        ss_io_wx_ff(*,*)
        ss_cost_f(*,*)
        ss_io_ff(*,*,*)
        ss_cost_z(*,*)
        ss_io_zy(*,*)

;





ss_cost_e1(ii,rr)$(ee10(ii,rr) gt 0).. cost_e1_ss(ii,rr) =e= gammae1(ii,rr)**(sig_e1(ii,rr)/(1-sig_e1(ii,rr)))*( sum(ie1, (alphae1_ss(ie1,ii,rr)**sig_e1(ii,rr))*(pio_ss(ie1,ii,rr)+mu(ie1,ii,rr)*(p_e_fed_ss*mu_fed(ie1,ii)+p_e_reg_ss(rr)*mu_reg(ie1,ii,rr))*cpi_ss)**(1-sig_e1(ii,rr))) )**(1/(1-sig_e1(ii,rr)));
ss_io_ie1(ie1,ii,rr)$(ee10(ii,rr) gt 0).. io_ie1_ss(ie1,ii,rr) =e= ((gammae1(ii,rr)*alphae1_ss(ie1,ii,rr))**sig_e1(ii,rr)) * ((pio_ss(ie1,ii,rr)+mu(ie1,ii,rr)*(p_e_fed_ss*mu_fed(ie1,ii)+p_e_reg_ss(rr)*mu_reg(ie1,ii,rr))*cpi_ss)/cost_e1_ss(ii,rr))**(-sig_e1(ii,rr));
ss_cost_e2(ii,rr)$(ee20(ii,rr) gt 0).. cost_e2_ss(ii,rr) =e= gammae2(ii,rr)**(sig_e2(ii,rr)/(1-sig_e2(ii,rr)))*( sum(ie2, (alphae2_ss(ie2,ii,rr)**sig_e2(ii,rr))*(pio_ss(ie2,ii,rr)+mu(ie2,ii,rr)*(p_e_fed_ss*mu_fed(ie2,ii)+p_e_reg_ss(rr)*mu_reg(ie2,ii,rr))*cpi_ss)**(1-sig_e2(ii,rr))) )**(1/(1-sig_e2(ii,rr)));
ss_io_ie2(ie2,ii,rr)$(ee20(ii,rr) gt 0).. io_ie2_ss(ie2,ii,rr) =e= ((gammae2(ii,rr)*alphae2_ss(ie2,ii,rr))**sig_e2(ii,rr)) * ((pio_ss(ie2,ii,rr)+mu(ie2,ii,rr)*(p_e_fed_ss*mu_fed(ie2,ii)+p_e_reg_ss(rr)*mu_reg(ie2,ii,rr))*cpi_ss)/cost_e2_ss(ii,rr))**(-sig_e2(ii,rr));

cost_e1_ss.fx(ii,rr)$(ee10(ii,rr) = 0) = 1;
io_ie1_ss.fx(ie1,ii,rr)$(ee10(ii,rr) = 0) = 0;
cost_e2_ss.fx(ii,rr)$(ee20(ii,rr) = 0) = 1;
io_ie2_ss.fx(ie2,ii,rr)$(ee20(ii,rr) = 0) = 0;


ss_cost_e(ii,rr)$(ee10(ii,rr) gt 0 and ee20(ii,rr) gt 0).. cost_e_ss(ii,rr) =e= gammae(ii,rr)**(sig_e(ii,rr)/(1-sig_e(ii,rr)))*( (alphae_e1_ss(ii,rr)**sig_e(ii,rr))*((cost_e1_ss(ii,rr))**(1-sig_e(ii,rr))) + (alphae_e2_ss(ii,rr)**sig_e(ii,rr))*((cost_e2_ss(ii,rr))**(1-sig_e(ii,rr))) )**(1/(1-sig_e(ii,rr)));
ss_io_e1e(ii,rr)$(ee10(ii,rr) gt 0 and ee20(ii,rr) gt 0).. io_e1e_ss(ii,rr) =e= ((gammae(ii,rr)*alphae_e1_ss(ii,rr))**sig_e(ii,rr)) * (cost_e1_ss(ii,rr)/cost_e_ss(ii,rr))**(-sig_e(ii,rr));
ss_io_e2e(ii,rr)$(ee10(ii,rr) gt 0 and ee20(ii,rr) gt 0).. io_e2e_ss(ii,rr) =e= ((gammae(ii,rr)*alphae_e2_ss(ii,rr))**sig_e(ii,rr)) * (cost_e2_ss(ii,rr)/cost_e_ss(ii,rr))**(-sig_e(ii,rr));

ss_cost_ee2(ii,rr)$(ee10(ii,rr) = 0 or ee20(ii,rr) = 0).. cost_e_ss(ii,rr) =e= alphae_e1_ss(ii,rr)*cost_e1_ss(ii,rr) + alphae_e2_ss(ii,rr)*cost_e2_ss(ii,rr);
ss_io_e1e2(ii,rr)$(ee10(ii,rr) = 0 or ee20(ii,rr) = 0).. io_e1e_ss(ii,rr) =e= alphae_e1_ss(ii,rr);
ss_io_e2e2(ii,rr)$(ee10(ii,rr) = 0 or ee20(ii,rr) = 0).. io_e2e_ss(ii,rr) =e= alphae_e2_ss(ii,rr);

cost_e_ss.fx(ii,rr)$(ee0(ii,rr) = 0) = 1;


ss_cost_m(ii,rr)$(mm0(ii,rr) gt 0).. cost_m_ss(ii,rr) =e= gammam(ii,rr)**(sig_m(ii,rr)/(1-sig_m(ii,rr)))*( sum(im, (alpham(im,ii,rr)**sig_m(ii,rr))*(pio_ss(im,ii,rr))**(1-sig_m(ii,rr))) )**(1/(1-sig_m(ii,rr)));
ss_io_im(im,ii,rr)$(mm0(ii,rr) gt 0).. io_im_ss(im,ii,rr) =e= ((gammam(ii,rr)*alpham(im,ii,rr))**sig_m(ii,rr)) * ((pio_ss(im,ii,rr))/cost_m_ss(ii,rr))**(-sig_m(ii,rr));

cost_m_ss.fx(ii,rr)$(mm0(ii,rr) = 0) = 1;
io_im_ss.fx(im,ii,rr)$(mm0(ii,rr) = 0) = 0;


ss_cost_l(i,r).. cost_l_ss(i,r) =e= w_ss(r)*(1+tau_p0);
ss_cost_v(ii,rr)$(ee0(ii,rr) gt 0 and mm0(ii,rr) gt 0).. cost_v_ss(ii,rr) =e= gammav(ii,rr)**(sig_v(ii,rr)/(1-sig_v(ii,rr)))*( (alphav_e_ss(ii,rr)**sig_v(ii,rr))*((cost_e_ss(ii,rr))**(1-sig_v(ii,rr))) + (alphav_m_ss(ii,rr)**sig_v(ii,rr))*((cost_m_ss(ii,rr))**(1-sig_v(ii,rr))) )**(1/(1-sig_v(ii,rr)));
ss_io_ev(ii,rr)$(ee0(ii,rr) gt 0 and mm0(ii,rr) gt 0).. io_ev_ss(ii,rr) =e= ((gammav(ii,rr)*alphav_e_ss(ii,rr))**sig_v(ii,rr)) * (cost_e_ss(ii,rr)/cost_v_ss(ii,rr))**(-sig_v(ii,rr));
ss_io_mv(ii,rr)$(ee0(ii,rr) gt 0 and mm0(ii,rr) gt 0).. io_mv_ss(ii,rr) =e= ((gammav(ii,rr)*alphav_m_ss(ii,rr))**sig_v(ii,rr)) * (cost_m_ss(ii,rr)/cost_v_ss(ii,rr))**(-sig_v(ii,rr));

ss_cost_v2(ii,rr)$(ee0(ii,rr) = 0 or mm0(ii,rr) = 0 and vv0(ii,rr) gt 0).. cost_v_ss(ii,rr) =e= alphav_e_ss(ii,rr)*cost_e_ss(ii,rr) + alphav_m_ss(ii,rr)*cost_m_ss(ii,rr);
ss_io_ev2(ii,rr)$(ee0(ii,rr) = 0 or mm0(ii,rr) = 0 and vv0(ii,rr) gt 0).. io_ev_ss(ii,rr) =e= alphav_e_ss(ii,rr);
ss_io_mv2(ii,rr)$(ee0(ii,rr) = 0 or mm0(ii,rr) = 0 and vv0(ii,rr) gt 0).. io_mv_ss(ii,rr) =e= alphav_m_ss(ii,rr);

cost_v_ss.fx(ii,rr)$(vv0(ii,rr) = 0) = 1;
io_ev_ss.fx(ii,rr)$(vv0(ii,rr) = 0) = 0;
io_mv_ss.fx(ii,rr)$(vv0(ii,rr) = 0) = 0;


ss_cost_w(ii,rr)$(vv0(ii,rr) gt 0).. cost_w_ss(ii,rr) =e= gammaw0(ii,rr)**(sig_w(ii,rr)/(1-sig_w(ii,rr)))*( (alphaw_l0(ii,rr)**sig_w(ii,rr))*((cost_l_ss(ii,rr))**(1-sig_w(ii,rr))) + (alphaw_v0(ii,rr)**sig_w(ii,rr))*((cost_v_ss(ii,rr))**(1-sig_w(ii,rr))) )**(1/(1-sig_w(ii,rr)));
ss_io_lw(ii,rr)$(vv0(ii,rr) gt 0).. io_lw_ss(ii,rr) =e= ((gammaw0(ii,rr)*alphaw_l0(ii,rr))**sig_w(ii,rr)) * (cost_l_ss(ii,rr)/cost_w_ss(ii,rr))**(-sig_w(ii,rr));
ss_io_vw(ii,rr)$(vv0(ii,rr) gt 0).. io_vw_ss(ii,rr) =e= ((gammaw0(ii,rr)*alphaw_v0(ii,rr))**sig_w(ii,rr)) * (cost_v_ss(ii,rr)/cost_w_ss(ii,rr))**(-sig_w(ii,rr));



ss_cost_w2(ii,rr)$(vv0(ii,rr) = 0).. cost_w_ss(ii,rr) =e=  cost_l_ss(ii,rr);
ss_io_lw2(ii,rr)$(vv0(ii,rr) = 0).. io_lw_ss(ii,rr) =e= 1;
ss_io_vw2(ii,rr)$(vv0(ii,rr) = 0).. io_vw_ss(ii,rr) =e= 0;

ss_cost_k(ii,rr)$(y0(ii,rr) > 0).. cost_k_ss(ii,rr) =e= xkinc_ss(ii,rr)/k_ss(ii,rr);

ss_cost_x(i_nf,rr)$(nr0(i_nf,rr) = 0 and ff0(i_nf,rr) = 0 and alphax_k0(i_nf,rr) gt 0 and alphax_w0(i_nf,rr) gt 0).. cost_x_ss(i_nf,rr) =e= py_ss(i_nf,rr)*(1-tau_y0(i_nf,rr));
ss_cost_x2(i_nf,rr)$((nr0(i_nf,rr) gt 0 or ff0(i_nf,rr) gt 0) and alphax_k0(i_nf,rr) gt 0 and alphax_w0(i_nf,rr) gt 0).. cost_x_ss(i_nf,rr) =e= gammax_ss(i_nf,rr)**(sig_x(i_nf,rr)/(1-sig_x(i_nf,rr)))*( (alphax_k0(i_nf,rr)**sig_x(i_nf,rr))*((cost_k_ss(i_nf,rr))**(1-sig_x(i_nf,rr))) + (alphax_w0(i_nf,rr)**sig_x(i_nf,rr))*((cost_w_ss(i_nf,rr))**(1-sig_x(i_nf,rr))) )**(1/(1-sig_x(i_nf,rr))) ;
cost_x_ss.fx(i_nf,rr)$(nr0(i_nf,rr) = 0 and ff0(i_nf,rr) = 0 and alphax_w0(i_nf,rr) = 0 and alphax_k0(i_nf,rr) = 0) = 0;

ss_io_wx(i_nf,rr)$((nr0(i_nf,rr) gt 0 or ff0(i_nf,rr) gt 0) and alphax_w0(i_nf,rr) gt 0).. io_wx_ss(i_nf,rr) =e= ((gammax_ss(i_nf,rr)*alphax_w0(i_nf,rr))**sig_x(i_nf,rr)) * (cost_w_ss(i_nf,rr)/cost_x_ss(i_nf,rr))**(-sig_x(i_nf,rr));
ss_cost_x_ff(i_ff,rr).. cost_x_ss(i_ff,rr) =e= cost_w_ss(i_ff,rr);
ss_io_wx_ff(i_ff,rr).. io_wx_ss(i_ff,rr) =e= 1;



ss_cost_f(ii,rr)$(ff0(ii,rr) gt 0).. cost_f_ss(ii,rr) =e= sum(i,(pio_ss(i,ii,rr)+mu(i,ii,rr)*(p_e_fed_ss*mu_fed(i,ii)+p_e_reg_ss(rr)*mu_reg(i,ii,rr))*cpi_ss)*(io0_ff(i,ii,rr)+iom0_ff(i,ii,rr))/ff0(ii,rr));
ss_io_ff(i,ii,r)$(ff0(ii,r) gt 0).. io_ff_ss(i,ii,r) =e= (ff_ss(ii,r)/ff0(ii,r))*(io0_ff(i,ii,r)+iom0_ff(i,ii,r))/(1+sum(margins,io0_mr(i,ii,margins,r)));
io_ff_ss.fx(i,ii,r)$(ff0(ii,r) = 0) = 0;
cost_f_ss.fx(ii,rr)$(ff0(ii,rr) = 0) = 1;



ss_cost_z(ii,rr)$(nr0(ii,rr) gt 0 or ff0(ii,rr) gt 0).. cost_z_ss(ii,rr) =e= (alphaz_f(ii,rr)*cost_f_ss(ii,rr) + alphaz_x(ii,rr)*cost_x_ss(ii,rr)) ;
ss_io_zy(i_nf,rr)$(nr0(i_nf,rr) gt 0).. io_zy_ss(i_nf,rr) =e= ((gammay0(i_nf,rr)*alphay_z0(i_nf,rr))**sig_r(i_nf,rr)) * (cost_z_ss(i_nf,rr)/((1-tau_y0(i_nf,rr))*py_ss(i_nf,rr)))**(-sig_r(i_nf,rr));
io_zy_ss.fx(i_nf,rr)$(nr0(i_nf,rr) = 0) = io_zy0(i_nf,rr);




* Firm First Order Conditions and Quantity Variables

equations
        ss_firm_ww(*,*)
        ss_firm_ww2(*,*)
        ss_firm_ww_ff(*,*)
        
        ss_firm_zz(*,*)
        ss_firm_zz_ff(*,*)
        ss_firm_xx(*,*)
        ss_firm_ff(*,*)

        ss_firm_ld(*,*)
        ss_firm_io_e1(*,*,*)
        ss_firm_io_e2(*,*,*)
        ss_firm_io_m(*,*,*)
        ss_firm_iom(*,*,*)

        ss_dd(*)
        ss_kdep(*,*)
        ss_lambdak(*,*)
        ss_firmeuler(*,*)
        ss_firmeuler_ff(*,*)

        ss_firm_f_k(*,*)
        ss_firm_f_k_ff(*,*)


        ss_firm_y(*,*)
        ss_firm_y2(*,*)
        ss_firm_y_ff(*,*)
        ss_acexp(*,*)

        ss_firm_ry(*,*)
        ss_firm_ny(*,*)
        ss_firm_ex(*,*)
        ss_firm_my(*,*)
        ss_firm_ey(*,*)

        ss_xkinc(*,*)
        ss_prof(*,*)
        ss_v(*,*)

        ss_etot(*)
        ss_etot_net(*)
;



ss_firm_ww(i_nf,rr)$(nr0(i_nf,rr) = 0 and ff0(i_nf,rr) = 0 and alphax_w0(i_nf,rr) gt 0  and alphax_k0(i_nf,rr) gt 0).. cost_w_ss(i_nf,rr) =e= (1-tau_y0(i_nf,rr))*(py_ss(i_nf,rr))*(gammax_ss(i_nf,rr)**(1/rho_x(i_nf,rr)))*(alphax_w0(i_nf,rr)*ww_ss(i_nf,rr)**(rho_x(i_nf,rr)-1))*(alphax_k0(i_nf,rr)*k_ss(i_nf,rr)**rho_x(i_nf,rr) + alphax_w0(i_nf,rr)*ww_ss(i_nf,rr)**rho_x(i_nf,rr))**((1-rho_x(i_nf,rr))/rho_x(i_nf,rr));
ss_firm_ww2(i_nf,rr)$((nr0(i_nf,rr) gt 0 or ff0(i_nf,rr) gt 0) and alphax_w0(i_nf,rr) gt 0  and alphax_k0(i_nf,rr) gt 0).. ww_ss(i_nf,rr) =e= xx_ss(i_nf,rr)*io_wx_ss(i_nf,rr);
cost_w_ss.fx(i_nf,rr)$(nr0(i_nf,rr) = 0 and ff0(i_nf,rr) = 0 and alphax_w0(i_nf,rr) = 0) = 1;

ss_firm_ww_ff(i_ff,rr).. ww_ss(i_ff,rr) =e= xx_ss(i_ff,rr);

ss_firm_zz(i_nf,rr)$(nr0(i_nf,rr) gt 0 or ff0(i_nf,rr) gt 0).. zz_ss(i_nf,rr) =e= io_zy_ss(i_nf,rr)*(y_ss(i_nf,rr)+acexp_ss(i_nf,rr));
ss_firm_zz_ff(i_ff,r)$(y0(i_ff,r) > 0).. cost_z_ss(i_ff,r) =e= (1-tau_y0(i_ff,r))*(py_ss(i_ff,r))*(gammay0(i_ff,r)**(1/rho_r(i_ff,r)))*((alphay_z0(i_ff,r))*zz_ss(i_ff,r)**(rho_r(i_ff,r)-1))*(alphay_k0(i_ff,r)*k_ss(i_ff,r)**rho_r(i_ff,r) + alphay_z0(i_ff,r)*zz_ss(i_ff,r)**rho_r(i_ff,r) + (alphay_r0(i_ff,r))*nr_ss(i_ff,r)**rho_r(i_ff,r))**((1-rho_r(i_ff,r))/rho_r(i_ff,r));

ss_firm_xx(ii,rr)$(nr0(ii,rr) gt 0 or ff0(ii,rr) gt 0).. xx_ss(ii,rr) =e= alphaz_x(ii,rr)*zz_ss(ii,rr);
ss_firm_ff(ii,rr)$(nr0(ii,rr) gt 0 or ff0(ii,rr) gt 0).. ff_ss(ii,rr) =e= alphaz_f(ii,rr)*zz_ss(ii,rr);
ff_ss.fx(ii,rr)$(nr0(ii,rr) = 0 and ff0(ii,rr) = 0) = 0;

ss_firm_ld(ii,rr).. l_ss(ii,rr) =e= ww_ss(ii,rr)*io_lw_ss(ii,rr);
ss_firm_io_e1(ie1,ii,rr).. io_ss(ie1,ii,rr) =e= (io_ie1_ss(ie1,ii,rr)*io_e1e_ss(ii,rr)*io_ev_ss(ii,rr)*io_vw_ss(ii,rr)*ww_ss(ii,rr))/(1+sum(margins,io0_mr(ie1,ii,margins,rr)));
ss_firm_io_e2(ie2,ii,rr).. io_ss(ie2,ii,rr) =e= (io_ie2_ss(ie2,ii,rr)*io_e2e_ss(ii,rr)*io_ev_ss(ii,rr)*io_vw_ss(ii,rr)*ww_ss(ii,rr))/(1+sum(margins,io0_mr(ie2,ii,margins,rr)));
ss_firm_io_m(im,ii,rr).. io_ss(im,ii,rr) =e= io_im_ss(im,ii,rr)*io_mv_ss(ii,rr)*io_vw_ss(ii,rr)*ww_ss(ii,rr)/(1+sum(margins,io0_mr(im,ii,margins,rr)));


ss_dd(rr).. dd_ss(rr) =e= ((tau_k0+tau_kr0(rr)))*deltat/(deltat+rbar_ss(rr));
ss_kdep(ii,rr)$(y0(ii,rr) gt 0).. kdep_ss(ii,rr) =e= delta*pkbar_ss(rr)*k_ss(ii,rr)/(gr+deltat);

ss_lambdak(ii,rr)$(y0(ii,rr) gt 0).. lambdak_ss(ii,rr) =e= pkbar_ss(rr)*(1-dd_ss(rr));
ss_firmeuler(i_nf,rr)$(y0(i_nf,rr) gt 0).. lambdak_ss(i_nf,rr) =e= (1/(1+rbar_ss(rr)))*((1-tau_k0-tau_kr0(rr))*(cost_x_ss(i_nf,rr)*f_k_ss(i_nf,rr))  + lambdak_ss(i_nf,rr)*(1-delta));
ss_firmeuler_ff(i_ff,rr)$(y0(i_ff,rr) gt 0).. lambdak_ss(i_ff,rr) =e= (1/(1+rbar_ss(rr)))*((1-tau_k0-tau_kr0(rr))*((1-tau_y0(i_ff,rr))*(py_ss(i_ff,rr))*f_k_ss(i_ff,rr))  + lambdak_ss(i_ff,rr)*(1-delta));

ss_firm_f_k(i_nf,rr)$(y0(i_nf,rr) gt 0).. f_k_ss(i_nf,rr) =e= (gammax_ss(i_nf,rr)**(1/rho_x(i_nf,rr)))*(alphax_k0(i_nf,rr)*k_ss(i_nf,rr)**(rho_x(i_nf,rr)-1))*(alphax_k0(i_nf,rr)*k_ss(i_nf,rr)**rho_x(i_nf,rr) + alphax_w0(i_nf,rr)*ww_ss(i_nf,rr)**rho_x(i_nf,rr))**((1-rho_x(i_nf,rr))/rho_x(i_nf,rr));
ss_firm_f_k_ff(i_ff,r)$(y0(i_ff,r) gt 0).. f_k_ss(i_ff,r) =e= (gammay0(i_ff,r)**(1/rho_r(i_ff,r)))*((alphay_k0(i_ff,r))*k_ss(i_ff,r)**(rho_r(i_ff,r)-1))*(alphay_k0(i_ff,r)*k_ss(i_ff,r)**rho_r(i_ff,r) + alphay_z0(i_ff,r)*zz_ss(i_ff,r)**rho_r(i_ff,r) + (alphay_r0(i_ff,r))*nr_ss(i_ff,r)**rho_r(i_ff,r))**((1-rho_r(i_ff,r))/rho_r(i_ff,r));

ss_firm_y(i_nf,rr)$(nr0(i_nf,rr) = 0 and ff0(i_nf,rr) = 0 and alphax_w0(i_nf,rr) gt 0  and alphax_k0(i_nf,rr) gt 0).. y_ss(i_nf,rr) =e= (gammax_ss(i_nf,rr)**(1/rho_x(i_nf,rr)))*(alphax_k0(i_nf,rr)*k_ss(i_nf,rr)**rho_x(i_nf,rr) + alphax_w0(i_nf,rr)*ww_ss(i_nf,rr)**rho_x(i_nf,rr))**(1/rho_x(i_nf,rr)) - acexp_ss(i_nf,rr) ;
ss_firm_y2(i_nf,rr)$((nr0(i_nf,rr) gt 0 or ff0(i_nf,rr) gt 0) and alphax_w0(i_nf,rr) gt 0  and alphax_k0(i_nf,rr) gt 0).. py_ss(i_nf,rr) =e= (cost_z_ss(i_nf,rr)*io_zy_ss(i_nf,rr) + pr_ss(i_nf,rr)*(nr_ss(i_nf,rr)/(y_ss(i_nf,rr)+acexp_ss(i_nf,rr))))/(1-tau_y0(i_nf,rr));
y_ss.fx(i_nf,rr)$(nr0(i_nf,rr) = 0 and ff0(i_nf,rr) = 0 and alphax_w0(i_nf,rr) = 0 and alphax_k0(i_nf,rr) = 0) = 0;
ss_firm_y_ff(i_ff,r)$(y0(i_ff,r) gt 0).. y_ss(i_ff,r) =e= (gammay0(i_ff,r)**(1/rho_r(i_ff,r)))*(alphay_k0(i_ff,r)*k_ss(i_ff,r)**rho_r(i_ff,r) + alphay_z0(i_ff,r)*zz_ss(i_ff,r)**rho_r(i_ff,r) + (alphay_r0(i_ff,r))*nr_ss(i_ff,r)**rho_r(i_ff,r))**(1/rho_r(i_ff,r)) - acexp_ss(i_ff,r);
ss_acexp(ii,rr)$(y0(ii,rr) gt 0).. acexp_ss(ii,rr) =e= 0;


ss_firm_ry(ii,rr)$(y0(ii,rr) > 0).. ry_ss(ii,rr) =e= (y_ss(ii,rr)+gy_reg0(ii,rr)+gy_fed0(ii,rr))*alphay_dr0(ii,rr)*(p_ss(ii,rr)/py_ss(ii,rr))**(sig_ex(ii,rr));
ss_firm_ny(ii,rr)$(y0(ii,rr) > 0).. ny_ss(ii,rr) =e= (y_ss(ii,rr)+gy_reg0(ii,rr)+gy_fed0(ii,rr))*alphay_dn0(ii,rr)*(pn_ss(ii)/py_ss(ii,rr))**(sig_ex(ii,rr));
ss_firm_ex(ii,rr)$(y0(ii,rr) > 0).. ex_ss(ii,rr) =e= (y_ss(ii,rr)+gy_reg0(ii,rr)+gy_fed0(ii,rr))*alphay_f0(ii,rr)*((pf_ss(ii)/exch_ss)/py_ss(ii,rr))**(sig_ex(ii,rr));
ss_firm_my(ii,rr)$(y0(ii,rr) > 0).. my_ss(ii,rr) =e= (y_ss(ii,rr)+gy_reg0(ii,rr)+gy_fed0(ii,rr))*alphay_m0(ii,rr)*(pmy_ss(ii)/py_ss(ii,rr))**(sig_ex(ii,rr));

ss_firm_ey(i_td,rr).. ey_ss(i_td,rr) =e= (y_ss(i_td,rr)+gy_reg0(i_td,rr)+gy_fed0(i_td,rr))*alphay_e0(i_td,rr)*(sum(er,maper(rr,er)*pe_ss(er))/py_ss(i_td,rr))**(sig_ex(i_td,rr));


ss_xkinc(i,r).. xkinc_ss(i,r) =e= py_ss(i,r)*(1-tau_y0(i,r))*y_ss(i,r) - cost_w_ss(i,r)*ww_ss(i,r) - cost_f_ss(i,r)*ff_ss(i,r) - pr_ss(i,r)*nr_ss(i,r);
ss_prof(i,r).. prof_ss(i,r) =e= (1-tau_k0-tau_kr0(r))*xkinc_ss(i,r) + (tau_k0+tau_kr0(r))*deltat*kdep_ss(i,r) - delta*pkbar_ss(r)*k_ss(i,r) + cpi_ss*p_e_fed_ss*allow_fed_ss(i,r);
ss_v(i,r).. v_ss(i,r) =e= lambdak_ss(i,r)*k_ss(i,r) + dd_ss(r)*kdep_ss(i,r) + ((cpi_ss*p_e_fed_ss*allow_fed_ss(i,r))/(1+rbarn0))/(1-(1/(1+rbarn0)));



ss_etot(r).. etot_ss(r) =e=  sum(j,muc(j,r)*cg_ss(j,r)) + sum(i,mug(i,r)*(g_fed_ss(i,r)*(1+sum(margins,g_fed0_mr(i,margins,r)))+g_reg_ss(i,r)*(1+sum(margins,g_reg0_mr(i,margins,r)))) + sum(ii,((io_ss(i,ii,r)+io_ff_ss(i,ii,r))*(1+sum(margins,io0_mr(i,ii,margins,r))))*mu(i,ii,r)))     ;
ss_etot_net(r).. etot_net_ss(r) =e= etot_ss(r);


* Market Clearing

equations
ss_mc_y(*,*)
ss_mc_y2(*,*)
ss_mc_ny(*)
ss_mc_my(*)
ss_mc_ey(*)
ss_mc_l(*)
ss_mc_f
;


ss_mc_y(i,r)$(alphax_w0(i,r) gt 0  and alphax_k0(i,r) gt 0).. ry_ss(i,r) - g_dr_ss(i,r) =g= 0;
p_ss.fx(i,r)$(alphax_w0(i,r) = 0  and alphax_k0(i,r) = 0)=1;
ss_mc_ny(i).. sum(r,ny_ss(i,r)) - sum(r,g_dn_ss(i,r)) =g= 0;
ss_mc_my(i)$(sum(r,my0(i,r)) > 0).. sum(r,my_ss(i,r)) - sum(r,sum(margins,map_mr(i,margins)*dm_ss(margins,r))) =g= 0;
ss_mc_ey(er).. sum(i_td,sum(r,maper(r,er)*ey_ss(i_td,r)) - sum(r,maper(r,er)*g_dn_ss(i_td,r))) =g= 0;
ss_mc_l(r).. ls_ss(r) - sum(i,l_ss(i,r)) - lg_fed0(r) - lg_reg0(r) =g= 0;
ss_mc_f.. sum(r,sum(i,(pf_ss(i)/exch_ss)*(im0(i,r)-ex0(i,r)))) + sum(r,sum(i,(pf_ss(i)/exch_ss)*(ex_ss(i,r)-g_f_ss(i,r)))) =g= 0;



* Initialization


p_ss.l(i,r) = 1;
p_ss.fx(i_ff,r) = 1;
pn_ss.l(i) = 1;
pn_ss.fx(i_elec) = 1;
pe_ss.l(er) = 1;
pmy_ss.l(i) = 1;
exch_ss.l = 1;
w_ss.l(r) = 1;
rbar_ss.l(r) = rbar0;
lambda_ss.l(r) = lambda0(r);
lambdak_ss.l(i,r) = lambdak0(i,r);
lambdak_ss.fx(i,r)$(y0(i,r) = 0) = lambdak0(i,r);



pbar_ss.l(r) = pbar0(r);
pkbar_ss.l(r) = pkbar0(r);
wbar_ss.l(r) = wbar0(r);
pd_ss.l(i,r) = pd0(i,r);
pg_ss.l(i,r) = pg0(i,r);
py_ss.l(i,r) = py0(i,r);
pc_ss.l(i,r) = pc0(i,r);
pi_ss.l(i,r) = pi0(i,r);
pgf_ss.l(i,r) = pgf0(i,r);
pgr_ss.l(i,r) = pgr0(i,r);
pio_ss.l(i,ii,r) = pio0(i,ii,r);
pm_ss.l(margins,r) = pm0(margins,r);
pr_ss.l(i,r) = pr0(i,r);
cp_ss.l(j,r) = cp0(j,r);
cpv_ss.l(cjv,r) = cpv0(cjv,r);
cpumlot_ss.l(cju,r) = cpumlot0(cju,r);
cptilde_ss.l(cjt,r) = cptilde0(cjt,r);
cphat_ss.l(cj,r) = cphat0(cj,r);

ppi_ss.l = 1;
cpi_ss.l = 1;


cbar_ss.l(r) = pcbar0(r)/pbar0(r);
leis_ss.l(r) = leis0(r);
ls_ss.l(r) = ls0(r);


crev_fed_ss.l(r) = 0;
crev_reg_ss.l(r) = 0;
crebate_fed_ss.l(r) = 0;
crebate_reg_ss.l(r) = 0;
grev_fed_ss.l(r) = grev_fed0(r);
grev_reg_ss.l(r) = grev_reg0(r);
glump_fed_ss.l(r) = glump_fed0(r);
glump_reg_ss.l(r) = glump_reg0(r);
ggrant_ss.l(r) = ggrant0(r);

c_cv_ss.l(j,cjv,r) = c_cv0(j,cjv,r);
cv_cumlot_ss.l(cjv,cju,r) = cv_cumlot0(cjv,cju,r);
cumlot_ctilde_ss.l(cju,cjt,r) = cumlot_ctilde0(cju,cjt,r);
ctilde_chat_ss.l(cjt,cj,r) = ctilde_chat0(cjt,cj,r);
chat_cbar_ss.l(cj,r) = chat_cbar0(cj,r);
cg_ss.l(j,r) = cg0(j,r);
c_ss.l(i,r) = c0(i,r);
pce_ss.l(i,r) = pce0(i,r);
ibar_ss.l(r) = ibar0(r);
i_ss.l(i,r) = i0(i,r);
pfi_ss.l(i,r) = pfi0(i,r);
g_ss.l(i,r) = g0(i,r);
g_d_ss.l(i,r) = g0_d(i,r);
g_f_ss.l(i,r) = g0_f(i,r);
g_dn_ss.l(i,r) = g0_dn(i,r);
g_dr_ss.l(i,r) = g0_dr(i,r);
g_dr_ss.fx(i_ff,r) = 0;
dm_ss.l(margins,r) = dm0(margins,r);



cost_e1_ss.l(ii,rr)$(y0(ii,rr) gt 0) = cost_e10(ii,rr);
io_ie1_ss.l(ie1,ii,rr)$(y0(ii,rr) gt 0) = io_ie10(ie1,ii,rr);
cost_e2_ss.l(ii,rr)$(y0(ii,rr) gt 0) = cost_e20(ii,rr);
io_ie2_ss.l(ie2,ii,rr)$(y0(ii,rr) gt 0) = io_ie20(ie2,ii,rr);
cost_e_ss.l(ii,rr)$(y0(ii,rr) gt 0) = cost_e0(ii,rr);
io_e1e_ss.l(ii,rr)$(y0(ii,rr) gt 0) = io_e1e0(ii,rr);
io_e2e_ss.l(ii,rr)$(y0(ii,rr) gt 0) = io_e2e0(ii,rr);
cost_m_ss.l(ii,rr)$(y0(ii,rr) gt 0) = cost_m0(ii,rr);
io_im_ss.l(im,ii,rr)$(y0(ii,rr) gt 0) = io_im0(im,ii,rr);
cost_l_ss.l(ii,rr)$(y0(ii,rr) gt 0) = cost_l0(ii,rr);
cost_v_ss.l(ii,rr)$(y0(ii,rr) gt 0) = cost_v0(ii,rr);
io_ev_ss.l(ii,rr)$(y0(ii,rr) gt 0) = io_ev0(ii,rr);
io_mv_ss.l(ii,rr)$(y0(ii,rr) gt 0) = io_mv0(ii,rr);
cost_w_ss.l(ii,rr)$(y0(ii,rr) gt 0) = cost_w0(ii,rr);
io_lw_ss.l(ii,rr)$(y0(ii,rr) gt 0) = io_lw0(ii,rr);
io_vw_ss.l(ii,rr)$(y0(ii,rr) gt 0) = io_vw0(ii,rr);

cost_e1_ss.fx(ii,rr)$(y0(ii,rr) = 0) = cost_e10(ii,rr);
io_ie1_ss.fx(ie1,ii,rr)$(y0(ii,rr) = 0) = io_ie10(ie1,ii,rr);
cost_e2_ss.fx(ii,rr)$(y0(ii,rr) = 0) = cost_e20(ii,rr);
io_ie2_ss.fx(ie2,ii,rr)$(y0(ii,rr) = 0) = io_ie20(ie2,ii,rr);
cost_e1_ss.fx(ii,rr)$(y0(ii,rr) = 0) = cost_e10(ii,rr);
cost_e2_ss.fx(ii,rr)$(y0(ii,rr) = 0) = cost_e20(ii,rr);
io_e1e_ss.fx(ii,rr)$(y0(ii,rr) = 0) = io_e1e0(ii,rr);
io_e2e_ss.fx(ii,rr)$(y0(ii,rr) = 0) = io_e2e0(ii,rr);
cost_m_ss.fx(ii,rr)$(y0(ii,rr) = 0) = cost_m0(ii,rr);
io_im_ss.fx(im,ii,rr)$(y0(ii,rr) = 0) = io_im0(im,ii,rr);
cost_l_ss.fx(ii,rr)$(y0(ii,rr) = 0) = cost_l0(ii,rr);
cost_v_ss.fx(ii,rr)$(y0(ii,rr) = 0) = cost_v0(ii,rr);
io_ev_ss.fx(ii,rr)$(y0(ii,rr) = 0) = io_ev0(ii,rr);
io_mv_ss.fx(ii,rr)$(y0(ii,rr) = 0) = io_mv0(ii,rr);
cost_w_ss.fx(ii,rr)$(y0(ii,rr) = 0) = cost_w0(ii,rr);
io_lw_ss.fx(ii,rr)$(y0(ii,rr) = 0) = io_lw0(ii,rr);
io_vw_ss.fx(ii,rr)$(y0(ii,rr) = 0) = io_vw0(ii,rr);


cost_k_ss.l(ii,rr)$(y0(ii,rr) gt 0) = cost_k0(ii,rr);
cost_x_ss.l(ii,rr)$(y0(ii,rr) gt 0) = cost_x0(ii,rr);
io_wx_ss.l(ii,rr)$(y0(ii,rr) gt 0) = io_wx0(ii,rr);
cost_f_ss.l(ii,rr)$(y0(ii,rr) gt 0) = cost_f0(ii,rr);
io_ff_ss.l(i,ii,rr)$(y0(ii,rr) gt 0) = io0_ff(i,ii,rr);
cost_z_ss.l(ii,rr)$(y0(ii,rr) gt 0) = cost_z0(ii,rr);
io_zy_ss.l(i_nf,rr)$(y0(i_nf,rr) gt 0) = io_zy0(i_nf,rr);

cost_k_ss.fx(ii,rr)$(y0(ii,rr) = 0) = cost_k0(ii,rr);
cost_x_ss.fx(ii,rr)$(y0(ii,rr) = 0) = cost_x0(ii,rr);
io_wx_ss.fx(ii,rr)$(y0(ii,rr) = 0) = io_wx0(ii,rr);
cost_f_ss.fx(ii,rr)$(y0(ii,rr) = 0) = cost_f0(ii,rr);
io_ff_ss.fx(i,ii,rr)$(y0(ii,rr) = 0) = io0_ff(i,ii,rr);
cost_z_ss.fx(ii,rr)$(y0(ii,rr) = 0) = cost_z0(ii,rr);
io_zy_ss.fx(i_nf,rr)$(y0(i_nf,rr) = 0) = io_zy0(i_nf,rr);



zz_ss.l(ii,rr)$(y0(ii,rr) gt 0) = zz0(ii,rr);
xx_ss.l(ii,rr)$(y0(ii,rr) gt 0) = xx0(ii,rr);
ff_ss.l(ii,rr)$(y0(ii,rr) gt 0) = ff0(ii,rr);
ww_ss.l(ii,rr)$(y0(ii,rr) gt 0) = ww0(ii,rr);
l_ss.l(ii,rr)$(y0(ii,rr) gt 0) = l0(ii,rr);
io_ss.l(i,ii,rr)$(y0(ii,rr) gt 0) = io0(i,ii,rr);
k_ss.l(ii,rr)$(y0(ii,rr) gt 0) = k0(ii,rr);
f_k_ss.l(ii,rr)$(y0(ii,rr) gt 0) = f_k0(ii,rr);
acexp_ss.l(ii,rr)$(y0(ii,rr) gt 0) = acexp0(ii,rr);
y_ss.l(ii,rr)$(y0(ii,rr) gt 0) = y0(ii,rr);
ry_ss.l(ii,rr)$(y0(ii,rr) gt 0) = g0_dr(ii,rr);
ny_ss.l(ii,rr)$(y0(ii,rr) gt 0) = exd0(ii,rr);
ex_ss.l(ii,rr)$(y0(ii,rr) gt 0) = ex0(ii,rr);
my_ss.l(ii,rr)$(my0(ii,rr) gt 0) = my0(ii,rr);
ey_ss.l(i_td,rr)$(y0(i_td,rr) gt 0) = exd0(i_td,rr);
xkinc_ss.l(ii,rr)$(y0(ii,rr) gt 0) = xkinc0(ii,rr);
prof_ss.l(ii,rr)$(y0(ii,rr) gt 0) = prof0(ii,rr);
dd_ss.l(rr) = dd0(rr);
kdep_ss.l(ii,rr)$(k0(ii,rr) gt 0) = kdep0(ii,rr);
v_ss.l(ii,rr)$(k0(ii,rr) gt 0) = v0(ii,rr);
allow_fed_ss.fx(ii,rr) = 0;

zz_ss.fx(ii,rr)$(y0(ii,rr) = 0) = zz0(ii,rr);
xx_ss.fx(ii,rr)$(y0(ii,rr) = 0) = xx0(ii,rr);
ff_ss.fx(ii,rr)$(y0(ii,rr) = 0) = ff0(ii,rr);
ww_ss.fx(ii,rr)$(y0(ii,rr) = 0) = 0;
l_ss.fx(ii,rr)$(y0(ii,rr) = 0) = 0;
io_ss.fx(i,ii,rr)$(y0(ii,rr) = 0) = 0;
iom_ss.fx(i,ii,rr)$(y0(ii,rr) = 0) = 0;
k_ss.fx(ii,rr)$(y0(ii,rr) = 0) = 0;
f_k_ss.fx(ii,rr)$(y0(ii,rr) = 0) = 0;
acexp_ss.fx(ii,rr)$(y0(ii,rr) = 0) = 0;
y_ss.fx(ii,rr)$(y0(ii,rr) = 0) = 0;
ry_ss.fx(ii,rr)$(y0(ii,rr) = 0) = 0;
ny_ss.fx(ii,rr)$(y0(ii,rr) = 0) = 0;
ex_ss.fx(ii,rr)$(y0(ii,rr) = 0) = 0;
my_ss.fx(ii,rr)$(my0(ii,rr) = 0) = 0;
ey_ss.fx(ii,rr)$(y0(ii,rr) = 0) = 0;
ey_ss.fx(ii,rr)$(not i_td(ii)) = 0;
ny_ss.fx(i_td,rr) = 0;
xkinc_ss.fx(ii,rr)$(y0(ii,rr) = 0) = 0;
prof_ss.fx(ii,rr)$(y0(ii,rr) = 0) = 0;
kdep_ss.fx(ii,rr)$(k0(ii,rr) = 0) = 0;


etot_ss.l(r) = etot0(r);
etot_net_ss.l(r) = etot0(r);





model DR_GEM_SS_LUMP /

        ss_pbar.pbar_ss
        ss_pkbar.pkbar_ss
        ss_wbar.wbar_ss
        ss_pd.pd_ss
        ss_pd_ff.pd_ss
        ss_pd_td.pd_ss
        ss_pg.pg_ss
        ss_py.py_ss
        ss_pc.pc_ss
        ss_pi.pi_ss
        ss_pgf.pgf_ss
        ss_pgr.pgr_ss
        ss_pio.pio_ss
        ss_pm.pm_ss
        ss_pr.pr_ss
        ss_pr_ff.pr_ss
        ss_cp.cp_ss
        ss_cpv.cpv_ss
        ss_cpumlot.cpumlot_ss
        ss_cphat.cphat_ss
        ss_cptilde.cptilde_ss


        ss_ppi.ppi_ss
        ss_cpi.cpi_ss

        ss_hheuler.rbar_ss
        ss_hh_foc_c.cbar_ss
        ss_hh_foc_l.leis_ss
        ss_hh_ls.ls_ss
        ss_bc.lambda_ss

        ss_crev_fed.crev_fed_ss
        ss_crev_reg.crev_reg_ss
        ss_grev_fed.grev_fed_ss
        ss_grev_reg.grev_reg_ss
        ss_glump_fed.glump_fed_ss
        ss_glump_reg.glump_reg_ss
        ss_crebate_fed.crebate_fed_ss
        ss_crebate_reg.crebate_reg_ss
        ss_ggrant.ggrant_ss


        ss_c_cv.c_cv_ss
        ss_cv_cumlot.cv_cumlot_ss
        ss_cumlot_ctilde.cumlot_ctilde_ss
        ss_ctilde_chat.ctilde_chat_ss
        ss_chat_cbar.chat_cbar_ss
        ss_cg.cg_ss
        ss_c.c_ss
        ss_pce.pce_ss
        ss_ibar.ibar_ss
        ss_i.i_ss
        ss_pfi.pfi_ss
        ss_g.g_ss
        ss_g_d.g_d_ss
        ss_g_f.g_f_ss
        ss_g_dr.g_dr_ss
        ss_g_dn.g_dn_ss
        ss_g_dn_ff.g_dn_ss
        ss_g_dn_td.g_dn_ss
        ss_dm.dm_ss

        ss_cost_e1.cost_e1_ss
        ss_io_ie1.io_ie1_ss
        ss_cost_e2.cost_e2_ss
        ss_io_ie2.io_ie2_ss
        ss_cost_e.cost_e_ss
        ss_io_e1e.io_e1e_ss
        ss_io_e2e.io_e2e_ss
        ss_cost_ee2.cost_e_ss
        ss_io_e1e2.io_e1e_ss
        ss_io_e2e2.io_e2e_ss
        ss_cost_m.cost_m_ss
        ss_io_im.io_im_ss
        ss_cost_l.cost_l_ss
        ss_cost_v.cost_v_ss
        ss_io_ev.io_ev_ss
        ss_io_mv.io_mv_ss
        ss_cost_v2.cost_v_ss
        ss_io_ev2.io_ev_ss
        ss_io_mv2.io_mv_ss
        ss_cost_w.cost_w_ss
        ss_io_lw.io_lw_ss
        ss_io_vw.io_vw_ss
        ss_cost_w2.cost_w_ss
        ss_io_lw2.io_lw_ss
        ss_io_vw2.io_vw_ss
        ss_cost_k.cost_k_ss
        ss_cost_x.cost_x_ss
        ss_cost_x2.cost_x_ss
        ss_cost_x_ff.cost_x_ss
        ss_io_wx.io_wx_ss
        ss_io_wx_ff.io_wx_ss
        ss_cost_f.cost_f_ss
        ss_io_ff.io_ff_ss
        ss_cost_z.cost_z_ss
        ss_io_zy.io_zy_ss

        ss_firm_ww.ww_ss
        ss_firm_ww2.ww_ss
        ss_firm_ww_ff.ww_ss
        ss_firm_zz.zz_ss
        ss_firm_zz_ff.zz_ss

        ss_firm_xx.xx_ss
        ss_firm_ff.ff_ss

        ss_firm_ld.l_ss
        ss_firm_io_e1.io_ss
        ss_firm_io_e2.io_ss
        ss_firm_io_m.io_ss
        ss_lambdak.lambdak_ss
        ss_firmeuler.k_ss
        ss_firmeuler_ff.k_ss

        ss_firm_f_k.f_k_ss
        ss_firm_f_k_ff.f_k_ss

        ss_firm_y.y_ss
        ss_firm_y2.y_ss
        ss_firm_y_ff.y_ss
        ss_acexp.acexp_ss
        ss_firm_ry.ry_ss
        ss_firm_ny.ny_ss
        ss_firm_my.my_ss
        ss_firm_ex.ex_ss
        ss_firm_ey.ey_ss
        ss_xkinc.xkinc_ss
        ss_prof.prof_ss
        ss_dd.dd_ss
        ss_kdep.kdep_ss
        ss_v.v_ss

        ss_etot.etot_ss
        ss_etot_net.etot_net_ss


        ss_mc_y.p_ss
        ss_mc_ny.pn_ss
        ss_mc_my.pmy_ss
        ss_mc_ey.pe_ss
        ss_mc_l.w_ss
        ss_mc_f.exch_ss
/
;



** Transition

* Complementary Price/Equations
variables
p(*,*,*)
pn(*,*)
pe(*,*)
pmy(*,*)
exch(*)
w(*,*)
lambda(*,*)
lambdak(*,*,*)

;

* Secondary Variables

variables
pbar(*,*)
pkbar(*,*)
wbar(*,*)
rbar(*,*)
rbarn(*,*)
pd(*,*,*)
pg(*,*,*)
py(*,*,*)
pc(*,*,*)
pi(*,*,*)
pgf(*,*,*)
pgr(*,*,*)
pio(*,*,*,*)
pm(*,*,*)
pr(*,*,*)
cp(*,*,*)
cpv(*,*,*)
cpumlot(*,*,*)
cptilde(*,*,*)
cphat(*,*,*)

ppi
cpi


crev_fed
grev_fed
glump_fed
crebate_fed
crev_reg(*,*)
grev_reg(*,*)
glump_reg(*,*)
crebate_reg(*,*)
ggrant(*,*)

cbar(*,*)
leis(*,*)
ls(*,*)


c_cv(*,*,*,*)
cv_cumlot(*,*,*,*)
cumlot_ctilde(*,*,*,*)
ctilde_chat(*,*,*,*)
chat_cbar(*,*,*)
cg(*,*,*)
cons(*,*,*)
pce(*,*,*)
ibar(*,*)
inv(*,*,*)
pfi(*,*,*)
io_ff(*,*,*,*)
g(*,*,*)
g_d(*,*,*)
g_f(*,*,*)
g_dn(*,*,*)
g_dr(*,*,*)
dm(*,*,*)



cost_e1(*,*,*)
io_ie1(*,*,*,*)
cost_e2(*,*,*)
io_ie2(*,*,*,*)
cost_e(*,*,*)
io_e1e(*,*,*)
io_e2e(*,*,*)
cost_m(*,*,*)
io_im(*,*,*,*)
cost_l(*,*,*)
cost_v(*,*,*)
io_ev(*,*,*)
io_mv(*,*,*)
cost_w(*,*,*)
io_lw(*,*,*)
io_vw(*,*,*)
cost_k(*,*,*)
cost_x(*,*,*)
io_wx(*,*,*)
cost_f(*,*,*)
io_ff(*,*,*,*)
cost_z(*,*,*)
io_zy(*,*,*)


zz(*,*,*)
xx(*,*,*)
ff(*,*,*)
ww(*,*,*)
l(*,*,*)
io(*,*,*,*)
k(*,*,*)
xir(*,*,*)
f_k(*,*,*)
acexp(*,*,*)
y(*,*,*)
ex(*,*,*)
ry(*,*,*)
ny(*,*,*)
my(*,*,*)
ey(*,*,*)
xkinc(*,*,*)
prof(*,*,*)
dd(*,*)
kdep(*,*,*)
v(*,*,*)
allow_fed(*,*,*)

etot(*,*)
etot_net(*,*)


;

* Transition Equations

* Prices

equations
        trans_pbar(*,*)
        trans_pkbar(*,*)
        trans_wbar(*,*)
        trans_rbar(*,*)
        trans_rbar_tc(*,*)
        trans_pg(*,*,*)
        trans_pd(*,*,*)
        trans_pd_ff(*,*,*)
        trans_pd_td(*,*,*)
        trans_py(*,*,*)
        trans_pc(*,*,*)
        trans_pi(*,*,*)
        trans_pgf(*,*,*)
        trans_pgr(*,*,*)
        trans_pio(*,*,*,*)
        trans_pm(*,*,*)
        trans_pr(*,*,*)
        trans_pr_ff(*,*,*)
        trans_cp(*,*,*)
        trans_cpv(*,*,*)
        trans_cpumlot(*,*,*)
        trans_cptilde(*,*,*)
        trans_cphat(*,*,*)

        trans_ppi
        trans_cpi
;


trans_pbar(r,t).. pbar(r,t) =e= gammacbar(r)**(sig_cbar/(1-sig_cbar)) *( sum(cj, (alphacbar(cj,r)**sig_cbar)*((cphat(cj,r,t))**(1-sig_cbar))) )**(1/(1-sig_cbar));
trans_pkbar(r,t).. pkbar(r,t) =e= sum(i,xi0(i,r)*(pi(i,r,t)));
trans_wbar(r,t).. wbar(r,t) =e= w(r,t)*(1-tau_l0-tau_lr0(r));

trans_rbar(r,t)$(not tlast(t)).. rbar(r,t) =e= ((1+rbarn(r,t))/(pbar(r,t+1)/pbar(r,t)) - 1);
trans_rbar_tc(r,tlast).. rbar(r,tlast) =e= ((1+rbarn(r,tlast))/(1+gp) - 1);

trans_pg(i,r,t).. pg(i,r,t) =e= gammag0(i,r)**(sig_f(i,r)/(1-sig_f(i,r)))*( (alphag_d0(i,r)**sig_f(i,r))*((pd(i,r,t))**(1-sig_f(i,r))) + (alphag_f0(i,r)**sig_f(i,r))*((pf(i,t)/exch(t))**(1-sig_f(i,r)))     )**(1/(1-sig_f(i,r)));
trans_py(i,r,t).. py(i,r,t) =e= (alphay_dr0(i,r)*p(i,r,t)**(1+sig_ex(i,r)) + alphay_dn0(i,r)*pn(i,t)**(1+sig_ex(i,r)) + alphay_e0(i,r)*(sum(er,maper(r,er)*pe(er,t)))**(1+sig_ex(i,r)) + alphay_f0(i,r)*(pf(i,t)/exch(t))**(1+sig_ex(i,r)) + alphay_m0(i,r)*pmy(i,t)**(1+sig_ex(i,r)))**(1/(1+sig_ex(i,r)));

trans_pd(i,r,t)$(not i_ff(i) and not i_td(i)).. pd(i,r,t) =e= gammar0(i,r)**(sig_rn(i,r)/(1-sig_rn(i,r)))*( (alphar_r0(i,r)**sig_rn(i,r))*((p(i,r,t))**(1-sig_rn(i,r))) + (alphar_n0(i,r)**sig_rn(i,r))*(pn(i,t)**(1-sig_rn(i,r)))     )**(1/(1-sig_rn(i,r)));
trans_pd_ff(i_ff,r,t).. pd(i_ff,r,t) =e= pn(i_ff,t);
trans_pd_td(i_td,r,t).. pd(i_td,r,t) =e= gammar0(i_td,r)**(sig_rn(i_td,r)/(1-sig_rn(i_td,r)))*( (alphar_r0(i_td,r)**sig_rn(i_td,r))*((p(i_td,r,t))**(1-sig_rn(i_td,r))) + (alphar_e0(i_td,r)**sig_rn(i_td,r))*((sum(er,maper(r,er)*pe(er,t)))**(1-sig_rn(i_td,r)))     )**(1/(1-sig_rn(i_td,r)));


trans_pc(i,r,t).. pc(i,r,t) =e= (1/(1+sum(margins,pce0_mr(i,margins,r))))*pg(i,r,t) + sum(margins,pce0_mr(i,margins,r)*pm(margins,r,t))/(1+sum(margins,pce0_mr(i,margins,r)));
trans_pi(i,r,t).. pi(i,r,t) =e= (1/(1+sum(margins,pfi0_mr(i,margins,r))))*pg(i,r,t) + sum(margins,pfi0_mr(i,margins,r)*pm(margins,r,t))/(1+ sum(margins,pfi0_mr(i,margins,r)));
trans_pgf(i,r,t).. pgf(i,r,t) =e= (1/(1+sum(margins,g_fed0_mr(i,margins,r))))*pg(i,r,t) + sum(margins,g_fed0_mr(i,margins,r)*pm(margins,r,t))/(1+ sum(margins,g_fed0_mr(i,margins,r)));
trans_pgr(i,r,t).. pgr(i,r,t) =e= (1/(1+sum(margins,g_reg0_mr(i,margins,r))))*pg(i,r,t) + sum(margins,g_reg0_mr(i,margins,r)*pm(margins,r,t))/(1+ sum(margins,g_reg0_mr(i,margins,r)));
trans_pio(i,ii,r,t).. pio(i,ii,r,t) =e= (1/(1+sum(margins,io0_mr(i,ii,margins,r))))*pg(i,r,t) + sum(margins,io0_mr(i,ii,margins,r)*pm(margins,r,t))/(1+ sum(margins,io0_mr(i,ii,margins,r)));
trans_pm(margins,r,t).. pm(margins,r,t) =e= sum(i,map_mr(i,margins)*pmy(i,t)) ;

trans_pr(i_nf,r,t)$(nr0(i_nf,r)>0).. pr(i_nf,r,t) =e= (1-tau_y0(i_nf,r))*py(i_nf,r,t)*(gammay0(i_nf,r)**(1/rho_r(i_nf,r)))*((alphay_r0(i_nf,r))*nr(i_nf,r,t)**(rho_r(i_nf,r)-1))*(alphay_z0(i_nf,r)*zz(i_nf,r,t)**rho_r(i_nf,r) + (alphay_r0(i_nf,r))*nr(i_nf,r,t)**rho_r(i_nf,r))**((1-rho_r(i_nf,r))/rho_r(i_nf,r));
pr.fx(i_nf,r,t)$(nr0(i_nf,r) = 0) = 0;
trans_pr_ff(i_ff,r,t)$(y0(i_ff,r) gt 0).. pr(i_ff,r,t) =e=  (1-tau_y0(i_ff,r))*py(i_ff,r,t)*(gammay0(i_ff,r)**(1/rho_r(i_ff,r)))*((alphay_r0(i_ff,r))*nr(i_ff,r,t)**(rho_r(i_ff,r)-1))*(alphay_k0(i_ff,r)*k(i_ff,r,t)**rho_r(i_ff,r) + alphay_z0(i_ff,r)*zz(i_ff,r,t)**rho_r(i_ff,r) + (alphay_r0(i_ff,r))*nr(i_ff,r,t)**rho_r(i_ff,r))**((1-rho_r(i_ff,r))/rho_r(i_ff,r));
pr.fx(i_ff,r,t)$(y0(i_ff,r) = 0) = 1;

trans_cp(j,r,t).. cp(j,r,t) =e= sum(i_cons,gmaxp(i_cons,j,r)*pc(i_cons,r,t));
trans_cpv(cjv,r,t).. cpv(cjv,r,t) =e= gammacv(cjv,r)**(sig_cv(cjv)/(1-sig_cv(cjv))) *( sum(j,cmapv(j,cjv) * (alphacv(j,cjv,r,t)**sig_cv(cjv))*((cp(j,r,t)+muc(j,r)*(p_e_fed(t)*muc_fed(j)+p_e_reg(r,t)*muc_reg(j,r))*cpi(t))**(1-sig_cv(cjv)))) )**(1/(1-sig_cv(cjv)));
trans_cpumlot(cju,r,t).. cpumlot(cju,r,t) =e= gammacu(cju,r)**(sig_cu(cju)/(1-sig_cu(cju))) *( sum(cjv,cmapu(cjv,cju) * (alphacu(cjv,cju,r,t)**sig_cu(cju))*((cpv(cjv,r,t))**(1-sig_cu(cju)))) )**(1/(1-sig_cu(cju)));
trans_cptilde(cjt,r,t).. cptilde(cjt,r,t) =e= gammact(cjt,r)**(sig_ct(cjt)/(1-sig_ct(cjt))) *( sum(cju,cmapt(cju,cjt) * (alphact(cju,cjt,r,t)**sig_ct(cjt))*((cpumlot(cju,r,t))**(1-sig_ct(cjt)))) )**(1/(1-sig_ct(cjt)));
trans_cphat(cj,r,t).. cphat(cj,r,t) =e= gammac(cj,r)**(sig_c(cj)/(1-sig_c(cj))) *( sum(cjt,cmap(cjt,cj) * (alphac(cjt,cj,r)**sig_c(cj))*((cptilde(cjt,r,t))**(1-sig_c(cj)))) )**(1/(1-sig_c(cj)));


trans_cpi(t).. cpi(t) =e= sum(j,sum(r,(cp(j,r,t)+muc(j,r)*(p_e_fed(t)*muc_fed(j)+p_e_reg(r,t)*muc_reg(j,r))*cpi(t))*cg0(j,r)))/sum(j,sum(r,cp0(j,r)*cg0(j,r)));
trans_ppi(t).. ppi(t) =e= sum(i,sum(r,py(i,r,t)*y0(i,r)))/sum(i,sum(r,py0(i,r)*y0(i,r)));

* Households


equations
        trans_hh_foc_c(*,*)
        trans_hh_foc_l(*,*)
        trans_hh_ls(*,*)
        trans_hheuler(*,*)
        trans_hheuler_tc(*,*)
        trans_bc(*,*)

;

trans_hh_foc_c(r,t).. cbar(r,t) =e= hhtot(r)*(( lambda(r,t)*pbar(r,t))**(-1/sigma))*(1+alpha_leis(r)*(pbar(r,t)/wbar(r,t))**(eta(r)-1))**(((1/sigma)-eta(r))/(eta(r)-1));
trans_hh_foc_l(r,t).. leis(r,t) =e= cbar(r,t)*alpha_leis(r)*(pbar(r,t)/wbar(r,t))**(eta(r));
trans_hh_ls(r,t).. ls(r,t) =e= ht_d(r) - leis(r,t);
trans_hheuler(r,t)$(not tlast(t)).. lambda(r,t) =e= beta*(lambda(r,t+1))*(1+rbarn(r,t));
trans_hheuler_tc(r,tlast).. lambda(r,tlast) =e= beta*(lambda_ss(r))*(1+rbarn(r,tlast));

trans_bc(r,t).. wbar(r,t)*ls(r,t) + sum(i,prof(i,r,t)+pr(i,r,t)*nr(i,r,t))  + sum(i,(pf(i,t)/exch(t))*(im0(i,r) - ex0(i,r)))
+ cpi(t)*gtrans_fed0(r) + cpi(t)*gtrans_reg0(r) + cpi(t)*crebate_fed(r,t) + cpi(t)*crebate_reg(r,t)
+ sum(i_nt,pn(i_nt,t)*(g0_dn(i_nt,r) - exd0(i_nt,r))) + sum(i,pmy(i,t)*(sum(margins,map_mr(i,margins)*dm0(margins,r)) - my0(i,r)))
 +sum(er,maper(r,er)*pe(er,t))*(sum(i_td,g0_dn(i_td,r)) - sum(i_td,exd0(i_td,r)))
- cpi(t)*glump_fed(r,t) - cpi(t)*glump_reg(r,t) - pbar(r,t)*cbar(r,t)  =g= 0;



* Government

equations
        trans_crev_fed(*,*)
        trans_crev_reg(*,*)
        trans_grev_fed(*,*)
        trans_grev_reg(*,*)
        trans_glump_fed(*,*)
        trans_glump_reg(*,*)
        trans_crebate_fed(*,*)
        trans_crebate_reg(*,*)
        trans_ggrant(*,*)
;


trans_crev_fed(r,t).. crev_fed(r,t) =e= sum(j,cg(j,r,t)*muc(j,r)*muc_fed(j))*p_e_fed(t) + sum(i, mug_fed(i)*mug(i,r)*(g_fed(i,r,t)*(1+sum(margins,g_fed0_mr(i,margins,r)))+g_reg(i,r,t)*(1+sum(margins,g_reg0_mr(i,margins,r)))) + sum(ii,((io(i,ii,r,t))*(1+sum(margins,io0_mr(i,ii,margins,r))))*mu(i,ii,r)*mu_fed(i,ii)))*(p_e_fed(t)) - p_e_fed(t)*sum(i,allow_fed(i,r,t));
trans_crev_reg(r,t).. crev_reg(r,t) =e= sum(j,cg(j,r,t)*muc(j,r)*muc_reg(j,r))*p_e_reg(r,t) + sum(i,mug_reg(i,r)*mug(i,r)*(g_fed(i,r,t)*(1+sum(margins,g_fed0_mr(i,margins,r)))+g_reg(i,r,t)*(1+sum(margins,g_reg0_mr(i,margins,r)))) + sum(ii,((io(i,ii,r,t))*(1+sum(margins,io0_mr(i,ii,margins,r))))*mu(i,ii,r)*mu_reg(i,ii,r)))*(p_e_reg(r,t));

trans_grev_fed(r,t).. grev_fed(r,t) =e= ((tau_l0+tau_p0)*w(r,t)*ls(r,t) + sum(i,tau_k0*(xkinc(i,r,t))) - sum(i,tau_k0*deltat*kdep(i,r,t))  + sum(i,py(i,r,t)*gy_fed0(i,r)) + crev_fed(r,t)*cpi(t) )/cpi(t);
trans_grev_reg(r,t).. grev_reg(r,t) =e= ((tau_lr0(r))*w(r,t)*ls(r,t) + sum(i,tau_kr0(r)*(xkinc(i,r,t))) - sum(i,tau_kr0(r)*deltat*kdep(i,r,t)) + sum(i,tau_y0(i,r)*py(i,r,t)*y(i,r,t)) + sum(i,py(i,r,t)*gy_reg0(i,r)) + ggrant(r,t)*cpi(t) +  crev_reg(r,t)*cpi(t))/cpi(t);


trans_glump_fed(r,t).. glump_fed(r,t) =e= ((1+tau_p0)*w(r,t)*lg_fed0(r) + sum(i,(pgf(i,r,t)+mug(i,r)*(p_e_fed(t)*mug_fed(i)+p_e_reg(r,t)*mug_reg(i,r))*cpi(t))*g_fed(i,r,t)*(1+sum(margins,g_fed0_mr(i,margins,r)))) + ggrant(r,t)*cpi(t) + cpi(t)*gtrans_fed0(r) + crebate_fed(r,t)*cpi(t) - grev_fed(r,t)*cpi(t) )/cpi(t);
trans_glump_reg(r,t).. glump_reg(r,t) =e= ((1+tau_p0)*w(r,t)*lg_reg0(r) + sum(i,(pgr(i,r,t)+mug(i,r)*(p_e_fed(t)*mug_fed(i)+p_e_reg(r,t)*mug_reg(i,r))*cpi(t))*g_reg(i,r,t)*(1+sum(margins,g_reg0_mr(i,margins,r)))) + cpi(t)*gtrans_reg0(r) + crebate_reg(r,t)*cpi(t)  - grev_reg(r,t)*cpi(t))/cpi(t);

trans_crebate_fed(r,t).. crebate_fed(r,t) =e= (glump_fed(r,t)*cpi(t) - (1+tau_p0)*w(r,t)*lg_fed0(r) - sum(i,(pgf(i,r,t)+mug(i,r)*(p_e_fed(t)*mug_fed(i)+p_e_reg(r,t)*mug_reg(i,r))*cpi(t))*g_fed(i,r,t)*(1+sum(margins,g_fed0_mr(i,margins,r)))) - cpi(t)*gtrans_fed0(r) - ggrant(r,t)*cpi(t) + grev_fed(r,t)*cpi(t))/cpi(t);
trans_crebate_reg(r,t).. crebate_reg(r,t) =e=  (glump_reg(r,t)*cpi(t) - (1+tau_p0)*w(r,t)*lg_reg0(r) - sum(i,(pgr(i,r,t)+mug(i,r)*(p_e_fed(t)*mug_fed(i)+p_e_reg(r,t)*mug_reg(i,r))*cpi(t))*g_reg(i,r,t)*(1+sum(margins,g_reg0_mr(i,margins,r)))) - cpi(t)*gtrans_reg0(r) + grev_reg(r,t)*cpi(t))/cpi(t);

trans_ggrant(r,t).. ggrant(r,t) =e= ((1+tau_p0)*w(r,t)*lg_reg0(r) + sum(i,(pgr(i,r,t)+mug(i,r)*(p_e_fed(t)*mug_fed(i)+p_e_reg(r,t)*mug_reg(i,r))*cpi(t))*g_reg(i,r,t)*(1+sum(margins,g_reg0_mr(i,margins,r)))) + cpi(t)*gtrans_reg0(r)  -
 (tau_lr0(r))*w(r,t)*ls(r,t) - sum(i,tau_kr0(r)*(xkinc(i,r,t))) + sum(i,tau_kr0(r)*deltat*kdep(i,r,t))  - sum(i,tau_y0(i,r)*py(i,r,t)*y(i,r,t)) - sum(i,py(i,r,t)*gy_reg0(i,r))  - glump_reg(r,t)*cpi(t)  )/cpi(t);



* Final Good Demand

equations
        trans_c_cv(*,*,*,*)
        trans_cv_cumlot(*,*,*,*)
        trans_cumlot_ctilde(*,*,*,*)
        trans_ctilde_chat(*,*,*,*)
        trans_chat_cbar(*,*,*)
        trans_cg(*,*,*)
        trans_c(*,*,*)
        trans_pce(*,*,*)
        trans_ibar(*,*)
        trans_i(*,*,*)
        trans_pfi(*,*,*)
        trans_g(*,*,*)
        trans_g_d(*,*,*)
        trans_g_f(*,*,*)
        trans_g_dr(*,*,*)
        trans_g_dn(*,*,*)
        trans_g_dn_ff(*,*,*)
        trans_g_dn_td(*,*,*)
        trans_dm(*,*,*)
;



trans_c_cv(j,cjv,r,t).. c_cv(j,cjv,r,t) =e= ((gammacv(cjv,r)*alphacv(j,cjv,r,t))**sig_cv(cjv)) * ((cp(j,r,t)+muc(j,r)*(p_e_fed(t)*muc_fed(j)+p_e_reg(r,t)*muc_reg(j,r))*cpi(t))/cpv(cjv,r,t))**(-sig_cv(cjv));
trans_cv_cumlot(cjv,cju,r,t).. cv_cumlot(cjv,cju,r,t) =e= ((gammacu(cju,r)*alphacu(cjv,cju,r,t))**sig_cu(cju)) * ((cpv(cjv,r,t))/cpumlot(cju,r,t))**(-sig_cu(cju));
trans_cumlot_ctilde(cju,cjt,r,t).. cumlot_ctilde(cju,cjt,r,t) =e= ((gammact(cjt,r)*alphact(cju,cjt,r,t))**sig_ct(cjt)) * ((cpumlot(cju,r,t))/cptilde(cjt,r,t))**(-sig_ct(cjt));
trans_ctilde_chat(cjt,cj,r,t).. ctilde_chat(cjt,cj,r,t) =e= ((gammac(cj,r)*alphac(cjt,cj,r))**sig_c(cj)) * ((cptilde(cjt,r,t))/cphat(cj,r,t))**(-sig_c(cj));
trans_chat_cbar(cj,r,t).. chat_cbar(cj,r,t) =e= ((gammacbar(r)*alphacbar(cj,r))**sig_cbar) * ((cphat(cj,r,t))/pbar(r,t))**(-sig_cbar);
trans_cg(j,r,t).. cg(j,r,t) =e= sum(cjv,cmapv(j,cjv)*c_cv(j,cjv,r,t)*sum(cju,cmapu(cjv,cju)*cv_cumlot(cjv,cju,r,t)*sum(cjt,cmapt(cju,cjt)*cumlot_ctilde(cju,cjt,r,t)*sum(cj,cmap(cjt,cj) * ctilde_chat(cjt,cj,r,t)*chat_cbar(cj,r,t)*cbar(r,t) ))) );
trans_c(i,r,t).. cons(i,r,t) =e= sum(j,gmaxp(i,j,r)*cg(j,r,t));
trans_pce(i,r,t).. pce(i,r,t) =e= cons(i,r,t)/(1+sum(margins,pce0_mr(i,margins,r)));

trans_ibar(r,t).. ibar(r,t) =e= sum(i,xir(i,r,t)*k(i,r,t));
trans_i(i,r,t).. inv(i,r,t) =e= xi0(i,r)*ibar(r,t);
trans_pfi(i,r,t).. pfi(i,r,t) =e= inv(i,r,t)/(1+sum(margins,pfi0_mr(i,margins,r)));


trans_g(i,r,t).. g(i,r,t) =e= pce(i,r,t) + pfi(i,r,t) + g_fed(i,r,t) + g_reg(i,r,t) + sum(ii,io(i,ii,r,t)+io_ff(i,ii,r,t)) ;
trans_g_d(i,r,t).. g_d(i,r,t) =e= g(i,r,t)*((gammag0(i,r)*alphag_d0(i,r))**sig_f(i,r)) * (pd(i,r,t)/pg(i,r,t))**(-sig_f(i,r));
trans_g_f(i,r,t).. g_f(i,r,t) =e= g(i,r,t)*((gammag0(i,r)*alphag_f0(i,r))**sig_f(i,r)) * ((pf(i,t)/exch(t))/pg(i,r,t))**(-sig_f(i,r));

trans_g_dr(i,r,t).. g_dr(i,r,t) =e= g_d(i,r,t)*((gammar0(i,r)*alphar_r0(i,r))**sig_rn(i,r)) * (p(i,r,t)/pd(i,r,t))**(-sig_rn(i,r));
trans_g_dn(i,r,t)$(not i_ff(i) and not i_td(i)).. g_dn(i,r,t) =e= g_d(i,r,t)*((gammar0(i,r)*alphar_n0(i,r))**sig_rn(i,r)) * (pn(i,t)/pd(i,r,t))**(-sig_rn(i,r));
trans_g_dn_ff(i_ff,r,t).. g_dn(i_ff,r,t) =e= g_d(i_ff,r,t);
trans_g_dn_td(i_td,r,t).. g_dn(i_td,r,t) =e= g_d(i_td,r,t)*((gammar0(i_td,r)*alphar_e0(i_td,r))**sig_rn(i_td,r)) * (sum(er,maper(r,er)*pe(er,t))/pd(i_td,r,t))**(-sig_rn(i_td,r));


trans_dm(margins,r,t).. dm(margins,r,t) =e= sum(i,pce0_mr(i,margins,r)*pce(i,r,t) + pfi0_mr(i,margins,r)*pfi(i,r,t)+
g_fed0_mr(i,margins,r)*g_fed(i,r,t) + g_reg0_mr(i,margins,r)*g_reg(i,r,t) + sum(ii,io0_mr(i,ii,margins,r)*(io(i,ii,r,t)+io_ff(i,ii,r,t))));


* Firms

* Variable Inputs

equations
        trans_cost_e1(*,*,*)
        trans_io_ie1(*,*,*,*)
        trans_cost_e2(*,*,*)
        trans_io_ie2(*,*,*,*)
        trans_cost_e(*,*,*)
        trans_io_e1e(*,*,*)
        trans_io_e2e(*,*,*)
        trans_cost_ee2(*,*,*)
        trans_io_e1e2(*,*,*)
        trans_io_e2e2(*,*,*)
        trans_cost_m(*,*,*)
        trans_io_im(*,*,*,*)
        trans_cost_l(*,*,*)
        trans_cost_v(*,*,*)
        trans_io_ev(*,*,*)
        trans_io_mv(*,*,*)
        trans_cost_v2(*,*,*)
        trans_io_ev2(*,*,*)
        trans_io_mv2(*,*,*)
        trans_cost_w(*,*,*)
        trans_io_lw(*,*,*)
        trans_io_vw(*,*,*)
        trans_cost_w2(*,*,*)
        trans_io_lw2(*,*,*)
        trans_io_vw2(*,*,*)

        trans_cost_k(*,*,*)

        trans_cost_x(*,*,*)
        trans_cost_x2(*,*,*)
        trans_cost_x_ff(*,*,*)
        trans_io_wx(*,*,*)
        trans_io_wx_ff(*,*,*)
        trans_cost_f(*,*,*)
        trans_io_ff(*,*,*,*)
        trans_cost_z(*,*,*)
        trans_io_zy(*,*,*)



;


trans_cost_e1(ii,rr,t)$(ee10(ii,rr) gt 0).. cost_e1(ii,rr,t) =e= gammae1(ii,rr)**(sig_e1(ii,rr)/(1-sig_e1(ii,rr)))*( sum(ie1, (alphae1(ie1,ii,rr,t)**sig_e1(ii,rr))*(pio(ie1,ii,rr,t)+mu(ie1,ii,rr)*(p_e_fed(t)*mu_fed(ie1,ii)+p_e_reg(rr,t)*mu_reg(ie1,ii,rr))*cpi(t))**(1-sig_e1(ii,rr))) )**(1/(1-sig_e1(ii,rr)));
trans_io_ie1(ie1,ii,rr,t)$(ee10(ii,rr) gt 0).. io_ie1(ie1,ii,rr,t) =e= ((gammae1(ii,rr)*alphae1(ie1,ii,rr,t))**sig_e1(ii,rr)) * ((pio(ie1,ii,rr,t)+mu(ie1,ii,rr)*(p_e_fed(t)*mu_fed(ie1,ii)+p_e_reg(rr,t)*mu_reg(ie1,ii,rr))*cpi(t))/cost_e1(ii,rr,t))**(-sig_e1(ii,rr));
trans_cost_e2(ii,rr,t)$(ee20(ii,rr) gt 0).. cost_e2(ii,rr,t) =e= gammae2(ii,rr)**(sig_e2(ii,rr)/(1-sig_e2(ii,rr)))*( sum(ie2, (alphae2(ie2,ii,rr,t)**sig_e2(ii,rr))*(pio(ie2,ii,rr,t)+mu(ie2,ii,rr)*(p_e_fed(t)*mu_fed(ie2,ii)+p_e_reg(rr,t)*mu_reg(ie2,ii,rr))*cpi(t))**(1-sig_e2(ii,rr))) )**(1/(1-sig_e2(ii,rr)));
trans_io_ie2(ie2,ii,rr,t)$(ee20(ii,rr) gt 0).. io_ie2(ie2,ii,rr,t) =e= ((gammae2(ii,rr)*alphae2(ie2,ii,rr,t))**sig_e2(ii,rr)) * ((pio(ie2,ii,rr,t)+mu(ie2,ii,rr)*(p_e_fed(t)*mu_fed(ie2,ii)+p_e_reg(rr,t)*mu_reg(ie2,ii,rr))*cpi(t))/cost_e2(ii,rr,t))**(-sig_e2(ii,rr));

cost_e1.fx(ii,rr,t)$(ee10(ii,rr) = 0) = 1;
io_ie1.fx(ie1,ii,rr,t)$(ee10(ii,rr) = 0) = 0;
cost_e2.fx(ii,rr,t)$(ee20(ii,rr) = 0) = 1;
io_ie2.fx(ie2,ii,rr,t)$(ee20(ii,rr) = 0) = 0;

trans_cost_e(ii,rr,t)$(ee10(ii,rr) gt 0 and ee20(ii,rr) gt 0).. cost_e(ii,rr,t) =e= gammae(ii,rr)**(sig_e(ii,rr)/(1-sig_e(ii,rr)))*( (alphae_e1(ii,rr,t)**sig_e(ii,rr))*((cost_e1(ii,rr,t))**(1-sig_e(ii,rr))) + (alphae_e2(ii,rr,t)**sig_e(ii,rr))*((cost_e2(ii,rr,t))**(1-sig_e(ii,rr))) )**(1/(1-sig_e(ii,rr)));
trans_io_e1e(ii,rr,t)$(ee10(ii,rr) gt 0 and ee20(ii,rr) gt 0).. io_e1e(ii,rr,t) =e= ((gammae(ii,rr)*alphae_e1(ii,rr,t))**sig_e(ii,rr)) * (cost_e1(ii,rr,t)/cost_e(ii,rr,t))**(-sig_e(ii,rr));
trans_io_e2e(ii,rr,t)$(ee10(ii,rr) gt 0 and ee20(ii,rr) gt 0).. io_e2e(ii,rr,t) =e= ((gammae(ii,rr)*alphae_e2(ii,rr,t))**sig_e(ii,rr)) * (cost_e2(ii,rr,t)/cost_e(ii,rr,t))**(-sig_e(ii,rr));

trans_cost_ee2(ii,rr,t)$(ee10(ii,rr) = 0 or ee20(ii,rr) = 0).. cost_e(ii,rr,t) =e= alphae_e1(ii,rr,t)*cost_e1(ii,rr,t) + alphae_e2(ii,rr,t)*cost_e2(ii,rr,t);
trans_io_e1e2(ii,rr,t)$(ee10(ii,rr) = 0 or ee20(ii,rr) = 0).. io_e1e(ii,rr,t) =e= alphae_e1(ii,rr,t);
trans_io_e2e2(ii,rr,t)$(ee10(ii,rr) = 0 or ee20(ii,rr) = 0).. io_e2e(ii,rr,t) =e= alphae_e2(ii,rr,t);

cost_e.fx(ii,rr,t)$(ee0(ii,rr) = 0) = 1;


trans_cost_m(ii,rr,t)$(mm0(ii,rr) gt 0).. cost_m(ii,rr,t) =e= gammam(ii,rr)**(sig_m(ii,rr)/(1-sig_m(ii,rr)))*( sum(im, (alpham(im,ii,rr)**sig_m(ii,rr))*(pio(im,ii,rr,t))**(1-sig_m(ii,rr))) )**(1/(1-sig_m(ii,rr)));
trans_io_im(im,ii,rr,t)$(mm0(ii,rr) gt 0).. io_im(im,ii,rr,t) =e= ((gammam(ii,rr)*alpham(im,ii,rr))**sig_m(ii,rr)) * ((pio(im,ii,rr,t))/cost_m(ii,rr,t))**(-sig_m(ii,rr));

cost_m.fx(ii,rr,t)$(mm0(ii,rr) = 0) = 1;
io_im.fx(im,ii,rr,t)$(mm0(ii,rr) = 0) = 0;


trans_cost_l(i,r,t).. cost_l(i,r,t) =e= w(r,t)*(1+tau_p0);
trans_cost_v(ii,rr,t)$(ee0(ii,rr) gt 0 and mm0(ii,rr) gt 0).. cost_v(ii,rr,t) =e= gammav(ii,rr)**(sig_v(ii,rr)/(1-sig_v(ii,rr)))*( (alphav_e(ii,rr,t)**sig_v(ii,rr))*((cost_e(ii,rr,t))**(1-sig_v(ii,rr))) + (alphav_m(ii,rr,t)**sig_v(ii,rr))*((cost_m(ii,rr,t))**(1-sig_v(ii,rr))) )**(1/(1-sig_v(ii,rr)));
trans_io_ev(ii,rr,t)$(ee0(ii,rr) gt 0 and mm0(ii,rr) gt 0).. io_ev(ii,rr,t) =e= ((gammav(ii,rr)*alphav_e(ii,rr,t))**sig_v(ii,rr)) * (cost_e(ii,rr,t)/cost_v(ii,rr,t))**(-sig_v(ii,rr));
trans_io_mv(ii,rr,t)$(ee0(ii,rr) gt 0 and mm0(ii,rr) gt 0).. io_mv(ii,rr,t) =e= ((gammav(ii,rr)*alphav_m(ii,rr,t))**sig_v(ii,rr)) * (cost_m(ii,rr,t)/cost_v(ii,rr,t))**(-sig_v(ii,rr));

trans_cost_v2(ii,rr,t)$(ee0(ii,rr) = 0 or mm0(ii,rr) = 0 and vv0(ii,rr) gt 0).. cost_v(ii,rr,t) =e= alphav_e(ii,rr,t)*cost_e(ii,rr,t) + alphav_m(ii,rr,t)*cost_m(ii,rr,t);
trans_io_ev2(ii,rr,t)$(ee0(ii,rr) = 0 or mm0(ii,rr) = 0 and vv0(ii,rr) gt 0).. io_ev(ii,rr,t) =e= alphav_e(ii,rr,t);
trans_io_mv2(ii,rr,t)$(ee0(ii,rr) = 0 or mm0(ii,rr) = 0 and vv0(ii,rr) gt 0).. io_mv(ii,rr,t) =e= alphav_m(ii,rr,t);

cost_v.fx(ii,rr,t)$(vv0(ii,rr) = 0) = 1;
io_ev.fx(ii,rr,t)$(vv0(ii,rr) = 0) = 0;
io_mv.fx(ii,rr,t)$(vv0(ii,rr) = 0) = 0;

trans_cost_w(ii,rr,t)$(vv0(ii,rr) gt 0).. cost_w(ii,rr,t) =e= gammaw0(ii,rr)**(sig_w(ii,rr)/(1-sig_w(ii,rr)))*( (alphaw_l0(ii,rr)**sig_w(ii,rr))*((cost_l(ii,rr,t))**(1-sig_w(ii,rr))) + (alphaw_v0(ii,rr)**sig_w(ii,rr))*((cost_v(ii,rr,t))**(1-sig_w(ii,rr))) )**(1/(1-sig_w(ii,rr)));
trans_io_lw(ii,rr,t)$(vv0(ii,rr) gt 0).. io_lw(ii,rr,t) =e= ((gammaw0(ii,rr)*alphaw_l0(ii,rr))**sig_w(ii,rr)) * (cost_l(ii,rr,t)/cost_w(ii,rr,t))**(-sig_w(ii,rr));
trans_io_vw(ii,rr,t)$(vv0(ii,rr) gt 0).. io_vw(ii,rr,t) =e= ((gammaw0(ii,rr)*alphaw_v0(ii,rr))**sig_w(ii,rr)) * (cost_v(ii,rr,t)/cost_w(ii,rr,t))**(-sig_w(ii,rr));

trans_cost_w2(ii,rr,t)$(vv0(ii,rr) = 0).. cost_w(ii,rr,t) =e=  cost_l(ii,rr,t);
trans_io_lw2(ii,rr,t)$(vv0(ii,rr) = 0).. io_lw(ii,rr,t) =e= 1;
trans_io_vw2(ii,rr,t)$(vv0(ii,rr) = 0).. io_vw(ii,rr,t) =e= 0;


trans_cost_k(ii,rr,t)$(y0(ii,rr) gt 0).. cost_k(ii,rr,t) =e= xkinc(ii,rr,t)/k(ii,rr,t);

trans_cost_x(i_nf,rr,t)$(nr0(i_nf,rr) = 0 and ff0(i_nf,rr) = 0).. cost_x(i_nf,rr,t) =e= (1-tau_y0(i_nf,rr))*py(i_nf,rr,t);
trans_cost_x2(i_nf,rr,t)$(nr0(i_nf,rr) gt 0 or ff0(i_nf,rr) gt 0).. cost_x(i_nf,rr,t) =e= gammax(i_nf,rr,t)**(sig_x(i_nf,rr)/(1-sig_x(i_nf,rr)))*( (alphax_k0(i_nf,rr)**sig_x(i_nf,rr))*((cost_k(i_nf,rr,t))**(1-sig_x(i_nf,rr))) + (alphax_w0(i_nf,rr)**sig_x(i_nf,rr))*((cost_w(i_nf,rr,t))**(1-sig_x(i_nf,rr))) )**(1/(1-sig_x(i_nf,rr))) ;
trans_cost_x_ff(i_ff,rr,t).. cost_x(i_ff,rr,t) =e= cost_w(i_ff,rr,t);
trans_io_wx(i_nf,rr,t)$(nr0(i_nf,rr) gt 0 or ff0(i_nf,rr) gt 0).. io_wx(i_nf,rr,t) =e= ((gammax(i_nf,rr,t)*alphax_w0(i_nf,rr))**sig_x(i_nf,rr)) * (cost_w(i_nf,rr,t)/cost_x(i_nf,rr,t))**(-sig_x(i_nf,rr));
trans_io_wx_ff(i_ff,rr,t).. io_wx(i_ff,rr,t) =e= 1;


trans_cost_f(ii,rr,t)$(ff0(ii,rr) gt 0).. cost_f(ii,rr,t) =e= sum(i,(pio(i,ii,rr,t)+mu(i,ii,rr)*(p_e_fed(t)*mu_fed(i,ii)+p_e_reg(rr,t)*mu_reg(i,ii,rr))*cpi(t))*(io0_ff(i,ii,rr)+iom0_ff(i,ii,rr))/ff0(ii,rr));
trans_io_ff(i,ii,r,t)$(ff0(ii,r) gt 0 ).. io_ff(i,ii,r,t) =e= (ff(ii,r,t)/ff0(ii,r))*(io0_ff(i,ii,r)+iom0_ff(i,ii,r))/(1+sum(margins,io0_mr(i,ii,margins,r)));
cost_f.fx(ii,rr,t)$(ff0(ii,rr) = 0) = 1;
io_ff.fx(i,ii,r,t)$(ff0(ii,r) = 0) = 0;

trans_cost_z(ii,rr,t)$(nr0(ii,rr) gt 0 or ff0(ii,rr) gt 0).. cost_z(ii,rr,t) =e= (alphaz_f(ii,rr)*cost_f(ii,rr,t) + alphaz_x(ii,rr)*cost_x(ii,rr,t)) ;
trans_io_zy(i_nf,rr,t)$(nr0(i_nf,rr) > 0).. io_zy(i_nf,rr,t) =e= ((gammay0(i_nf,rr)*alphay_z0(i_nf,rr))**sig_r(i_nf,rr)) * (cost_z(i_nf,rr,t)/((1-tau_y0(i_nf,rr))*py(i_nf,rr,t)))**(-sig_r(i_nf,rr));
io_zy.fx(i_nf,rr,t)$(nr0(i_nf,rr) = 0) = io_zy0(i_nf,rr);



* Firm First Order Conditions and Quantity Variables

equations

        trans_firm_ww(*,*,*)
        trans_firm_ww2(*,*,*)
        trans_firm_ww_ff(*,*,*)

        trans_firm_zz(*,*,*)
        trans_firm_zz_ff(*,*,*)

        trans_firm_xx(*,*,*)
        trans_firm_ff(*,*,*)

        trans_firm_ld(*,*,*)
        trans_firm_io_e1(*,*,*,*)
        trans_firm_io_e2(*,*,*,*)
        trans_firm_io_m(*,*,*,*)
        trans_firm_iom(*,*,*,*)

        trans_lambdak(*,*,*)
        trans_firmeuler(*,*,*)
        trans_firmeuler_tc(*,*,*)
        trans_firmeuler_ff(*,*,*)
        trans_firmeuler_ff_tc(*,*,*)

        trans_firm_f_k(*,*,*)
        trans_firm_f_k_ff(*,*,*)

        trans_firm_kk(*,*,*)
        trans_dd(*,*)
        trans_dd_tc(*,*)
        trans_kdep(*,*,*)

        trans_firm_y(*,*,*)
        trans_firm_y2(*,*,*)
        trans_firm_y3(*,*,*)
        trans_firm_y_ff(*,*,*)
        trans_acexp(*,*,*)

        trans_firm_ry(*,*,*)
        trans_firm_ny(*,*,*)
        trans_firm_my(*,*,*)
        trans_firm_ex(*,*,*)
        trans_firm_ey(*,*,*)

        trans_xkinc(*,*,*)
        trans_prof(*,*,*)
        trans_v(*,*,*)
        trans_v_tc(*,*,*)
        trans_etot(*,*)
        trans_etot_net(*,*)

;


trans_firm_ww(i_nf,rr,t)$(nr0(i_nf,rr) = 0 and ff0(i_nf,rr) = 0  and alphax_w0(i_nf,rr) gt 0  and alphax_k0(i_nf,rr) gt 0).. cost_w(i_nf,rr,t) =e= (1-tau_y0(i_nf,rr))*(py(i_nf,rr,t))*(gammax(i_nf,rr,t)**(1/rho_x(i_nf,rr)))*(alphax_w0(i_nf,rr)*ww(i_nf,rr,t)**(rho_x(i_nf,rr)-1))*(alphax_k0(i_nf,rr)*k(i_nf,rr,t)**rho_x(i_nf,rr) + alphax_w0(i_nf,rr)*ww(i_nf,rr,t)**rho_x(i_nf,rr))**((1-rho_x(i_nf,rr))/rho_x(i_nf,rr));
trans_firm_ww2(i_nf,rr,t)$((nr0(i_nf,rr) gt 0 or ff0(i_nf,rr) gt 0)  and alphax_w0(i_nf,rr) gt 0  and alphax_k0(i_nf,rr) gt 0).. ww(i_nf,rr,t) =e= xx(i_nf,rr,t)*io_wx(i_nf,rr,t);
ww.fx(i_nf,rr,t)$(alphax_w0(i_nf,rr) = 0  and alphax_k0(i_nf,rr) = 0) =0;
trans_firm_ww_ff(i_ff,rr,t).. ww(i_ff,rr,t) =e= xx(i_ff,rr,t);



trans_firm_zz(i_nf,rr,t)$(nr0(i_nf,rr) gt 0 or ff0(i_nf,rr) gt 0).. zz(i_nf,rr,t) =e= io_zy(i_nf,rr,t)*(y(i_nf,rr,t)+acexp(i_nf,rr,t));
trans_firm_zz_ff(i_ff,r,t)$(y0(i_ff,r) gt 0).. cost_z(i_ff,r,t) =e= (1-tau_y0(i_ff,r))*(py(i_ff,r,t))*(gammay0(i_ff,r)**(1/rho_r(i_ff,r)))*((alphay_z0(i_ff,r))*zz(i_ff,r,t)**(rho_r(i_ff,r)-1))*(alphay_k0(i_ff,r)*k(i_ff,r,t)**rho_r(i_ff,r) + alphay_z0(i_ff,r)*zz(i_ff,r,t)**rho_r(i_ff,r) + (alphay_r0(i_ff,r))*nr(i_ff,r,t)**rho_r(i_ff,r))**((1-rho_r(i_ff,r))/rho_r(i_ff,r));


trans_firm_xx(ii,rr,t)$(nr0(ii,rr) gt 0 or ff0(ii,rr) gt 0).. xx(ii,rr,t) =e= alphaz_x(ii,rr)*zz(ii,rr,t);
trans_firm_ff(ii,rr,t)$(nr0(ii,rr) gt 0 or ff0(ii,rr) gt 0).. ff(ii,rr,t) =e= alphaz_f(ii,rr)*zz(ii,rr,t);
ff.fx(i_nf,rr,t)$(nr0(i_nf,rr) = 0 and ff0(i_nf,rr) = 0) = 0;

trans_firm_ld(ii,rr,t).. l(ii,rr,t) =e= ww(ii,rr,t)*io_lw(ii,rr,t);
trans_firm_io_e1(ie1,ii,rr,t).. io(ie1,ii,rr,t) =e= (io_ie1(ie1,ii,rr,t)*io_e1e(ii,rr,t)*io_ev(ii,rr,t)*io_vw(ii,rr,t)*ww(ii,rr,t))/(1+sum(margins,io0_mr(ie1,ii,margins,rr)));
trans_firm_io_e2(ie2,ii,rr,t).. io(ie2,ii,rr,t) =e= (io_ie2(ie2,ii,rr,t)*io_e2e(ii,rr,t)*io_ev(ii,rr,t)*io_vw(ii,rr,t)*ww(ii,rr,t))/(1+sum(margins,io0_mr(ie2,ii,margins,rr)));
trans_firm_io_m(im,ii,rr,t).. io(im,ii,rr,t) =e= io_im(im,ii,rr,t)*io_mv(ii,rr,t)*io_vw(ii,rr,t)*ww(ii,rr,t)/(1+sum(margins,io0_mr(im,ii,margins,rr)));


trans_lambdak(ii,rr,t)$(y0(ii,rr) gt 0).. lambdak(ii,rr,t) =e= pkbar(rr,t)*(1-dd(rr,t)) + (1-tau_k0-tau_kr0(rr))*py(ii,rr,t)*(1-tau_y0(ii,rr))*qparb(ii,rr)*(xir(ii,rr,t) - delta);
trans_firmeuler(i_nf,rr,t)$(y0(i_nf,rr) gt 0 and not tlast(t)).. lambdak(i_nf,rr,t) =e= (1/(1+rbarn(rr,t)))*((1-tau_k0-tau_kr0(rr))*(cost_x(i_nf,rr,t+1)*f_k(i_nf,rr,t+1) )
+ (1-tau_k0-tau_kr0(rr))*(1-tau_y0(i_nf,rr))*py(i_nf,rr,t+1)*(qparb(i_nf,rr)/2)*(power(xir(i_nf,rr,t+1),2)  - (delta)**2)  + lambdak(i_nf,rr,t+1)*(1-delta));
trans_firmeuler_tc(i_nf,rr,tlast)$(y0(i_nf,rr) gt 0).. lambdak(i_nf,rr,tlast) =e= (1/(1+rbarn(rr,tlast)))*((1-tau_k0-tau_kr0(rr))*cost_x_ss(i_nf,rr)*f_k_ss(i_nf,rr)
 + lambdak_ss(i_nf,rr)*(1-delta));
trans_firmeuler_ff(i_ff,rr,t)$(y0(i_ff,rr) gt 0 and not tlast(t)).. lambdak(i_ff,rr,t) =e= (1/(1+rbarn(rr,t)))*((1-tau_k0-tau_kr0(rr))*(py(i_ff,rr,t+1)*(1-tau_y0(i_ff,rr))*f_k(i_ff,rr,t+1) )
+ (1-tau_k0-tau_kr0(rr))*(1-tau_y0(i_ff,rr))*py(i_ff,rr,t+1)*(qparb(i_ff,rr)/2)*(power(xir(i_ff,rr,t+1),2)  - (delta)**2)  + lambdak(i_ff,rr,t+1)*(1-delta));
trans_firmeuler_ff_tc(i_ff,rr,tlast)$(y0(i_ff,rr) gt 0).. lambdak(i_ff,rr,tlast) =e= (1/(1+rbarn(rr,tlast)))*((1-tau_k0-tau_kr0(rr))*py_ss(i_ff,rr)*(1-tau_y0(i_ff,rr))*f_k_ss(i_ff,rr)
 + lambdak_ss(i_ff,rr)*(1-delta));

trans_firm_f_k(i_nf,rr,t)$(y0(i_nf,rr) gt 0).. f_k(i_nf,rr,t) =e= (gammax(i_nf,rr,t)**(1/rho_x(i_nf,rr)))*(alphax_k0(i_nf,rr)*k(i_nf,rr,t)**(rho_x(i_nf,rr)-1))*(alphax_k0(i_nf,rr)*k(i_nf,rr,t)**rho_x(i_nf,rr) + alphax_w0(i_nf,rr)*ww(i_nf,rr,t)**rho_x(i_nf,rr))**((1-rho_x(i_nf,rr))/rho_x(i_nf,rr));
trans_firm_f_k_ff(i_ff,r,t)$(y0(i_ff,r) gt 0).. f_k(i_ff,r,t) =e= (gammay0(i_ff,r)**(1/rho_r(i_ff,r)))*((alphay_k0(i_ff,r))*k(i_ff,r,t)**(rho_r(i_ff,r)-1))*(alphay_k0(i_ff,r)*k(i_ff,r,t)**rho_r(i_ff,r) + alphay_z0(i_ff,r)*zz(i_ff,r,t)**rho_r(i_ff,r) + (alphay_r0(i_ff,r))*nr(i_ff,r,t)**rho_r(i_ff,r))**((1-rho_r(i_ff,r))/rho_r(i_ff,r));




trans_firm_kk(ii,rr,t)..  (1-delta)*k(ii,rr,t-1) + k(ii,rr,t-1)*xir(ii,rr,t-1) + k0(ii,rr)$tfirst(t) =e= k(ii,rr,t);

trans_dd(rr,t)$(not tlast(t)).. dd(rr,t) =e= ( (tau_k0+tau_kr0(rr))*deltat + (1-deltat)*dd(rr,t+1) ) / (1 + rbarn(rr,t)) ;
trans_dd_tc(rr,tlast).. dd(rr,tlast) =e=  ( (tau_k0+tau_kr0(rr))*deltat + (1-deltat)*dd_ss(rr)  ) / (1 + rbarn(rr,tlast)) ;
trans_kdep(ii,rr,t)$(k0(ii,rr) gt 0).. kdep(ii,rr,t) =e= (1-deltat)*kdep(ii,rr,t-1) + pkbar(rr,t-1)*k(ii,rr,t-1)*xir(ii,rr,t-1) + kdep0(ii,rr)$tfirst(t);
trans_v(i,r,t)$(not tlast(t)).. v(i,r,t) =e= (1/(1+rbarn0))*(prof(i,r,t) + v(i,r,t+1));
trans_v_tc(i,r,tlast).. v(i,r,tlast) =e= (1/(1+rbarn0))*(prof(i,r,tlast) + v_ss(i,r));



trans_firm_y(i_nf,rr,t)$(nr0(i_nf,rr) = 0 and ff0(i_nf,rr) = 0 and alphax_w0(i_nf,rr) gt 0  and alphax_k0(i_nf,rr) gt 0).. y(i_nf,rr,t) =e= (gammax(i_nf,rr,t)**(1/rho_x(i_nf,rr)))*(alphax_k0(i_nf,rr)*k(i_nf,rr,t)**rho_x(i_nf,rr) + alphax_w0(i_nf,rr)*ww(i_nf,rr,t)**rho_x(i_nf,rr))**(1/rho_x(i_nf,rr)) - acexp(i_nf,rr,t);
trans_firm_y2(i_nf,rr,t)$((nr0(i_nf,rr) gt 0 or ff0(i_nf,rr) gt 0) and alphax_w0(i_nf,rr) gt 0  and alphax_k0(i_nf,rr) gt 0).. py(i_nf,rr,t) =e= (cost_z(i_nf,rr,t)*io_zy(i_nf,rr,t) + pr(i_nf,rr,t)*(nr(i_nf,rr,t)/(y(i_nf,rr,t)+acexp(i_nf,rr,t))))/(1-tau_y0(i_nf,rr));
y.fx(i_nf,rr,t)$(nr0(i_nf,rr) = 0 and ff0(i_nf,rr) = 0 and alphax_w0(i_nf,rr) = 0  and alphax_k0(i_nf,rr) = 0)=0;
trans_firm_y_ff(i_ff,r,t)$(y0(i_ff,r) gt 0).. y(i_ff,r,t) =e= (gammay0(i_ff,r)**(1/rho_r(i_ff,r)))*(alphay_k0(i_ff,r)*k(i_ff,r,t)**rho_r(i_ff,r) + alphay_z0(i_ff,r)*zz(i_ff,r,t)**rho_r(i_ff,r) + (alphay_r0(i_ff,r))*nr(i_ff,r,t)**rho_r(i_ff,r))**(1/rho_r(i_ff,r)) - acexp(i_ff,r,t);
trans_acexp(ii,rr,t)$(y0(ii,rr) gt 0).. acexp(ii,rr,t) =e= k(ii,rr,t)*xir(ii,rr,t)*0.5*(qparb(ii,rr)/xir(ii,rr,t))*power((xir(ii,rr,t)-delta),2);

trans_firm_ry(ii,rr,t)$(y0(ii,rr) > 0).. ry(ii,rr,t) =e= (y(ii,rr,t)+gy_reg0(ii,rr)+gy_fed0(ii,rr))*alphay_dr0(ii,rr)*(p(ii,rr,t)/py(ii,rr,t))**(sig_ex(ii,rr));
trans_firm_ny(ii,rr,t)$(y0(ii,rr) > 0).. ny(ii,rr,t) =e= (y(ii,rr,t)+gy_reg0(ii,rr)+gy_fed0(ii,rr))*alphay_dn0(ii,rr)*(pn(ii,t)/py(ii,rr,t))**(sig_ex(ii,rr));
trans_firm_ex(ii,rr,t)$(y0(ii,rr) > 0).. ex(ii,rr,t) =e= (y(ii,rr,t)+gy_reg0(ii,rr)+gy_fed0(ii,rr))*alphay_f0(ii,rr)*((pf(ii,t)/exch(t))/py(ii,rr,t))**(sig_ex(ii,rr));
trans_firm_my(ii,rr,t)$(y0(ii,rr) > 0).. my(ii,rr,t) =e= (y(ii,rr,t)+gy_reg0(ii,rr)+gy_fed0(ii,rr))*alphay_m0(ii,rr)*(pmy(ii,t)/py(ii,rr,t))**(sig_ex(ii,rr));
trans_firm_ey(i_td,rr,t).. ey(i_td,rr,t) =e=  (y(i_td,rr,t)+gy_reg0(i_td,rr)+gy_fed0(i_td,rr))*alphay_e0(i_td,rr)*(sum(er,maper(rr,er)*pe(er,t))/py(i_td,rr,t))**(sig_ex(i_td,rr));


trans_xkinc(i,r,t).. xkinc(i,r,t) =e= (py(i,r,t)*(1-tau_y0(i,r)))*y(i,r,t) - cost_w(i,r,t)*ww(i,r,t)  - cost_f(i,r,t)*ff(i,r,t) - pr(i,r,t)*nr(i,r,t);
trans_prof(i,r,t).. prof(i,r,t) =e= (1-tau_k0-tau_kr0(r))*xkinc(i,r,t) + (tau_k0+tau_kr0(r))*deltat*kdep(i,r,t) - pkbar(r,t)*xir(i,r,t)*k(i,r,t) + cpi(t)*p_e_fed(t)*allow_fed(i,r,t);

trans_etot(r,t).. etot(r,t) =e=  sum(j,cg(j,r,t)*muc(j,r)) + sum(i, mug(i,r)*(g_fed(i,r,t)*(1+sum(margins,g_fed0_mr(i,margins,r)))+g_reg(i,r,t)*(1+sum(margins,g_reg0_mr(i,margins,r)))) + sum(ii,((io(i,ii,r,t)+io_ff(i,ii,r,t))*(1+sum(margins,io0_mr(i,ii,margins,r))))*mu(i,ii,r)))     ;
trans_etot_net(r,t).. etot_net(r,t) =e= etot(r,t);




* Market Clearing

equations
trans_mc_y(*,*,*)
trans_mc_ny(*,*)
trans_mc_my(*,*)
trans_mc_ey(*,*)
trans_mc_l(*,*)
trans_mc_f(*)
;


trans_mc_y(i,r,t)$(alphax_w0(i,r) gt 0  and alphax_k0(i,r) gt 0).. ry(i,r,t) - g_dr(i,r,t)     =g= 0;
p.fx(i,r,t)$(alphax_w0(i,r) = 0  and alphax_k0(i,r) = 0)=1    ;
trans_mc_ny(i,t).. sum(r,ny(i,r,t)) - sum(r,g_dn(i,r,t))     =g= 0;
trans_mc_my(i,t)$(sum(r,my0(i,r)) > 0).. sum(r,my(i,r,t)) - sum(r,sum(margins,map_mr(i,margins)*dm(margins,r,t))) =g= 0;
trans_mc_ey(er,t).. sum(i_td,sum(r,maper(r,er)*ey(i_td,r,t)) - sum(r,maper(r,er)*g_dn(i_td,r,t))) =g= 0;
trans_mc_l(r,t).. ls(r,t) - sum(i,l(i,r,t)) - lg_fed0(r) - lg_reg0(r) =g= 0;
trans_mc_f(t).. sum(r,sum(i,(pf(i,t)/exch(t))*(im0(i,r) - ex0(i,r)))) + sum(r,sum(i,(pf(i,t)/exch(t))*(ex(i,r,t)-g_f(i,r,t)))) =g= 0;

* Initialization


p.l(i,r,t) = 1;
p.fx(i_ff,r,t) = 1;
pn.l(i,t) = 1;
pn.fx(i_elec,t) = 1;
pe.l(er,t) = 1;
*pe.fx(er_west,t) = 1;
pmy.l(i,t) = 1;
exch.l(t) = 1;
w.l(r,t) = 1;
rbar.l(r,t) = rbar0;
rbarn.l(r,t) = rbarn0;
lambda.l(r,t) = lambda0(r);
lambdak.l(i,r,t) = lambdak0(i,r);
lambdak.fx(i,r,t)$(y0(i,r) = 0) = lambdak0(i,r);





pbar.l(r,t) = pbar0(r);
pkbar.l(r,t) = pkbar0(r);
wbar.l(r,t) = wbar0(r);
pd.l(i,r,t) = pd0(i,r);
pg.l(i,r,t) = pg0(i,r);
py.l(i,r,t) = py0(i,r);
pc.l(i,r,t) = pc0(i,r);
pi.l(i,r,t) = pi0(i,r);
pgf.l(i,r,t) = pgf0(i,r);
pgr.l(i,r,t) = pgr0(i,r);
pio.l(i,ii,r,t) = pio0(i,ii,r);
pm.l(margins,r,t) = pm0(margins,r);
pr.l(i,r,t) = pr0(i,r);
cp.l(j,r,t) = cp0(j,r);
cpv.l(cjv,r,t) = cpv0(cjv,r);
cpumlot.l(cju,r,t) = cpumlot0(cju,r);
cptilde.l(cjt,r,t) = cptilde0(cjt,r);
cphat.l(cj,r,t) = cphat0(cj,r);

ppi.l(t) = 1;
cpi.l(t) = 1;


cbar.l(r,t) = pcbar0(r)/pbar0(r);
leis.l(r,t) = leis0(r);
ls.l(r,t) = ls0(r);


crev_fed.l(r,t) = 0;
crebate_fed.l(r,t) = 0;
grev_fed.l(r,t) = grev_fed0(r);
grev_reg.l(r,t) = grev_reg0(r);
glump_fed.l(r,t) = glump_fed0(r);
glump_reg.l(r,t) = glump_reg0(r);
ggrant.l(r,t) = ggrant0(r);


c_cv.l(j,cjv,r,t) = c_cv0(j,cjv,r);
cv_cumlot.l(cjv,cju,r,t) = cv_cumlot0(cjv,cju,r);
cumlot_ctilde.l(cju,cjt,r,t) = cumlot_ctilde0(cju,cjt,r);
ctilde_chat.l(cjt,cj,r,t) = ctilde_chat0(cjt,cj,r);
chat_cbar.l(cj,r,t) = chat_cbar0(cj,r);
cg.l(j,r,t) = cg0(j,r);
cons.l(i,r,t) = c0(i,r);
pce.l(i,r,t) = pce0(i,r);
ibar.l(r,t) = ibar0(r);
inv.l(i,r,t) = i0(i,r);
pfi.l(i,r,t) = pfi0(i,r);
g.l(i,r,t) = g0(i,r);
g_d.l(i,r,t) = g0_d(i,r);
g_f.l(i,r,t) = g0_f(i,r);
g_dr.l(i,r,t) = g0_dr(i,r);
g_dn.l(i,r,t) = g0_dn(i,r);
g_dr.fx(i_ff,r,t) = 0;
dm.l(margins,r,t) = dm0(margins,r);



cost_e1.l(ii,rr,t)$(y0(ii,rr) gt 0) = cost_e10(ii,rr);
io_ie1.l(ie1,ii,rr,t)$(y0(ii,rr) gt 0) = io_ie10(ie1,ii,rr);
cost_e2.l(ii,rr,t)$(y0(ii,rr) gt 0) = cost_e20(ii,rr);
io_ie2.l(ie2,ii,rr,t)$(y0(ii,rr) gt 0) = io_ie20(ie2,ii,rr);
cost_e.l(ii,rr,t)$(y0(ii,rr) gt 0) = cost_e0(ii,rr);
io_e1e.l(ii,rr,t)$(y0(ii,rr) gt 0) = io_e1e0(ii,rr);
io_e2e.l(ii,rr,t)$(y0(ii,rr) gt 0) = io_e2e0(ii,rr);
cost_m.l(ii,rr,t)$(y0(ii,rr) gt 0) = cost_m0(ii,rr);
io_im.l(im,ii,rr,t)$(y0(ii,rr) gt 0) = io_im0(im,ii,rr);
cost_l.l(ii,rr,t)$(y0(ii,rr) gt 0) = cost_l0(ii,rr);
cost_v.l(ii,rr,t)$(y0(ii,rr) gt 0) = cost_v0(ii,rr);
io_ev.l(ii,rr,t)$(y0(ii,rr) gt 0) = io_ev0(ii,rr);
io_mv.l(ii,rr,t)$(y0(ii,rr) gt 0) = io_mv0(ii,rr);
cost_w.l(ii,rr,t)$(y0(ii,rr) gt 0) = cost_w0(ii,rr);
io_lw.l(ii,rr,t)$(y0(ii,rr) gt 0) = io_lw0(ii,rr);
io_vw.l(ii,rr,t)$(y0(ii,rr) gt 0) = io_vw0(ii,rr);
cost_k.l(ii,rr,t)$(y0(ii,rr) gt 0) = cost_k0(ii,rr);
cost_x.l(ii,rr,t)$(y0(ii,rr) gt 0) = cost_x0(ii,rr);
io_wx.l(ii,rr,t)$(y0(ii,rr) gt 0) = io_wx0(ii,rr);
cost_f.l(ii,rr,t)$(y0(ii,rr) gt 0) = cost_f0(ii,rr);
io_ff.l(i,ii,rr,t)$(y0(ii,rr) gt 0) = io0_ff(i,ii,rr);
cost_z.l(ii,rr,t)$(y0(ii,rr) gt 0) = cost_z0(ii,rr);
io_zy.l(i_nf,rr,t)$(y0(i_nf,rr) gt 0) = io_zy0(i_nf,rr);

cost_e1.fx(ii,rr,t)$(y0(ii,rr) = 0) = cost_e10(ii,rr);
io_ie1.fx(ie1,ii,rr,t)$(y0(ii,rr) = 0) = io_ie10(ie1,ii,rr);
cost_e2.fx(ii,rr,t)$(y0(ii,rr) = 0) = cost_e20(ii,rr);
io_ie2.fx(ie2,ii,rr,t)$(y0(ii,rr) = 0) = io_ie20(ie2,ii,rr);
cost_e.fx(ii,rr,t)$(y0(ii,rr) = 0) = cost_e0(ii,rr);
io_e1e.fx(ii,rr,t)$(y0(ii,rr) = 0) = io_e1e0(ii,rr);
io_e2e.fx(ii,rr,t)$(y0(ii,rr) = 0) = io_e2e0(ii,rr);
cost_m.fx(ii,rr,t)$(y0(ii,rr) = 0) = cost_m0(ii,rr);
io_im.fx(im,ii,rr,t)$(y0(ii,rr) = 0) = io_im0(im,ii,rr);
cost_l.fx(ii,rr,t)$(y0(ii,rr) = 0) = cost_l0(ii,rr);
cost_v.fx(ii,rr,t)$(y0(ii,rr) = 0) = cost_v0(ii,rr);
io_ev.fx(ii,rr,t)$(y0(ii,rr) = 0) = io_ev0(ii,rr);
io_mv.fx(ii,rr,t)$(y0(ii,rr) = 0) = io_mv0(ii,rr);
cost_w.fx(ii,rr,t)$(y0(ii,rr) = 0) = cost_w0(ii,rr);
io_lw.fx(ii,rr,t)$(y0(ii,rr) = 0) = io_lw0(ii,rr);
io_vw.fx(ii,rr,t)$(y0(ii,rr) = 0) = io_vw0(ii,rr);
cost_k.fx(ii,rr,t)$(y0(ii,rr) = 0) = cost_k0(ii,rr);
cost_x.fx(ii,rr,t)$(y0(ii,rr) = 0) = cost_x0(ii,rr);
io_wx.fx(ii,rr,t)$(y0(ii,rr) = 0) = io_wx0(ii,rr);
cost_f.fx(ii,rr,t)$(y0(ii,rr) = 0) = cost_f0(ii,rr);
io_ff.fx(i,ii,rr,t)$(y0(ii,rr) = 0) = io0_ff(i,ii,rr);
cost_z.fx(ii,rr,t)$(y0(ii,rr) = 0) = cost_z0(ii,rr);
io_zy.fx(i_nf,rr,t)$(y0(i_nf,rr) = 0) = io_zy0(i_nf,rr);


zz.l(ii,rr,t)$(y0(ii,rr) gt 0) = zz0(ii,rr);
xx.l(ii,rr,t)$(y0(ii,rr) gt 0) = xx0(ii,rr);
ff.l(ii,rr,t)$(y0(ii,rr) gt 0) = ff0(ii,rr);
ww.l(ii,rr,t)$(y0(ii,rr) gt 0) = ww0(ii,rr);
l.l(ii,rr,t)$(y0(ii,rr) gt 0) = l0(ii,rr);
io.l(i,ii,rr,t)$(y0(ii,rr) gt 0) = io0(i,ii,rr);
k.l(ii,rr,t)$(y0(ii,rr) gt 0) = k0(ii,rr);
xir.l(ii,rr,t)$(y0(ii,rr) gt 0) = delta;
f_k.l(ii,rr,t)$(y0(ii,rr) gt 0) = f_k0(ii,rr);
acexp.l(ii,rr,t)$(y0(ii,rr) gt 0) = acexp0(ii,rr);
y.l(ii,rr,t)$(y0(ii,rr) gt 0) = y0(ii,rr);
ry.l(ii,rr,t)$(y0(ii,rr) gt 0) = g0_dr(ii,rr);
ny.l(ii,rr,t)$(y0(ii,rr) gt 0) = exd0(ii,rr);
ex.l(ii,rr,t)$(y0(ii,rr) gt 0) = ex0(ii,rr);
my.l(ii,rr,t)$(my0(ii,rr) gt 0) = my0(ii,rr);
ey.l(i_td,rr,t)$(y0(i_td,rr) gt 0) = exd0(i_td,rr);
xkinc.l(ii,rr,t)$(y0(ii,rr) gt 0) = xkinc0(ii,rr);
prof.l(ii,rr,t)$(y0(ii,rr) gt 0) = prof0(ii,rr);
dd.l(rr,t) = dd0(rr);
kdep.l(ii,rr,t)$(k0(ii,rr) gt 0) = kdep0(ii,rr);
v.l(ii,rr,t)$(k0(ii,rr) gt 0) = v0(ii,rr);
allow_fed.fx(ii,rr,t) = 0;


zz.fx(ii,rr,t)$(y0(ii,rr) = 0) = zz0(ii,rr);
xx.fx(ii,rr,t)$(y0(ii,rr) = 0) = xx0(ii,rr);
ff.fx(ii,rr,t)$(y0(ii,rr) = 0) = ff0(ii,rr);
ww.fx(ii,rr,t)$(y0(ii,rr) = 0) = 0;
l.fx(ii,rr,t)$(y0(ii,rr) = 0) = 0;
io.fx(i,ii,rr,t)$(y0(ii,rr) = 0) = 0;
k.fx(ii,rr,t)$(y0(ii,rr) = 0) = 0;
xir.fx(ii,rr,t)$(y0(ii,rr) = 0) = 0;
f_k.fx(ii,rr,t)$(y0(ii,rr) = 0) = 0;
acexp.fx(ii,rr,t)$(y0(ii,rr) = 0) = 0;
y.fx(ii,rr,t)$(y0(ii,rr) = 0) = 0;
ry.fx(ii,rr,t)$(y0(ii,rr) = 0) = 0;
ny.fx(ii,rr,t)$(y0(ii,rr) = 0) = 0;
ex.fx(ii,rr,t)$(y0(ii,rr) = 0) = 0;
my.fx(ii,rr,t)$(my0(ii,rr) = 0) = 0;
ey.fx(ii,rr,t)$(not i_td(ii)) = 0;
ny.fx(i_td,rr,t) = 0;
xkinc.fx(ii,rr,t)$(y0(ii,rr) = 0) = 0;
prof.fx(ii,rr,t)$(y0(ii,rr) = 0) = 0;
kdep.fx(ii,rr,t)$(k0(ii,rr) = 0) = 0;



etot.l(r,t) = etot0(r);
etot_net.l(r,t) = etot0(r)


model DR_GEM_FULL_LUMP /

        ss_pbar.pbar_ss
        ss_pkbar.pkbar_ss
        ss_wbar.wbar_ss
        ss_pd.pd_ss
        ss_pd_ff.pd_ss
        ss_pd_td.pd_ss
        ss_pg.pg_ss
        ss_py.py_ss
        ss_pc.pc_ss
        ss_pi.pi_ss
        ss_pgf.pgf_ss
        ss_pgr.pgr_ss
        ss_pio.pio_ss
        ss_pm.pm_ss
        ss_pr.pr_ss
        ss_pr_ff.pr_ss
        ss_cp.cp_ss
        ss_cpv.cpv_ss
        ss_cpumlot.cpumlot_ss
        ss_cphat.cphat_ss
        ss_cptilde.cptilde_ss

        ss_ppi.ppi_ss
        ss_cpi.cpi_ss

        ss_hheuler.rbar_ss
        ss_hh_foc_c.cbar_ss
        ss_hh_foc_l.leis_ss
        ss_hh_ls.ls_ss
        ss_bc.lambda_ss

        ss_crev_fed.crev_fed_ss
        ss_crev_reg.crev_reg_ss
        ss_grev_fed.grev_fed_ss
        ss_grev_reg.grev_reg_ss
        ss_glump_fed.glump_fed_ss
        ss_glump_reg.glump_reg_ss
        ss_crebate_fed.crebate_fed_ss
        ss_crebate_reg.crebate_reg_ss
        ss_ggrant.ggrant_ss


        ss_c_cv.c_cv_ss
        ss_cv_cumlot.cv_cumlot_ss
        ss_cumlot_ctilde.cumlot_ctilde_ss
        ss_ctilde_chat.ctilde_chat_ss
        ss_chat_cbar.chat_cbar_ss
        ss_cg.cg_ss
        ss_c.c_ss
        ss_pce.pce_ss
        ss_ibar.ibar_ss
        ss_i.i_ss
        ss_pfi.pfi_ss
        ss_g.g_ss
        ss_g_d.g_d_ss
        ss_g_f.g_f_ss
        ss_g_dr.g_dr_ss
        ss_g_dn.g_dn_ss
        ss_g_dn_ff.g_dn_ss
        ss_g_dn_td.g_dn_ss
        ss_dm.dm_ss

        ss_cost_e1.cost_e1_ss
        ss_io_ie1.io_ie1_ss
        ss_cost_e2.cost_e2_ss
        ss_io_ie2.io_ie2_ss
        ss_cost_e.cost_e_ss
        ss_io_e1e.io_e1e_ss
        ss_io_e2e.io_e2e_ss
        ss_cost_ee2.cost_e_ss
        ss_io_e1e2.io_e1e_ss
        ss_io_e2e2.io_e2e_ss
        ss_cost_m.cost_m_ss
        ss_io_im.io_im_ss
        ss_cost_l.cost_l_ss
        ss_cost_v.cost_v_ss
        ss_io_ev.io_ev_ss
        ss_io_mv.io_mv_ss
        ss_cost_v2.cost_v_ss
        ss_io_ev2.io_ev_ss
        ss_io_mv2.io_mv_ss
        ss_cost_w.cost_w_ss
        ss_io_lw.io_lw_ss
        ss_io_vw.io_vw_ss
        ss_cost_w2.cost_w_ss
        ss_io_lw2.io_lw_ss
        ss_io_vw2.io_vw_ss
        ss_cost_k.cost_k_ss
        ss_cost_x.cost_x_ss
        ss_cost_x2.cost_x_ss
        ss_cost_x_ff.cost_x_ss
        ss_io_wx.io_wx_ss
        ss_io_wx_ff.io_wx_ss
        ss_cost_f.cost_f_ss
        ss_io_ff.io_ff_ss
        ss_cost_z.cost_z_ss
        ss_io_zy.io_zy_ss

        ss_firm_ww.ww_ss
        ss_firm_ww2.ww_ss
        ss_firm_ww_ff.ww_ss
        ss_firm_zz.zz_ss
        ss_firm_zz_ff.zz_ss

        ss_firm_xx.xx_ss
        ss_firm_ff.ff_ss

        ss_firm_ld.l_ss
        ss_firm_io_e1.io_ss
        ss_firm_io_e2.io_ss
        ss_firm_io_m.io_ss
        ss_lambdak.lambdak_ss
        ss_firmeuler.k_ss
        ss_firmeuler_ff.k_ss

        ss_firm_f_k.f_k_ss
        ss_firm_f_k_ff.f_k_ss

        ss_firm_y.y_ss
        ss_firm_y2.y_ss
        ss_firm_y_ff.y_ss
        ss_acexp.acexp_ss
        ss_firm_ry.ry_ss
        ss_firm_ny.ny_ss
        ss_firm_ex.ex_ss
        ss_firm_my.my_ss
        ss_firm_ey.ey_ss
        ss_xkinc.xkinc_ss
        ss_prof.prof_ss
        ss_dd.dd_ss
        ss_kdep.kdep_ss
        ss_v.v_ss

        ss_etot.etot_ss
        ss_etot_net.etot_net_ss


        ss_mc_y.p_ss
        ss_mc_ny.pn_ss
        ss_mc_my.pmy_ss
        ss_mc_ey.pe_ss
        ss_mc_l.w_ss
        ss_mc_f.exch_ss

        trans_pbar.pbar
        trans_pkbar.pkbar
        trans_wbar.wbar
        trans_rbar.rbar
        trans_rbar_tc.rbar
        trans_pd.pd
        trans_pd_ff.pd
        trans_pd_td.pd
        trans_pg.pg
        trans_py.py
        trans_pc.pc
        trans_pi.pi
        trans_pgf.pgf
        trans_pgr.pgr
        trans_pio.pio
        trans_pm.pm
        trans_pr.pr
        trans_pr_ff.pr
        trans_cp.cp
        trans_cpv.cpv
        trans_cpumlot.cpumlot
        trans_cptilde.cptilde
        trans_cphat.cphat

        trans_ppi.ppi
        trans_cpi.cpi


        trans_hheuler.rbarn
        trans_hheuler_tc.rbarn
        trans_hh_foc_c.cbar
        trans_hh_foc_l.leis
        trans_hh_ls.ls
        trans_bc.lambda

        trans_crev_fed.crev_fed
        trans_crev_reg.crev_reg
        trans_grev_fed.grev_fed
        trans_grev_reg.grev_reg
        trans_glump_fed.glump_fed
        trans_glump_reg.glump_reg
        trans_crebate_fed.crebate_fed
        trans_crebate_reg.crebate_reg
        trans_ggrant.ggrant

        trans_c_cv.c_cv
        trans_cv_cumlot.cv_cumlot
        trans_cumlot_ctilde.cumlot_ctilde
        trans_ctilde_chat.ctilde_chat
        trans_chat_cbar.chat_cbar
        trans_cg.cg
        trans_c.cons
        trans_pce.pce
        trans_ibar.ibar
        trans_i.inv
        trans_pfi.pfi
        trans_g.g
        trans_g_d.g_d
        trans_g_f.g_f
        trans_g_dr.g_dr
        trans_g_dn.g_dn
        trans_g_dn_ff.g_dn
        trans_g_dn_td.g_dn
        trans_dm.dm

        trans_cost_e1.cost_e1
        trans_io_ie1.io_ie1
        trans_cost_e2.cost_e2
        trans_io_ie2.io_ie2
        trans_cost_e.cost_e
        trans_io_e1e.io_e1e
        trans_io_e2e.io_e2e
        trans_cost_ee2.cost_e
        trans_io_e1e2.io_e1e
        trans_io_e2e2.io_e2e
        trans_cost_m.cost_m
        trans_io_im.io_im
        trans_cost_l.cost_l
        trans_cost_v.cost_v
        trans_io_ev.io_ev
        trans_io_mv.io_mv
        trans_cost_w.cost_w
        trans_io_lw.io_lw
        trans_io_vw.io_vw
        trans_cost_v2.cost_v
        trans_io_ev2.io_ev
        trans_io_mv2.io_mv
        trans_cost_w2.cost_w
        trans_io_lw2.io_lw
        trans_io_vw2.io_vw
        trans_cost_k.cost_k
        trans_cost_x.cost_x
        trans_cost_x2.cost_x
        trans_cost_x_ff.cost_x
        trans_io_wx.io_wx
        trans_io_wx_ff.io_wx
        trans_cost_f.cost_f
        trans_io_ff.io_ff
        trans_cost_z.cost_z
        trans_io_zy.io_zy

        trans_firm_ww.ww
        trans_firm_ww2.ww
        trans_firm_ww_ff.ww
        trans_firm_zz.zz
        trans_firm_zz_ff.zz
        trans_firm_xx.xx
        trans_firm_ff.ff
        trans_firm_ld.l
        trans_firm_io_e1.io
        trans_firm_io_e2.io
        trans_firm_io_m.io
        trans_lambdak.lambdak
        trans_firmeuler.xir
        trans_firmeuler_tc.xir
        trans_firmeuler_ff.xir
        trans_firmeuler_ff_tc.xir
        trans_firm_f_k.f_k
        trans_firm_f_k_ff.f_k
        trans_firm_kk.k
        trans_firm_y.y
        trans_firm_y2.y
        trans_firm_y_ff.y
        trans_acexp.acexp
        trans_firm_ry.ry
        trans_firm_ny.ny
        trans_firm_ex.ex
        trans_firm_my.my
        trans_firm_ey.ey
        trans_xkinc.xkinc
        trans_prof.prof
        trans_dd.dd
        trans_dd_tc.dd
        trans_kdep.kdep
        trans_v.v
        trans_v_tc.v
        trans_etot.etot
        trans_etot_net.etot_net

        trans_mc_y.p
        trans_mc_ny.pn
        trans_mc_my.pmy
        trans_mc_ey.pe
        trans_mc_l.w
        trans_mc_f.exch
/
;

