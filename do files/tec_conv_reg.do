*=================================
* name: tec_conv_reg.do
* databased used: tec_database.dta              
* date: November 21, 2023
* last update: January 01, 2024
*=================================

* Here we perform additional regressions to test 
* (in)conditional convergence of income in the 
* model using NLS and GMM approaches


use  "$fin\tec_database.dta", clear


// set de database as panel data
gen int years = year
xtset code years, yearly delta(2) 

mata: mata set matafavor speed



*=================================
*				NON-LEAST SQUARE ESTIMATES
*=================================

// inconditional convergence 
gen int t=2

nl (eco_growth= {a} - ln_gdp_0 * (1 - exp(-{beta}*t)) ///
+ ln_gdp_pc * (1 - exp(-{beta}*t))), ////
vce(r) nolog


// inconditional convergence with time FE
levelsof year, local(qds)

foreach q of local qds {
    local year = `q'
    gen y`year' = (year == `q')
}

nl (eco_growth= {a} - ln_gdp_0 * (1 - exp(-{beta}*t)) ///
+ ln_gdp_pc * (1 - exp(-{beta}*t)) + ///
{y1}*y1986 + {y2}*y1988 + {y3}*y1990 + {y4}*y1992 /// 
 + {y5}*y1994 + {y6}*y1996 + {y7}*y1998 ///
 + {y8}*y2000 + {y9}*y2002 + {y10}*y2004 ///
 + {y11}*y2006 + {y12}*y2008 + {y13}*y2010 ///
 + {y14}*y2012 + {y15}*y2014 + {y16}*y2016 ///
 + {y17}*y2018), ///
vce(r) nolog

// inconditional convergence with country FE
levelsof code, local(qdc)

foreach q of local qdc {
    local code = `q'
    gen c`code' = (code == `q')
}

nl (eco_growth= {a} - ln_gdp_0 * (1 - exp(-{beta}*t)) ///
+ ln_gdp_pc * (1 - exp(-{beta}*t)) + ///
{c1}*c2+ {c2}*c3 + {c3}*c4 + {c4}*c5 /// 
 + {c5}*c6 + {c6}*c7 + {c7}*c8 ///
 + {c8}*c9 + {c9}*c10 + {c10}*c11 ///
 + {c11}*c12 + {c12}*c13 + {c13}*c14 ///
 + {c14}*c15 + {c15}*c16 + {c16}*c17 ///
 + {c17}*c18 + {c17}*c19), ///
vce(r) nolog

// conditional convergence no FE 
nl (eco_growth= {a} - ln_gdp_0 * (1 - exp(-{beta}*t)) ///
 + ln_gdp_pc * (1 - exp(-{beta}*t)) ///
 + {b1}*inv_share + {b2}*gov_share ///
 + {b3}*emp_growth + {b4}*health ///
 + {b5}*trade_growth), /// 
vce(r) nolog


// conditional convergence no FE + TRADE_LIB 
nl (eco_growth= {a} - ln_gdp_0 * (1 - exp(-{beta}*t)) ///
 + ln_gdp_pc * (1 - exp(-{beta}*t)) ///
 + {b1}*inv_share + {b2}*gov_share ///
 + {b3}*emp_growth + {b4}*health ///
 + {b5}*trade_growth + {b6}*trade_lib ), /// 
vce(r) nolog


// conditional convergence no FE + POLITICAL_REG 
nl (eco_growth= {a} - ln_gdp_0 * (1 - exp(-{beta}*t)) ///
 + ln_gdp_pc * (1 - exp(-{beta}*t)) ///
 + {b1}*inv_share + {b2}*gov_share ///
 + {b3}*emp_growth + {b4}*health ///
 + {b5}*trade_growth + {b6}*political_regime ), /// 
vce(r) nolog


// conditional convergence no FE + DEMO_LIB 
nl (eco_growth= {a} - ln_gdp_0 * (1 - exp(-{beta}*t)) ///
 + ln_gdp_pc * (1 - exp(-{beta}*t)) ///
 + {b1}*inv_share + {b2}*gov_share ///
 + {b3}*emp_growth + {b4}*health ///
 + {b5}*trade_growth + {b6}*demo_lib ), /// 
vce(r) nolog

// conditional convergence no FE + FULL_DUMMY
nl (eco_growth= {a} - ln_gdp_0 * (1 - exp(-{beta}*t)) ///
 + ln_gdp_pc * (1 - exp(-{beta}*t)) ///
 + {b1}*inv_share + {b2}*gov_share ///
 + {b3}*emp_growth + {b4}*health ///
 + {b5}*trade_growth + {b6}*trade_lib ///
 + {b7}*political_regime), /// 
vce(r) nolog

// conditional convergence + TIME FE + FULL_DUMMY
nl (eco_growth= {a} - ln_gdp_0 * (1 - exp(-{beta}*t)) ///
 + ln_gdp_pc * (1 - exp(-{beta}*t)) ///
 + {b1}*inv_share + {b2}*gov_share ///
 + {b3}*emp_growth + {b4}*health ///
 + {b5}*trade_growth + {b6}*trade_lib ///
 + {b7}*political_regime ///
 + {y1}*y1986 + {y2}*y1988 + {y3}*y1990 + {y4}*y1992 /// 
 + {y5}*y1994 + {y6}*y1996 + {y7}*y1998 ///
 + {y8}*y2000 + {y9}*y2002 + {y10}*y2004 ///
 + {y11}*y2006 + {y12}*y2008 + {y13}*y2010 ///
 + {y14}*y2012 + {y15}*y2014 + {y16}*y2016 ///
 + {y17}*y2018), /// 
vce(r) nolog

// conditional convergence + COUNTRY FE + FULL_DUMMY
nl (eco_growth= {a} - ln_gdp_0 * (1 - exp(-{beta}*t)) ///
 + ln_gdp_pc * (1 - exp(-{beta}*t)) ///
 + {b1}*inv_share + {b2}*gov_share ///
 + {b3}*emp_growth + {b4}*health ///
 + {b5}*trade_growth + {b6}*trade_lib ///
 + {b7}*political_regime ///
 + {c1}*c2+ {c2}*c3 + {c3}*c4 + {c4}*c5 /// 
 + {c5}*c6 + {c6}*c7 + {c7}*c8 ///
 + {c8}*c9 + {c9}*c10 + {c10}*c11 ///
 + {c11}*c12 + {c12}*c13 + {c13}*c14 ///
 + {c14}*c15 + {c15}*c16 + {c16}*c17 ///
 + {c17}*c18 + {c17}*c19), /// 
vce(r) nolog

