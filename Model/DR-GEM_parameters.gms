$TITLE Benchmark Model Parameters

* Time step = 4 years
* Options for exogenous growth in quantities and prices
* Adjustment costs calibrated for four year time step
* Average federal and state tax rates for labor and capital income
*



* ------------------------------------------------------------------------------
* Interest Rates and Growth Rates
* ------------------------------------------------------------------------------

parameter
rbar0 "Real after-tax annual interest rate" /.04/
rbarn0 "Nominal after-tax interest rate"
gr /.0/
gp /0.0/
gf /0/
;
gf = (1+gp)*(1+gr) - 1;

rbar0 = (1+rbar0)**(pl) - 1;

rbarn0 = (1+rbar0)*(1+gp) - 1;

* ------------------------------------------------------------------------------
* Capital adjustment costs
* ------------------------------------------------------------------------------

parameter
qparb00(*)
qparb0
qparb(*,*)
;

qparb0 = 1;

* ------------------------------------------------------------------------------
* Household Parameters
* ------------------------------------------------------------------------------



parameter
elas_ls "Elasticity of Labor Supply" /0.3/
sigma "CRRA" /2/
beta
w_l "fraction of time spent working" /0.66/
;
beta = (1/(1+rbar0))*(1+gr)**sigma;



* ------------------------------------------------------------------------------
* Tax Rates
* ------------------------------------------------------------------------------

parameter
tau_p00
tau_l00
tau_lr00
tau_k00
tau_kr00
tau_y00
;

tau_p00 = 0.133;

tau_l00 = 0.2;
tau_lr00 = 0.05;

tau_k00 = 0.1;
tau_kr00 = 0.025;

* Social Cost of Carbon

sets scc /scc_low,scc,scc_high,scc95/
parameters
sc_co2(scc,t)
;


$CALL GDXXRW.EXE scc_input.xlsx par=sc_co2 rng=A1:J5 cdim = 1 rdim = 1


$GDXIN scc_input.gdx
$LOAD sc_co2
$GDXIN

display
sc_co2
;













