* Cleaning
	cls
	clear all
	set more off
	capture log close

* local
	local name = "Jhon Roly"	
	display "Hello, `name'"

	local fruits "banana apple pear grape"
	foreach fruit of local fruits {
		display "My favorite fruit is: `fruit'"
	}

* global
	global age = 29
	display "My age is $age"

	dir 
	ls 
	
	global root "path"
	global data "path"
	global results "path"
	global figures "path"
	
	use "{$data}\data.xslx", clear 
	graph export "{$figures}\name.png", replace
	
