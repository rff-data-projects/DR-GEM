$TITLE National Data-Model Reconcialation


* ------------------------------------------------------------------------------
* Assign new set definition to model parameters
* ------------------------------------------------------------------------------

sets
n /n1*n60/
;

Set mapind(*,n)    /
c1         .        n14
c2         .        n15
c3a        .        n1
c3b        .        n2
c4         .        n3
c5         .        n16
c6         .        n17
c7a        .        n4
c7b        .        n5
c7c        .        n6
c7d        .        n7
c7e        .        n8
c7f        .        n9
c7g        .        n10
c8         .        n11
c9         .        n12
c10        .        n18
c11        .        n19
c12        .        n20
c13        .        n21
c14        .        n22
c15        .        n23
c16        .        n24
c17        .        n25
c18        .        n13
c19        .        n26
c20        .        n27
c21        .        n28
c22        .        n29
c23        .        n30
c24        .        n31
c25        .        n32
c26        .        n33
c27        .        n34
c28        .        n35
c29        .        n36
c30        .        n37
c31a       .        n38
c31b       .        n39
c31c       .        n40
c32        .        n41
c33        .        n42
c34        .        n43
c35        .        n44
c36        .        n45
c37        .        n46
c38        .        n46
c39        .        n46
c40        .        n46
c41        .        n46
c42        .        n46
c43        .        n46
c44        .        n46
c45        .        n47
c46        .        n48
c47        .        n49
c48        .        n50
c49        .        n51
c50        .        n52
c51        .        n53
c52        .        n54
c53        .        n55
c54        .        n56
c55        .        n57
c56        .        n58
c57        .        n59
c58        .        n60
/;

alias(n,nn);
alias(n,nnn);

sets
map_mr00(n,margins)  / n46.transport,n44.wholesale,n45.retail/
;


sets
n_e(n) /n1*n13/
n_refine(n) /n13/
n_ff(n) /n1,n2,n3/
n_ind(n) /n14,n15,n16,n17,n19*n43/
n_ind2(n) /n1*n3,n12*n13,n14,n15,n16*n17,n19*n43/
n_gen(n) /n4*n10/
n_gen_coal(n) /n4/
n_gen_gas(n) /n5/
n_gen_nuc(n) /n6/
n_gen_hyd(n) /n7/
n_gen_sol(n) /n8/
n_gen_win(n) /n9/
n_gen_oth(n) /n10/
n_td(n) /n11/
n_elec(n) /n4*n11/
n_ngd(n) /n12/
n_com(n) /n18,n44,n45,n47*n60/
n_trans(n) /n46/
n_mv(n) /n38*n40/
n_coal(n) /n3/
n_oil(n) /n1/
n_gas(n) /n2/
n_ag(n) /n14*n15/
n_cons(n) /n19/
n_othmine(n) /n16*n17/

;

alias(n_refine,n_refine2);
alias(n_gas,n_gas2);

* ------------------------------------------------------------------------------
* Define new national model parameters
* ------------------------------------------------------------------------------

parameter
IO00(*,*)
IO00_F(*,*)
IO00_DN(*,*)
L00(*)
TOPI00(*)
GOS000(*)

PCE00_DN(*)
PCE00_F(*)
PCE00(*)

PFI00_DN(*)
PFI00_F(*)
PFI00(*)

G_FED00_DN(*)
G_FED00_F(*)
G_FED00(*)

G_REG00_DN(*)
G_REG00_F(*)
G_REG00(*)

GY_FED00(*)
GY_REG00(*)

EX00(*)

NR00(*)
NRP00(*)

GTRANS_FED00
GTRANS_REG00
GGRANT00

LG_FED00
LG_REG00

hhtot00


pce00_m
pce00_tot
pce00_mr
pce00_mtot
pfi00_m
pfi00_tot
pfi00_mr
pfi00_mtot
g_fed00_m
g_fed00_tot
g_fed00_mr
g_fed00_mtot
g_reg00_m
g_reg00_tot
g_reg00_mr
g_reg00_mtot
io00_m
io00_tot
io00_mr
io00_mtot
dm00

;

* ------------------------------------------------------------------------------
* Map data to national model parameters
* ------------------------------------------------------------------------------


L00(n) = sum(in, mapind(in,n) * L0_(in));
TOPI00(n) = sum(in, mapind(in,n) * TOPI0_(in));
GOS000(n) = sum(in, mapind(in,n) * GOS0_(in));
PCE00(n) = sum(in, mapind(in,n) * PCE0_(in));
PCE00_DN(n) = sum(in, mapind(in,n) * PCE0_DN_(in));
PCE00_F(n) = sum(in, mapind(in,n) * PCE0_F_(in));
PFI00(n) = sum(in, mapind(in,n) * PFI0_(in));
PFI00_DN(n) = sum(in, mapind(in,n) * PFI0_DN_(in));
PFI00_F(n) = sum(in, mapind(in,n) * PFI0_F_(in));
G_FED00(n) = sum(in, mapind(in,n) * G_FED0_(in));
G_FED00_DN(n) = sum(in, mapind(in,n) * G_FED0_DN_(in));
G_FED00_F(n) = sum(in, mapind(in,n) * G_FED0_F_(in));
G_REG00(n) = sum(in, mapind(in,n) * G_REG0_(in));
G_REG00_DN(n) = sum(in, mapind(in,n) * G_REG0_DN_(in));
G_REG00_F(n) = sum(in, mapind(in,n) * G_REG0_F_(in));
GY_FED00(n) = sum(in, mapind(in,n) * GY_FED0_(in));
GY_REG00(n) = sum(in, mapind(in,n) * GY_REG0_(in));
EX00(n) = sum(in, mapind(in,n) * EX0_(in));
NR00(n) = sum(in, mapind(in,n) * NR0_(in));
NRP00(n) = sum(in, mapind(in,n) * NRP0_(in));


IO00(n,nn) = sum(in,sum(in2, mapind(in2,nn) * IO0_(in,in2)) * mapind(in,n));
IO00_DN(n,nn) = sum(in,sum(in2, mapind(in2,nn) * IO0_DN_(in,in2)) * mapind(in,n));
IO00_F(n,nn) = sum(in,sum(in2, mapind(in2,nn) * IO0_F_(in,in2)) * mapind(in,n));

GTRANS_FED00 = GTRANS_FED0_;
GTRANS_REG00 = GTRANS_REG0_;
GGRANT00 = GGRANT0_;

LG_FED00 = LG_FED0_;
LG_REG00 = LG_REG0_;

hhtot00 = 1;

pce00_m(n,margins) = sum(in, mapind(in,n) * pce0_m_(in,margins));
pce00_tot(n) = sum(in, mapind(in,n) * pce0_tot_(in));
pce00_mr(n,margins)$(pce00_tot(n) gt 0) = pce00_m(n,margins)/pce00_tot(n);
pce00_mtot(n,margins) = pce00_mr(n,margins)*pce00(n);

pfi00_m(n,margins) = sum(in, mapind(in,n) * pfi0_m_(in,margins));
pfi00_tot(n) = sum(in, mapind(in,n) * pfi0_tot_(in));
pfi00_mr(n,margins)$(pfi00_tot(n) gt 0) = pfi00_m(n,margins)/pfi00_tot(n);
pfi00_mtot(margins) = sum(n,pfi00_mr(n,margins)*pfi00(n));

g_fed00_m(n,margins) = sum(in, mapind(in,n) * g_fed0_m_(in,margins));
g_fed00_tot(n) = sum(in, mapind(in,n) * g_fed0_tot_(in));
g_fed00_mr(n,margins)$(g_fed00_tot(n) gt 0) = g_fed00_m(n,margins)/g_fed00_tot(n);
g_fed00_mtot(margins) = sum(n,g_fed00_mr(n,margins)*g_fed00(n));

g_reg00_m(n,margins) = sum(in, mapind(in,n) * g_reg0_m_(in,margins));
g_reg00_tot(n) = sum(in, mapind(in,n) * g_reg0_tot_(in));
g_reg00_mr(n,margins)$(g_reg00_tot(n) gt 0) = g_reg00_m(n,margins)/g_reg00_tot(n);
g_reg00_mtot(margins) = sum(n,g_reg00_mr(n,margins)*g_reg00(n));

io00_m(n,margins) = sum(in, mapind(in,n) * io0_m_(in,margins));
io00_tot(n) = sum(in, mapind(in,n) * io0_tot_(in));
io00_mr(n,margins)$(io00_tot(n) gt 0) = io00_m(n,margins)/io00_tot(n);
io00_mtot(n,nn,margins) = io00_mr(n,margins)*io00(n,nn);


dm00(margins) = sum(n,pce00_mr(n,margins)*pce00(n) + pfi00_mr(n,margins)*pfi00(n)
+g_fed00_mr(n,margins)*g_fed00(n) + g_reg00_mr(n,margins)*g_reg00(n) + io00_mr(n,margins)*sum(nn,IO00(n,nn)));

QPARB00(n) = QPARB0;

display
pce00
pfi00
g_fed00
g_reg00
io00
;

* ------------------------------------------------------------------------------
* Step 1: Calibrate good demand, trade shares, and margin demand
* ------------------------------------------------------------------------------

parameter
G00(*)  "Composite demand for good i"
xf00(*) "Foreign demand ratio for good i"
G00_D(*) "Domestic composite demand for good i"
G00_F(*) "Demand for foreign good i"
IM00(*)  "Imports of foreign good i"
BOP00  "Balance of payments"
MY00(*) "Margin supply"

;

PFI00(n) = 1.5*PFI00(n);
PFI00_F(n) = 1.5*PFI00_F(n);

* Armington Composite Demand for Good i

G00(n) = PCE00(n) + PFI00(n) + G_FED00(n) + G_REG00(n) + sum(nn,IO00(n,nn));

* Allocate good demand to domestic and foreign demand

xf00(n)$(G00(n) gt 0) = (PCE00_F(n) + PFI00_F(n) + G_FED00_F(n) + G_REG00_F(n) + sum(nn,IO00_F(n,nn)))/G00(n);

G00_D(n) = (1-xf00(n))*G00(n);
G00_F(n) = xf00(n)*G00(n);


IM00(n) = G00_F(n);
BOP00 = sum(n,IM00(n)-EX00(n));

* Define margin supply and demand

MY00(n) = sum(margins, map_mr00(n,margins)*( sum(nn,pce00_mr(nn,margins)*PCE00(nn) + pfi00_mr(nn,margins)*PFI00(nn) + g_fed00_mr(nn,margins)*G_FED00(nn) + g_reg00_mr(nn,margins)*G_REG00(nn) + io00_mr(nn,margins)*sum(nnn,IO00(nn,nnn))    )));
dm00(margins) = sum(n,pce00_mr(n,margins)*pce00(n) + pfi00_mr(n,margins)*pfi00(n)
+g_fed00_mr(n,margins)*g_fed00(n) + g_reg00_mr(n,margins)*g_reg00(n) + io00_mr(n,margins)*sum(nn,IO00(n,nn)));

display
G00_D
xf00
IM00
dm00
my00
;

* ------------------------------------------------------------------------------
* Step 2: Define final good demand aggregate demands
* ------------------------------------------------------------------------------

parameter
C00  "Consumption expenditures (net of margins) on good i"
I00 "Total Investment expenditures on good i"

CBAR00  "Total consumption expenditures"
IBAR00 "Total investment expenditures"
GBAR_FED00 "Total federal government expenditures on good i"
GBAR_REG00 "Total regional government expenditures on good i"


;



C00(n) = PCE00(n)*(1+sum(margins,pce00_mr(n,margins)));
I00(n) = PFI00(n)*(1+sum(margins,pfi00_mr(n,margins)));


CBAR00 = sum(n,C00(n));
IBAR00 = sum(n,I00(n));
GBAR_FED00(n) = G_FED00(n)*(1+sum(margins,g_fed00_mr(n,margins)));
GBAR_REG00(n) = G_REG00(n)*(1+sum(margins,g_reg00_mr(n,margins)));




* ------------------------------------------------------------------------------
* Step 3: Calibrate output, gross operating surplus, capital, and depreciation
* ------------------------------------------------------------------------------



** Note: This procedure assumes that deltat = delta.

parameter
IOM00 "Intermediate input margin expenditures"
Y00 "Total production by industry i"
GOS00
KS00 "Total capital supply"
delta00 "Capital depreciation rates"
deltat00 "Taxable capital depreciation rates"
rent00 "Implicit rental return on capital"
DD00 "Present value of taxable depreciation on a $ of new investment"
LAMBDAK00(*) "Shadow value of capital"
K00 "Capital for industry i"
G0S_Y00
gos00_db
i00_db
ks00_db
io00_db
ibar00_db
;



IOM00(nn,n) = sum(margins,io00_mr(nn,margins)*IO00(nn,n));


Y00(n) = G00_D(n) + MY00(n) + EX00(n)  - GY_REG00(n) - GY_FED00(n);
tau_y00(n) = TOPI00(n)/Y00(n);
L00(n) = L00(n)/(1+tau_p00);
GOS00(n) = Y00(n) - TOPI00(n) - L00(n)*(1+tau_p00) - sum(nn,IO00(nn,n)) - sum(nn,IOM00(nn,n)) - NRP00(n);

G0S_Y00(n) = GOS00(n)/Y00(n);

io00_db(n) = sum(nn,IOM00(nn,n));

gos00_db = sum(n,GOS00(n));


* Note: this method below calibrates delta to be consistent with tau_kr0, data, and model structure


KS00 = (sum(n,GOS00(n)) - IBAR00 - (tau_k00+tau_kr00)*(sum(n,GOS00(n))-IBAR00) )/rbar0;
delta00 = IBAR00/KS00;
deltat00 = delta00;
DD00 = ((tau_k00+tau_kr00))*deltat00/(deltat00+RBAR0);
LAMBDAK00(n) = (1-DD00);
K00(n) = (1-tau_k00-tau_kr00)*GOS00(n)/(rbar0 + (1-tau_k00-tau_kr00)*delta00);
rent00(n) = (gos00(n)/k00(n))*(1/lambdak00(n));

ks00_db = ks00 - sum(N,k00(n));
ibar00_db = IBAR00 - sum(n,delta00*k00(n));

* Note: this method below calibrates regional capital tax rate to be consistent with delta, data, and model structure

$ontext
delta00 = .0586;
deltat00 = delta00;


KS00 = IBAR00/delta(00;
tau_kr00 = 1-(rbar0*ks00)/(sum(n,GOS00(n))-IBAR00) - tau_k00;
DD00 = ((tau_k00+tau_kr00))*deltat00/(deltat00+RBAR0);
LAMBDAK00(n) = (1-DD00);
K00(n) = (1-tau_k00-tau_kr00)*GOS00(n)/(rbar0 + (1-tau_k00-tau_kr00)*delta00);
rent00(n) = (gos00(n)/k00(n))*(1/lambdak00(n));

ks00_db= ks00 - sum(n,k00(n));
ibar00_db = IBAR00 - sum(n,(delta00)*k00(n));
$offtext




display
Y00
G00_D
my00
EX00
GY_REG00
GY_FED00
GOS00
L00
NRP00
TOPI00
tau_y00
io00_db
K00
KS00
ks00_db
ibar00_db
tau_kr00
delta00
gos00_db
G0S_Y00
;




* ------------------------------------------------------------------------------
* Step 4: Derive capital income
* ------------------------------------------------------------------------------

parameters
pkbar00  "Price of new capital"
xi00(*) "Share of investment spending allocated to good i"
ACEXP00(*) "Adjustment cost expenditures"
F_K00(*) "Marginal return to capital"
KDEP00(*) "Depreciated capital stock"
XKINC00(*) "Capital Income"
PROF00(*) "Profits"
PROF00b "Profits (gross of investment expenditures"
v00(*) "Value of Firm"
v00_db

;


xi00(n) = (PFI00(n))/sum(nn,PFI00(nn));
pkbar00 = sum(n,xi00(n)) ;




ACEXP00(n) = 0 ;

F_K00(n)$(K00(n) gt 0) = (LAMBDAK00(n)*(rbar0+delta00)  )/((1-tau_y00(n))*(1-tau_k00-tau_kr00));

KDEP00(n) = ((delta00+gr)*K00(n))/(gr+deltat00);
*KDEP00(n) = 0;
XKINC00(n) = GOS00(n);

PROF00(n) = (1-tau_k00-tau_kr00)*XKINC00(n) + (tau_k00+tau_kr00)*deltat00*KDEP00(n) - (delta00+gr)*K00(n);
PROF00b(n) = (1-tau_k00-tau_kr00)*XKINC00(n) + (tau_k00+tau_kr00)*deltat00*KDEP00(n);

v00(n) = lambdak00(n)*k00(n) + dd00*kdep00(n);

v00_db(n) = (1-tau_k00-tau_kr00)*(GOS00(n) - delta00*k00(n))/rbar0;




display
lambdak00
F_K00
XKINC00
GOS00
v00
v00_db
prof00
XI00
;

* ------------------------------------------------------------------------------
* Step 5: Government expenditure and finance
* ------------------------------------------------------------------------------

* Government expenditures

parameters
GEXP_FED00
GEXP_REG00
;

LG_FED00 = LG_FED00/(1+tau_p00);
LG_REG00 = LG_REG00/(1+tau_p00);

GEXP_FED00 = LG_FED00*(1+tau_p00) + sum(n,GBAR_FED00(n)) + GGRANT00 + GTRANS_FED00;
GEXP_REG00 = LG_REG00*(1+tau_p00) + sum(n,GBAR_REG00(n)) + GTRANS_REG00;

* Government finance

parameters
GREV_FED00
GREV_K_FED00
GREV_REG00
GLUMP_FED00
GLUMP_REG00
;

*


GREV_FED00 = (tau_l00 + tau_p00)*(sum(n,L00(n)) + LG_FED00 + LG_REG00)  +  sum(n,tau_k00*XKINC00(n)) - sum(n,tau_k00*deltat00*KDEP00(n)) + sum(n,GY_FED00(n));
GREV_K_FED00 = sum(n,tau_k00*XKINC00(n)) - sum(n,tau_k00*deltat00*KDEP00(n));
GREV_REG00 = (tau_lr00)*(sum(n,L00(n))  + LG_FED00 + LG_REG00) + sum(n,tau_kr00*XKINC00(n)) - sum(n,tau_kr00*deltat00*KDEP00(n)) + sum(n,tau_y00(n)*Y00(n))  + sum(n,GY_REG00(n)) + GGRANT00 ;

GLUMP_FED00 = LG_FED00*(1+tau_p00) + sum(n,GBAR_FED00(n)) + GGRANT00 + GTRANS_FED00 - GREV_FED00;
GLUMP_REG00 = GEXP_REG00 - GREV_REG00;



display
grev_k_fed00
gexp_fed00
gexp_reg00
glump_fed00
glump_reg00
;


* ------------------------------------------------------------------------------
* Step 6: Verify budget constraint and domestic trade balance
* ------------------------------------------------------------------------------


parameter
r00
r00_db
save00
LS00
bc00
wealth00
vtot00
bc00_db
;

r00 = sum(n,prof00(n))/sum(n,v00(n));

r00_db = rbar0/(1-tau_k00-tau_kr00);

save00 = sum(n,r00*v00(n)) - sum(n,prof00(n));

LS00 = sum(n,L00(n)) + LG_FED00 + LG_REG00;

bc00 = (1-tau_l00-tau_lr00)*LS00 + sum(n,PROF00(n)+NRP00(n)) + GTRANS_FED00 + GTRANS_REG00 + BOP00 - CBAR00 - GLUMP_FED00 - GLUMP_REG00 ;

wealth00 = (CBAR00 + GLUMP_FED00 + GLUMP_REG00 - (1-tau_l00-tau_lr00)*LS00 - sum(n,NRP00(n)) - GTRANS_FED00 - GTRANS_REG00 - BOP00)/r00;
vtot00 = sum(n,v00(n));

bc00_db = sum(n,PCE00(n) + PFI00(n) + G_FED00(n) + G_REG00(n) + my00(n) - sum(nn,IOM00(nn,n))) - cbar00 - ibar00 - sum(n,gbar_fed00(n) + gbar_reg00(n)) ;

;

display
bop00
bc00
cbar00
save00
r00
r00_db
rbar0
wealth00
vtot00
bc00_db
;


*
* Calculate national emissions factors for each producer and consumer good
*


parameter

mu_n(*,*)
muc_n(*)
mug_n(*)
esector0n
esector_db_n
;



mu_n(n,nn) = 0;
muc_n(n) = 0;
mug_n(n) = 0;



* Natural Gas
mu_n(n_gas,n_ind2) = mu_sector_('gas','ind');
mu_n(n_gas,n_gen_gas) = mu_sector_('gas','ep');
mu_n(n_gas,n_ngd) = 0;
mu_n(n_gas,n_trans) = mu_sector_('gas','trans');

* Coal
mu_n(n_coal,n_ind2) = mu_sector_('coal','ind');
mu_n(n_coal,n_gen_coal) = mu_sector_('coal','ep');
mu_n(n_coal,n_com) = mu_sector_('coal','com');

* Natural Gas Distribution
mu_n(n_ngd,n_ag) = mu_sector_('gas','ind');
mu_n(n_ngd,n_cons) = mu_sector_('gas','ind');
mu_n(n_ngd,n_com) = mu_sector_('gas','com');
muc_n(n_ngd) = mu_sector_('gas','res');
mug_n(n_ngd) = mu_sector_('gas','com');

* Refned Products
mu_n(n_refine,n_ind2) = mu_sector_('ref','ind');
mu_n(n_refine,n_gen_gas) = mu_sector_('ref','ep');
mu_n(n_refine,n_com) = mu_sector_('ref','com');
mu_n(n_refine,n_trans) = mu_sector_('ref','trans');
muc_n(n_refine) = (seds_ex00('ref','res')/PCE00(n_refine)*(1+sum(margins,pce00_mr(n_refine,margins))))*mu_sector_('ref','res') + (1-(seds_ex00('ref','res')/pce00(n_refine)*(1+sum(margins,pce00_mr(n_refine,margins)))))*mu_sector_('ref','trans');
mug_n(n_refine) = mu_sector_('ref','trans');



esector0n('coal','res') = 0;
esector0n('coal','com') = sum(n_coal,sum(n_com,mu_n(n_coal,n_com)*io00(n_coal,n_com)*(1+sum(margins,io00_mr(n_coal,margins))))*1000);
esector0n('coal','ind') = sum(n_coal,sum(n_ind2,mu_n(n_coal,n_ind2)*io00(n_coal,n_ind2)*(1+sum(margins,io00_mr(n_coal,margins))))*1000);
esector0n('coal','trans') = 0;
esector0n('coal','ep') = sum(n_coal,sum(n_gen,mu_n(n_coal,n_gen)*io00(n_coal,n_gen)*(1+sum(margins,io00_mr(n_coal,margins))))*1000);

esector0n('gas','res') = sum(n_ngd,muc_n(n_ngd)*pce00(n_ngd)*(1+sum(margins,pce00_mr(n_ngd,margins)))*1000);
esector0n('gas','com') = sum(n_ngd,sum(n_com,mu_n(n_ngd,n_com)*io00(n_ngd,n_com)*(1+sum(margins,io00_mr(n_ngd,margins))))*1000 + mug_n(n_ngd)*(G_FED00(n_ngd)*(1+sum(margins,g_fed0_mr_(n_ngd,margins)))+G_REG00(n_ngd)*(1+sum(margins,g_reg0_mr_(n_ngd,margins))))*1000);
esector0n('gas','ind') = sum(n_gas,sum(n_ind2,mu_n(n_gas,n_ind2)*io00(n_gas,n_ind2)*(1+sum(margins,io00_mr(n_gas,margins))))*1000)
    + sum(n_ngd,sum(n_ind2,mu_n(n_ngd,n_ind2)*io00(n_ngd,n_ind2)*(1+sum(margins,io00_mr(n_ngd,margins))))*1000);
esector0n('gas','trans') = sum(n_gas,sum(n_trans,mu_n(n_gas,n_trans)*io00(n_gas,n_trans)*(1+sum(margins,io00_mr(n_gas,margins))))*1000);
esector0n('gas','ep') = sum(n_gas,sum(n_gen,mu_n(n_gas,n_gen)*io00(n_gas,n_gen)*(1+sum(margins,io00_mr(n_gas,margins))))*1000);

esector0n('ref','res') = (seds_ex00('ref','res')/sum(n_refine,pce00(n_refine)*(1+sum(margins,pce00_mr(n_refine,margins)))))*mu_sector_('ref','res')*sum(n_refine,pce00(n_refine)*(1+sum(margins,pce00_mr(n_refine,margins)))*1000);
esector0n('ref','com') = sum(n_refine,sum(n_com,mu_n(n_refine,n_com)*io00(n_refine,n_com)*(1+sum(margins,io00_mr(n_refine,margins))))*1000);
esector0n('ref','ind') = sum(n_refine,sum(n_ind2,mu_n(n_refine,n_ind2)*io00(n_refine,n_ind2)*(1+sum(margins,io00_mr(n_refine,margins))))*1000) ;
esector0n('ref','trans') = sum(n_refine,sum(n_trans,mu_n(n_refine,n_trans)*io00(n_refine,n_trans)*(1+sum(margins,io00_mr(n_refine,margins))))*1000) + (1-(seds_ex00('ref','res')/sum(n_refine,pce00(n_refine)*(1+sum(margins,pce00_mr(n_refine,margins))))))*mu_sector_('ref','trans')*sum(n_refine,pce00(n_refine)*(1+sum(margins,pce00_mr(n_refine,margins)))*1000) + sum(n_refine,mug_n(n_refine)*(G_FED00(n_refine)*(1+sum(margins,g_fed00_mr(n_refine,margins)))+G_REG00(n_refine)*(1+sum(margins,g_reg00_mr(n_refine,margins))))*1000) ;
esector0n('ref','ep') = sum(n_refine,sum(n_gen,mu_n(n_refine,n_gen)*io00(n_refine,n_gen)*(1+sum(margins,io00_mr(n_refine,margins))))*1000);

esector_db_n(fuel,sec) = esector00_(fuel,sec)*1000 - esector0n(fuel,sec);


display
esector0_
esector0n
esector_db_n
;



