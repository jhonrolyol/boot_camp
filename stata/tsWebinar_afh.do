//------------------------------------------------------------------------------
//         Introduction to time-series commands in Stata
//                May 11th, 2023
//------------------------------------------------------------------------------



// REVIEW: COMPONENTS OF A TIME SERIES
//------------------------------------------------------------------------------

clear all

cd "D:\master\MSc\boot_camp\stata"


* Set blogrotonda scheme

/*net install github, from("https://haghish.github.io/github/")
github install La-Rotonda/blogrotonda */

set scheme blogrotonda, perm



// Create a year variable from scratch
set obs 120
generate year = ""
replace year = "2013" in 1/12
replace year = "2014" in 13/24
replace year = "2015" in 25/36
replace year = "2016" in 37/48
replace year = "2017" in 49/60
replace year = "2018" in 61/72
replace year = "2019" in 73/84
replace year = "2020" in 85/96
replace year = "2021" in 97/108
replace year = "2022" in 109/120

// Create a month variable from scratch
generate month = _n
replace month = mod(month,12)
replace month = 12 if month == 0
tostring month, generate(str_month)
generate date = str_month + "/" + year
generate t = monthly(date,"MY")
format t %tm
drop year date str_month

// Linear and multiplicative trend
generate lin_trend = _n
generate mul_trend = _n^1.8

// Seasonal effects
generate season = 0
replace season = 11 if month == 1
replace season = 13 if month == 2
replace season = 12 if month == 3
replace season = 15 if month == 4
replace season = 19 if month == 5
replace season = 23 if month == 6
replace season = 21 if month == 7
replace season = 28 if month == 8
replace season = 20 if month == 9
replace season = 17 if month == 10
replace season = 15 if month == 11
replace season = 12 if month == 12

// Additive and multiplicative seasonality
generate xt_linlin = lin_trend + season
generate xt_linmul = lin_trend*season
generate xt_mullin = mul_trend+season*50
generate xt_mulmul = mul_trend*season

// Noise
generate xt_linlin_e = xt_linlin + rnormal()*50
generate xt_linmul_e = xt_linmul + rnormal()*500
generate xt_mullin_e = xt_mullin + rnormal()*1000
generate xt_mulmul_e = xt_mulmul + rnormal()*20000

// Tell Stata our data are time series
tsset t

// Plots
tsline lin_trend, ytitle("")
graph export "img/g1.png", replace

tsline mul_trend, ytitle("")
graph export "img/g2.png", replace

tsline xt_linlin, ytitle("")
graph export "img/g3.png", replace

tsline xt_linmul, ytitle("")
graph export "img/g4.png", replace

tsline xt_mullin, ytitle("")
graph export "img/g5.png", replace

tsline xt_mulmul, ytitle("")
graph export "img/g6.png", replace

tsline xt_linlin_e, ytitle("")
graph export "img/g7.png", replace

tsline xt_linmul_e, ytitle("")
graph export "img/g8.png", replace

tsline xt_mullin_e, ytitle("")
graph export "img/g9.png", replace

tsline xt_mulmul_e, ytitle("")
graph export "img/g10.png", replace


// UNIVARIATE TIME SERIES ANALYSIS
//------------------------------------------------------------------------------

clear all

// Import data from Excel and label the variables
import excel "D:\master\MSc\boot_camp\stata\ptmex.xls", sheet("Sheet1") firstrow
label variable lightrail "Light Rail passengers (thousands)"
label variable trolley "Trolleybus passengers (thousands)"
label variable rtp "RTP passengers (millions)"
label variable metro "Metro passengers (millions)"
label variable metrobus "Metrobus passengers (thousands)"
label variable suburbano "Suburbano passengers"
label variable mexibus "Mexibus passengers"
label variable mexicable "Mexicable passengers"

// String to date variable
generate t = monthly(date, "YM")
format t %tm
drop date

// Tell Stata we are working with time series
tsset t, monthly

// Plot metro
tsline metro
graph export "img/g12.png", replace

// Get rid of pandemic
keep if tin(1986m1, 2019m12)
tsline metro
graph export "img/g13.png", replace

// When I first looked at this time series, I only noticed the 2017 earthquake
// and three regimes: stability up to 2012, growth from 2012 to 2014,
// then again stability from 2014 onwards.

// I ran a cusum test to see if there were any periods of parameter
// instability, other than the one that was obvious to me:
regress metro
estat sbcusum

// We see the parameter instability at the end of the series clearly,
// but sbcusum is picking up instability in other places as well.
// How about we smooth the series and look again? Smoothing removes noise
// so we can look at the other components more clearly.

// Moving average (1 1 1) smoother
tssmooth ma ma3_metro = metro, window(1 1 1) replace

tsline metro ma3_metro
graph export "img/g14.png", replace

tsline ma3_metro
graph export "img/g15.png", replace

// This symmetric, window-3 smoothing already makes me notice other features
// of the series...
quietly regress ma3_metro
estat sbcusum // ...but the sbcusum plot is still pretty close to the original.
graph export "img/g16.png", replace

// The seasonality is very apparent in the 2004-2006 period:
tsline metro ma3_metro if tin(2004m1, 2006m12)
graph export "img/g17.png", replace

// Seasonal adjustment with moving average (11 1) smoother
tssmooth ma ma12_metro = metro, window(11 1) replace

tsline metro ma12_metro if tin(2004m1, 2006m12)
graph export "img/g18.png", replace

tsline metro ma12_metro
graph export "img/g19.png", replace

tsline ma12_metro // We can read a lot more stories off this seasonally-adjusted
// series, like the Great Recesssion and the big economic crisis of the second
// half of the 90s. Both created a lot of unemployment, so there were fewer
// people using the Metro to go to work.
graph export "img/g20.png", replace

quietly regress ma12_metro
estat sbcusum // The instability is also a lot more obvious now in the sbcusum plot.
graph export "img/g21.png", replace

// Metrobus
tsline metrobus
graph export "img/g22.png", replace

// At first sight, maybe it looks to you like the number of passengers grew
// at a more or less constant rate in this period. But because I lived there,
// I know that the Metrobus lines were also inaugurated one by one over the
// years, and so I noticed right away there were periods of growth when the system
// all of a sudden could carry more passengers, followed by stable periods.
// We can see this more clearly if we apply our trick of seasonal adjustment again:
tssmooth ma ma12_metrobus = metrobus, window(11 1) replace

tsline metrobus ma12_metrobus
graph export "img/g23.png", replace

tsline ma12_metrobus
graph export "img/g24.png", replace

// These trends and changing mean are a problem for a lot of common
// estimation methods that assume stationarity. Our series here is
// clearly not stationary, but I will go ahead and test it for stationarity
// just to show you how it is done in Stata.
dfuller metrobus

// The result is as expected and we are out of luck if we want to model this
// series with any method that relies on stationarity. But next we might wonder
// whether the first-differences of this series are stationary, that is,
// not the series itself but the ups and downs around these trends we discovered
// when we smoothed.

// Before we test that, let's see what those first differences look like...
tsline D.metrobus
graph export "img/g25.png", replace

// Unit-root test
dfuller D.metrobus // The first-differences are stationary.

tsline D.metrobus if tin(2008m1, 2019m12) // Mean is constant, but variance does not
// look constant. We'll come back to this...
graph export "img/g26.png", replace

// AC and PAC
ac D.metrobus // 1 MA lag and seasonality
graph export "img/g27.png", replace

pac D.metrobus // 2 AR lags
graph export "img/g28.png", replace

// Lag-order selection with arimamsoc
arimasoc D.metrobus

// ARIMA with metrobus
arima metrobus, arima(2, 1, 1) //Third AR lag not significant
estimates store arima21

// Test for ARCH effects
quietly regress D.metrobus
estat archlm, lags(1)

// ARCH(1)
arch D.metrobus, ar(1) arch(1)
estimates store arch1

// Compare arima21 and arch1
estimates stats arima21 arch1

// Forecast 2019 with arch1
quietly arch D.metrobus if tin(2008m1, 2018m12), ar(1) arch(1)
predict fcst_arch1 if tin(2008m1, 2019m12), dynamic(tm(2018m12))
tsline D.metrobus fcst_arch1 if tin(2018m1, 2019m12)
graph export "img/g29.png", replace

// MULTIVARIATE TIME SERIES ANALYSIS
//------------------------------------------------------------------------------

clear all

use "D:\master\MSc\boot_camp\stata\var_ptmex.dta"

tsset date // Stata complains that there are gaps in the date variable.

// We have to let Stata know what is going on by using a business calendar:
bcal create mycal, from (date) replace
bcal load mycal
generate bcaldate = bofd("mycal", date)
format %tbmycal bcaldate
tsset bcaldate

// Lag-order selection
varsoc d_metro d_metrobus d_trolley d_rtp, maxlag(5) // Most say 3 lags

// VAR(3)
var d_metro d_metrobus d_trolley d_rtp, lags(1 2 3)

// Bayesian VAR slide
bayes: var d_metro d_metrobus d_trolley d_rtp, lags(1 2 3)
bayesgraph diagnostics {d_rtp:L.d_metro}
graph export "img/g30.png", replace

// SVAR(3)
matrix input  A =  ( 1,  0,  0,  0\ ///
					 .,  1,  0,  0\ ///
					 .,  .,  1,  0\ ///
					 .,  .,  .,  1)

matrix input B =   ( .,  0,  0,  0\ ///
                     0,  .,  0,  0\ ///
                     0,  0,  .,  0\ ///
				     0,  0,  0,  .)

svar d_rtp d_trolley d_metrobus d_metro, aeq(A) beq(B) lags(1 2 3)

// Impulse-Response Functions
irf set "myIRF", replace
irf create svar1, replace
irf graph oirf

graph export "img/g31.png", replace

