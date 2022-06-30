* Define baseline natural resource stocks

parameter
NR0_(*)
NRP0_(*)
;

NR0_(in) = 0;
NRP0_(in) = 0;


NR0_(in_coal) = seds_prod00('coal') / 0.003537;
NRP0_(in_coal) = seds_prod00('coal') * 0.1;


NR0_(in_gas) = seds_prod00('gas') / 0.091484;
NRP0_(in_gas) = seds_prod00('gas') * 0.125;

NR0_(in_oil) = seds_prod00('crude') / 0.093454;
NRP0_(in_oil) = seds_prod00('crude') * 0.125;


NR0_(in_gen_nuc) = sum(in_td,IO0_(in_gen_nuc,in_td)) / 0.4;
NR0_(in_gen_hyd) = sum(in_td,IO0_(in_gen_hyd,in_td))/0.25;
NR0_(in_gen_oth) = sum(in_td,IO0_(in_gen_oth,in_td))/0.25;

NRP0_(in_gen)$(NR0_(in_gen) > 0) = NR0_(in_gen)*0.1;


