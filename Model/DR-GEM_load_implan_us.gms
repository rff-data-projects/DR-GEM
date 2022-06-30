$TITLE Implan Social Accounting Matrix -- US$

* ------------------------------------------------------------------------------
* Define implan labels
* ------------------------------------------------------------------------------

SET Implan1_All0 /

* INDUSTRIES = R1

1        Agriculture
15        Forestry and Fishing
20        Oil&Gas Extraction
22        Coal Mining
23        Other Mining
37        Mining Services
41        Electric Generation
49        Electric Transmission and Distribution
50        Natural Gas Distribution
51        Other Utilities
52        Construction
65        Food Beverage Tobacco
112        Textile Mills and Textile Product Mills
124        Apparel and Leather
134        Wood Products
146        Paper Products
154        Printing
156        Petroleum Refining
157        Other Petroleum and Coal Products
161        Chemicals
188        Plastics and Rubber
199        Nonmetallic Mineral Products
217        Iron and Steel
221        Aluminum
225        Other Nonferrous Metals
229        Foundries
231        Fabricated Metals
262        Machinery
301        Computers and Electronics
325        Electrical Equipment Appliances Components
343        Motor Vehicles Bodies and Trailers and Parts
357        Other Transportation Equipment
368        Furniture and Related Products
379        Misc Manufacturing
395        Wholesale Trade
396        Retail Trade
408        Air Transportation
409        Rail Transportation
410        Water Transportation
411        Truck Transportation
412        Transit and Ground Transportation
413        Pipeline Transportation
414        Other Transportation
416        Warehouse and Storage
417        Information
433        Finance and Insurance
440        Real Estate and Owner-Occupied Housing
442        Rental and Leasing
447        Professional Services
461        Management of Companies
462        Administrative and Waste Services
472        Education
475        Health Care
488        Arts Entertainment Recreation
499        Accomodation and Food
504        Other Services (not government)
518        Federal Government Services
519        Government Elec Utilities
521        State and Local Enterprises
527        Used
528        Scrap
529        ROW Adj
530        NCI
531        Payroll

* COMMODITIES = R2


3001        Agriculture
3015        Forestry and Fishing
3020        Oil&Gas Extraction
3022        Coal Mining
3023        Other Mining
3037        Mining Services
3041        Electric Generation
3049        Electric Transmission and Distribution
3050        Natural Gas Distribution
3051        Other Utilities
3052        Construction
3065        Food Beverage Tobacco
3112        Textile Mills and Textile Product Mills
3124        Apparel and Leather
3134        Wood Products
3146        Paper Products
3154        Printing
3156        Petroleum Refining
3157        Other Petroleum and Coal Products
3161        Chemicals
3188        Plastics and Rubber
3199        Nonmetallic Mineral Products
3217        Iron and Steel
3221        Aluminum
3225        Other Nonferrous Metals
3229        Foundries
3231        Fabricated Metals
3262        Machinery
3301        Computers and Electronics
3325        Electrical Equipment Appliances Components
3343        Motor Vehicles Bodies and Trailers and Parts
3357        Other Transportation Equipment
3368        Furniture and Related Products
3379        Misc Manufacturing
3395        Wholesale Trade
3396        Retail Trade
3408        Air Transportation
3409        Rail Transportation
3410        Water Transportation
3411        Truck Transportation
3412        Transit and Ground Transportation
3413        Pipeline Transportation
3414        Other Transportation
3416        Warehouse and Storage
3417        Information
3433        Finance and Insurance
3440        Real Estate and Owner-Occupied Housing
3442        Rental and Leasing
3447        Professional Services
3461        Management of Companies
3462        Administrative and Waste Services
3472        Education
3475        Health Care
3488        Arts Entertainment Recreation
3499        Accomodation and Food
3504        Other Services (not government)
3518        Federal Government Services
3519        Government Elec Utilities
3521        State and Local Enterprises
3527        Used
3528        Scrap
3529        ROW Adj
3530        NCI
3531        Payroll


* FACTORS = R3

 5001 Employee Compensation
 6001 Proprietary Income
 7001 Other Property Income
 8001 Tax on Production and Imports

* INSTITUTIONS = R4

10001        Households LT15k
10002        Households 15-30k
10003        Households 30-40k
10004        Households 40-50k
10005        Households 50-70k
10006        Households 70-100k
10007        Households 100-150k
10008        Households 150-200k
10009        Households 200k+
11001        Federal Government NonDefense
11002        Federal Government Defense
11003        Federal Government Investment
12001        State-Local Govt NonEducation
12002        State-Local Govt Education
12003        State-Local Govt Investment
13001        Enterprises (Corporations)
14001        Capital
14002        Inventory Additions or Deletions

* Trade = R5

25001 Foreign trade
28001 Domestic Trade

/;

ALIAS (Implan1_All0,Implan1_All0a);

* ------------------------------------------------------------------------------
* Define new labels and map old labels into new labels
* ------------------------------------------------------------------------------

Set RS_All0 /
ind1*ind59
Used
Scrap
Row_adj
NCI
Payroll
c1*c58
cGovUtil
cUsed
cScrap
cRow_adj
cNCI
cPayroll
f1*f4
s1*s18
F_trade
D_trade
/
;

ALIAS (RS_All0,RS_All0a);


Set Implan1_RS_All0(Implan1_All0,RS_All0)    /
1        .        ind1
15        .        ind2
20        .        ind3
22        .        ind4
23        .        ind5
37        .        ind6
41        .        ind7
49        .        ind8
50        .        ind9
51        .        ind10
52        .        ind11
65        .        ind12
112        .        ind13
124        .        ind14
134        .        ind15
146        .        ind16
154        .        ind17
156        .        ind18
157        .        ind19
161        .        ind20
188        .        ind21
199        .        ind22
217        .        ind23
221        .        ind24
225        .        ind25
229        .        ind26
231        .        ind27
262        .        ind28
301        .        ind29
325        .        ind30
343        .        ind31
357        .        ind32
368        .        ind33
379        .        ind34
395        .        ind35
396        .        ind36
408        .        ind37
409        .        ind38
410        .        ind39
411        .        ind40
412        .        ind41
413        .        ind42
414        .        ind43
416        .        ind44
417        .        ind45
433        .        ind46
440        .        ind47
442        .        ind48
447        .        ind49
461        .        ind50
462        .        ind51
472        .        ind52
475        .        ind53
488        .        ind54
499        .        ind55
504        .        ind56
518        .        ind57
519        .        ind58
521        .        ind59
527        .        Used
528        .        Scrap
529        .        Row_adj
530        .        NCI
531        .        Payroll
3001        .        c1
3015        .        c2
3020        .        c3
3022        .        c4
3023        .        c5
3037        .        c6
3041        .        c7
3049        .        c8
3050        .        c9
3051        .        c10
3052        .        c11
3065        .        c12
3112        .        c13
3124        .        c14
3134        .        c15
3146        .        c16
3154        .        c17
3156        .        c18
3157        .        c19
3161        .        c20
3188        .        c21
3199        .        c22
3217        .        c23
3221        .        c24
3225        .        c25
3229        .        c26
3231        .        c27
3262        .        c28
3301        .        c29
3325        .        c30
3343        .        c31
3357        .        c32
3368        .        c33
3379        .        c34
3395        .        c35
3396        .        c36
3408        .        c37
3409        .        c38
3410        .        c39
3411        .        c40
3412        .        c41
3413        .        c42
3414        .        c43
3416        .        c44
3417        .        c45
3433        .        c46
3440        .        c47
3442        .        c48
3447        .        c49
3461        .        c50
3462        .        c51
3472        .        c52
3475        .        c53
3488        .        c54
3499        .        c55
3504        .        c56
3518        .        c57
3519        .        cGovUtil
3521        .        c58
3527        .        cUsed
3528        .        cScrap
3529        .        cRow_adj
3530        .        cNCI
3531        .        cPayroll
5001        .        f1
6001        .        f2
7001        .        f3
8001        .        f4
10001        .        s1
10002        .        s2
10003        .        s3
10004        .        s4
10005        .        s5
10006        .        s6
10007        .        s7
10008        .        s8
10009        .        s9
11001        .        s10
11002        .        s11
11003        .        s12
12001        .        s13
12002        .        s14
12003        .        s15
13001        .        s16
14001        .        s17
14002        .        s18
25001        .        F_trade
28001        .        D_trade
/;


* ------------------------------------------------------------------------------
* Import All Data and Export SAM data
* ------------------------------------------------------------------------------

PARAMETER SAM_US0(Implan1_All0,Implan1_All0a) SAM /


$INCLUDE 2x1_US.dat
$INCLUDE 3x1_US.dat
$INCLUDE 5x1_US.dat
$INCLUDE 1x2_US.dat
$INCLUDE 4x2_US.dat
$INCLUDE 4x3_US.dat
$INCLUDE 5x3_US.dat
$INCLUDE 2x4_US.dat
$INCLUDE 4x4_US.dat
$INCLUDE 5x4_US.dat
$INCLUDE 1x5_US.dat
$INCLUDE 4x5_US.dat
$INCLUDE 5x5_US.dat
$INCLUDE 1x6_US.dat
$INCLUDE 4x6_US.dat
$INCLUDE 6x1_US.dat
$INCLUDE 6x3_US.dat
$INCLUDE 6x4_US.dat
/;


PARAMETER FEXPORT_US0(*,*)   Foreign commodity exports  /
$INCLUDE 1x7_US.dat
$INCLUDE 4x7_US.dat
/;

PARAMETER FIMPORT_US0(*,*)   Foreign commodity imports   /
$INCLUDE 7x1_US.dat
$INCLUDE 7x4_US.dat
/;


PARAMETER
SAM_US1(RS_All0,RS_All0a)
FEXPORT_US1(RS_All0,RS_All0a)
FIMPORT_US1(RS_All0,RS_All0a)

;

SAM_US1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,SAM_US0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FEXPORT_US1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FEXPORT_US0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));
FIMPORT_US1(RS_All0,RS_All0a) = sum(implan1_All0a,(sum(implan1_All0,FIMPORT_US0(implan1_All0,implan1_All0a)*implan1_RS_All0(implan1_All0,RS_All0))*implan1_RS_All0(implan1_All0a,RS_All0a)));

execute_unload "SAM_US.gdx" SAM_US1;
execute_unload "FEXPORT_US.gdx" FEXPORT_US1;
execute_unload "FIMPORT_US.gdx" FIMPORT_US1;

* ------------------------------------------------------------------------------
* Convert into a single datafile
* ------------------------------------------------------------------------------

parameter
SAM_FULL(RS_All0,RS_All0a)
FEXPORT_FULL(RS_All0,RS_All0a)
FIMPORT_FULL(RS_All0,RS_All0a)

;


SAM_FULL(RS_All0,RS_All0a) = SAM_US1(RS_All0,RS_All0a);
FEXPORT_FULL(RS_All0,RS_All0a) = FEXPORT_US1(RS_All0,RS_All0a);
FIMPORT_FULL(RS_All0,RS_All0a) = FIMPORT_US1(RS_All0,RS_All0a);
