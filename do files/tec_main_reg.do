*=================================
* name: tec_main_reg.do
* databased used: tec_database.dta              
* date: December 18, 2021
* last update: November 21, 2023
*=================================

use  "$fin\tec_database.dta", clear


// set de database as panel data
xtset code year, yearly delta(2) 


mata: mata set matafavor speed


*=================================
*                 MAIN REGRESSIONS - SYS-GMM
*=================================


// trade growth
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) c e(b)) ///
iv(health emp_growth, e(l)) ///
ar(2)

outreg2 using "$reg\Main_Model", word append ctitle (1, S-GMM) dec(4)


// trade growth + trade liberalization
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth trade_lib, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) c e(b)) ///
iv(health emp_growth trade_lib, e(l)) ///
ar(2)

outreg2 using "$reg\Main_Model", word append ctitle (2, S-GMM) dec(4)


// trade growth + political regime
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth political_regime, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) c e(b)) ///
iv(health emp_growth political_regime, e(l)) ///
ar(2)

outreg2 using "$reg\Main_Model", word append ctitle (3, S-GMM) dec(4)


// trade growth + liberalization + political regime
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth trade_lib political_regime, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) c e(b)) ///
iv(health emp_growth trade_lib political_regime, e(l)) ///
ar(2)

outreg2 using "$reg\Main_Model", word append ctitle (4, S-GMM) dec(4)


// trade growth + democracy liberalization
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth demo_lib, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) c e(b)) ///
iv(health emp_growth demo_lib, e(l)) ///
ar(2)


outreg2 using "$reg\Main_Model", word append ctitle (5, S-GMM) dec(4)


// trade growth + liberalization + political regime + democracy liberalization
xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth trade_lib political_regime demo_lib, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) c e(b)) ///
iv(health emp_growth trade_lib political_regime demo_lib, e(l)) ///
ar(2)


outreg2 using "$reg\Main_Model", word append ctitle (6, S-GMM) dec(4)
