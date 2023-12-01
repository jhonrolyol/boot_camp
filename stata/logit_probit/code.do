* Cleanning
	cls
	clear all
	set more off
	capture log close

* ruta
	cd "D:\master\MSc\boot_camp\stata\logit_probit"
	
* Cargar la data
	use "data.dta", clear 
	describe
	
	rename var1 x
	rename var2 y

	describe
	browse 

* Set blogrotonda scheme

/*net install github, from("https://haghish.github.io/github/")
github install La-Rotonda/blogrotonda */

*set scheme blogrotonda, perm


* Diagram
	twoway scatter y x
	scatter y x 
	scatter y x, name(g1)
	graph export "img/g1.png", replace
	graph export "img/g1.pdf", replace 

	twoway (scatter y x) (lfit y x)
	scatter y x
	scatter y x || lfit y x, name(g2)
	graph export "img/g2.png", replace
	graph export "img/g2.pdf", replace 
	
* OLS Estimation
	reg y x
	reg y x, nocons

* We calculate the marginal effects
	margins, dydx(*)

* LOGIT model estimation
	logit y x
	
	/*
			Note.-
				The signs can be interpreted in this model,
				but the betas cannot be interpreted.
	*/

* PROBIT model estimation
	probit y x 
	/* Note.-
				The signs can be interpreted in this model,
				but the betas cannot be interpreted.
			
				The LOGIT and PROBIT models are not directly
				comparable.
	*/
	
* Marginal effects in the LOGIT model
	logit y x
	margins, dydx(*)
	/*
			Interpretation.-
				In this case the marginal effect comes out: 0.231504
				which indicates that a change in "x" increases the
				probability of success at about 2.3% or 2.3%
				percentage points and the marginal effect
				becomes significant.

			NOTE: This marginal effect in this case is the average 
						of the 23 marginal effects.
	*/
	margins, dydx(*) atmean 
	/*
		This is the marginal effect on the mean; that is, in the average
		individual. Using 	the average "x" in the marginal effect formula. 
		And this marginal effect is 0.695836, also significant.
	*/
* PROBIT model estimation
	probit y x

* Marginal effects in the "mean"
	margins, dydx(*) atmean 
	
	/*
			NOTE.-
				Beta and marginal effects are different.

				The case of the marginal effect comes out PROBIT: 0.0682841
				The marginal effect case LOGIT comes out: 0.0695836

				and you can see that there is not much difference between using
				a LOGIT or a PROBIT model.

			NOTE.- 
					The magnitudes of the betas of LOGIT and PROBIT model are
					not interpretable. But if the signs and meaning are 
					interpretable of the betas.

					It is always advisable to calculate marginal effects.
					in the LOGIT and PROBIT Models and compare them.		
	*/

* Calculate the estimated probability of success the "p hat"

	* Estimated probability with PROBIT
	probit y x 
	* Use the predict
	predict phatprobit, p  // "p hat" is the individual's probability of success.
	
	* Estiamted probability with LOGIT 
	logit y x
	* Use the predict 
	predict phatlogit, p 
	
* Graphs
	twoway scatter y phatprobit x
	scatter y phatprobit x
	scatter y phatprobit x, name(g3)
	graph export "img/g3.png", replace
	graph export "img/g3.pdf", replace 

	scatter y phatprobit x || lfit y x, name(g4)
	graph export "img/g4.png", replace
	graph export "img/g4.pdf", replace 

	scatter y phatlogit x, name(g5)
	graph export "img/g5.png", replace
	graph export "img/g5.pdf", replace 

	scatter y phatlogit x || lfit y x, name(g6)
	graph export "img/g6.png", replace
	graph export "img/g6.pdf", replace 

* Comparing in the case of the LOGIT and PROBIT model.
	sort phatprobit // Sort from smallest to largest
	line phatprobit phatlogit x, name(g7)
	graph export "img/g7.png", replace
		// Blue Line: Estimation by the PROBIT model.
		// Red Line: Estimation using the LOGIT model.


// Draw the adjustment lines
	twoway (line phatprobit x) (line phatlogit x), name(g8)
	graph export "img/g8.png", replace

	/*	
		In the estimates by LOGIT and PROBIT (see graph) they
		are almost equal and that is why the marginal effects
		are very similar at any point of the "x" level (the
		slopes will always be almost equal).
	*/

* Graphical comparison of logit and probit estimates
* with the estimation of the linear probability model (ols).
	graph twoway || line phatprobit x || line phatlogit x || lfit y x, name(g9)
	graph export "img/g9.png", replace

	/*
		In this case (see graph) the estimation is observed using the
		linear probability model and the estimation using the logit
		and probit models. Where, the logit and probit estimation looks
		like an elongated "S" with a changing marginal effect, while 
		the estimation by the linear probability model (lco) has a 
		constant marginal effect (it is the straight line with a
		constant slope). And if the marginal effect is calculated 
		in the area of ​​the middle or central part, there would no
		longer be so much difference in the marginal effects (see 
		intersection in the graph).
	*/

* To have a clearer graph
* we add the points of the diagram
* dispersion
	graph twoway || line phatprobit x ///
				 || line phatlogit x ///
				 || lfit y x ///
				 || scatter y x, name(g10)
	graph export "img/g10.png", replace
			
			
	line phatprobit phatlogit x || lfit y x || scatter y x, name(g11)
	graph export "img/g11.png", replace

// Plot the fit lines, linear regression line
// and scatter points
	twoway (line phatprobit x, lcolor(blue) lpattern(dash)) ///
				 (line phatlogit x, lcolor(red) lpattern(dash)) ///
				 (lfit y x, lcolor(black)) ///
				 (scatter y x, mcolor(black) msymbol(circle)),/// 
				 legend(label(1 "Probit") label(2 "Logit") /// 
				 label(3 "Regresión Lineal") label(4 "Puntos de Dispersión")) ///
				 name(g12)
	graph export "img/g12.png", replace

