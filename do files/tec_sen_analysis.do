*=================================
* name: tec_sen_analysis.do
* databased used: tec_database.dta              
* date: November 20, 2023
* last update: December 22, 2023
*=================================

* Here we peform a set of alternative regressions in 
* order to verify whether our main specification
* is valid. This alternative specification follows 
* Roodman (2009a, 2009b) suggestions. 



use  "$fin\tec_database.dta", clear


// set de database as panel data
xtset code year, yearly delta(2) 


mata: mata set matafavor speed

*=================================
*           SENSITIVE ANALYSIS - SYS-GMM
*=================================


**** COLUMN 1

// 1 lag and collapsing instrument matrix
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 1) c e(b)) ///
iv(health emp_growth, e(l)) ///
ar(2)

outreg2 using "$reg\COL1_Model", word append ctitle (1, 1 LI - C) dec(4)


// 1 lag without collapsing instrument matrix
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 1) e(b)) ///
iv(health emp_growth, e(l)) ///
ar(2)

outreg2 using "$reg\COL1_Model", word append ctitle (2, 1 LI - WC) dec(4)


// 2 lags without collapsing instrument matrix 
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) e(b)) ///
iv(health emp_growth, e(l)) ///
ar(2)

outreg2 using "$reg\COL1_Model", word append ctitle (3, 2 LI - WC) dec(4)



**** COLUMN 2

// 1 lag and collapsing instrument matrix
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth trade_lib, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 1) c e(b)) ///
iv(health emp_growth trade_lib, e(l)) ///
ar(2)

outreg2 using "$reg\COL2_Model", word append ctitle (1, 1 LI - C) dec(4)



// 1 lag without collapsing instrument matrix
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth trade_lib, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 1) e(b)) ///
iv(health emp_growth trade_lib, e(l)) ///
ar(2)

outreg2 using "$reg\COL2_Model", word append ctitle (2, 1 LI - WC) dec(4)


// 2 lags without collapsing instrument matrix 
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth trade_lib, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) e(b)) ///
iv(health emp_growth trade_lib, e(l)) ///
ar(2)

outreg2 using "$reg\COL2_Model", word append ctitle (3, 2 LI - WC) dec(4)



**** COLUMN 3

// 1 lag and collapsing instrument matrix
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth political_regime, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 1) c e(b)) ///
iv(health emp_growth political_regime, e(l)) ///
ar(2)

outreg2 using "$reg\COL3_Model", word append ctitle (1, 1 LI - C) dec(4)


// 1 lag without collapsing instrument matrix
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth political_regime, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 1) c e(b)) ///
iv(health emp_growth political_regime, e(l)) ///
ar(2)

outreg2 using "$reg\COL3_Model", word append ctitle (2, 1 LI - WC) dec(4)


// 2 lags without collapsing instrument matrix 
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth political_regime, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) e(b)) ///
iv(health emp_growth political_regime, e(l)) ///
ar(2)

outreg2 using "$reg\COL3_Model", word append ctitle (3, 2 LI - WC) dec(4)



**** COLUMN 4

// 1 lag and collapsing instrument matrix
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth trade_lib political_regime, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 1) c e(b)) ///
iv(health emp_growth trade_lib political_regime, e(l)) ///
ar(2)

outreg2 using "$reg\COL4_Model", word append ctitle (1, 1 LI - C) dec(4)


// 1 lag without collapsing instrument matrix
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth trade_lib political_regime, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 1) e(b)) ///
iv(health emp_growth trade_lib political_regime, e(l)) ///
ar(2)

outreg2 using "$reg\COL4_Model", word append ctitle (2, 1 LI - WC) dec(4)


// 2 lags without collapsing instrument matrix 
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth trade_lib political_regime, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) e(b)) ///
iv(health emp_growth trade_lib political_regime, e(l)) ///
ar(2)

outreg2 using "$reg\COL4_Model", word append ctitle (3, 2 LI - WC) dec(4)



**** COLUMN 5

//  1 lag and collapsing instrument matrix
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth demo_lib, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 1) c e(b)) ///
iv(health emp_growth demo_lib, e(l)) ///
ar(2)

outreg2 using "$reg\COL5_Model", word append ctitle (1, 1 LI - C) dec(4)


//  1 lag without collapsing instrument matrix
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth demo_lib, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 1) e(b)) ///
iv(health emp_growth demo_lib, e(l)) ///
ar(2)

outreg2 using "$reg\COL5_Model", word append ctitle (2, 1 LI - WC) dec(4)


// 2 lags without collapsing instrument matrix 
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth demo_lib, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) e(b)) ///
iv(health emp_growth demo_lib, e(l)) ///
ar(2)

outreg2 using "$reg\COL5_Model", word append ctitle (3, LI - WC) dec(4)



**** COLUMN 6

//  1 lag and collapsing instrument matrix
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth trade_lib political_regime demo_lib, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 1) c e(b)) ///
iv(health emp_growth trade_lib political_regime demo_lib, e(l)) ///
ar(2)

outreg2 using "$reg\COL6_Model", word append ctitle (1, 1 LI - C) dec(4)


//  1 lag without collapsing instrument matrix
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth trade_lib political_regime demo_lib, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 1) e(b)) ///
iv(health emp_growth trade_lib political_regime demo_lib, e(l)) ///
ar(2)

outreg2 using "$reg\COL6_Model", word append ctitle (2, 1 LI - WC) dec(4)


// 2 lags without collapsing instrument matrix 
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth trade_lib political_regime demo_lib, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) e(b)) ///
iv(health emp_growth trade_lib political_regime demo_lib, e(l)) ///
ar(2)

outreg2 using "$reg\COL6_Model", word append ctitle (3, 2 LI - WC) dec(4)
