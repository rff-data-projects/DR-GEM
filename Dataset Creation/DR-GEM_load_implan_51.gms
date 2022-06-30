$TITLE Implan Social Accounting Matrix -- 51 states$





* ------------------------------------------------------------------------------
* Define full SAM data files
* ------------------------------------------------------------------------------

parameter
SAM_FULL_S(RS_All0,RS_All0a,s)
FEXPORT_FULL_S(RS_All0,RS_All0a,s)
FIMPORT_FULL_S(RS_All0,RS_All0a,s)
DEXPORT_FULL_S(RS_All0,RS_All0a,s)
DIMPORT_FULL_S(RS_All0,RS_All0a,s)
;


* ------------------------------------------------------------------------------
* Import All Data and Export SAM data
* ------------------------------------------------------------------------------

* Alabama

PARAMETER SAM_AL0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_AL.dat
$INCLUDE 3x1_AL.dat
$INCLUDE 5x1_AL.dat
$INCLUDE 1x2_AL.dat
$INCLUDE 4x2_AL.dat
$INCLUDE 4x3_AL.dat
$INCLUDE 5x3_AL.dat
$INCLUDE 2x4_AL.dat
$INCLUDE 4x4_AL.dat
$INCLUDE 5x4_AL.dat
$INCLUDE 1x5_AL.dat
$INCLUDE 4x5_AL.dat
$INCLUDE 5x5_AL.dat
$INCLUDE 1x6_AL.dat
$INCLUDE 4x6_AL.dat
$INCLUDE 6x1_AL.dat
$INCLUDE 6x3_AL.dat
$INCLUDE 6x4_AL.dat
/;


PARAMETER FEXPORT_AL0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_AL.dat
$INCLUDE 4x7_AL.dat
/;

PARAMETER FIMPORT_AL0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_AL.dat
$INCLUDE 7x4_AL.dat
/;

PARAMETER DEXPORT_AL0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_AL.dat
$INCLUDE 4x8_AL.dat
/;

PARAMETER DIMPORT_AL0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_AL.dat
$INCLUDE 8x4_AL.dat
/;


PARAMETER
SAM_AL1(RS_All0,RS_All0a)
FEXPORT_AL1(RS_All0,RS_All0a)
FIMPORT_AL1(RS_All0,RS_All0a)
DEXPORT_AL1(RS_All0,RS_All0a)
DIMPORT_AL1(RS_All0,RS_All0a)

;

SAM_AL1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_AL0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_AL1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_AL0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_AL1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_AL0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_AL1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_AL0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_AL1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_AL0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_AL1.gdx" SAM_AL1;
execute_unload "FEXPORT_AL1.gdx" FEXPORT_AL1;
execute_unload "FIMPORT_AL1.gdx" FIMPORT_AL1;
execute_unload "DEXPORT_AL1.gdx" DEXPORT_AL1;
execute_unload "DIMPORT_AL1.gdx" DIMPORT_AL1;

* Alaska

PARAMETER SAM_AK0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_AK.dat
$INCLUDE 3x1_AK.dat
$INCLUDE 5x1_AK.dat
$INCLUDE 1x2_AK.dat
$INCLUDE 4x2_AK.dat
$INCLUDE 4x3_AK.dat
$INCLUDE 5x3_AK.dat
$INCLUDE 2x4_AK.dat
$INCLUDE 4x4_AK.dat
$INCLUDE 5x4_AK.dat
$INCLUDE 1x5_AK.dat
$INCLUDE 4x5_AK.dat
$INCLUDE 5x5_AK.dat
$INCLUDE 1x6_AK.dat
$INCLUDE 4x6_AK.dat
$INCLUDE 6x1_AK.dat
$INCLUDE 6x3_AK.dat
$INCLUDE 6x4_AK.dat
/;


PARAMETER FEXPORT_AK0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_AK.dat
$INCLUDE 4x7_AK.dat
/;

PARAMETER FIMPORT_AK0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_AK.dat
$INCLUDE 7x4_AK.dat
/;

PARAMETER DEXPORT_AK0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_AK.dat
$INCLUDE 4x8_AK.dat
/;

PARAMETER DIMPORT_AK0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_AK.dat
$INCLUDE 8x4_AK.dat
/;


PARAMETER
SAM_AK1(RS_All0,RS_All0a)
FEXPORT_AK1(RS_All0,RS_All0a)
FIMPORT_AK1(RS_All0,RS_All0a)
DEXPORT_AK1(RS_All0,RS_All0a)
DIMPORT_AK1(RS_All0,RS_All0a)

;

SAM_AK1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_AK0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_AK1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_AK0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_AK1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_AK0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_AK1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_AK0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_AK1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_AK0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_AK1.gdx" SAM_AK1;
execute_unload "FEXPORT_AK1.gdx" FEXPORT_AK1;
execute_unload "FIMPORT_AK1.gdx" FIMPORT_AK1;
execute_unload "DEXPORT_AK1.gdx" DEXPORT_AK1;
execute_unload "DIMPORT_AK1.gdx" DIMPORT_AK1;

* Arkansas

PARAMETER SAM_AR0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_AR.dat
$INCLUDE 3x1_AR.dat
$INCLUDE 5x1_AR.dat
$INCLUDE 1x2_AR.dat
$INCLUDE 4x2_AR.dat
$INCLUDE 4x3_AR.dat
$INCLUDE 5x3_AR.dat
$INCLUDE 2x4_AR.dat
$INCLUDE 4x4_AR.dat
$INCLUDE 5x4_AR.dat
$INCLUDE 1x5_AR.dat
$INCLUDE 4x5_AR.dat
$INCLUDE 5x5_AR.dat
$INCLUDE 1x6_AR.dat
$INCLUDE 4x6_AR.dat
$INCLUDE 6x1_AR.dat
$INCLUDE 6x3_AR.dat
$INCLUDE 6x4_AR.dat
/;


PARAMETER FEXPORT_AR0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_AR.dat
$INCLUDE 4x7_AR.dat
/;

PARAMETER FIMPORT_AR0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_AR.dat
$INCLUDE 7x4_AR.dat
/;

PARAMETER DEXPORT_AR0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_AR.dat
$INCLUDE 4x8_AR.dat
/;

PARAMETER DIMPORT_AR0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_AR.dat
$INCLUDE 8x4_AR.dat
/;


PARAMETER
SAM_AR1(RS_All0,RS_All0a)
FEXPORT_AR1(RS_All0,RS_All0a)
FIMPORT_AR1(RS_All0,RS_All0a)
DEXPORT_AR1(RS_All0,RS_All0a)
DIMPORT_AR1(RS_All0,RS_All0a)

;

SAM_AR1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_AR0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_AR1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_AR0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_AR1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_AR0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_AR1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_AR0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_AR1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_AR0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_AR1.gdx" SAM_AR1;
execute_unload "FEXPORT_AR1.gdx" FEXPORT_AR1;
execute_unload "FIMPORT_AR1.gdx" FIMPORT_AR1;
execute_unload "DEXPORT_AR1.gdx" DEXPORT_AR1;
execute_unload "DIMPORT_AR1.gdx" DIMPORT_AR1;

* Arizona

PARAMETER  SAM_AZ0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_AZ.dat
$INCLUDE 3x1_AZ.dat
$INCLUDE 5x1_AZ.dat
$INCLUDE 1x2_AZ.dat
$INCLUDE 4x2_AZ.dat
$INCLUDE 4x3_AZ.dat
$INCLUDE 5x3_AZ.dat
$INCLUDE 2x4_AZ.dat
$INCLUDE 4x4_AZ.dat
$INCLUDE 5x4_AZ.dat
$INCLUDE 1x5_AZ.dat
$INCLUDE 4x5_AZ.dat
$INCLUDE 5x5_AZ.dat
$INCLUDE 1x6_AZ.dat
$INCLUDE 4x6_AZ.dat
$INCLUDE 6x1_AZ.dat
$INCLUDE 6x3_AZ.dat
$INCLUDE 6x4_AZ.dat
/;


PARAMETER  FEXPORT_AZ0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_AZ.dat
$INCLUDE 4x7_AZ.dat
/;

PARAMETER  FIMPORT_AZ0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_AZ.dat
$INCLUDE 7x4_AZ.dat
/;

PARAMETER  DEXPORT_AZ0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_AZ.dat
$INCLUDE 4x8_AZ.dat
/;

PARAMETER  DIMPORT_AZ0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_AZ.dat
$INCLUDE 8x4_AZ.dat
/;


PARAMETER
SAM_AZ1(RS_All0,RS_All0a)
FEXPORT_AZ1(RS_All0,RS_All0a)
FIMPORT_AZ1(RS_All0,RS_All0a)
DEXPORT_AZ1(RS_All0,RS_All0a)
DIMPORT_AZ1(RS_All0,RS_All0a)

;

SAM_AZ1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_AZ0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_AZ1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_AZ0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_AZ1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_AZ0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_AZ1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_AZ0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_AZ1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_AZ0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_AZ1.gdx" SAM_AZ1;
execute_unload "FEXPORT_AZ1.gdx" FEXPORT_AZ1;
execute_unload "FIMPORT_AZ1.gdx" FIMPORT_AZ1;
execute_unload "DEXPORT_AZ1.gdx" DEXPORT_AZ1;
execute_unload "DIMPORT_AZ1.gdx" DIMPORT_AZ1;

* California

PARAMETER  SAM_CA0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_CA.dat
$INCLUDE 3x1_CA.dat
$INCLUDE 5x1_CA.dat
$INCLUDE 1x2_CA.dat
$INCLUDE 4x2_CA.dat
$INCLUDE 4x3_CA.dat
$INCLUDE 5x3_CA.dat
$INCLUDE 2x4_CA.dat
$INCLUDE 4x4_CA.dat
$INCLUDE 5x4_CA.dat
$INCLUDE 1x5_CA.dat
$INCLUDE 4x5_CA.dat
$INCLUDE 5x5_CA.dat
$INCLUDE 1x6_CA.dat
$INCLUDE 4x6_CA.dat
$INCLUDE 6x1_CA.dat
$INCLUDE 6x3_CA.dat
$INCLUDE 6x4_CA.dat
/;


PARAMETER  FEXPORT_CA0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_CA.dat
$INCLUDE 4x7_CA.dat
/;

PARAMETER  FIMPORT_CA0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_CA.dat
$INCLUDE 7x4_CA.dat
/;

PARAMETER  DEXPORT_CA0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_CA.dat
$INCLUDE 4x8_CA.dat
/;

PARAMETER  DIMPORT_CA0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_CA.dat
$INCLUDE 8x4_CA.dat
/;


PARAMETER
SAM_CA1(RS_All0,RS_All0a)
FEXPORT_CA1(RS_All0,RS_All0a)
FIMPORT_CA1(RS_All0,RS_All0a)
DEXPORT_CA1(RS_All0,RS_All0a)
DIMPORT_CA1(RS_All0,RS_All0a)

;

SAM_CA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_CA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_CA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_CA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_CA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_CA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_CA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_CA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_CA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_CA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_CA1.gdx" SAM_CA1;
execute_unload "FEXPORT_CA1.gdx" FEXPORT_CA1;
execute_unload "FIMPORT_CA1.gdx" FIMPORT_CA1;
execute_unload "DEXPORT_CA1.gdx" DEXPORT_CA1;
execute_unload "DIMPORT_CA1.gdx" DIMPORT_CA1;

* Colorado

PARAMETER SAM_CO0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_CO.dat
$INCLUDE 3x1_CO.dat
$INCLUDE 5x1_CO.dat
$INCLUDE 1x2_CO.dat
$INCLUDE 4x2_CO.dat
$INCLUDE 4x3_CO.dat
$INCLUDE 5x3_CO.dat
$INCLUDE 2x4_CO.dat
$INCLUDE 4x4_CO.dat
$INCLUDE 5x4_CO.dat
$INCLUDE 1x5_CO.dat
$INCLUDE 4x5_CO.dat
$INCLUDE 5x5_CO.dat
$INCLUDE 1x6_CO.dat
$INCLUDE 4x6_CO.dat
$INCLUDE 6x1_CO.dat
$INCLUDE 6x3_CO.dat
$INCLUDE 6x4_CO.dat
/;


PARAMETER FEXPORT_CO0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_CO.dat
$INCLUDE 4x7_CO.dat
/;

PARAMETER FIMPORT_CO0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_CO.dat
$INCLUDE 7x4_CO.dat
/;

PARAMETER DEXPORT_CO0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_CO.dat
$INCLUDE 4x8_CO.dat
/;

PARAMETER DIMPORT_CO0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_CO.dat
$INCLUDE 8x4_CO.dat
/;


PARAMETER
SAM_CO1(RS_All0,RS_All0a)
FEXPORT_CO1(RS_All0,RS_All0a)
FIMPORT_CO1(RS_All0,RS_All0a)
DEXPORT_CO1(RS_All0,RS_All0a)
DIMPORT_CO1(RS_All0,RS_All0a)

;

SAM_CO1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_CO0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_CO1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_CO0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_CO1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_CO0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_CO1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_CO0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_CO1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_CO0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_CO1.gdx" SAM_CO1;
execute_unload "FEXPORT_CO1.gdx" FEXPORT_CO1;
execute_unload "FIMPORT_CO1.gdx" FIMPORT_CO1;
execute_unload "DEXPORT_CO1.gdx" DEXPORT_CO1;
execute_unload "DIMPORT_CO1.gdx" DIMPORT_CO1;

* Connecticut

PARAMETER SAM_CT0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_CT.dat
$INCLUDE 3x1_CT.dat
$INCLUDE 5x1_CT.dat
$INCLUDE 1x2_CT.dat
$INCLUDE 4x2_CT.dat
$INCLUDE 4x3_CT.dat
$INCLUDE 5x3_CT.dat
$INCLUDE 2x4_CT.dat
$INCLUDE 4x4_CT.dat
$INCLUDE 5x4_CT.dat
$INCLUDE 1x5_CT.dat
$INCLUDE 4x5_CT.dat
$INCLUDE 5x5_CT.dat
$INCLUDE 1x6_CT.dat
$INCLUDE 4x6_CT.dat
$INCLUDE 6x1_CT.dat
$INCLUDE 6x3_CT.dat
$INCLUDE 6x4_CT.dat
/;


PARAMETER  FEXPORT_CT0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_CT.dat
$INCLUDE 4x7_CT.dat
/;

PARAMETER FIMPORT_CT0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_CT.dat
$INCLUDE 7x4_CT.dat
/;

PARAMETER DEXPORT_CT0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_CT.dat
$INCLUDE 4x8_CT.dat
/;

PARAMETER DIMPORT_CT0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_CT.dat
$INCLUDE 8x4_CT.dat
/;


PARAMETER
SAM_CT1(RS_All0,RS_All0a)
FEXPORT_CT1(RS_All0,RS_All0a)
FIMPORT_CT1(RS_All0,RS_All0a)
DEXPORT_CT1(RS_All0,RS_All0a)
DIMPORT_CT1(RS_All0,RS_All0a)

;

SAM_CT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_CT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_CT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_CT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_CT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_CT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_CT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_CT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_CT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_CT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_CT1.gdx" SAM_CT1;
execute_unload "FEXPORT_CT1.gdx" FEXPORT_CT1;
execute_unload "FIMPORT_CT1.gdx" FIMPORT_CT1;
execute_unload "DEXPORT_CT1.gdx" DEXPORT_CT1;
execute_unload "DIMPORT_CT1.gdx" DIMPORT_CT1;

* DC

PARAMETER SAM_DC0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_DC.dat
$INCLUDE 3x1_DC.dat
$INCLUDE 5x1_DC.dat
$INCLUDE 1x2_DC.dat
$INCLUDE 4x2_DC.dat
$INCLUDE 4x3_DC.dat
$INCLUDE 5x3_DC.dat
$INCLUDE 2x4_DC.dat
$INCLUDE 4x4_DC.dat
$INCLUDE 5x4_DC.dat
$INCLUDE 1x5_DC.dat
$INCLUDE 4x5_DC.dat
$INCLUDE 5x5_DC.dat
$INCLUDE 1x6_DC.dat
$INCLUDE 4x6_DC.dat
$INCLUDE 6x1_DC.dat
$INCLUDE 6x3_DC.dat
$INCLUDE 6x4_DC.dat
/;


PARAMETER FEXPORT_DC0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_DC.dat
$INCLUDE 4x7_DC.dat
/;

PARAMETER FIMPORT_DC0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_DC.dat
$INCLUDE 7x4_DC.dat
/;

PARAMETER DEXPORT_DC0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_DC.dat
$INCLUDE 4x8_DC.dat
/;

PARAMETER DIMPORT_DC0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_DC.dat
$INCLUDE 8x4_DC.dat
/;


PARAMETER
SAM_DC1(RS_All0,RS_All0a)
FEXPORT_DC1(RS_All0,RS_All0a)
FIMPORT_DC1(RS_All0,RS_All0a)
DEXPORT_DC1(RS_All0,RS_All0a)
DIMPORT_DC1(RS_All0,RS_All0a)

;

SAM_DC1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_DC0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_DC1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_DC0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_DC1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_DC0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_DC1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_DC0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_DC1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_DC0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_DC1.gdx" SAM_DC1;
execute_unload "FEXPORT_DC1.gdx" FEXPORT_DC1;
execute_unload "FIMPORT_DC1.gdx" FIMPORT_DC1;
execute_unload "DEXPORT_DC1.gdx" DEXPORT_DC1;
execute_unload "DIMPORT_DC1.gdx" DIMPORT_DC1;

* Delaware

PARAMETER SAM_DE0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_DE.dat
$INCLUDE 3x1_DE.dat
$INCLUDE 5x1_DE.dat
$INCLUDE 1x2_DE.dat
$INCLUDE 4x2_DE.dat
$INCLUDE 4x3_DE.dat
$INCLUDE 5x3_DE.dat
$INCLUDE 2x4_DE.dat
$INCLUDE 4x4_DE.dat
$INCLUDE 5x4_DE.dat
$INCLUDE 1x5_DE.dat
$INCLUDE 4x5_DE.dat
$INCLUDE 5x5_DE.dat
$INCLUDE 1x6_DE.dat
$INCLUDE 4x6_DE.dat
$INCLUDE 6x1_DE.dat
$INCLUDE 6x3_DE.dat
$INCLUDE 6x4_DE.dat
/;


PARAMETER FEXPORT_DE0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_DE.dat
$INCLUDE 4x7_DE.dat
/;

PARAMETER FIMPORT_DE0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_DE.dat
$INCLUDE 7x4_DE.dat
/;

PARAMETER DEXPORT_DE0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_DE.dat
$INCLUDE 4x8_DE.dat
/;

PARAMETER DIMPORT_DE0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_DE.dat
$INCLUDE 8x4_DE.dat
/;


PARAMETER
SAM_DE1(RS_All0,RS_All0a)
FEXPORT_DE1(RS_All0,RS_All0a)
FIMPORT_DE1(RS_All0,RS_All0a)
DEXPORT_DE1(RS_All0,RS_All0a)
DIMPORT_DE1(RS_All0,RS_All0a)

;

SAM_DE1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_DE0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_DE1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_DE0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_DE1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_DE0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_DE1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_DE0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_DE1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_DE0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_DE1.gdx" SAM_DE1;
execute_unload "FEXPORT_DE1.gdx" FEXPORT_DE1;
execute_unload "FIMPORT_DE1.gdx" FIMPORT_DE1;
execute_unload "DEXPORT_DE1.gdx" DEXPORT_DE1;
execute_unload "DIMPORT_DE1.gdx" DIMPORT_DE1;

* Florida

PARAMETER SAM_FL0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_FL.dat
$INCLUDE 3x1_FL.dat
$INCLUDE 5x1_FL.dat
$INCLUDE 1x2_FL.dat
$INCLUDE 4x2_FL.dat
$INCLUDE 4x3_FL.dat
$INCLUDE 5x3_FL.dat
$INCLUDE 2x4_FL.dat
$INCLUDE 4x4_FL.dat
$INCLUDE 5x4_FL.dat
$INCLUDE 1x5_FL.dat
$INCLUDE 4x5_FL.dat
$INCLUDE 5x5_FL.dat
$INCLUDE 1x6_FL.dat
$INCLUDE 4x6_FL.dat
$INCLUDE 6x1_FL.dat
$INCLUDE 6x3_FL.dat
$INCLUDE 6x4_FL.dat
/;


PARAMETER FEXPORT_FL0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_FL.dat
$INCLUDE 4x7_FL.dat
/;

PARAMETER FIMPORT_FL0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_FL.dat
$INCLUDE 7x4_FL.dat
/;

PARAMETER DEXPORT_FL0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_FL.dat
$INCLUDE 4x8_FL.dat
/;

PARAMETER DIMPORT_FL0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_FL.dat
$INCLUDE 8x4_FL.dat
/;


PARAMETER
SAM_FL1(RS_All0,RS_All0a)
FEXPORT_FL1(RS_All0,RS_All0a)
FIMPORT_FL1(RS_All0,RS_All0a)
DEXPORT_FL1(RS_All0,RS_All0a)
DIMPORT_FL1(RS_All0,RS_All0a)

;

SAM_FL1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_FL0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_FL1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_FL0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_FL1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_FL0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_FL1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_FL0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_FL1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_FL0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_FL1.gdx" SAM_FL1;
execute_unload "FEXPORT_FL1.gdx" FEXPORT_FL1;
execute_unload "FIMPORT_FL1.gdx" FIMPORT_FL1;
execute_unload "DEXPORT_FL1.gdx" DEXPORT_FL1;
execute_unload "DIMPORT_FL1.gdx" DIMPORT_FL1;

* Georgia

PARAMETER SAM_GA0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_GA.dat
$INCLUDE 3x1_GA.dat
$INCLUDE 5x1_GA.dat
$INCLUDE 1x2_GA.dat
$INCLUDE 4x2_GA.dat
$INCLUDE 4x3_GA.dat
$INCLUDE 5x3_GA.dat
$INCLUDE 2x4_GA.dat
$INCLUDE 4x4_GA.dat
$INCLUDE 5x4_GA.dat
$INCLUDE 1x5_GA.dat
$INCLUDE 4x5_GA.dat
$INCLUDE 5x5_GA.dat
$INCLUDE 1x6_GA.dat
$INCLUDE 4x6_GA.dat
$INCLUDE 6x1_GA.dat
$INCLUDE 6x3_GA.dat
$INCLUDE 6x4_GA.dat
/;


PARAMETER FEXPORT_GA0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_GA.dat
$INCLUDE 4x7_GA.dat
/;

PARAMETER FIMPORT_GA0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_GA.dat
$INCLUDE 7x4_GA.dat
/;

PARAMETER DEXPORT_GA0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_GA.dat
$INCLUDE 4x8_GA.dat
/;

PARAMETER DIMPORT_GA0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_GA.dat
$INCLUDE 8x4_GA.dat
/;


PARAMETER
SAM_GA1(RS_All0,RS_All0a)
FEXPORT_GA1(RS_All0,RS_All0a)
FIMPORT_GA1(RS_All0,RS_All0a)
DEXPORT_GA1(RS_All0,RS_All0a)
DIMPORT_GA1(RS_All0,RS_All0a)

;

SAM_GA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_GA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_GA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_GA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_GA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_GA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_GA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_GA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_GA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_GA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_GA1.gdx" SAM_GA1;
execute_unload "FEXPORT_GA1.gdx" FEXPORT_GA1;
execute_unload "FIMPORT_GA1.gdx" FIMPORT_GA1;
execute_unload "DEXPORT_GA1.gdx" DEXPORT_GA1;
execute_unload "DIMPORT_GA1.gdx" DIMPORT_GA1;

* Hawaii

PARAMETER SAM_HI0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_HI.dat
$INCLUDE 3x1_HI.dat
$INCLUDE 5x1_HI.dat
$INCLUDE 1x2_HI.dat
$INCLUDE 4x2_HI.dat
$INCLUDE 4x3_HI.dat
$INCLUDE 5x3_HI.dat
$INCLUDE 2x4_HI.dat
$INCLUDE 4x4_HI.dat
$INCLUDE 5x4_HI.dat
$INCLUDE 1x5_HI.dat
$INCLUDE 4x5_HI.dat
$INCLUDE 5x5_HI.dat
$INCLUDE 1x6_HI.dat
$INCLUDE 4x6_HI.dat
$INCLUDE 6x1_HI.dat
$INCLUDE 6x3_HI.dat
$INCLUDE 6x4_HI.dat
/;


PARAMETER FEXPORT_HI0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_HI.dat
$INCLUDE 4x7_HI.dat
/;

PARAMETER FIMPORT_HI0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_HI.dat
$INCLUDE 7x4_HI.dat
/;

PARAMETER DEXPORT_HI0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_HI.dat
$INCLUDE 4x8_HI.dat
/;

PARAMETER DIMPORT_HI0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_HI.dat
$INCLUDE 8x4_HI.dat
/;


PARAMETER
SAM_HI1(RS_All0,RS_All0a)
FEXPORT_HI1(RS_All0,RS_All0a)
FIMPORT_HI1(RS_All0,RS_All0a)
DEXPORT_HI1(RS_All0,RS_All0a)
DIMPORT_HI1(RS_All0,RS_All0a)

;

SAM_HI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_HI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_HI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_HI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_HI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_HI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_HI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_HI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_HI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_HI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_HI1.gdx" SAM_HI1;
execute_unload "FEXPORT_HI1.gdx" FEXPORT_HI1;
execute_unload "FIMPORT_HI1.gdx" FIMPORT_HI1;
execute_unload "DEXPORT_HI1.gdx" DEXPORT_HI1;
execute_unload "DIMPORT_HI1.gdx" DIMPORT_HI1;

* Iowa

PARAMETER SAM_IA0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_IA.dat
$INCLUDE 3x1_IA.dat
$INCLUDE 5x1_IA.dat
$INCLUDE 1x2_IA.dat
$INCLUDE 4x2_IA.dat
$INCLUDE 4x3_IA.dat
$INCLUDE 5x3_IA.dat
$INCLUDE 2x4_IA.dat
$INCLUDE 4x4_IA.dat
$INCLUDE 5x4_IA.dat
$INCLUDE 1x5_IA.dat
$INCLUDE 4x5_IA.dat
$INCLUDE 5x5_IA.dat
$INCLUDE 1x6_IA.dat
$INCLUDE 4x6_IA.dat
$INCLUDE 6x1_IA.dat
$INCLUDE 6x3_IA.dat
$INCLUDE 6x4_IA.dat
/;


PARAMETER FEXPORT_IA0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_IA.dat
$INCLUDE 4x7_IA.dat
/;

PARAMETER FIMPORT_IA0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_IA.dat
$INCLUDE 7x4_IA.dat
/;

PARAMETER DEXPORT_IA0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_IA.dat
$INCLUDE 4x8_IA.dat
/;

PARAMETER DIMPORT_IA0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_IA.dat
$INCLUDE 8x4_IA.dat
/;


PARAMETER
SAM_IA1(RS_All0,RS_All0a)
FEXPORT_IA1(RS_All0,RS_All0a)
FIMPORT_IA1(RS_All0,RS_All0a)
DEXPORT_IA1(RS_All0,RS_All0a)
DIMPORT_IA1(RS_All0,RS_All0a)

;

SAM_IA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_IA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_IA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_IA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_IA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_IA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_IA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_IA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_IA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_IA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_IA1.gdx" SAM_IA1;
execute_unload "FEXPORT_IA1.gdx" FEXPORT_IA1;
execute_unload "FIMPORT_IA1.gdx" FIMPORT_IA1;
execute_unload "DEXPORT_IA1.gdx" DEXPORT_IA1;
execute_unload "DIMPORT_IA1.gdx" DIMPORT_IA1;

* Idaho

PARAMETER SAM_ID0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_ID.dat
$INCLUDE 3x1_ID.dat
$INCLUDE 5x1_ID.dat
$INCLUDE 1x2_ID.dat
$INCLUDE 4x2_ID.dat
$INCLUDE 4x3_ID.dat
$INCLUDE 5x3_ID.dat
$INCLUDE 2x4_ID.dat
$INCLUDE 4x4_ID.dat
$INCLUDE 5x4_ID.dat
$INCLUDE 1x5_ID.dat
$INCLUDE 4x5_ID.dat
$INCLUDE 5x5_ID.dat
$INCLUDE 1x6_ID.dat
$INCLUDE 4x6_ID.dat
$INCLUDE 6x1_ID.dat
$INCLUDE 6x3_ID.dat
$INCLUDE 6x4_ID.dat
/;


PARAMETER FEXPORT_ID0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_ID.dat
$INCLUDE 4x7_ID.dat
/;

PARAMETER FIMPORT_ID0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_ID.dat
$INCLUDE 7x4_ID.dat
/;

PARAMETER DEXPORT_ID0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_ID.dat
$INCLUDE 4x8_ID.dat
/;

PARAMETER DIMPORT_ID0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_ID.dat
$INCLUDE 8x4_ID.dat
/;


PARAMETER
SAM_ID1(RS_All0,RS_All0a)
FEXPORT_ID1(RS_All0,RS_All0a)
FIMPORT_ID1(RS_All0,RS_All0a)
DEXPORT_ID1(RS_All0,RS_All0a)
DIMPORT_ID1(RS_All0,RS_All0a)

;

SAM_ID1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_ID0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_ID1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_ID0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_ID1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_ID0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_ID1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_ID0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_ID1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_ID0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_ID1.gdx" SAM_ID1;
execute_unload "FEXPORT_ID1.gdx" FEXPORT_ID1;
execute_unload "FIMPORT_ID1.gdx" FIMPORT_ID1;
execute_unload "DEXPORT_ID1.gdx" DEXPORT_ID1;
execute_unload "DIMPORT_ID1.gdx" DIMPORT_ID1;

* Illinois

PARAMETER SAM_IL0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_IL.dat
$INCLUDE 3x1_IL.dat
$INCLUDE 5x1_IL.dat
$INCLUDE 1x2_IL.dat
$INCLUDE 4x2_IL.dat
$INCLUDE 4x3_IL.dat
$INCLUDE 5x3_IL.dat
$INCLUDE 2x4_IL.dat
$INCLUDE 4x4_IL.dat
$INCLUDE 5x4_IL.dat
$INCLUDE 1x5_IL.dat
$INCLUDE 4x5_IL.dat
$INCLUDE 5x5_IL.dat
$INCLUDE 1x6_IL.dat
$INCLUDE 4x6_IL.dat
$INCLUDE 6x1_IL.dat
$INCLUDE 6x3_IL.dat
$INCLUDE 6x4_IL.dat
/;


PARAMETER FEXPORT_IL0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_IL.dat
$INCLUDE 4x7_IL.dat
/;

PARAMETER FIMPORT_IL0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_IL.dat
$INCLUDE 7x4_IL.dat
/;

PARAMETER DEXPORT_IL0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_IL.dat
$INCLUDE 4x8_IL.dat
/;

PARAMETER DIMPORT_IL0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_IL.dat
$INCLUDE 8x4_IL.dat
/;


PARAMETER
SAM_IL1(RS_All0,RS_All0a)
FEXPORT_IL1(RS_All0,RS_All0a)
FIMPORT_IL1(RS_All0,RS_All0a)
DEXPORT_IL1(RS_All0,RS_All0a)
DIMPORT_IL1(RS_All0,RS_All0a)

;

SAM_IL1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_IL0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_IL1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_IL0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_IL1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_IL0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_IL1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_IL0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_IL1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_IL0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_IL1.gdx" SAM_IL1;
execute_unload "FEXPORT_IL1.gdx" FEXPORT_IL1;
execute_unload "FIMPORT_IL1.gdx" FIMPORT_IL1;
execute_unload "DEXPORT_IL1.gdx" DEXPORT_IL1;
execute_unload "DIMPORT_IL1.gdx" DIMPORT_IL1;

* Indiana

PARAMETER SAM_IN0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_IN.dat
$INCLUDE 3x1_IN.dat
$INCLUDE 5x1_IN.dat
$INCLUDE 1x2_IN.dat
$INCLUDE 4x2_IN.dat
$INCLUDE 4x3_IN.dat
$INCLUDE 5x3_IN.dat
$INCLUDE 2x4_IN.dat
$INCLUDE 4x4_IN.dat
$INCLUDE 5x4_IN.dat
$INCLUDE 1x5_IN.dat
$INCLUDE 4x5_IN.dat
$INCLUDE 5x5_IN.dat
$INCLUDE 1x6_IN.dat
$INCLUDE 4x6_IN.dat
$INCLUDE 6x1_IN.dat
$INCLUDE 6x3_IN.dat
$INCLUDE 6x4_IN.dat
/;


PARAMETER FEXPORT_IN0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_IN.dat
$INCLUDE 4x7_IN.dat
/;

PARAMETER FIMPORT_IN0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_IN.dat
$INCLUDE 7x4_IN.dat
/;

PARAMETER DEXPORT_IN0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_IN.dat
$INCLUDE 4x8_IN.dat
/;

PARAMETER DIMPORT_IN0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_IN.dat
$INCLUDE 8x4_IN.dat
/;


PARAMETER
SAM_IN1(RS_All0,RS_All0a)
FEXPORT_IN1(RS_All0,RS_All0a)
FIMPORT_IN1(RS_All0,RS_All0a)
DEXPORT_IN1(RS_All0,RS_All0a)
DIMPORT_IN1(RS_All0,RS_All0a)

;

SAM_IN1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_IN0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_IN1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_IN0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_IN1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_IN0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_IN1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_IN0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_IN1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_IN0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_IN1.gdx" SAM_IN1;
execute_unload "FEXPORT_IN1.gdx" FEXPORT_IN1;
execute_unload "FIMPORT_IN1.gdx" FIMPORT_IN1;
execute_unload "DEXPORT_IN1.gdx" DEXPORT_IN1;
execute_unload "DIMPORT_IN1.gdx" DIMPORT_IN1;

* Kansas

PARAMETER SAM_KS0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_KS.dat
$INCLUDE 3x1_KS.dat
$INCLUDE 5x1_KS.dat
$INCLUDE 1x2_KS.dat
$INCLUDE 4x2_KS.dat
$INCLUDE 4x3_KS.dat
$INCLUDE 5x3_KS.dat
$INCLUDE 2x4_KS.dat
$INCLUDE 4x4_KS.dat
$INCLUDE 5x4_KS.dat
$INCLUDE 1x5_KS.dat
$INCLUDE 4x5_KS.dat
$INCLUDE 5x5_KS.dat
$INCLUDE 1x6_KS.dat
$INCLUDE 4x6_KS.dat
$INCLUDE 6x1_KS.dat
$INCLUDE 6x3_KS.dat
$INCLUDE 6x4_KS.dat
/;


PARAMETER FEXPORT_KS0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_KS.dat
$INCLUDE 4x7_KS.dat
/;

PARAMETER FIMPORT_KS0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_KS.dat
$INCLUDE 7x4_KS.dat
/;

PARAMETER DEXPORT_KS0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_KS.dat
$INCLUDE 4x8_KS.dat
/;

PARAMETER DIMPORT_KS0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_KS.dat
$INCLUDE 8x4_KS.dat
/;


PARAMETER
SAM_KS1(RS_All0,RS_All0a)
FEXPORT_KS1(RS_All0,RS_All0a)
FIMPORT_KS1(RS_All0,RS_All0a)
DEXPORT_KS1(RS_All0,RS_All0a)
DIMPORT_KS1(RS_All0,RS_All0a)

;

SAM_KS1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_KS0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_KS1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_KS0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_KS1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_KS0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_KS1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_KS0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_KS1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_KS0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_KS1.gdx" SAM_KS1;
execute_unload "FEXPORT_KS1.gdx" FEXPORT_KS1;
execute_unload "FIMPORT_KS1.gdx" FIMPORT_KS1;
execute_unload "DEXPORT_KS1.gdx" DEXPORT_KS1;
execute_unload "DIMPORT_KS1.gdx" DIMPORT_KS1;

* Kentucky

PARAMETER SAM_KY0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_KY.dat
$INCLUDE 3x1_KY.dat
$INCLUDE 5x1_KY.dat
$INCLUDE 1x2_KY.dat
$INCLUDE 4x2_KY.dat
$INCLUDE 4x3_KY.dat
$INCLUDE 5x3_KY.dat
$INCLUDE 2x4_KY.dat
$INCLUDE 4x4_KY.dat
$INCLUDE 5x4_KY.dat
$INCLUDE 1x5_KY.dat
$INCLUDE 4x5_KY.dat
$INCLUDE 5x5_KY.dat
$INCLUDE 1x6_KY.dat
$INCLUDE 4x6_KY.dat
$INCLUDE 6x1_KY.dat
$INCLUDE 6x3_KY.dat
$INCLUDE 6x4_KY.dat
/;


PARAMETER FEXPORT_KY0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_KY.dat
$INCLUDE 4x7_KY.dat
/;

PARAMETER FIMPORT_KY0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_KY.dat
$INCLUDE 7x4_KY.dat
/;

PARAMETER DEXPORT_KY0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_KY.dat
$INCLUDE 4x8_KY.dat
/;

PARAMETER DIMPORT_KY0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_KY.dat
$INCLUDE 8x4_KY.dat
/;


PARAMETER
SAM_KY1(RS_All0,RS_All0a)
FEXPORT_KY1(RS_All0,RS_All0a)
FIMPORT_KY1(RS_All0,RS_All0a)
DEXPORT_KY1(RS_All0,RS_All0a)
DIMPORT_KY1(RS_All0,RS_All0a)

;

SAM_KY1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_KY0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_KY1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_KY0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_KY1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_KY0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_KY1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_KY0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_KY1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_KY0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_KY1.gdx" SAM_KY1;
execute_unload "FEXPORT_KY1.gdx" FEXPORT_KY1;
execute_unload "FIMPORT_KY1.gdx" FIMPORT_KY1;
execute_unload "DEXPORT_KY1.gdx" DEXPORT_KY1;
execute_unload "DIMPORT_KY1.gdx" DIMPORT_KY1;

* Louisiana

PARAMETER SAM_LA0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_LA.dat
$INCLUDE 3x1_LA.dat
$INCLUDE 5x1_LA.dat
$INCLUDE 1x2_LA.dat
$INCLUDE 4x2_LA.dat
$INCLUDE 4x3_LA.dat
$INCLUDE 5x3_LA.dat
$INCLUDE 2x4_LA.dat
$INCLUDE 4x4_LA.dat
$INCLUDE 5x4_LA.dat
$INCLUDE 1x5_LA.dat
$INCLUDE 4x5_LA.dat
$INCLUDE 5x5_LA.dat
$INCLUDE 1x6_LA.dat
$INCLUDE 4x6_LA.dat
$INCLUDE 6x1_LA.dat
$INCLUDE 6x3_LA.dat
$INCLUDE 6x4_LA.dat
/;


PARAMETER FEXPORT_LA0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_LA.dat
$INCLUDE 4x7_LA.dat
/;

PARAMETER FIMPORT_LA0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_LA.dat
$INCLUDE 7x4_LA.dat
/;

PARAMETER DEXPORT_LA0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_LA.dat
$INCLUDE 4x8_LA.dat
/;

PARAMETER DIMPORT_LA0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_LA.dat
$INCLUDE 8x4_LA.dat
/;


PARAMETER
SAM_LA1(RS_All0,RS_All0a)
FEXPORT_LA1(RS_All0,RS_All0a)
FIMPORT_LA1(RS_All0,RS_All0a)
DEXPORT_LA1(RS_All0,RS_All0a)
DIMPORT_LA1(RS_All0,RS_All0a)

;

SAM_LA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_LA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_LA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_LA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_LA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_LA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_LA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_LA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_LA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_LA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_LA1.gdx" SAM_LA1;
execute_unload "FEXPORT_LA1.gdx" FEXPORT_LA1;
execute_unload "FIMPORT_LA1.gdx" FIMPORT_LA1;
execute_unload "DEXPORT_LA1.gdx" DEXPORT_LA1;
execute_unload "DIMPORT_LA1.gdx" DIMPORT_LA1;

* Mass

PARAMETER SAM_MA0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_MA.dat
$INCLUDE 3x1_MA.dat
$INCLUDE 5x1_MA.dat
$INCLUDE 1x2_MA.dat
$INCLUDE 4x2_MA.dat
$INCLUDE 4x3_MA.dat
$INCLUDE 5x3_MA.dat
$INCLUDE 2x4_MA.dat
$INCLUDE 4x4_MA.dat
$INCLUDE 5x4_MA.dat
$INCLUDE 1x5_MA.dat
$INCLUDE 4x5_MA.dat
$INCLUDE 5x5_MA.dat
$INCLUDE 1x6_MA.dat
$INCLUDE 4x6_MA.dat
$INCLUDE 6x1_MA.dat
$INCLUDE 6x3_MA.dat
$INCLUDE 6x4_MA.dat
/;


PARAMETER FEXPORT_MA0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_MA.dat
$INCLUDE 4x7_MA.dat
/;

PARAMETER FIMPORT_MA0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_MA.dat
$INCLUDE 7x4_MA.dat
/;

PARAMETER DEXPORT_MA0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_MA.dat
$INCLUDE 4x8_MA.dat
/;

PARAMETER DIMPORT_MA0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_MA.dat
$INCLUDE 8x4_MA.dat
/;


PARAMETER
SAM_MA1(RS_All0,RS_All0a)
FEXPORT_MA1(RS_All0,RS_All0a)
FIMPORT_MA1(RS_All0,RS_All0a)
DEXPORT_MA1(RS_All0,RS_All0a)
DIMPORT_MA1(RS_All0,RS_All0a)

;

SAM_MA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_MA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_MA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_MA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_MA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_MA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_MA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_MA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_MA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_MA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_MA1.gdx" SAM_MA1;
execute_unload "FEXPORT_MA1.gdx" FEXPORT_MA1;
execute_unload "FIMPORT_MA1.gdx" FIMPORT_MA1;
execute_unload "DEXPORT_MA1.gdx" DEXPORT_MA1;
execute_unload "DIMPORT_MA1.gdx" DIMPORT_MA1;

* Maryland

PARAMETER SAM_MD0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_MD.dat
$INCLUDE 3x1_MD.dat
$INCLUDE 5x1_MD.dat
$INCLUDE 1x2_MD.dat
$INCLUDE 4x2_MD.dat
$INCLUDE 4x3_MD.dat
$INCLUDE 5x3_MD.dat
$INCLUDE 2x4_MD.dat
$INCLUDE 4x4_MD.dat
$INCLUDE 5x4_MD.dat
$INCLUDE 1x5_MD.dat
$INCLUDE 4x5_MD.dat
$INCLUDE 5x5_MD.dat
$INCLUDE 1x6_MD.dat
$INCLUDE 4x6_MD.dat
$INCLUDE 6x1_MD.dat
$INCLUDE 6x3_MD.dat
$INCLUDE 6x4_MD.dat
/;


PARAMETER FEXPORT_MD0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_MD.dat
$INCLUDE 4x7_MD.dat
/;

PARAMETER FIMPORT_MD0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_MD.dat
$INCLUDE 7x4_MD.dat
/;

PARAMETER DEXPORT_MD0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_MD.dat
$INCLUDE 4x8_MD.dat
/;

PARAMETER DIMPORT_MD0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_MD.dat
$INCLUDE 8x4_MD.dat
/;


PARAMETER
SAM_MD1(RS_All0,RS_All0a)
FEXPORT_MD1(RS_All0,RS_All0a)
FIMPORT_MD1(RS_All0,RS_All0a)
DEXPORT_MD1(RS_All0,RS_All0a)
DIMPORT_MD1(RS_All0,RS_All0a)

;

SAM_MD1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_MD0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_MD1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_MD0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_MD1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_MD0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_MD1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_MD0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_MD1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_MD0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_MD1.gdx" SAM_MD1;
execute_unload "FEXPORT_MD1.gdx" FEXPORT_MD1;
execute_unload "FIMPORT_MD1.gdx" FIMPORT_MD1;
execute_unload "DEXPORT_MD1.gdx" DEXPORT_MD1;
execute_unload "DIMPORT_MD1.gdx" DIMPORT_MD1;

* Maine

PARAMETER SAM_ME0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_ME.dat
$INCLUDE 3x1_ME.dat
$INCLUDE 5x1_ME.dat
$INCLUDE 1x2_ME.dat
$INCLUDE 4x2_ME.dat
$INCLUDE 4x3_ME.dat
$INCLUDE 5x3_ME.dat
$INCLUDE 2x4_ME.dat
$INCLUDE 4x4_ME.dat
$INCLUDE 5x4_ME.dat
$INCLUDE 1x5_ME.dat
$INCLUDE 4x5_ME.dat
$INCLUDE 5x5_ME.dat
$INCLUDE 1x6_ME.dat
$INCLUDE 4x6_ME.dat
$INCLUDE 6x1_ME.dat
$INCLUDE 6x3_ME.dat
$INCLUDE 6x4_ME.dat
/;


PARAMETER FEXPORT_ME0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_ME.dat
$INCLUDE 4x7_ME.dat
/;

PARAMETER FIMPORT_ME0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_ME.dat
$INCLUDE 7x4_ME.dat
/;

PARAMETER DEXPORT_ME0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_ME.dat
$INCLUDE 4x8_ME.dat
/;

PARAMETER DIMPORT_ME0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_ME.dat
$INCLUDE 8x4_ME.dat
/;


PARAMETER
SAM_ME1(RS_All0,RS_All0a)
FEXPORT_ME1(RS_All0,RS_All0a)
FIMPORT_ME1(RS_All0,RS_All0a)
DEXPORT_ME1(RS_All0,RS_All0a)
DIMPORT_ME1(RS_All0,RS_All0a)

;

SAM_ME1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_ME0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_ME1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_ME0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_ME1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_ME0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_ME1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_ME0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_ME1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_ME0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_ME1.gdx" SAM_ME1;
execute_unload "FEXPORT_ME1.gdx" FEXPORT_ME1;
execute_unload "FIMPORT_ME1.gdx" FIMPORT_ME1;
execute_unload "DEXPORT_ME1.gdx" DEXPORT_ME1;
execute_unload "DIMPORT_ME1.gdx" DIMPORT_ME1;

* Michigan

PARAMETER SAM_MI0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_MI.dat
$INCLUDE 3x1_MI.dat
$INCLUDE 5x1_MI.dat
$INCLUDE 1x2_MI.dat
$INCLUDE 4x2_MI.dat
$INCLUDE 4x3_MI.dat
$INCLUDE 5x3_MI.dat
$INCLUDE 2x4_MI.dat
$INCLUDE 4x4_MI.dat
$INCLUDE 5x4_MI.dat
$INCLUDE 1x5_MI.dat
$INCLUDE 4x5_MI.dat
$INCLUDE 5x5_MI.dat
$INCLUDE 1x6_MI.dat
$INCLUDE 4x6_MI.dat
$INCLUDE 6x1_MI.dat
$INCLUDE 6x3_MI.dat
$INCLUDE 6x4_MI.dat
/;


PARAMETER FEXPORT_MI0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_MI.dat
$INCLUDE 4x7_MI.dat
/;

PARAMETER FIMPORT_MI0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_MI.dat
$INCLUDE 7x4_MI.dat
/;

PARAMETER DEXPORT_MI0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_MI.dat
$INCLUDE 4x8_MI.dat
/;

PARAMETER DIMPORT_MI0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_MI.dat
$INCLUDE 8x4_MI.dat
/;


PARAMETER
SAM_MI1(RS_All0,RS_All0a)
FEXPORT_MI1(RS_All0,RS_All0a)
FIMPORT_MI1(RS_All0,RS_All0a)
DEXPORT_MI1(RS_All0,RS_All0a)
DIMPORT_MI1(RS_All0,RS_All0a)

;

SAM_MI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_MI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_MI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_MI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_MI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_MI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_MI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_MI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_MI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_MI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_MI1.gdx" SAM_MI1;
execute_unload "FEXPORT_MI1.gdx" FEXPORT_MI1;
execute_unload "FIMPORT_MI1.gdx" FIMPORT_MI1;
execute_unload "DEXPORT_MI1.gdx" DEXPORT_MI1;
execute_unload "DIMPORT_MI1.gdx" DIMPORT_MI1;

* Minnesota

PARAMETER SAM_MN0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_MN.dat
$INCLUDE 3x1_MN.dat
$INCLUDE 5x1_MN.dat
$INCLUDE 1x2_MN.dat
$INCLUDE 4x2_MN.dat
$INCLUDE 4x3_MN.dat
$INCLUDE 5x3_MN.dat
$INCLUDE 2x4_MN.dat
$INCLUDE 4x4_MN.dat
$INCLUDE 5x4_MN.dat
$INCLUDE 1x5_MN.dat
$INCLUDE 4x5_MN.dat
$INCLUDE 5x5_MN.dat
$INCLUDE 1x6_MN.dat
$INCLUDE 4x6_MN.dat
$INCLUDE 6x1_MN.dat
$INCLUDE 6x3_MN.dat
$INCLUDE 6x4_MN.dat
/;


PARAMETER FEXPORT_MN0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_MN.dat
$INCLUDE 4x7_MN.dat
/;

PARAMETER FIMPORT_MN0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_MN.dat
$INCLUDE 7x4_MN.dat
/;

PARAMETER DEXPORT_MN0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_MN.dat
$INCLUDE 4x8_MN.dat
/;

PARAMETER DIMPORT_MN0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_MN.dat
$INCLUDE 8x4_MN.dat
/;


PARAMETER
SAM_MN1(RS_All0,RS_All0a)
FEXPORT_MN1(RS_All0,RS_All0a)
FIMPORT_MN1(RS_All0,RS_All0a)
DEXPORT_MN1(RS_All0,RS_All0a)
DIMPORT_MN1(RS_All0,RS_All0a)

;

SAM_MN1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_MN0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_MN1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_MN0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_MN1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_MN0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_MN1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_MN0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_MN1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_MN0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_MN1.gdx" SAM_MN1;
execute_unload "FEXPORT_MN1.gdx" FEXPORT_MN1;
execute_unload "FIMPORT_MN1.gdx" FIMPORT_MN1;
execute_unload "DEXPORT_MN1.gdx" DEXPORT_MN1;
execute_unload "DIMPORT_MN1.gdx" DIMPORT_MN1;

* Missouri

PARAMETER SAM_MO0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_MO.dat
$INCLUDE 3x1_MO.dat
$INCLUDE 5x1_MO.dat
$INCLUDE 1x2_MO.dat
$INCLUDE 4x2_MO.dat
$INCLUDE 4x3_MO.dat
$INCLUDE 5x3_MO.dat
$INCLUDE 2x4_MO.dat
$INCLUDE 4x4_MO.dat
$INCLUDE 5x4_MO.dat
$INCLUDE 1x5_MO.dat
$INCLUDE 4x5_MO.dat
$INCLUDE 5x5_MO.dat
$INCLUDE 1x6_MO.dat
$INCLUDE 4x6_MO.dat
$INCLUDE 6x1_MO.dat
$INCLUDE 6x3_MO.dat
$INCLUDE 6x4_MO.dat
/;


PARAMETER FEXPORT_MO0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_MO.dat
$INCLUDE 4x7_MO.dat
/;

PARAMETER FIMPORT_MO0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_MO.dat
$INCLUDE 7x4_MO.dat
/;

PARAMETER DEXPORT_MO0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_MO.dat
$INCLUDE 4x8_MO.dat
/;

PARAMETER DIMPORT_MO0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_MO.dat
$INCLUDE 8x4_MO.dat
/;


PARAMETER
SAM_MO1(RS_All0,RS_All0a)
FEXPORT_MO1(RS_All0,RS_All0a)
FIMPORT_MO1(RS_All0,RS_All0a)
DEXPORT_MO1(RS_All0,RS_All0a)
DIMPORT_MO1(RS_All0,RS_All0a)

;

SAM_MO1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_MO0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_MO1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_MO0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_MO1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_MO0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_MO1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_MO0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_MO1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_MO0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_MO1.gdx" SAM_MO1;
execute_unload "FEXPORT_MO1.gdx" FEXPORT_MO1;
execute_unload "FIMPORT_MO1.gdx" FIMPORT_MO1;
execute_unload "DEXPORT_MO1.gdx" DEXPORT_MO1;
execute_unload "DIMPORT_MO1.gdx" DIMPORT_MO1;

* Mississippi

PARAMETER SAM_MS0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_MS.dat
$INCLUDE 3x1_MS.dat
$INCLUDE 5x1_MS.dat
$INCLUDE 1x2_MS.dat
$INCLUDE 4x2_MS.dat
$INCLUDE 4x3_MS.dat
$INCLUDE 5x3_MS.dat
$INCLUDE 2x4_MS.dat
$INCLUDE 4x4_MS.dat
$INCLUDE 5x4_MS.dat
$INCLUDE 1x5_MS.dat
$INCLUDE 4x5_MS.dat
$INCLUDE 5x5_MS.dat
$INCLUDE 1x6_MS.dat
$INCLUDE 4x6_MS.dat
$INCLUDE 6x1_MS.dat
$INCLUDE 6x3_MS.dat
$INCLUDE 6x4_MS.dat
/;


PARAMETER FEXPORT_MS0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_MS.dat
$INCLUDE 4x7_MS.dat
/;

PARAMETER FIMPORT_MS0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_MS.dat
$INCLUDE 7x4_MS.dat
/;

PARAMETER DEXPORT_MS0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_MS.dat
$INCLUDE 4x8_MS.dat
/;

PARAMETER DIMPORT_MS0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_MS.dat
$INCLUDE 8x4_MS.dat
/;


PARAMETER
SAM_MS1(RS_All0,RS_All0a)
FEXPORT_MS1(RS_All0,RS_All0a)
FIMPORT_MS1(RS_All0,RS_All0a)
DEXPORT_MS1(RS_All0,RS_All0a)
DIMPORT_MS1(RS_All0,RS_All0a)

;

SAM_MS1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_MS0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_MS1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_MS0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_MS1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_MS0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_MS1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_MS0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_MS1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_MS0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_MS1.gdx" SAM_MS1;
execute_unload "FEXPORT_MS1.gdx" FEXPORT_MS1;
execute_unload "FIMPORT_MS1.gdx" FIMPORT_MS1;
execute_unload "DEXPORT_MS1.gdx" DEXPORT_MS1;
execute_unload "DIMPORT_MS1.gdx" DIMPORT_MS1;

* Montana

PARAMETER SAM_MT0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_MT.dat
$INCLUDE 3x1_MT.dat
$INCLUDE 5x1_MT.dat
$INCLUDE 1x2_MT.dat
$INCLUDE 4x2_MT.dat
$INCLUDE 4x3_MT.dat
$INCLUDE 5x3_MT.dat
$INCLUDE 2x4_MT.dat
$INCLUDE 4x4_MT.dat
$INCLUDE 5x4_MT.dat
$INCLUDE 1x5_MT.dat
$INCLUDE 4x5_MT.dat
$INCLUDE 5x5_MT.dat
$INCLUDE 1x6_MT.dat
$INCLUDE 4x6_MT.dat
$INCLUDE 6x1_MT.dat
$INCLUDE 6x3_MT.dat
$INCLUDE 6x4_MT.dat
/;


PARAMETER FEXPORT_MT0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_MT.dat
$INCLUDE 4x7_MT.dat
/;

PARAMETER FIMPORT_MT0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_MT.dat
$INCLUDE 7x4_MT.dat
/;

PARAMETER DEXPORT_MT0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_MT.dat
$INCLUDE 4x8_MT.dat
/;

PARAMETER DIMPORT_MT0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_MT.dat
$INCLUDE 8x4_MT.dat
/;


PARAMETER
SAM_MT1(RS_All0,RS_All0a)
FEXPORT_MT1(RS_All0,RS_All0a)
FIMPORT_MT1(RS_All0,RS_All0a)
DEXPORT_MT1(RS_All0,RS_All0a)
DIMPORT_MT1(RS_All0,RS_All0a)

;

SAM_MT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_MT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_MT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_MT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_MT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_MT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_MT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_MT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_MT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_MT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_MT1.gdx" SAM_MT1;
execute_unload "FEXPORT_MT1.gdx" FEXPORT_MT1;
execute_unload "FIMPORT_MT1.gdx" FIMPORT_MT1;
execute_unload "DEXPORT_MT1.gdx" DEXPORT_MT1;
execute_unload "DIMPORT_MT1.gdx" DIMPORT_MT1;

* North Carolina

PARAMETER SAM_NC0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_NC.dat
$INCLUDE 3x1_NC.dat
$INCLUDE 5x1_NC.dat
$INCLUDE 1x2_NC.dat
$INCLUDE 4x2_NC.dat
$INCLUDE 4x3_NC.dat
$INCLUDE 5x3_NC.dat
$INCLUDE 2x4_NC.dat
$INCLUDE 4x4_NC.dat
$INCLUDE 5x4_NC.dat
$INCLUDE 1x5_NC.dat
$INCLUDE 4x5_NC.dat
$INCLUDE 5x5_NC.dat
$INCLUDE 1x6_NC.dat
$INCLUDE 4x6_NC.dat
$INCLUDE 6x1_NC.dat
$INCLUDE 6x3_NC.dat
$INCLUDE 6x4_NC.dat
/;


PARAMETER FEXPORT_NC0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_NC.dat
$INCLUDE 4x7_NC.dat
/;

PARAMETER FIMPORT_NC0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_NC.dat
$INCLUDE 7x4_NC.dat
/;

PARAMETER DEXPORT_NC0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_NC.dat
$INCLUDE 4x8_NC.dat
/;

PARAMETER DIMPORT_NC0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_NC.dat
$INCLUDE 8x4_NC.dat
/;


PARAMETER
SAM_NC1(RS_All0,RS_All0a)
FEXPORT_NC1(RS_All0,RS_All0a)
FIMPORT_NC1(RS_All0,RS_All0a)
DEXPORT_NC1(RS_All0,RS_All0a)
DIMPORT_NC1(RS_All0,RS_All0a)

;

SAM_NC1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_NC0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_NC1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_NC0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_NC1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_NC0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_NC1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_NC0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_NC1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_NC0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_NC1.gdx" SAM_NC1;
execute_unload "FEXPORT_NC1.gdx" FEXPORT_NC1;
execute_unload "FIMPORT_NC1.gdx" FIMPORT_NC1;
execute_unload "DEXPORT_NC1.gdx" DEXPORT_NC1;
execute_unload "DIMPORT_NC1.gdx" DIMPORT_NC1;

* North Dakota

PARAMETER SAM_ND0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_ND.dat
$INCLUDE 3x1_ND.dat
$INCLUDE 5x1_ND.dat
$INCLUDE 1x2_ND.dat
$INCLUDE 4x2_ND.dat
$INCLUDE 4x3_ND.dat
$INCLUDE 5x3_ND.dat
$INCLUDE 2x4_ND.dat
$INCLUDE 4x4_ND.dat
$INCLUDE 5x4_ND.dat
$INCLUDE 1x5_ND.dat
$INCLUDE 4x5_ND.dat
$INCLUDE 5x5_ND.dat
$INCLUDE 1x6_ND.dat
$INCLUDE 4x6_ND.dat
$INCLUDE 6x1_ND.dat
$INCLUDE 6x3_ND.dat
$INCLUDE 6x4_ND.dat
/;


PARAMETER FEXPORT_ND0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_ND.dat
$INCLUDE 4x7_ND.dat
/;

PARAMETER FIMPORT_ND0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_ND.dat
$INCLUDE 7x4_ND.dat
/;

PARAMETER DEXPORT_ND0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_ND.dat
$INCLUDE 4x8_ND.dat
/;

PARAMETER DIMPORT_ND0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_ND.dat
$INCLUDE 8x4_ND.dat
/;


PARAMETER
SAM_ND1(RS_All0,RS_All0a)
FEXPORT_ND1(RS_All0,RS_All0a)
FIMPORT_ND1(RS_All0,RS_All0a)
DEXPORT_ND1(RS_All0,RS_All0a)
DIMPORT_ND1(RS_All0,RS_All0a)

;

SAM_ND1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_ND0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_ND1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_ND0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_ND1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_ND0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_ND1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_ND0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_ND1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_ND0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_ND1.gdx" SAM_ND1;
execute_unload "FEXPORT_ND1.gdx" FEXPORT_ND1;
execute_unload "FIMPORT_ND1.gdx" FIMPORT_ND1;
execute_unload "DEXPORT_ND1.gdx" DEXPORT_ND1;
execute_unload "DIMPORT_ND1.gdx" DIMPORT_ND1;

* Nebraska

PARAMETER SAM_NE0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_NE.dat
$INCLUDE 3x1_NE.dat
$INCLUDE 5x1_NE.dat
$INCLUDE 1x2_NE.dat
$INCLUDE 4x2_NE.dat
$INCLUDE 4x3_NE.dat
$INCLUDE 5x3_NE.dat
$INCLUDE 2x4_NE.dat
$INCLUDE 4x4_NE.dat
$INCLUDE 5x4_NE.dat
$INCLUDE 1x5_NE.dat
$INCLUDE 4x5_NE.dat
$INCLUDE 5x5_NE.dat
$INCLUDE 1x6_NE.dat
$INCLUDE 4x6_NE.dat
$INCLUDE 6x1_NE.dat
$INCLUDE 6x3_NE.dat
$INCLUDE 6x4_NE.dat
/;


PARAMETER FEXPORT_NE0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_NE.dat
$INCLUDE 4x7_NE.dat
/;

PARAMETER FIMPORT_NE0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_NE.dat
$INCLUDE 7x4_NE.dat
/;

PARAMETER DEXPORT_NE0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_NE.dat
$INCLUDE 4x8_NE.dat
/;

PARAMETER DIMPORT_NE0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_NE.dat
$INCLUDE 8x4_NE.dat
/;


PARAMETER
SAM_NE1(RS_All0,RS_All0a)
FEXPORT_NE1(RS_All0,RS_All0a)
FIMPORT_NE1(RS_All0,RS_All0a)
DEXPORT_NE1(RS_All0,RS_All0a)
DIMPORT_NE1(RS_All0,RS_All0a)

;

SAM_NE1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_NE0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_NE1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_NE0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_NE1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_NE0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_NE1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_NE0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_NE1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_NE0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_NE1.gdx" SAM_NE1;
execute_unload "FEXPORT_NE1.gdx" FEXPORT_NE1;
execute_unload "FIMPORT_NE1.gdx" FIMPORT_NE1;
execute_unload "DEXPORT_NE1.gdx" DEXPORT_NE1;
execute_unload "DIMPORT_NE1.gdx" DIMPORT_NE1;

* New Hampshire

PARAMETER SAM_NH0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_NH.dat
$INCLUDE 3x1_NH.dat
$INCLUDE 5x1_NH.dat
$INCLUDE 1x2_NH.dat
$INCLUDE 4x2_NH.dat
$INCLUDE 4x3_NH.dat
$INCLUDE 5x3_NH.dat
$INCLUDE 2x4_NH.dat
$INCLUDE 4x4_NH.dat
$INCLUDE 5x4_NH.dat
$INCLUDE 1x5_NH.dat
$INCLUDE 4x5_NH.dat
$INCLUDE 5x5_NH.dat
$INCLUDE 1x6_NH.dat
$INCLUDE 4x6_NH.dat
$INCLUDE 6x1_NH.dat
$INCLUDE 6x3_NH.dat
$INCLUDE 6x4_NH.dat
/;


PARAMETER FEXPORT_NH0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_NH.dat
$INCLUDE 4x7_NH.dat
/;

PARAMETER FIMPORT_NH0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_NH.dat
$INCLUDE 7x4_NH.dat
/;

PARAMETER DEXPORT_NH0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_NH.dat
$INCLUDE 4x8_NH.dat
/;

PARAMETER DIMPORT_NH0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_NH.dat
$INCLUDE 8x4_NH.dat
/;


PARAMETER
SAM_NH1(RS_All0,RS_All0a)
FEXPORT_NH1(RS_All0,RS_All0a)
FIMPORT_NH1(RS_All0,RS_All0a)
DEXPORT_NH1(RS_All0,RS_All0a)
DIMPORT_NH1(RS_All0,RS_All0a)

;

SAM_NH1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_NH0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_NH1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_NH0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_NH1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_NH0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_NH1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_NH0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_NH1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_NH0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_NH1.gdx" SAM_NH1;
execute_unload "FEXPORT_NH1.gdx" FEXPORT_NH1;
execute_unload "FIMPORT_NH1.gdx" FIMPORT_NH1;
execute_unload "DEXPORT_NH1.gdx" DEXPORT_NH1;
execute_unload "DIMPORT_NH1.gdx" DIMPORT_NH1;

* New Jersey

PARAMETER SAM_NJ0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_NJ.dat
$INCLUDE 3x1_NJ.dat
$INCLUDE 5x1_NJ.dat
$INCLUDE 1x2_NJ.dat
$INCLUDE 4x2_NJ.dat
$INCLUDE 4x3_NJ.dat
$INCLUDE 5x3_NJ.dat
$INCLUDE 2x4_NJ.dat
$INCLUDE 4x4_NJ.dat
$INCLUDE 5x4_NJ.dat
$INCLUDE 1x5_NJ.dat
$INCLUDE 4x5_NJ.dat
$INCLUDE 5x5_NJ.dat
$INCLUDE 1x6_NJ.dat
$INCLUDE 4x6_NJ.dat
$INCLUDE 6x1_NJ.dat
$INCLUDE 6x3_NJ.dat
$INCLUDE 6x4_NJ.dat
/;


PARAMETER FEXPORT_NJ0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_NJ.dat
$INCLUDE 4x7_NJ.dat
/;

PARAMETER FIMPORT_NJ0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_NJ.dat
$INCLUDE 7x4_NJ.dat
/;

PARAMETER DEXPORT_NJ0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_NJ.dat
$INCLUDE 4x8_NJ.dat
/;

PARAMETER DIMPORT_NJ0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_NJ.dat
$INCLUDE 8x4_NJ.dat
/;


PARAMETER
SAM_NJ1(RS_All0,RS_All0a)
FEXPORT_NJ1(RS_All0,RS_All0a)
FIMPORT_NJ1(RS_All0,RS_All0a)
DEXPORT_NJ1(RS_All0,RS_All0a)
DIMPORT_NJ1(RS_All0,RS_All0a)

;

SAM_NJ1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_NJ0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_NJ1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_NJ0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_NJ1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_NJ0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_NJ1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_NJ0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_NJ1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_NJ0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_NJ1.gdx" SAM_NJ1;
execute_unload "FEXPORT_NJ1.gdx" FEXPORT_NJ1;
execute_unload "FIMPORT_NJ1.gdx" FIMPORT_NJ1;
execute_unload "DEXPORT_NJ1.gdx" DEXPORT_NJ1;
execute_unload "DIMPORT_NJ1.gdx" DIMPORT_NJ1;

* New Mexico

PARAMETER SAM_NM0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_NM.dat
$INCLUDE 3x1_NM.dat
$INCLUDE 5x1_NM.dat
$INCLUDE 1x2_NM.dat
$INCLUDE 4x2_NM.dat
$INCLUDE 4x3_NM.dat
$INCLUDE 5x3_NM.dat
$INCLUDE 2x4_NM.dat
$INCLUDE 4x4_NM.dat
$INCLUDE 5x4_NM.dat
$INCLUDE 1x5_NM.dat
$INCLUDE 4x5_NM.dat
$INCLUDE 5x5_NM.dat
$INCLUDE 1x6_NM.dat
$INCLUDE 4x6_NM.dat
$INCLUDE 6x1_NM.dat
$INCLUDE 6x3_NM.dat
$INCLUDE 6x4_NM.dat
/;


PARAMETER FEXPORT_NM0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_NM.dat
$INCLUDE 4x7_NM.dat
/;

PARAMETER FIMPORT_NM0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_NM.dat
$INCLUDE 7x4_NM.dat
/;

PARAMETER DEXPORT_NM0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_NM.dat
$INCLUDE 4x8_NM.dat
/;

PARAMETER DIMPORT_NM0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_NM.dat
$INCLUDE 8x4_NM.dat
/;


PARAMETER
SAM_NM1(RS_All0,RS_All0a)
FEXPORT_NM1(RS_All0,RS_All0a)
FIMPORT_NM1(RS_All0,RS_All0a)
DEXPORT_NM1(RS_All0,RS_All0a)
DIMPORT_NM1(RS_All0,RS_All0a)

;

SAM_NM1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_NM0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_NM1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_NM0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_NM1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_NM0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_NM1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_NM0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_NM1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_NM0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_NM1.gdx" SAM_NM1;
execute_unload "FEXPORT_NM1.gdx" FEXPORT_NM1;
execute_unload "FIMPORT_NM1.gdx" FIMPORT_NM1;
execute_unload "DEXPORT_NM1.gdx" DEXPORT_NM1;
execute_unload "DIMPORT_NM1.gdx" DIMPORT_NM1;

* Nevada

PARAMETER SAM_NV0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_NV.dat
$INCLUDE 3x1_NV.dat
$INCLUDE 5x1_NV.dat
$INCLUDE 1x2_NV.dat
$INCLUDE 4x2_NV.dat
$INCLUDE 4x3_NV.dat
$INCLUDE 5x3_NV.dat
$INCLUDE 2x4_NV.dat
$INCLUDE 4x4_NV.dat
$INCLUDE 5x4_NV.dat
$INCLUDE 1x5_NV.dat
$INCLUDE 4x5_NV.dat
$INCLUDE 5x5_NV.dat
$INCLUDE 1x6_NV.dat
$INCLUDE 4x6_NV.dat
$INCLUDE 6x1_NV.dat
$INCLUDE 6x3_NV.dat
$INCLUDE 6x4_NV.dat
/;


PARAMETER FEXPORT_NV0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_NV.dat
$INCLUDE 4x7_NV.dat
/;

PARAMETER FIMPORT_NV0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_NV.dat
$INCLUDE 7x4_NV.dat
/;

PARAMETER DEXPORT_NV0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_NV.dat
$INCLUDE 4x8_NV.dat
/;

PARAMETER DIMPORT_NV0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_NV.dat
$INCLUDE 8x4_NV.dat
/;


PARAMETER
SAM_NV1(RS_All0,RS_All0a)
FEXPORT_NV1(RS_All0,RS_All0a)
FIMPORT_NV1(RS_All0,RS_All0a)
DEXPORT_NV1(RS_All0,RS_All0a)
DIMPORT_NV1(RS_All0,RS_All0a)

;

SAM_NV1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_NV0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_NV1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_NV0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_NV1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_NV0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_NV1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_NV0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_NV1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_NV0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_NV1.gdx" SAM_NV1;
execute_unload "FEXPORT_NV1.gdx" FEXPORT_NV1;
execute_unload "FIMPORT_NV1.gdx" FIMPORT_NV1;
execute_unload "DEXPORT_NV1.gdx" DEXPORT_NV1;
execute_unload "DIMPORT_NV1.gdx" DIMPORT_NV1;

* New York

PARAMETER SAM_NY0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_NY.dat
$INCLUDE 3x1_NY.dat
$INCLUDE 5x1_NY.dat
$INCLUDE 1x2_NY.dat
$INCLUDE 4x2_NY.dat
$INCLUDE 4x3_NY.dat
$INCLUDE 5x3_NY.dat
$INCLUDE 2x4_NY.dat
$INCLUDE 4x4_NY.dat
$INCLUDE 5x4_NY.dat
$INCLUDE 1x5_NY.dat
$INCLUDE 4x5_NY.dat
$INCLUDE 5x5_NY.dat
$INCLUDE 1x6_NY.dat
$INCLUDE 4x6_NY.dat
$INCLUDE 6x1_NY.dat
$INCLUDE 6x3_NY.dat
$INCLUDE 6x4_NY.dat
/;


PARAMETER FEXPORT_NY0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_NY.dat
$INCLUDE 4x7_NY.dat
/;

PARAMETER FIMPORT_NY0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_NY.dat
$INCLUDE 7x4_NY.dat
/;

PARAMETER DEXPORT_NY0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_NY.dat
$INCLUDE 4x8_NY.dat
/;

PARAMETER DIMPORT_NY0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_NY.dat
$INCLUDE 8x4_NY.dat
/;


PARAMETER
SAM_NY1(RS_All0,RS_All0a)
FEXPORT_NY1(RS_All0,RS_All0a)
FIMPORT_NY1(RS_All0,RS_All0a)
DEXPORT_NY1(RS_All0,RS_All0a)
DIMPORT_NY1(RS_All0,RS_All0a)

;

SAM_NY1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_NY0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_NY1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_NY0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_NY1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_NY0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_NY1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_NY0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_NY1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_NY0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_NY1.gdx" SAM_NY1;
execute_unload "FEXPORT_NY1.gdx" FEXPORT_NY1;
execute_unload "FIMPORT_NY1.gdx" FIMPORT_NY1;
execute_unload "DEXPORT_NY1.gdx" DEXPORT_NY1;
execute_unload "DIMPORT_NY1.gdx" DIMPORT_NY1;

* Ohio

PARAMETER SAM_OH0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_OH.dat
$INCLUDE 3x1_OH.dat
$INCLUDE 5x1_OH.dat
$INCLUDE 1x2_OH.dat
$INCLUDE 4x2_OH.dat
$INCLUDE 4x3_OH.dat
$INCLUDE 5x3_OH.dat
$INCLUDE 2x4_OH.dat
$INCLUDE 4x4_OH.dat
$INCLUDE 5x4_OH.dat
$INCLUDE 1x5_OH.dat
$INCLUDE 4x5_OH.dat
$INCLUDE 5x5_OH.dat
$INCLUDE 1x6_OH.dat
$INCLUDE 4x6_OH.dat
$INCLUDE 6x1_OH.dat
$INCLUDE 6x3_OH.dat
$INCLUDE 6x4_OH.dat
/;


PARAMETER FEXPORT_OH0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_OH.dat
$INCLUDE 4x7_OH.dat
/;

PARAMETER FIMPORT_OH0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_OH.dat
$INCLUDE 7x4_OH.dat
/;

PARAMETER DEXPORT_OH0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_OH.dat
$INCLUDE 4x8_OH.dat
/;

PARAMETER DIMPORT_OH0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_OH.dat
$INCLUDE 8x4_OH.dat
/;


PARAMETER
SAM_OH1(RS_All0,RS_All0a)
FEXPORT_OH1(RS_All0,RS_All0a)
FIMPORT_OH1(RS_All0,RS_All0a)
DEXPORT_OH1(RS_All0,RS_All0a)
DIMPORT_OH1(RS_All0,RS_All0a)

;

SAM_OH1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_OH0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_OH1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_OH0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_OH1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_OH0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_OH1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_OH0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_OH1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_OH0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_OH1.gdx" SAM_OH1;
execute_unload "FEXPORT_OH1.gdx" FEXPORT_OH1;
execute_unload "FIMPORT_OH1.gdx" FIMPORT_OH1;
execute_unload "DEXPORT_OH1.gdx" DEXPORT_OH1;
execute_unload "DIMPORT_OH1.gdx" DIMPORT_OH1;

* Oklahoma

PARAMETER SAM_OK0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_OK.dat
$INCLUDE 3x1_OK.dat
$INCLUDE 5x1_OK.dat
$INCLUDE 1x2_OK.dat
$INCLUDE 4x2_OK.dat
$INCLUDE 4x3_OK.dat
$INCLUDE 5x3_OK.dat
$INCLUDE 2x4_OK.dat
$INCLUDE 4x4_OK.dat
$INCLUDE 5x4_OK.dat
$INCLUDE 1x5_OK.dat
$INCLUDE 4x5_OK.dat
$INCLUDE 5x5_OK.dat
$INCLUDE 1x6_OK.dat
$INCLUDE 4x6_OK.dat
$INCLUDE 6x1_OK.dat
$INCLUDE 6x3_OK.dat
$INCLUDE 6x4_OK.dat
/;


PARAMETER FEXPORT_OK0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_OK.dat
$INCLUDE 4x7_OK.dat
/;

PARAMETER FIMPORT_OK0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_OK.dat
$INCLUDE 7x4_OK.dat
/;

PARAMETER DEXPORT_OK0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_OK.dat
$INCLUDE 4x8_OK.dat
/;

PARAMETER DIMPORT_OK0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_OK.dat
$INCLUDE 8x4_OK.dat
/;


PARAMETER
SAM_OK1(RS_All0,RS_All0a)
FEXPORT_OK1(RS_All0,RS_All0a)
FIMPORT_OK1(RS_All0,RS_All0a)
DEXPORT_OK1(RS_All0,RS_All0a)
DIMPORT_OK1(RS_All0,RS_All0a)

;

SAM_OK1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_OK0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_OK1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_OK0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_OK1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_OK0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_OK1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_OK0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_OK1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_OK0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_OK1.gdx" SAM_OK1;
execute_unload "FEXPORT_OK1.gdx" FEXPORT_OK1;
execute_unload "FIMPORT_OK1.gdx" FIMPORT_OK1;
execute_unload "DEXPORT_OK1.gdx" DEXPORT_OK1;
execute_unload "DIMPORT_OK1.gdx" DIMPORT_OK1;

* OR

PARAMETER SAM_OR0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_OR.dat
$INCLUDE 3x1_OR.dat
$INCLUDE 5x1_OR.dat
$INCLUDE 1x2_OR.dat
$INCLUDE 4x2_OR.dat
$INCLUDE 4x3_OR.dat
$INCLUDE 5x3_OR.dat
$INCLUDE 2x4_OR.dat
$INCLUDE 4x4_OR.dat
$INCLUDE 5x4_OR.dat
$INCLUDE 1x5_OR.dat
$INCLUDE 4x5_OR.dat
$INCLUDE 5x5_OR.dat
$INCLUDE 1x6_OR.dat
$INCLUDE 4x6_OR.dat
$INCLUDE 6x1_OR.dat
$INCLUDE 6x3_OR.dat
$INCLUDE 6x4_OR.dat
/;


PARAMETER FEXPORT_OR0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_OR.dat
$INCLUDE 4x7_OR.dat
/;

PARAMETER FIMPORT_OR0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_OR.dat
$INCLUDE 7x4_OR.dat
/;

PARAMETER DEXPORT_OR0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_OR.dat
$INCLUDE 4x8_OR.dat
/;

PARAMETER DIMPORT_OR0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_OR.dat
$INCLUDE 8x4_OR.dat
/;


PARAMETER
SAM_OR1(RS_All0,RS_All0a)
FEXPORT_OR1(RS_All0,RS_All0a)
FIMPORT_OR1(RS_All0,RS_All0a)
DEXPORT_OR1(RS_All0,RS_All0a)
DIMPORT_OR1(RS_All0,RS_All0a)

;

SAM_OR1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_OR0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_OR1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_OR0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_OR1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_OR0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_OR1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_OR0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_OR1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_OR0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_OR1.gdx" SAM_OR1;
execute_unload "FEXPORT_OR1.gdx" FEXPORT_OR1;
execute_unload "FIMPORT_OR1.gdx" FIMPORT_OR1;
execute_unload "DEXPORT_OR1.gdx" DEXPORT_OR1;
execute_unload "DIMPORT_OR1.gdx" DIMPORT_OR1;

* Pennsylvania

PARAMETER SAM_PA0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_PA.dat
$INCLUDE 3x1_PA.dat
$INCLUDE 5x1_PA.dat
$INCLUDE 1x2_PA.dat
$INCLUDE 4x2_PA.dat
$INCLUDE 4x3_PA.dat
$INCLUDE 5x3_PA.dat
$INCLUDE 2x4_PA.dat
$INCLUDE 4x4_PA.dat
$INCLUDE 5x4_PA.dat
$INCLUDE 1x5_PA.dat
$INCLUDE 4x5_PA.dat
$INCLUDE 5x5_PA.dat
$INCLUDE 1x6_PA.dat
$INCLUDE 4x6_PA.dat
$INCLUDE 6x1_PA.dat
$INCLUDE 6x3_PA.dat
$INCLUDE 6x4_PA.dat
/;


PARAMETER FEXPORT_PA0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_PA.dat
$INCLUDE 4x7_PA.dat
/;

PARAMETER FIMPORT_PA0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_PA.dat
$INCLUDE 7x4_PA.dat
/;

PARAMETER DEXPORT_PA0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_PA.dat
$INCLUDE 4x8_PA.dat
/;

PARAMETER DIMPORT_PA0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_PA.dat
$INCLUDE 8x4_PA.dat
/;


PARAMETER
SAM_PA1(RS_All0,RS_All0a)
FEXPORT_PA1(RS_All0,RS_All0a)
FIMPORT_PA1(RS_All0,RS_All0a)
DEXPORT_PA1(RS_All0,RS_All0a)
DIMPORT_PA1(RS_All0,RS_All0a)

;

SAM_PA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_PA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_PA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_PA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_PA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_PA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_PA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_PA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_PA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_PA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_PA1.gdx" SAM_PA1;
execute_unload "FEXPORT_PA1.gdx" FEXPORT_PA1;
execute_unload "FIMPORT_PA1.gdx" FIMPORT_PA1;
execute_unload "DEXPORT_PA1.gdx" DEXPORT_PA1;
execute_unload "DIMPORT_PA1.gdx" DIMPORT_PA1;

* Rhode Island

PARAMETER SAM_RI0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_RI.dat
$INCLUDE 3x1_RI.dat
$INCLUDE 5x1_RI.dat
$INCLUDE 1x2_RI.dat
$INCLUDE 4x2_RI.dat
$INCLUDE 4x3_RI.dat
$INCLUDE 5x3_RI.dat
$INCLUDE 2x4_RI.dat
$INCLUDE 4x4_RI.dat
$INCLUDE 5x4_RI.dat
$INCLUDE 1x5_RI.dat
$INCLUDE 4x5_RI.dat
$INCLUDE 5x5_RI.dat
$INCLUDE 1x6_RI.dat
$INCLUDE 4x6_RI.dat
$INCLUDE 6x1_RI.dat
$INCLUDE 6x3_RI.dat
$INCLUDE 6x4_RI.dat
/;


PARAMETER FEXPORT_RI0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_RI.dat
$INCLUDE 4x7_RI.dat
/;

PARAMETER FIMPORT_RI0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_RI.dat
$INCLUDE 7x4_RI.dat
/;

PARAMETER DEXPORT_RI0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_RI.dat
$INCLUDE 4x8_RI.dat
/;

PARAMETER DIMPORT_RI0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_RI.dat
$INCLUDE 8x4_RI.dat
/;


PARAMETER
SAM_RI1(RS_All0,RS_All0a)
FEXPORT_RI1(RS_All0,RS_All0a)
FIMPORT_RI1(RS_All0,RS_All0a)
DEXPORT_RI1(RS_All0,RS_All0a)
DIMPORT_RI1(RS_All0,RS_All0a)

;

SAM_RI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_RI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_RI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_RI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_RI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_RI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_RI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_RI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_RI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_RI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_RI1.gdx" SAM_RI1;
execute_unload "FEXPORT_RI1.gdx" FEXPORT_RI1;
execute_unload "FIMPORT_RI1.gdx" FIMPORT_RI1;
execute_unload "DEXPORT_RI1.gdx" DEXPORT_RI1;
execute_unload "DIMPORT_RI1.gdx" DIMPORT_RI1;

* South Carolina

PARAMETER SAM_SC0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_SC.dat
$INCLUDE 3x1_SC.dat
$INCLUDE 5x1_SC.dat
$INCLUDE 1x2_SC.dat
$INCLUDE 4x2_SC.dat
$INCLUDE 4x3_SC.dat
$INCLUDE 5x3_SC.dat
$INCLUDE 2x4_SC.dat
$INCLUDE 4x4_SC.dat
$INCLUDE 5x4_SC.dat
$INCLUDE 1x5_SC.dat
$INCLUDE 4x5_SC.dat
$INCLUDE 5x5_SC.dat
$INCLUDE 1x6_SC.dat
$INCLUDE 4x6_SC.dat
$INCLUDE 6x1_SC.dat
$INCLUDE 6x3_SC.dat
$INCLUDE 6x4_SC.dat
/;


PARAMETER FEXPORT_SC0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_SC.dat
$INCLUDE 4x7_SC.dat
/;

PARAMETER FIMPORT_SC0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_SC.dat
$INCLUDE 7x4_SC.dat
/;

PARAMETER DEXPORT_SC0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_SC.dat
$INCLUDE 4x8_SC.dat
/;

PARAMETER DIMPORT_SC0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_SC.dat
$INCLUDE 8x4_SC.dat
/;


PARAMETER
SAM_SC1(RS_All0,RS_All0a)
FEXPORT_SC1(RS_All0,RS_All0a)
FIMPORT_SC1(RS_All0,RS_All0a)
DEXPORT_SC1(RS_All0,RS_All0a)
DIMPORT_SC1(RS_All0,RS_All0a)

;

SAM_SC1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_SC0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_SC1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_SC0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_SC1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_SC0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_SC1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_SC0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_SC1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_SC0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_SC1.gdx" SAM_SC1;
execute_unload "FEXPORT_SC1.gdx" FEXPORT_SC1;
execute_unload "FIMPORT_SC1.gdx" FIMPORT_SC1;
execute_unload "DEXPORT_SC1.gdx" DEXPORT_SC1;
execute_unload "DIMPORT_SC1.gdx" DIMPORT_SC1;

* South Dakota

PARAMETER SAM_SD0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_SD.dat
$INCLUDE 3x1_SD.dat
$INCLUDE 5x1_SD.dat
$INCLUDE 1x2_SD.dat
$INCLUDE 4x2_SD.dat
$INCLUDE 4x3_SD.dat
$INCLUDE 5x3_SD.dat
$INCLUDE 2x4_SD.dat
$INCLUDE 4x4_SD.dat
$INCLUDE 5x4_SD.dat
$INCLUDE 1x5_SD.dat
$INCLUDE 4x5_SD.dat
$INCLUDE 5x5_SD.dat
$INCLUDE 1x6_SD.dat
$INCLUDE 4x6_SD.dat
$INCLUDE 6x1_SD.dat
$INCLUDE 6x3_SD.dat
$INCLUDE 6x4_SD.dat
/;


PARAMETER FEXPORT_SD0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_SD.dat
$INCLUDE 4x7_SD.dat
/;

PARAMETER FIMPORT_SD0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_SD.dat
$INCLUDE 7x4_SD.dat
/;

PARAMETER DEXPORT_SD0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_SD.dat
$INCLUDE 4x8_SD.dat
/;

PARAMETER DIMPORT_SD0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_SD.dat
$INCLUDE 8x4_SD.dat
/;


PARAMETER
SAM_SD1(RS_All0,RS_All0a)
FEXPORT_SD1(RS_All0,RS_All0a)
FIMPORT_SD1(RS_All0,RS_All0a)
DEXPORT_SD1(RS_All0,RS_All0a)
DIMPORT_SD1(RS_All0,RS_All0a)

;

SAM_SD1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_SD0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_SD1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_SD0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_SD1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_SD0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_SD1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_SD0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_SD1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_SD0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_SD1.gdx" SAM_SD1;
execute_unload "FEXPORT_SD1.gdx" FEXPORT_SD1;
execute_unload "FIMPORT_SD1.gdx" FIMPORT_SD1;
execute_unload "DEXPORT_SD1.gdx" DEXPORT_SD1;
execute_unload "DIMPORT_SD1.gdx" DIMPORT_SD1;

* Tennessee

PARAMETER SAM_TN0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_TN.dat
$INCLUDE 3x1_TN.dat
$INCLUDE 5x1_TN.dat
$INCLUDE 1x2_TN.dat
$INCLUDE 4x2_TN.dat
$INCLUDE 4x3_TN.dat
$INCLUDE 5x3_TN.dat
$INCLUDE 2x4_TN.dat
$INCLUDE 4x4_TN.dat
$INCLUDE 5x4_TN.dat
$INCLUDE 1x5_TN.dat
$INCLUDE 4x5_TN.dat
$INCLUDE 5x5_TN.dat
$INCLUDE 1x6_TN.dat
$INCLUDE 4x6_TN.dat
$INCLUDE 6x1_TN.dat
$INCLUDE 6x3_TN.dat
$INCLUDE 6x4_TN.dat
/;


PARAMETER FEXPORT_TN0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_TN.dat
$INCLUDE 4x7_TN.dat
/;

PARAMETER FIMPORT_TN0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_TN.dat
$INCLUDE 7x4_TN.dat
/;

PARAMETER DEXPORT_TN0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_TN.dat
$INCLUDE 4x8_TN.dat
/;

PARAMETER DIMPORT_TN0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_TN.dat
$INCLUDE 8x4_TN.dat
/;


PARAMETER
SAM_TN1(RS_All0,RS_All0a)
FEXPORT_TN1(RS_All0,RS_All0a)
FIMPORT_TN1(RS_All0,RS_All0a)
DEXPORT_TN1(RS_All0,RS_All0a)
DIMPORT_TN1(RS_All0,RS_All0a)

;

SAM_TN1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_TN0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_TN1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_TN0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_TN1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_TN0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_TN1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_TN0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_TN1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_TN0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_TN1.gdx" SAM_TN1;
execute_unload "FEXPORT_TN1.gdx" FEXPORT_TN1;
execute_unload "FIMPORT_TN1.gdx" FIMPORT_TN1;
execute_unload "DEXPORT_TN1.gdx" DEXPORT_TN1;
execute_unload "DIMPORT_TN1.gdx" DIMPORT_TN1;

* Texas

PARAMETER SAM_TX0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_TX.dat
$INCLUDE 3x1_TX.dat
$INCLUDE 5x1_TX.dat
$INCLUDE 1x2_TX.dat
$INCLUDE 4x2_TX.dat
$INCLUDE 4x3_TX.dat
$INCLUDE 5x3_TX.dat
$INCLUDE 2x4_TX.dat
$INCLUDE 4x4_TX.dat
$INCLUDE 5x4_TX.dat
$INCLUDE 1x5_TX.dat
$INCLUDE 4x5_TX.dat
$INCLUDE 5x5_TX.dat
$INCLUDE 1x6_TX.dat
$INCLUDE 4x6_TX.dat
$INCLUDE 6x1_TX.dat
$INCLUDE 6x3_TX.dat
$INCLUDE 6x4_TX.dat
/;


PARAMETER FEXPORT_TX0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_TX.dat
$INCLUDE 4x7_TX.dat
/;

PARAMETER FIMPORT_TX0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_TX.dat
$INCLUDE 7x4_TX.dat
/;

PARAMETER DEXPORT_TX0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_TX.dat
$INCLUDE 4x8_TX.dat
/;

PARAMETER DIMPORT_TX0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_TX.dat
$INCLUDE 8x4_TX.dat
/;


PARAMETER
SAM_TX1(RS_All0,RS_All0a)
FEXPORT_TX1(RS_All0,RS_All0a)
FIMPORT_TX1(RS_All0,RS_All0a)
DEXPORT_TX1(RS_All0,RS_All0a)
DIMPORT_TX1(RS_All0,RS_All0a)

;

SAM_TX1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_TX0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_TX1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_TX0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_TX1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_TX0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_TX1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_TX0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_TX1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_TX0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_TX1.gdx" SAM_TX1;
execute_unload "FEXPORT_TX1.gdx" FEXPORT_TX1;
execute_unload "FIMPORT_TX1.gdx" FIMPORT_TX1;
execute_unload "DEXPORT_TX1.gdx" DEXPORT_TX1;
execute_unload "DIMPORT_TX1.gdx" DIMPORT_TX1;

* Utah

PARAMETER SAM_UT0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_UT.dat
$INCLUDE 3x1_UT.dat
$INCLUDE 5x1_UT.dat
$INCLUDE 1x2_UT.dat
$INCLUDE 4x2_UT.dat
$INCLUDE 4x3_UT.dat
$INCLUDE 5x3_UT.dat
$INCLUDE 2x4_UT.dat
$INCLUDE 4x4_UT.dat
$INCLUDE 5x4_UT.dat
$INCLUDE 1x5_UT.dat
$INCLUDE 4x5_UT.dat
$INCLUDE 5x5_UT.dat
$INCLUDE 1x6_UT.dat
$INCLUDE 4x6_UT.dat
$INCLUDE 6x1_UT.dat
$INCLUDE 6x3_UT.dat
$INCLUDE 6x4_UT.dat
/;


PARAMETER FEXPORT_UT0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_UT.dat
$INCLUDE 4x7_UT.dat
/;

PARAMETER FIMPORT_UT0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_UT.dat
$INCLUDE 7x4_UT.dat
/;

PARAMETER DEXPORT_UT0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_UT.dat
$INCLUDE 4x8_UT.dat
/;

PARAMETER DIMPORT_UT0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_UT.dat
$INCLUDE 8x4_UT.dat
/;


PARAMETER
SAM_UT1(RS_All0,RS_All0a)
FEXPORT_UT1(RS_All0,RS_All0a)
FIMPORT_UT1(RS_All0,RS_All0a)
DEXPORT_UT1(RS_All0,RS_All0a)
DIMPORT_UT1(RS_All0,RS_All0a)

;

SAM_UT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_UT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_UT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_UT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_UT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_UT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_UT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_UT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_UT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_UT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_UT1.gdx" SAM_UT1;
execute_unload "FEXPORT_UT1.gdx" FEXPORT_UT1;
execute_unload "FIMPORT_UT1.gdx" FIMPORT_UT1;
execute_unload "DEXPORT_UT1.gdx" DEXPORT_UT1;
execute_unload "DIMPORT_UT1.gdx" DIMPORT_UT1;

* Virginia

PARAMETER SAM_VA0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_VA.dat
$INCLUDE 3x1_VA.dat
$INCLUDE 5x1_VA.dat
$INCLUDE 1x2_VA.dat
$INCLUDE 4x2_VA.dat
$INCLUDE 4x3_VA.dat
$INCLUDE 5x3_VA.dat
$INCLUDE 2x4_VA.dat
$INCLUDE 4x4_VA.dat
$INCLUDE 5x4_VA.dat
$INCLUDE 1x5_VA.dat
$INCLUDE 4x5_VA.dat
$INCLUDE 5x5_VA.dat
$INCLUDE 1x6_VA.dat
$INCLUDE 4x6_VA.dat
$INCLUDE 6x1_VA.dat
$INCLUDE 6x3_VA.dat
$INCLUDE 6x4_VA.dat
/;


PARAMETER FEXPORT_VA0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_VA.dat
$INCLUDE 4x7_VA.dat
/;

PARAMETER FIMPORT_VA0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_VA.dat
$INCLUDE 7x4_VA.dat
/;

PARAMETER DEXPORT_VA0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_VA.dat
$INCLUDE 4x8_VA.dat
/;

PARAMETER DIMPORT_VA0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_VA.dat
$INCLUDE 8x4_VA.dat
/;


PARAMETER
SAM_VA1(RS_All0,RS_All0a)
FEXPORT_VA1(RS_All0,RS_All0a)
FIMPORT_VA1(RS_All0,RS_All0a)
DEXPORT_VA1(RS_All0,RS_All0a)
DIMPORT_VA1(RS_All0,RS_All0a)

;

SAM_VA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_VA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_VA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_VA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_VA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_VA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_VA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_VA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_VA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_VA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_VA1.gdx" SAM_VA1;
execute_unload "FEXPORT_VA1.gdx" FEXPORT_VA1;
execute_unload "FIMPORT_VA1.gdx" FIMPORT_VA1;
execute_unload "DEXPORT_VA1.gdx" DEXPORT_VA1;
execute_unload "DIMPORT_VA1.gdx" DIMPORT_VA1;

* Vermont

PARAMETER SAM_VT0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_VT.dat
$INCLUDE 3x1_VT.dat
$INCLUDE 5x1_VT.dat
$INCLUDE 1x2_VT.dat
$INCLUDE 4x2_VT.dat
$INCLUDE 4x3_VT.dat
$INCLUDE 5x3_VT.dat
$INCLUDE 2x4_VT.dat
$INCLUDE 4x4_VT.dat
$INCLUDE 5x4_VT.dat
$INCLUDE 1x5_VT.dat
$INCLUDE 4x5_VT.dat
$INCLUDE 5x5_VT.dat
$INCLUDE 1x6_VT.dat
$INCLUDE 4x6_VT.dat
$INCLUDE 6x1_VT.dat
$INCLUDE 6x3_VT.dat
$INCLUDE 6x4_VT.dat
/;


PARAMETER FEXPORT_VT0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_VT.dat
$INCLUDE 4x7_VT.dat
/;

PARAMETER FIMPORT_VT0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_VT.dat
$INCLUDE 7x4_VT.dat
/;

PARAMETER DEXPORT_VT0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_VT.dat
$INCLUDE 4x8_VT.dat
/;

PARAMETER DIMPORT_VT0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_VT.dat
$INCLUDE 8x4_VT.dat
/;


PARAMETER
SAM_VT1(RS_All0,RS_All0a)
FEXPORT_VT1(RS_All0,RS_All0a)
FIMPORT_VT1(RS_All0,RS_All0a)
DEXPORT_VT1(RS_All0,RS_All0a)
DIMPORT_VT1(RS_All0,RS_All0a)

;

SAM_VT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_VT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_VT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_VT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_VT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_VT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_VT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_VT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_VT1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_VT0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_VT1.gdx" SAM_VT1;
execute_unload "FEXPORT_VT1.gdx" FEXPORT_VT1;
execute_unload "FIMPORT_VT1.gdx" FIMPORT_VT1;
execute_unload "DEXPORT_VT1.gdx" DEXPORT_VT1;
execute_unload "DIMPORT_VT1.gdx" DIMPORT_VT1;

* Washington

PARAMETER SAM_WA0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_WA.dat
$INCLUDE 3x1_WA.dat
$INCLUDE 5x1_WA.dat
$INCLUDE 1x2_WA.dat
$INCLUDE 4x2_WA.dat
$INCLUDE 4x3_WA.dat
$INCLUDE 5x3_WA.dat
$INCLUDE 2x4_WA.dat
$INCLUDE 4x4_WA.dat
$INCLUDE 5x4_WA.dat
$INCLUDE 1x5_WA.dat
$INCLUDE 4x5_WA.dat
$INCLUDE 5x5_WA.dat
$INCLUDE 1x6_WA.dat
$INCLUDE 4x6_WA.dat
$INCLUDE 6x1_WA.dat
$INCLUDE 6x3_WA.dat
$INCLUDE 6x4_WA.dat
/;


PARAMETER FEXPORT_WA0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_WA.dat
$INCLUDE 4x7_WA.dat
/;

PARAMETER FIMPORT_WA0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_WA.dat
$INCLUDE 7x4_WA.dat
/;

PARAMETER DEXPORT_WA0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_WA.dat
$INCLUDE 4x8_WA.dat
/;

PARAMETER DIMPORT_WA0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_WA.dat
$INCLUDE 8x4_WA.dat
/;


PARAMETER
SAM_WA1(RS_All0,RS_All0a)
FEXPORT_WA1(RS_All0,RS_All0a)
FIMPORT_WA1(RS_All0,RS_All0a)
DEXPORT_WA1(RS_All0,RS_All0a)
DIMPORT_WA1(RS_All0,RS_All0a)

;

SAM_WA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_WA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_WA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_WA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_WA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_WA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_WA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_WA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_WA1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_WA0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_WA1.gdx" SAM_WA1;
execute_unload "FEXPORT_WA1.gdx" FEXPORT_WA1;
execute_unload "FIMPORT_WA1.gdx" FIMPORT_WA1;
execute_unload "DEXPORT_WA1.gdx" DEXPORT_WA1;
execute_unload "DIMPORT_WA1.gdx" DIMPORT_WA1;

* Wisconsin

PARAMETER SAM_WI0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_WI.dat
$INCLUDE 3x1_WI.dat
$INCLUDE 5x1_WI.dat
$INCLUDE 1x2_WI.dat
$INCLUDE 4x2_WI.dat
$INCLUDE 4x3_WI.dat
$INCLUDE 5x3_WI.dat
$INCLUDE 2x4_WI.dat
$INCLUDE 4x4_WI.dat
$INCLUDE 5x4_WI.dat
$INCLUDE 1x5_WI.dat
$INCLUDE 4x5_WI.dat
$INCLUDE 5x5_WI.dat
$INCLUDE 1x6_WI.dat
$INCLUDE 4x6_WI.dat
$INCLUDE 6x1_WI.dat
$INCLUDE 6x3_WI.dat
$INCLUDE 6x4_WI.dat
/;


PARAMETER FEXPORT_WI0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_WI.dat
$INCLUDE 4x7_WI.dat
/;

PARAMETER FIMPORT_WI0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_WI.dat
$INCLUDE 7x4_WI.dat
/;

PARAMETER DEXPORT_WI0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_WI.dat
$INCLUDE 4x8_WI.dat
/;

PARAMETER DIMPORT_WI0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_WI.dat
$INCLUDE 8x4_WI.dat
/;


PARAMETER
SAM_WI1(RS_All0,RS_All0a)
FEXPORT_WI1(RS_All0,RS_All0a)
FIMPORT_WI1(RS_All0,RS_All0a)
DEXPORT_WI1(RS_All0,RS_All0a)
DIMPORT_WI1(RS_All0,RS_All0a)

;

SAM_WI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_WI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_WI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_WI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_WI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_WI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_WI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_WI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_WI1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_WI0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_WI1.gdx" SAM_WI1;
execute_unload "FEXPORT_WI1.gdx" FEXPORT_WI1;
execute_unload "FIMPORT_WI1.gdx" FIMPORT_WI1;
execute_unload "DEXPORT_WI1.gdx" DEXPORT_WI1;
execute_unload "DIMPORT_WI1.gdx" DIMPORT_WI1;

* West Virginia

PARAMETER SAM_WV0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_WV.dat
$INCLUDE 3x1_WV.dat
$INCLUDE 5x1_WV.dat
$INCLUDE 1x2_WV.dat
$INCLUDE 4x2_WV.dat
$INCLUDE 4x3_WV.dat
$INCLUDE 5x3_WV.dat
$INCLUDE 2x4_WV.dat
$INCLUDE 4x4_WV.dat
$INCLUDE 5x4_WV.dat
$INCLUDE 1x5_WV.dat
$INCLUDE 4x5_WV.dat
$INCLUDE 5x5_WV.dat
$INCLUDE 1x6_WV.dat
$INCLUDE 4x6_WV.dat
$INCLUDE 6x1_WV.dat
$INCLUDE 6x3_WV.dat
$INCLUDE 6x4_WV.dat
/;


PARAMETER FEXPORT_WV0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_WV.dat
$INCLUDE 4x7_WV.dat
/;

PARAMETER FIMPORT_WV0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_WV.dat
$INCLUDE 7x4_WV.dat
/;

PARAMETER DEXPORT_WV0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_WV.dat
$INCLUDE 4x8_WV.dat
/;

PARAMETER DIMPORT_WV0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_WV.dat
$INCLUDE 8x4_WV.dat
/;


PARAMETER
SAM_WV1(RS_All0,RS_All0a)
FEXPORT_WV1(RS_All0,RS_All0a)
FIMPORT_WV1(RS_All0,RS_All0a)
DEXPORT_WV1(RS_All0,RS_All0a)
DIMPORT_WV1(RS_All0,RS_All0a)

;

SAM_WV1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_WV0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_WV1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_WV0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_WV1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_WV0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_WV1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_WV0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_WV1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_WV0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_WV1.gdx" SAM_WV1;
execute_unload "FEXPORT_WV1.gdx" FEXPORT_WV1;
execute_unload "FIMPORT_WV1.gdx" FIMPORT_WV1;
execute_unload "DEXPORT_WV1.gdx" DEXPORT_WV1;
execute_unload "DIMPORT_WV1.gdx" DIMPORT_WV1;

* Wyoming

PARAMETER SAM_WY0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_WY.dat
$INCLUDE 3x1_WY.dat
$INCLUDE 5x1_WY.dat
$INCLUDE 1x2_WY.dat
$INCLUDE 4x2_WY.dat
$INCLUDE 4x3_WY.dat
$INCLUDE 5x3_WY.dat
$INCLUDE 2x4_WY.dat
$INCLUDE 4x4_WY.dat
$INCLUDE 5x4_WY.dat
$INCLUDE 1x5_WY.dat
$INCLUDE 4x5_WY.dat
$INCLUDE 5x5_WY.dat
$INCLUDE 1x6_WY.dat
$INCLUDE 4x6_WY.dat
$INCLUDE 6x1_WY.dat
$INCLUDE 6x3_WY.dat
$INCLUDE 6x4_WY.dat
/;


PARAMETER FEXPORT_WY0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_WY.dat
$INCLUDE 4x7_WY.dat
/;

PARAMETER FIMPORT_WY0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_WY.dat
$INCLUDE 7x4_WY.dat
/;

PARAMETER DEXPORT_WY0(*,*)   Domestic commodity exports  /
$INCLUDE 1x8_WY.dat
$INCLUDE 4x8_WY.dat
/;

PARAMETER DIMPORT_WY0(*,*)   Domestic commodity imports   /
$INCLUDE 8x1_WY.dat
$INCLUDE 8x4_WY.dat
/;


PARAMETER
SAM_WY1(RS_All0,RS_All0a)
FEXPORT_WY1(RS_All0,RS_All0a)
FIMPORT_WY1(RS_All0,RS_All0a)
DEXPORT_WY1(RS_All0,RS_All0a)
DIMPORT_WY1(RS_All0,RS_All0a)

;

SAM_WY1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_WY0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_WY1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_WY0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_WY1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_WY0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DEXPORT_WY1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DEXPORT_WY0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
DIMPORT_WY1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,DIMPORT_WY0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));


execute_unload "SAM_WY1.gdx" SAM_WY1;
execute_unload "FEXPORT_WY1.gdx" FEXPORT_WY1;
execute_unload "FIMPORT_WY1.gdx" FIMPORT_WY1;
execute_unload "DEXPORT_WY1.gdx" DEXPORT_WY1;
execute_unload "DIMPORT_WY1.gdx" DIMPORT_WY1;

* ------------------------------------------------------------------------------
* Aggregate state-level data into a single parameter
* ------------------------------------------------------------------------------




SAM_FULL_S(RS_All0,RS_All0a,'s1') = SAM_AL1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s2') = SAM_AK1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s3') = SAM_AZ1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s4') = SAM_AR1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s5') = SAM_CA1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s6') = SAM_CO1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s7') = SAM_CT1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s8') = SAM_DE1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s9') = SAM_DC1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s10') = SAM_FL1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s11') = SAM_GA1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s12') = SAM_HI1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s13') = SAM_ID1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s14') = SAM_IL1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s15') = SAM_IN1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s16') = SAM_IA1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s17') = SAM_KS1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s18') = SAM_KY1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s19') = SAM_LA1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s20') = SAM_ME1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s21') = SAM_MD1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s22') = SAM_MA1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s23') = SAM_MI1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s24') = SAM_MN1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s25') = SAM_MS1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s26') = SAM_MO1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s27') = SAM_MT1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s28') = SAM_NE1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s29') = SAM_NV1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s30') = SAM_NH1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s31') = SAM_NJ1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s32') = SAM_NM1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s33') = SAM_NY1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s34') = SAM_NC1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s35') = SAM_ND1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s36') = SAM_OH1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s37') = SAM_OK1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s38') = SAM_OR1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s39') = SAM_PA1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s40') = SAM_RI1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s41') = SAM_SC1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s42') = SAM_SD1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s43') = SAM_TN1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s44') = SAM_TX1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s45') = SAM_UT1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s47') = SAM_VA1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s46') = SAM_VT1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s48') = SAM_WA1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s49') = SAM_WI1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s50') = SAM_WV1(RS_All0,RS_All0a);
SAM_FULL_S(RS_All0,RS_All0a,'s51') = SAM_WY1(RS_All0,RS_All0a);


FEXPORT_FULL_S(RS_All0,RS_All0a,'s1') = FEXPORT_AL1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s2') = FEXPORT_AK1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s3') = FEXPORT_AZ1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s4') = FEXPORT_AR1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s5') = FEXPORT_CA1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s6') = FEXPORT_CO1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s7') = FEXPORT_CT1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s8') = FEXPORT_DE1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s9') = FEXPORT_DC1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s10') = FEXPORT_FL1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s11') = FEXPORT_GA1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s12') = FEXPORT_HI1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s13') = FEXPORT_ID1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s14') = FEXPORT_IL1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s15') = FEXPORT_IN1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s16') = FEXPORT_IA1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s17') = FEXPORT_KS1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s18') = FEXPORT_KY1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s19') = FEXPORT_LA1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s20') = FEXPORT_ME1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s21') = FEXPORT_MD1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s22') = FEXPORT_MA1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s23') = FEXPORT_MI1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s24') = FEXPORT_MN1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s25') = FEXPORT_MS1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s26') = FEXPORT_MO1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s27') = FEXPORT_MT1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s28') = FEXPORT_NE1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s29') = FEXPORT_NV1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s30') = FEXPORT_NH1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s31') = FEXPORT_NJ1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s32') = FEXPORT_NM1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s33') = FEXPORT_NY1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s34') = FEXPORT_NC1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s35') = FEXPORT_ND1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s36') = FEXPORT_OH1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s37') = FEXPORT_OK1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s38') = FEXPORT_OR1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s39') = FEXPORT_PA1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s40') = FEXPORT_RI1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s41') = FEXPORT_SC1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s42') = FEXPORT_SD1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s43') = FEXPORT_TN1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s44') = FEXPORT_TX1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s45') = FEXPORT_UT1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s47') = FEXPORT_VA1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s46') = FEXPORT_VT1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s48') = FEXPORT_WA1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s49') = FEXPORT_WI1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s50') = FEXPORT_WV1(RS_All0,RS_All0a);
FEXPORT_FULL_S(RS_All0,RS_All0a,'s51') = FEXPORT_WY1(RS_All0,RS_All0a);

FIMPORT_FULL_S(RS_All0,RS_All0a,'s1') = FIMPORT_AL1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s2') = FIMPORT_AK1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s3') = FIMPORT_AZ1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s4') = FIMPORT_AR1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s5') = FIMPORT_CA1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s6') = FIMPORT_CO1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s7') = FIMPORT_CT1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s8') = FIMPORT_DE1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s9') = FIMPORT_DC1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s10') = FIMPORT_FL1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s11') = FIMPORT_GA1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s12') = FIMPORT_HI1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s13') = FIMPORT_ID1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s14') = FIMPORT_IL1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s15') = FIMPORT_IN1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s16') = FIMPORT_IA1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s17') = FIMPORT_KS1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s18') = FIMPORT_KY1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s19') = FIMPORT_LA1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s20') = FIMPORT_ME1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s21') = FIMPORT_MD1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s22') = FIMPORT_MA1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s23') = FIMPORT_MI1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s24') = FIMPORT_MN1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s25') = FIMPORT_MS1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s26') = FIMPORT_MO1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s27') = FIMPORT_MT1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s28') = FIMPORT_NE1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s29') = FIMPORT_NV1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s30') = FIMPORT_NH1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s31') = FIMPORT_NJ1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s32') = FIMPORT_NM1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s33') = FIMPORT_NY1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s34') = FIMPORT_NC1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s35') = FIMPORT_ND1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s36') = FIMPORT_OH1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s37') = FIMPORT_OK1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s38') = FIMPORT_OR1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s39') = FIMPORT_PA1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s40') = FIMPORT_RI1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s41') = FIMPORT_SC1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s42') = FIMPORT_SD1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s43') = FIMPORT_TN1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s44') = FIMPORT_TX1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s45') = FIMPORT_UT1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s47') = FIMPORT_VA1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s46') = FIMPORT_VT1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s48') = FIMPORT_WA1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s49') = FIMPORT_WI1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s50') = FIMPORT_WV1(RS_All0,RS_All0a);
FIMPORT_FULL_S(RS_All0,RS_All0a,'s51') = FIMPORT_WY1(RS_All0,RS_All0a);

DEXPORT_FULL_S(RS_All0,RS_All0a,'s1') = DEXPORT_AL1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s2') = DEXPORT_AK1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s3') = DEXPORT_AZ1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s4') = DEXPORT_AR1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s5') = DEXPORT_CA1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s6') = DEXPORT_CO1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s7') = DEXPORT_CT1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s8') = DEXPORT_DE1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s9') = DEXPORT_DC1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s10') = DEXPORT_FL1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s11') = DEXPORT_GA1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s12') = DEXPORT_HI1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s13') = DEXPORT_ID1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s14') = DEXPORT_IL1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s15') = DEXPORT_IN1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s16') = DEXPORT_IA1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s17') = DEXPORT_KS1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s18') = DEXPORT_KY1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s19') = DEXPORT_LA1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s20') = DEXPORT_ME1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s21') = DEXPORT_MD1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s22') = DEXPORT_MA1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s23') = DEXPORT_MI1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s24') = DEXPORT_MN1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s25') = DEXPORT_MS1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s26') = DEXPORT_MO1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s27') = DEXPORT_MT1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s28') = DEXPORT_NE1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s29') = DEXPORT_NV1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s30') = DEXPORT_NH1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s31') = DEXPORT_NJ1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s32') = DEXPORT_NM1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s33') = DEXPORT_NY1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s34') = DEXPORT_NC1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s35') = DEXPORT_ND1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s36') = DEXPORT_OH1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s37') = DEXPORT_OK1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s38') = DEXPORT_OR1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s39') = DEXPORT_PA1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s40') = DEXPORT_RI1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s41') = DEXPORT_SC1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s42') = DEXPORT_SD1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s43') = DEXPORT_TN1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s44') = DEXPORT_TX1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s45') = DEXPORT_UT1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s47') = DEXPORT_VA1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s46') = DEXPORT_VT1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s48') = DEXPORT_WA1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s49') = DEXPORT_WI1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s50') = DEXPORT_WV1(RS_All0,RS_All0a);
DEXPORT_FULL_S(RS_All0,RS_All0a,'s51') = DEXPORT_WY1(RS_All0,RS_All0a);

DIMPORT_FULL_S(RS_All0,RS_All0a,'s1') = DIMPORT_AL1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s2') = DIMPORT_AK1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s3') = DIMPORT_AZ1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s4') = DIMPORT_AR1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s5') = DIMPORT_CA1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s6') = DIMPORT_CO1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s7') = DIMPORT_CT1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s8') = DIMPORT_DE1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s9') = DIMPORT_DC1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s10') = DIMPORT_FL1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s11') = DIMPORT_GA1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s12') = DIMPORT_HI1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s13') = DIMPORT_ID1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s14') = DIMPORT_IL1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s15') = DIMPORT_IN1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s16') = DIMPORT_IA1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s17') = DIMPORT_KS1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s18') = DIMPORT_KY1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s19') = DIMPORT_LA1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s20') = DIMPORT_ME1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s21') = DIMPORT_MD1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s22') = DIMPORT_MA1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s23') = DIMPORT_MI1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s24') = DIMPORT_MN1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s25') = DIMPORT_MS1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s26') = DIMPORT_MO1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s27') = DIMPORT_MT1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s28') = DIMPORT_NE1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s29') = DIMPORT_NV1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s30') = DIMPORT_NH1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s31') = DIMPORT_NJ1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s32') = DIMPORT_NM1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s33') = DIMPORT_NY1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s34') = DIMPORT_NC1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s35') = DIMPORT_ND1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s36') = DIMPORT_OH1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s37') = DIMPORT_OK1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s38') = DIMPORT_OR1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s39') = DIMPORT_PA1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s40') = DIMPORT_RI1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s41') = DIMPORT_SC1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s42') = DIMPORT_SD1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s43') = DIMPORT_TN1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s44') = DIMPORT_TX1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s45') = DIMPORT_UT1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s47') = DIMPORT_VA1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s46') = DIMPORT_VT1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s48') = DIMPORT_WA1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s49') = DIMPORT_WI1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s50') = DIMPORT_WV1(RS_All0,RS_All0a);
DIMPORT_FULL_S(RS_All0,RS_All0a,'s51') = DIMPORT_WY1(RS_All0,RS_All0a);


execute_unload "SAM_FULL_S.gdx" SAM_FULL_S;
execute_unload "FEXPORT_FULL_S.gdx" FEXPORT_FULL_S;
execute_unload "FIMPORT_FULL_S.gdx" FIMPORT_FULL_S;
execute_unload "DEXPORT_FULL_S.gdx" DEXPORT_FULL_S;
execute_unload "DIMPORT_FULL_S.gdx" DIMPORT_FULL_S;


* ------------------------------------------------------------------------------
* Import data
* ------------------------------------------------------------------------------

execute_loadpoint "SAM_FULL_S.gdx" SAM_FULL_S;
execute_loadpoint "FEXPORT_FULL_S.gdx" FEXPORT_FULL_S;
execute_loadpoint "FIMPORT_FULL_S.gdx" FIMPORT_FULL_S;
execute_loadpoint "DEXPORT_FULL_S.gdx" DEXPORT_FULL_S;
execute_loadpoint "DIMPORT_FULL_S.gdx" DIMPORT_FULL_S;
