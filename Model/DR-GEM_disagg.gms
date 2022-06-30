$TITLE Disaggregation Module $

* ------------------------------------------------------------------------------
* Define production and input shares to split out uses and industry inputs
* ------------------------------------------------------------------------------

sets
og  Oil and gas commodities /c3a,c3b/,
mapog(og,c)        Mapping for oil and gas sectors
                        / c3a.c3, c3b.c3 /,

egen  generator commodities /c7a,c7b,c7c,c7d,c7e,c7f,c7g/,
mapgen(egen,c)        Mapping for generator sectors
                        / c7a.c7, c7b.c7, c7c.c7, c7d.c7, c7e.c7, c7f.c7, c7g.c7  /,

mv motor vehicle production /c31a,c31b,c31c/,
mapmv(mv,c)           Mapping for mvp sectors
                        /c31a.c31,c31b.c31,c31c.c31/

in(*)  All commodities
in_ne(*) Non energy Commodities
in_e(*) Energy Commodities
;

in(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = yes;
in(og) = yes;
in(egen) = yes;
in(mv) = yes;

in_ne(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = yes;
in_ne(og) = no;
in_ne(egen) = no;
in_ne(mv) = yes;
in_ne('c4') = no;
in_ne('c8') = no;
in_ne('c9') = no;
in_ne('c18') = no;
in_e(og) = yes;
in_e(egen) = yes;
in_e('c4') = yes;
in_e('c8') = yes;
in_e('c9') = yes;
in_e('c18') = yes;


alias(in,in2);

parameter
shr_og_prod
;

shr_og_prod('c3a') = 0.67;
shr_og_prod('c3b') = 0.33;

parameter
shr_gen_prod
shr_gen_om
;

shr_gen_prod('c7a') = 0.3317;
shr_gen_prod('c7b') = 0.3372;
shr_gen_prod('c7c') = 0.1955;
shr_gen_prod('c7d') = 0.0598;
shr_gen_prod('c7e') = 0.0061;
shr_gen_prod('c7f') = 0.0468;
shr_gen_prod('c7g') = 0.0228;

shr_gen_om('c7a') = 0.2657;
shr_gen_om('c7b') = 0.3008;
shr_gen_om('c7c') = 0.3057;
shr_gen_om('c7d') = 0.0451;
shr_gen_om('c7e') = 0.0100;
shr_gen_om('c7f') = 0.0401;
shr_gen_om('c7g') = 0.0326;

parameter
shr_mv_prod
;

shr_mv_prod('c31a') = 0.985*0.47;
shr_mv_prod('c31b') = 0.015*0.47;
shr_mv_prod('c31c') = 0.53;

* ------------------------------------------------------------------------------
* Define new model parameters with disaggregation
* ------------------------------------------------------------------------------

parameter
IO0_(*,*)
IO0_F_(*,*)
IO0_DN_(*,*)
L0_(*)
TOPI0_(*)


PCE0_DN_(*)
PCE0_F_(*)
PCE0_(*)

PFI0_DN_(*)
PFI0_F_(*)
PFI0_(*)

G_FED0_DN_
G_FED0_F_
G_FED0_

G_REG0_DN_
G_REG0_F_
G_REG0_

GY_FED0_
GY_REG0_

EX0_(*)

GOS0_(*)

;

* Non disaggregated set allocation

L0_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = L0__(c);
TOPI0_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = TOPI0__(c);
GOS0_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = GOS0__(c);
PCE0_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = PCE0__(c);
PCE0_DN_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = PCE0_DN__(c);
PCE0_F_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = PCE0_F__(c);
PFI0_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = PFI0__(c);
PFI0_DN_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = PFI0_DN__(c);
PFI0_F_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = PFI0_F__(c);
G_FED0_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = G_FED0__(c);
G_FED0_DN_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = G_FED0_DN__(c);
G_FED0_F_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = G_FED0_F__(c);
G_REG0_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = G_REG0__(c);
G_REG0_DN_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = G_REG0_DN__(c);
G_REG0_F_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31')) = G_REG0_F__(c);
GY_FED0_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31'))  = GY_FED0__(c);
GY_REG0_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31'))  = GY_REG0__(c);
EX0_(c)$(not sameas(c,'c3') and not sameas(c,'c7') and not sameas(c,'c31'))  = EX0__(c);
IO0_(cc,c)$(not sameas(c,'c3') and not sameas(cc,'c3') and not sameas(c,'c7') and not sameas(cc,'c7') and not sameas(c,'c31')  and not sameas(cc,'c31')) = IO0__(cc,c);
IO0_DN_(cc,c)$(not sameas(c,'c3') and not sameas(cc,'c3') and not sameas(c,'c7') and not sameas(cc,'c7') and not sameas(c,'c31')  and not sameas(cc,'c31')) = IO0_DN__(cc,c);
IO0_F_(cc,c)$(not sameas(c,'c3') and not sameas(cc,'c3') and not sameas(c,'c7') and not sameas(cc,'c7') and not sameas(c,'c31')  and not sameas(cc,'c31')) = IO0_F__(cc,c);


* Allocate oil&gas set to oil/gas sets using basic output share

L0_(og) = sum(mapog(og,c), shr_og_prod(og) * L0__(c));
TOPI0_(og) = sum(mapog(og,c), shr_og_prod(og) * TOPI0__(c));
GOS0_(og) = sum(mapog(og,c), shr_og_prod(og) * GOS0__(c));
PCE0_(og) = sum(mapog(og,c), shr_og_prod(og) * PCE0__(c));
PCE0_DN_(og) = sum(mapog(og,c), shr_og_prod(og) * PCE0_DN__(c));
PCE0_F_(og) = sum(mapog(og,c), shr_og_prod(og) * PCE0_F__(c));
PFI0_(og) = sum(mapog(og,c), shr_og_prod(og) * PFI0__(c));
PFI0_DN_(og) = sum(mapog(og,c), shr_og_prod(og) * PFI0_DN__(c));
PFI0_F_(og) = sum(mapog(og,c), shr_og_prod(og) * PFI0_F__(c));
G_FED0_(og) = sum(mapog(og,c), shr_og_prod(og) * G_FED0__(c));
G_FED0_DN_(og) = sum(mapog(og,c), shr_og_prod(og) * G_FED0_DN__(c));
G_FED0_F_(og) = sum(mapog(og,c), shr_og_prod(og) * G_FED0_F__(c));
G_REG0_(og) = sum(mapog(og,c), shr_og_prod(og) * G_REG0__(c));
G_REG0_DN_(og) = sum(mapog(og,c), shr_og_prod(og) * G_REG0_DN__(c));
G_REG0_F_(og) = sum(mapog(og,c), shr_og_prod(og) * G_REG0_F__(c));
GY_FED0_(og) = sum(mapog(og,c), shr_og_prod(og) * GY_FED0__(c));
GY_REG0_(og) = sum(mapog(og,c), shr_og_prod(og) * GY_REG0__(c));
EX0_(og) = sum(mapog(og,c), shr_og_prod(og) * EX0__(c));
IO0_(og,cc)$(not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapog(og,c), shr_og_prod(og) * IO0__(c,cc));
IO0_(cc,og)$(not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapog(og,c), shr_og_prod(og) * IO0__(cc,c));
IO0_(og,og) = sum(mapog(og,c), shr_og_prod(og) * IO0__(c,c));
IO0_DN_(og,cc)$(not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapog(og,c), shr_og_prod(og) * IO0_DN__(c,cc));
IO0_DN_(cc,og)$(not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapog(og,c), shr_og_prod(og) * IO0_DN__(cc,c));
IO0_DN_(og,og) = sum(mapog(og,c), shr_og_prod(og) * IO0_DN__(c,c));
IO0_F_(og,cc)$(not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapog(og,c), shr_og_prod(og) * IO0_F__(c,cc));
IO0_F_(cc,og)$(not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapog(og,c), shr_og_prod(og) * IO0_F__(cc,c));
IO0_F_(og,og) = sum(mapog(og,c), shr_og_prod(og) * IO0_F__(c,c));

IO0_('c3b',cc)$(not sameas(cc,'c7')) = IO0_('c3a',cc)+IO0_('c3b',cc);
IO0_('c3b','c18') = 0;
IO0_DN_('c3b',cc)$(not sameas(cc,'c3') and not sameas(cc,'c7')) = 0.9*IO0_('c3b',cc);
IO0_DN_('c3b','c18') = 0;
IO0_F_('c3b',cc)$(not sameas(cc,'c3') and not sameas(cc,'c7')) = 0.1*IO0_('c3b',cc);
IO0_F_('c3b','c18') = 0;

IO0_('c3a',cc)$(not sameas(cc,'c7')) = 0;
IO0_('c3a','c18') = IO0__('c3','c18');
IO0_DN_('c3a',cc) = 0;
IO0_DN_('c3a','c18') = 0.53*IO0_('c3a','c18');
IO0_F_('c3a',cc) = 0;
IO0_F_('c3a','c18') = 0.47*IO0_('c3a','c18');

IO0_(egen,og) = 0;
IO0_DN_(egen,og) = 0;
IO0_F_(egen,og) = 0;


EX0_('c3a') = 0.35*EX0__('c3');
EX0_('c3b') = 0.65*EX0__('c3');

* Allocate generation set to generator sets using output and input shares

L0_(egen) = sum(mapgen(egen,c), shr_gen_om(egen) * L0__(c));

L0_('c7a') = L0_('c7a') - .003;
L0_('c7c') = L0_('c7c') + .003;

TOPI0_(egen) = sum(mapgen(egen,c), shr_gen_om(egen) * TOPI0__(c));
GOS0_(egen) = sum(mapgen(egen,c), shr_gen_om(egen) * GOS0__(c));

IO0_(cc,egen)$(not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapgen(egen,c), shr_gen_om(egen) * IO0__(cc,c));
IO0_DN_(cc,egen)$(not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapgen(egen,c), shr_gen_om(egen) * IO0_DN__(cc,c));
IO0_F_(cc,egen)$(not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapgen(egen,c), shr_gen_om(egen) * IO0_F__(cc,c));


IO0_(in_e,egen) = 0;
IO0_DN_(in_e,egen) = 0;
IO0_F_(in_e,egen) = 0;

IO0_('c5',egen) = 0;
IO0_DN_('c5',egen) = 0;
IO0_F_('c5',egen) = 0;

IO0_('c4','c7a') = IO0__('c4','c7');
IO0_DN_('c4','c7a') = IO0_DN__('c4','c7');
IO0_F_('c4','c7a') = IO0_F__('c4','c7');

IO0_('c3b','c7b') = IO0__('c3','c7');
IO0_DN_('c3b','c7b') = 0.9*IO0__('c3','c7');
IO0_F_('c3b','c7b') =0.1*IO0__('c3','c7');

IO0_('c5','c7c') = IO0__('c5','c7');
IO0_DN_('c5','c7c') = IO0_DN_('c5','c7');
IO0_F_('c5','c7c') =IO0_F__('c5','c7');

IO0_('c18',egen) = sum(mapgen(egen,c), shr_gen_om(egen) * IO0__('c18',c));
IO0_DN_('c18',egen) = sum(mapgen(egen,c), shr_gen_om(egen) * IO0_DN__('c18',c));
IO0_F_('c18',egen) = sum(mapgen(egen,c), shr_gen_om(egen) * IO0_F__('c18',c));


IO0_(egen,in) = 0;
IO0_(egen,'c8') = sum(mapgen(egen,c), shr_gen_prod(egen) * IO0__(c,'c8'));
IO0_DN_(egen,'c8') = sum(mapgen(egen,c), shr_gen_prod(egen) * IO0_DN__(c,'c8'));
IO0_F_(egen,'c8') = sum(mapgen(egen,c), shr_gen_prod(egen) * IO0_F__(c,'c8'));



* Allocate mvp set to mvp sets using output shares

L0_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * L0__(c));
TOPI0_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * TOPI0__(c));
GOS0_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * GOS0__(c));
PCE0_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * PCE0__(c));
PCE0_DN_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * PCE0_DN__(c));
PCE0_F_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * PCE0_F__(c));
PFI0_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * PFI0__(c));
PFI0_DN_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * PFI0_DN__(c));
PFI0_F_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * PFI0_F__(c));
G_FED0_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * G_FED0__(c));
G_FED0_DN_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * G_FED0_DN__(c));
G_FED0_F_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * G_FED0_F__(c));
G_REG0_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * G_REG0__(c));
G_REG0_DN_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * G_REG0_DN__(c));
G_REG0_F_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * G_REG0_F__(c));
GY_FED0_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * GY_FED0__(c));
GY_REG0_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * GY_REG0__(c));
EX0_(mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * EX0__(c));
IO0_(mv,cc)$(not sameas(cc,'c31') and not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapmv(mv,c), shr_mv_prod(mv) * IO0__(c,cc));
IO0_(cc,mv)$(not sameas(cc,'c31') and not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapmv(mv,c), shr_mv_prod(mv) * IO0__(cc,c));
IO0_(mv,mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * IO0__(c,c));
IO0_DN_(mv,cc)$(not sameas(cc,'c31') and not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapmv(mv,c), shr_mv_prod(mv) * IO0_DN__(c,cc));
IO0_DN_(cc,mv)$(not sameas(cc,'c31') and not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapmv(mv,c), shr_mv_prod(mv) * IO0_DN__(cc,c));
IO0_DN_(mv,mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * IO0_DN__(c,c));
IO0_F_(mv,cc)$(not sameas(cc,'c31') and not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapmv(mv,c), shr_mv_prod(mv) * IO0_F__(c,cc));
IO0_F_(cc,mv)$(not sameas(cc,'c31') and not sameas(cc,'c3') and not sameas(cc,'c7')) = sum(mapmv(mv,c), shr_mv_prod(mv) * IO0_F__(cc,c));
IO0_F_(mv,mv) = sum(mapmv(mv,c), shr_mv_prod(mv) * IO0_F__(c,c));

display
IO0_
L0_
TOPI0_
;


















