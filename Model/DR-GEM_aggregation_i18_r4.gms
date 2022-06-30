$TITLE Aggregation Module -- State Version $

* ------------------------------------------------------------------------------
* Regional Aggregation
* ------------------------------------------------------------------------------

* R1 = Northeast
* R2 = South
* R3 = Midwest
* R4 = West

* ER1 = Eastern Interconnect + ERCOT
* ER2 = Western Interconnect


sets
r /r1*r4/
er /er1*er2/
er_east(er) /er1/
er_west(er) /er2/
;

parameters
tau_p0
tau_l0
tau_lr0
tau_k0
tau_kr0
tau_y0
;

tau_p0 = tau_p00;
tau_l0 = tau_l00;
tau_lr0(r) = tau_lr00;
tau_k0 = tau_k00;
tau_kr0(r) = tau_kr00;

alias(r,rr)
alias(r,rr,rrr)


Set mapregion(s,r)    /
s1	.	r2
s2	.	r4
s3	.	r4
s4	.	r2
s5	.	r4
s6	.	r4
s7	.	r1
s8	.	r2
s9	.	r2
s10	.	r2
s11	.	r2
s12	.	r4
s13	.	r4
s14	.	r3
s15	.	r3
s16	.	r3
s17	.	r3
s18	.	r2
s19	.	r2
s20	.	r1
s21	.	r2
s22	.	r1
s23	.	r3
s24	.	r3
s25	.	r2
s26	.	r3
s27	.	r4
s28	.	r3
s29	.	r4
s30	.	r1
s31	.	r1
s32	.	r4
s33	.	r1
s34	.	r2
s35	.	r3
s36	.	r3
s37	.	r2
s38	.	r4
s39	.	r1
s40	.	r1
s41	.	r2
s42	.	r3
s43	.	r2
s44	.	r2
s45	.	r4
s46	.	r1
s47	.	r2
s48	.	r4
s49	.	r2
s50	.	r3
s51	.	r4
/;

set maper(r,er)
/r1.er1,r2.er1,r3.er1,r4.er2/
;



* ------------------------------------------------------------------------------
* Industrial Aggregation
* ------------------------------------------------------------------------------

sets
i /i1*i22/
;


Set mapin(*,i)    /
n14	.	i14
n15	.	i14
n1	.	i1
n2	.	i2
n3	.	i3
n16	.	i16
n17	.	i16
n4	.	i4
n5	.	i4
n6 	.	i6
n7 	.	i6
n8  	.	i8
n9 	.	i8
n10 	.	i6
n11 	.	i11
n12	.	i12
n18	.	i22
n19	.	i15
n20	.	i17
n21	.	i17
n22	.	i17
n23	.	i17
n24	.	i19
n25	.	i17
n13	.	i13
n26 	.	i17
n27 	.	i19
n28 	.	i17
n29 	.	i19
n30        	.	i19
n31       	.	i19
n32      	.	i19
n33       	.	i19
n34      	.	i18
n35       	.	i18
n36      	.	i18
n37        	.	i18
n38       	.	i18
n39       	.	i18
n40        	.	i18
n41        	.	i18
n42        	.	i18
n43     	.	i18
n44        	.	i20
n45        	.	i20
n46      	.	i21
n47      	.	i22
n48        	.	i22
n49        	.	i22
n50    	.	i22
n51        	.	i22
n52       	.	i22
n53     	.	i22
n54       	.	i22
n55       	.	i22
n56       	.	i22
n57       	.	i22
n58       	.	i22
n59    	.	i22
n60      	.	i22
/;

alias(i,ii);
alias(i,iii);

* ------------------------------------------------------------------------------
* Define industry subsets
* ------------------------------------------------------------------------------

set
i_oil(i) /i1/
i_gas(i) /i2/
i_coal(i) /i3/
i_gen_ff(i) /i4/
i_gen_oth(i) /i6/
i_gen_ren(i) /i8/
i_td(i) /i11/
i_ngd(i) /i12/
i_refine(i) /i13/
i_ag(i) /i14/
i_constr(i) /i15/
i_othmine(i) /i16/
i_ind_nd(i) /i17/
i_ind_d(i) /i18/
i_ind_h(i) /i19/
i_trade(i) /i20/
i_trans(i) /i21/
i_com(i) /i22/



i_ff(i) /i1,i2,i3/
i_nf(i) /i4,i6,i8,i11*i22/
i_cf(i) /i3,i12,i13/
i_if(i) /i2,i3,i13/
i_tf(i) /i2,i13/
i_gen(i) /i4,i6,i8/
i_elec(i) /i4,i6,i8,i11/
i_mine(i) /i1*i3,i16/
i_ind(i)  /i17*i19/
i_ind2(i) /i1,i2,i3,i12,i13,i14,i15,i16,i17*i19/
i_ind3(i) /i1,i2,i3,i13*i19/
i_com2(i) /i20,i22/

*i_gen_gas(i) /i5/

*i_ng(i) /i1*i3,i11*i19/
*i_ntd(i) /i1*i4,i6,i8,i12*i19/
i_nt(i)

;

sets
ie(*)
im(*)
is(*)
iadj(*)
iadj(*)
ie1(*)
ie2(*)
;

ie(i_ff) = yes;
ie(i_elec) = yes;
ie(i_ngd) = yes;
ie(i_refine) = yes;

ie1(i_td) = yes;



ie2(ie) = yes;
ie2(i_td) = no;


im(i_ag) = yes;
im(i_constr) = yes;
im(i_othmine) = yes;
im(i_ind) = yes;
im(i_com) = yes;
im(i_trans) = yes;
im(i_trade) = yes;

is(i_com) = yes;
is(i_trans) = yes;
is(i_trade) = yes;

iadj(im) = yes;
i_nt(i) = yes;
i_nt(i_elec) = no;



alias(ie,iee)
alias(im,imm)
alias(i_refine,i_refine2)
alias(i_gen,i_gen2)

scalar
ne
nm
ns
;

ne = 9;
nm = 9;
ns = 3;

sets
c_cons(c) /c1*c2,c5,c8*c10,c12*c23,c25*c31,c33*c49,c51*c58 /
i_cons(i)
i_pfi(i) /i14,i15,i16,i17,i18,i19/
i_gfed(i) /i11,i12,i13,i14,i15,i16,i17,i18,i19/
i_greg(i) /i11,i12,i13,i14,i15,i16,i17,i18,i19/
i_ex(i) /i1*i3,i11*i19/
;

i_cons(i_td) = yes;
i_cons(i_ngd)= yes;
i_cons(i_refine) = yes;
i_cons(i_ag) = yes;
i_cons(i_othmine) = yes;
i_cons(i_ind) = yes;
i_cons(i_trade) = yes;
i_cons(i_trans) = yes;
i_cons(i_com) = yes;


sets
map_mr(i,margins)  / i21.transport,i20.wholesale,i20.retail/
;



* ------------------------------------------------------------------------------
* Define new aggregated model parameters
* ------------------------------------------------------------------------------

parameter
G0(*,*)
G0_D(*,*)
G0_F(*,*)
G0_DN(*,*)
G0_DR(*,*)

Y0(*,*)
IO0(*,*,*)
L0(*,*)
TOPI0(*,*)
GOS0(*,*)

PCE0(*,*)
PFI0(*,*)
G_FED0(*,*)
G_REG0(*,*)

GY_FED0(*,*)
GY_REG0(*,*)

MY0(*,*)

EXD0(*,*)
EX0(*,*)
EXD0_ER(*)

NR0(*,*)
NRP0(*,*)

GTRANS_FED0(*)
GTRANS_REG0(*)
GGRANT0(*)

LG_FED0(*)
LG_REG0(*)

hhtot(*)
hhtot_share(*)
seds_q0
seds_ex0
seds_p0
esector00(*,*,*)
seds_ex_db
esector00_db

y_share(*,*)

pce0_m
pce0_tot
pce0_mr
pce0_mtot
pfi0_m
pfi0_tot
pfi0_mr
pfi0_mtot
g_fed0_m
g_fed0_tot
g_fed0_mr
g_fed0_mtot
g_reg0_m
g_reg0_tot
g_reg0_mr
g_reg0_mtot
io0_m
io0_tot
io0_mr
io0_mtot
dm0

my0_db

;

* ------------------------------------------------------------------------------
* Aggregate basic model inputs
* ------------------------------------------------------------------------------

Y0(i,r) = sum(s,mapregion(s,r) * sum(n, mapin(n,i) * Y0s(n,s)));
IO0(i,ii,r) = sum(s,mapregion(s,r) * sum(n,sum(nn, mapin(nn,ii) * IO0s(n,nn,s)) * mapin(n,i)));
L0(i,r) = sum(s,mapregion(s,r) * sum(n, mapin(n,i) * L0s(n,s)));
TOPI0(i,r) = sum(s,mapregion(s,r) * sum(n, mapin(n,i) * TOPI0s(n,s)));
GOS0(i,r) = sum(s,mapregion(s,r) * sum(n, mapin(n,i) * GOS0s(n,s)));
PCE0(i,r) = sum(s,mapregion(s,r) * sum(n, mapin(n,i) * PCE0s(n,s)));
PFI0(i,r) = sum(s,mapregion(s,r) * sum(n, mapin(n,i) * PFI0s(n,s)));
G_FED0(i,r) = sum(s,mapregion(s,r) * sum(n, mapin(n,i) * G_FED0s(n,s)));
G_REG0(i,r) = sum(s,mapregion(s,r) * sum(n, mapin(n,i) * G_REG0s(n,s)));
GY_FED0(i,r) = sum(s,mapregion(s,r) * sum(n, mapin(n,i) * GY_FED0s(n,s)));
GY_REG0(i,r) = sum(s,mapregion(s,r) * sum(n, mapin(n,i) * GY_REG0s(n,s)));
G0(i,r) = sum(s,mapregion(s,r) * sum(n,mapin(n,i) * G0s(n,s)));
G0_F(i,r) = sum(s,mapregion(s,r) * sum(n,mapin(n,i) * G0s_f(n,s)));
G0_D(i,r) = sum(s,mapregion(s,r) * sum(n,mapin(n,i) * G0s_d(n,s)));
G0_DN(i,r) = sum(s,mapregion(s,r) * sum(n,mapin(n,i) * G0s_DN(n,s)));
G0_DR(i,r) = sum(s,mapregion(s,r) * sum(n,mapin(n,i) * G0s_DR(n,s)));
MY0(i,r) = sum(s,mapregion(s,r) * sum(n,mapin(n,i) * MY0s(n,s)));
EXD0(i,r) = sum(s,mapregion(s,r) * sum(n, mapin(n,i) * EXD0s(n,s)));
EX0(i,r) = sum(s,mapregion(s,r) * sum(n, mapin(n,i) * EX0s(n,s)));
NR0(i,r) = sum(s,mapregion(s,r) * sum(n, mapin(n,i) * NR0s(n,s)));
NRP0(i,r) = sum(s,mapregion(s,r) * sum(n, mapin(n,i) * NRP0s(n,s)));







GTRANS_FED0(r) = sum(s,mapregion(s,r) * GTRANS_FED0s(s));
GTRANS_REG0(r) = sum(s,mapregion(s,r) * GTRANS_REG0s(s));
GGRANT0(r) = sum(s,mapregion(s,r) * GGRANT0s(s));

LG_FED0(r) = sum(s,mapregion(s,r) * LG_FED0s(s));
LG_REG0(r) = sum(s,mapregion(s,r) * LG_REG0s(s));


hhtot_share(r) = sum(s,mapregion(s,r) * hhtot_(s));
hhtot(r) = sum(s,mapregion(s,r) * hhtot_(s))*132;

seds_q0(fuel,sec,r) = sum(s,mapregion(s,r) * seds_q(fuel,sec,s));
seds_ex0(fuel,sec,r) = sum(s,mapregion(s,r) * seds_ex(fuel,sec,s));
seds_p0(fuel,sec,r)$(seds_q0(fuel,sec,r) gt 0) = seds_ex0(fuel,sec,r)/seds_q0(fuel,sec,r);
esector00(fuel,sec,r) = sum(s,mapregion(s,r) * esector00s(fuel,sec,s));


seds_ex_db(fuel,sec,r) = seds_ex0(fuel,sec,r) - seds_q0(fuel,sec,r)*seds_p00(fuel,sec);
esector00_db(fuel,sec,r) = esector00(fuel,sec,r) - seds_ex0(fuel,sec,r)*mu_sector_(fuel,sec);


display
Y0
Y0s
GOS0
GOS0s
seds_ex_db
esector00_db
hhtot_share
hhtot
;


qparb(i,r) = qparb0;
qparb(i_gen,r) = qparb0/3;

* ------------------------------------------------------------------------------
* Aggregate t/d domestic exports/imports  (manually for now)
* ------------------------------------------------------------------------------



parameter
tbal_td_er

;



exd0(i_td,r) = exd0(i_td,r) - g0_dn(i_td,r);
g0_dn(i_td,r)$(exd0(i_td,r) < 0) = -1*exd0(i_td,r);

exd0(i_td,r)$(exd0(i_td,r) < 0) = 0;
g0_dn(i_td,r)$(exd0(i_td,r) > 0) = 0;



G0_DR(i_td,r) = G0_D(i_td,r) - G0_DN(i_td,r);

tbal_td_er(er) = sum(r,maper(r,er)*sum(i_td,g0_dn(i_td,r))) - sum(r,maper(r,er)*sum(i_td,exd0(i_td,r)));

display
G0_D
G0_DR
G0_DN
exd0
tbal_td_er
;





* ------------------------------------------------------------------------------
*Aggregate margin demands and update margin requirments
* ------------------------------------------------------------------------------


pce0_m(i,margins,r) = sum(s, mapregion(s,r) * sum(n, mapin(n,i) * pce00_mr(n,margins)*pce0s(n,s)));
pce0_mr(i,margins,r)$(pce0(i,r) gt 0) = pce0_m(i,margins,r)/pce0(i,r);
pce0_mtot(i,margins,r) = pce0_mr(i,margins,r)*pce0(i,r);

pfi0_m(i,margins,r) = sum(s, mapregion(s,r) * sum(n, mapin(n,i) * pfi00_mr(n,margins)*pfi0s(n,s)));
pfi0_mr(i,margins,r)$(pfi0(i,r) gt 0) = pfi0_m(i,margins,r)/pfi0(i,r);
pfi0_mtot(i,margins,r) = pfi0_mr(i,margins,r)*pfi0(i,r);

g_fed0_m(i,margins,r) = sum(s, mapregion(s,r) * sum(n, mapin(n,i) * g_fed00_mr(n,margins)*g_fed0s(n,s)));
g_fed0_mr(i,margins,r)$(g_fed0(i,r) gt 0) = g_fed0_m(i,margins,r)/g_fed0(i,r);
g_fed0_mtot(i,margins,r) = g_fed0_mr(i,margins,r)*g_fed0(i,r);

g_reg0_m(i,margins,r) = sum(s, mapregion(s,r) * sum(n, mapin(n,i) * g_reg00_mr(n,margins)*g_reg0s(n,s)));
g_reg0_mr(i,margins,r)$(g_reg0(i,r) gt 0) = g_reg0_m(i,margins,r)/g_reg0(i,r);
g_reg0_mtot(i,margins,r) = g_reg0_mr(i,margins,r)*g_reg0(i,r);

io0_m(i,ii,margins,r) = sum(s, mapregion(s,r) * sum(n, mapin(n,i) * io00_mr(n,margins)* sum(nn, mapin(nn,ii) * IO0s(n,nn,s))));
io0_mr(i,ii,margins,r)$(IO0(i,ii,r) gt 0) = io0_m(i,ii,margins,r)/IO0(i,ii,r);
io0_mtot(i,ii,margins,r) = io0_mr(i,ii,margins,r)*io0(i,ii,r);


dm0(margins,r) = sum(i,pce0_mr(i,margins,r)*pce0(i,r) + pfi0_mr(i,margins,r)*pfi0(i,r)
+g_fed0_mr(i,margins,r)*g_fed0(i,r) + g_reg0_mr(i,margins,r)*g_reg0(i,r) + sum(ii,io0_mr(i,ii,margins,r)*IO0(i,ii,r)));

my0_db = sum(r,sum(margins,dm0(margins,r))) - sum(i,sum(r,my0(i,r)));

display
my0_db
pce0_mr
pfi0_mr
g_fed0_mr
g_reg0_mr
io0_mr
;

* ------------------------------------------------------------------------------
* Rebalance GOS and K (if necessary)
* ------------------------------------------------------------------------------

parameter
IOM0 "Intermediate input margin expenditures"

Y0_db
GOS0_db

delta
deltat
KS0
K0
DD0
LAMBDAK0
RENT0

ks0_db
ibar0_db
;


IOM0(ii,i,r) = sum(margins,io0_mr(ii,i,margins,r)*IO0(ii,i,r));
tau_y0(i,r)$(y0(i,r) gt 0) = TOPI0(i,r)/Y0(i,r);
tau_y0(i,r)$(y0(i,r) = 0) = 0;

Y0_db(i,r) = G0_DR(i,r) + MY0(i,r) + EX0(i,r) + EXD0(i,r)  - GY_REG0(i,r) - GY_FED0(i,r) - Y0(i,r);
GOS0_db(i,r) = Y0(i,r) - TOPI0(i,r) - L0(i,r)*(1+tau_p0) - sum(ii,IO0(ii,i,r)) - sum(ii,IOM0(ii,i,r)) - NRP0(i,r) - GOS0(i,r);

display
Y0_db
GOS0_db
;

Y0(i,r) = G0_DR(i,r) + MY0(i,r) + EX0(i,r) + EXD0(i,r) - GY_REG0(i,r) - GY_FED0(i,r);
GOS0(i,r) = Y0(i,r) - TOPI0(i,r) - L0(i,r)*(1+tau_p0) - sum(ii,IO0(ii,i,r)) - sum(ii,IOM0(ii,i,r)) - NRP0(i,r);


delta = delta00;
deltat = delta;
DD0(r) = ((tau_k0+tau_kr0(r)))*deltat/(deltat+RBAR0);
LAMBDAK0(i,r) = (1-DD0(r));
K0(i,r) = (1-tau_k0-tau_kr0(r))*GOS0(i,r)/(rbar0 + (1-tau_k0-tau_kr0(r))*delta);
rent0(i,r)$(k0(i,r) gt 0) = (gos0(i,r)/k0(i,r))*(1/lambdak0(i,r));

ks0_db(i) = sum(r,k0(i,r))- sum(n,mapin(n,i)*K00(n));
ibar0_db(r) = sum(i,PFI0(i,r)*(1+sum(margins,pfi0_mr(i,margins,r)))) - sum(i,delta*k0(i,r));

display
ks0_db
ibar0_db
K0
pfi0
pfi0_mr
;


pfi0(i,r) = sum(rr,pfi0(i,rr))*sum(ii,k0(ii,r))/sum(ii,sum(rr,k0(ii,rr)));
pfi0_mr(i,margins,r)$(pfi0(i,r) gt 0) = pfi0_m(i,margins,r)/pfi0(i,r);

ibar0_db(r) = sum(i,PFI0(i,r)*(1+sum(margins,pfi0_mr(i,margins,r)))) - sum(i,delta*k0(i,r));

dm0(margins,r) = sum(i,pce0_mr(i,margins,r)*pce0(i,r) + pfi0_mr(i,margins,r)*pfi0(i,r)
+g_fed0_mr(i,margins,r)*g_fed0(i,r) + g_reg0_mr(i,margins,r)*g_reg0(i,r) + sum(ii,io0_mr(i,ii,margins,r)*IO0(i,ii,r)));

display
ibar0_db
pfi0
pfi0_mr
;


* ------------------------------------------------------------------------------
* Define consumption good sets and subsets
* ------------------------------------------------------------------------------

sets
j /j1,j2,j10,j11,j14,j16,j17,j18,j25/
;
alias(j,jj)

sets

cj /cj1*cj2/
cj_trans(cj) /cj1/
cj_nontrans(cj) /cj2/

cjt /cjt1*cjt4/
cjt_vmt(cjt) /cjt1/
cjt_ot(cjt) /cjt2/
cjt_gs(cjt) /cjt3/
cjt_house(cjt) /cjt4/


cju /cju1*cju6/
cju_mve(cju) /cju1/
cju_mvf(cju) /cju2/
cju_vmt(cju) /cju1,cju2/
cju_ot(cju) /cju3/
cju_gs(cju) /cju4/
cju_ooh(cju) /cju5/
cju_energy(cju) /cju6/
cju_house(cju) /cju5,cju6/

cjv / cjv1*cjv8/
cjv_mve(cjv) /cjv1/
cjv_mvfuels(cjv) /cjv2/
cjv_mvelec(cjv) /cjv8/
cjv_mven(cjv) /cjv2,cjv8/
cjv_ot(cjv) /cjv3/
cjv_gs(cjv) / cjv4/
cjv_ooh(cjv) /cjv5/
cjv_elec(cjv) /cjv6/
cjv_fuels(cjv) /cjv7/
cjv_energy(cjv) /cjv6,cjv7/

j_mve(j) /j1/
j_mvf(j) /j10/
j_mvelec(j) /j25/
j_ot(j) /j18/
j_gs(j) /j2/
j_ooh(j) /j14/
j_elec(j) /j16/
j_ngd(j) /j17/
j_fueloil(j) /j11/
j_fuels(j) /j17,j11/


cmap(cjt,cj)
/cjt1.cj1,cjt2.cj1,
cjt3.cj2,cjt4.cj2 /
cmapt(cju,cjt)
/cju1.cjt1,
cju2.cjt1,
cju3.cjt2,
cju4.cjt3,
cju5.cjt4,
cju6.cjt4/
cmapu(cjv,cju)
/cjv1.cju1,
cjv2.cju2,
cjv8.cju2,
cjv3.cju3,
cjv4.cju4,
cjv5.cju5,
cjv6.cju6,
cjv7.cju6/
cmapv(j,cjv)
/j1.cjv1,
j10.cjv2,
j25.cjv8,

j18.cjv3,

j2.cjv4,

j14.cjv5,

j16.cjv6,
j17.cjv7,
j11.cjv7
/
;


* ------------------------------------------------------------------------------
* Import/define appropriate bridge between producer and consumer goods "gmax"
* ------------------------------------------------------------------------------

parameter
gmax00(i,j)
;

*$CALL GDXXRW.EXE gmax_i22_j9.xlsx par=gmax00 rng=A1:J12 rdim = 1 cdim=1


$GDXIN gmax_i22_j9.gdx
$onUNDF
$LOAD gmax00
$GDXIN

