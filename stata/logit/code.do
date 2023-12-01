* Cleanning
	cls
	clear all
	set more off
	capture log close

* ruta
	cd "D:\master\MSc\boot_camp\stata\logit"
	
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
		En las estimaciones por LOGIT y PROBIT (ver la gráfica)
		son casi iguales y por eso es que los efectos 
		marginales son muy parecidos en cualquier punto 
		a nivel de "x" (siempre las pendientes van estar casi
		iguales).

	*/

* Comparando graficamente las estimación por logit y probit
* con la estimación del modelo de probabilidad lineal(mco).
graph twoway || line phatprobit x || line phatlogit x || lfit y x, name(g9)
graph export "img/g9.png", replace

	/*
		En este caso (ver la gráfica) se oberva la estimación
		por el modelo de probabilidad lineal y la estimación por
		los modelos logit y probit. Donde, la estimación por logit
		y probit se vé como una "S" alargada con un efecto marginal 
		cambiante, mientras que la estimación por el modelo de 
		probabilidad lineal(mco) tiene un efecto marginal 
		constante (es la línea recta con pendiente constante).
		Y si se calcula el efecto marginal en la zona
		media o parte central ya no habría tanta diferencia en los
		efectos  marginales (ver la intersección en la gráfica).
		
	*/

* Para poder tener un gráfico más claro
* le agregamos los puntos del diagrama de 
* dispersión
graph twoway || line phatprobit x ///
			 || line phatlogit x ///
			 || lfit y x ///
			 || scatter y x, name(g10)
graph export "img/g10.png", replace
		
		
line phatprobit phatlogit x || lfit y x || scatter y x, name(g11)
graph export "img/g11.png", replace

// Graficar las líneas de ajuste, línea de regresión lineal y puntos de dispersión
twoway (line phatprobit x, lcolor(blue) lpattern(dash)) ///
       (line phatlogit x, lcolor(red) lpattern(dash)) ///
       (lfit y x, lcolor(black)) ///
       (scatter y x, mcolor(black) msymbol(circle)), legend(label(1 "Probit") label(2 "Logit") label(3 "Regresión Lineal") label(4 "Puntos de Dispersión")) name(g12)
graph export "img/g12.png", replace



	   
	   








