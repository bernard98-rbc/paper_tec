*=================================
* name: tec_demo_reg.do
* databased used: tec_dataset.dta             
* date: December 22, 2023
* last update: January 01, 2024
*=================================

* Here we perform additional regressions to test 
* different approaches to political regime measure


use  "$fin\tec_database.dta", clear


// set de database as panel data
gen int years = year
xtset code years, yearly delta(2) 

mata: mata set matafavor speed



*=================================
*		SPECIFICATION (III) OF MAIN REGRESSION
*=================================

xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth election_index, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) c e(b)) ///
iv(health emp_growth election_index, e(l)) ///
ar(2)

outreg2 using "$dem_reg\dem_rob", word append ctitle (1, S-GMM) dec(4)

xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth judcons_index, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) c e(b)) ///
iv(health emp_growth judcons_index, e(l)) ///
ar(2)

outreg2 using "$dem_reg\dem_rob", word append ctitle (2, S-GMM) dec(4)

xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth legcons_index, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) c e(b)) ///
iv(health emp_growth legcons_index, e(l)) ///
ar(2)

outreg2 using "$dem_reg\dem_rob", word append ctitle (3, S-GMM) dec(4)


*=================================
*		SPECIFICATION (IV) OF MAIN REGRESSION
*=================================

xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth trade_lib election_index, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) c e(b)) ///
iv(health emp_growth trade_lib election_index, e(l)) ///
ar(2)

outreg2 using "$dem_reg\dem_rob", word append ctitle (4, S-GMM) dec(4)


xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth trade_lib judcons_index, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) c e(b)) ///
iv(health emp_growth trade_lib judcons_index, e(l)) ///
ar(2)

outreg2 using "$dem_reg\dem_rob", word append ctitle (5, S-GMM) dec(4)


xtabond2 eco_growth L1.eco_growth ln_gdp_pc inv_share gov_share ///
emp_growth health trade_growth trade_lib legcons_index, two r ///
gmm(L1.eco_growth ln_gdp_pc inv_share gov_share trade_growth,lag(1 2) c e(b)) ///
iv(health emp_growth trade_lib legcons_index, e(l)) ///
ar(2)

outreg2 using "$dem_reg\dem_rob", word append ctitle (6, S-GMM) dec(4)






