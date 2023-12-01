* Cleaning
	cls
	clear all
	set more off
	capture log close 

* Change Working Directory
	dir
	ls
	cd 
	
* Numeric For Loop
	// Example of a numeric for loop
	forval i = 1/5 {
			display "Iteration: `i'"
	}

* String For Loop
	// Example of a string for loop
	local fruits "apple orange banana"
	
	foreach fruit of local fruits {
			display "Fruit: `fruit'"
	}

* While Loop
	// Example of a while loop
	local counter 1
	while `counter' <= 5 {
			display "Counter: `counter'"
			local counter = `counter' + 1
	}

* Nested For Loops
	// Example of nested for loops
	forval i = 1/3 {
			forval j = 1/2 {
					display "Outer loop: `i', Inner loop: `j'"
			}
	}
		