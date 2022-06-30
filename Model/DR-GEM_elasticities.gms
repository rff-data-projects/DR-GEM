$TITLE Benchmark Elasticities




* ------------------------------------------------------------------------------
* Household Elasticities
* ------------------------------------------------------------------------------



parameter
sig_cbar
sig_c(cj)
sig_ct(cjt)
sig_cu(cju)
sig_cv(cjv)
;


sig_cbar = 0.5;
sig_c(cj) = 0.5;
sig_c('cj1') = 0.35;
sig_ct(cjt) = 0.5;
sig_cu(cju) = 0.5;
sig_ct('cjt1') = 0.4;
sig_ct('cjt4') = 0.3;
sig_cu('cju1') = 0.2;
sig_cu('cju6') = 0.75;
sig_cv(cjv) = 0.5;
sig_cv('cjv8') = 0.5;

sig_cu('cju2') = 0.25;



* ------------------------------------------------------------------------------
* Production Elasticities
* ------------------------------------------------------------------------------

parameter
rho_r(*,*)
sig_r(*,*) "Elasticity of Subs. Y = F(R,X)"
rho_x(*,*)
sig_x(*,*) "Elasticity of Subs. X = F(K,W)"
sig_w(*,*) "Elasticity of Subs. W = F(L,V)"
sig_v(*,*) "Elasticity of Subs. V = F(E,M)"
sig_e(*,*) "Elasticity of Subs. Across Energy Goods  E = F(E_1,E_2)"
sig_e1(*,*) "Elasticity of Subs. Across Energy Goods  E = F(E_1,E_2)"
sig_e2(*,*)
sig_m(*,*) "Elasticity of Subs. Across Material Goods  M = F(M_1,...,M_n)"
sig_y
rho_y
;

sig_r(i,r) = 0.5;
sig_r(i_coal,r) = 0.89;
sig_r(i_oil,r) = 0.45;
sig_r(i_gas,r) = 0.37;
sig_r(i_gen_oth,r) = 0.25;
rho_r(i,r) = (sig_r(i,r)-1)/sig_r(i,r);

sig_x(i,r) = 0.5;
sig_x(i_td,r)  = 0.2;
sig_x(i_gen,r)  = 0.3;
sig_x(i_ngd,r)  = 0.3;


rho_x(i,r) = (sig_x(i,r)-1)/sig_x(i,r);

sig_w(i,r) = 0.7;
sig_w(i_td,r) = 0.2;
sig_w(i_gen,r)  = 0.2;
sig_w(i_gen,r)  = 0.2;
sig_w(i_gen,r)  = 0.2;

sig_v(i,r) = 0.7;
sig_v(i_td,r)  = 0.4;
sig_v(i_gen,r)  = 0.2;
sig_v(i_ngd,r)  = 0.4;

sig_e(i,r) = 0.4;
sig_e1(i,r) = 0.4;
sig_e2(i,r) = 0.4;

sig_e(i_td,r) = 3;
sig_e1(i_td,r) = 5;
sig_e2(i_td,r) = 3;


sig_e(i_gen,r) = 0.2;
sig_e1(i_gen,r) = 0.2;
sig_e2(i_gen,r) = 6;


sig_m(i,r) = 0.6;
sig_m(i_gen,r) = 0.2;

sig_v(i_ind,r) = 0.5;
sig_e(i_ind,r) = 0.5;
sig_e1(i_ind,r) = 0.5;
sig_e2(i_ind,r) = 0.4;

sig_v(i_com,r) = 0.4;
sig_e(i_com,r) = 0.6;
sig_e1(i_com,r) = 0.5;
sig_e2(i_com,r) = 0.4;

sig_v(i_trans,r) = 0.2;
sig_e(i_trans,r) = 0.2;
sig_e1(i_trans,r) = 0.2;
sig_e2(i_trans,r) = 0.2;


sig_m(i,r) = 0.6;
sig_m(i_gen,r) = 0.2;

* ------------------------------------------------------------------------------
* Trade Elasticities
* ------------------------------------------------------------------------------

parameter
sig_f(*,*) "Foreign input elasticity of substitution"
sig_ex "Elasticity of transformation in output"
sig_rn
;


sig_f(i,r) = 4;
sig_f(i_elec,r) = 1.5;
sig_f(i_ff,r) = 0.5;
sig_f(i_refine,r) = 0.5;

sig_ex(i,r) = 2;
sig_ex(i_coal,r) = 1.1;

sig_rn(i,r) = 2;
sig_rn(i_td,r) = 20;













