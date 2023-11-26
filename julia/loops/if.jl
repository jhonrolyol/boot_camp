# Open the terminal: control + shift + enter
# Open the command palette: control + shift + p
# Run Julia: shift + enter

# Install packages (type in the Julia environment)
    # ] add Statistics
    # ] add Distributions
    # ] add LinearAlgebra
    # ] add Plots
    # ] add DataFrames
    # ] add SymPy

# Load useful packages
#using Statistics
#using Distributions
#using LinearAlgebra
#using Plots 
#using DataFrames
#using SymPy

# Shorcuts
    # Compile julia in bash of Git: julia mi_script.jl
    # Ctrl + s: save change


# option 1
# Example: Loop with "if" statement in Julia
# Define an array of numbers
numbers = [1, 5, 8, 12, 4, 9, 7]
# Loop through each number in the array
for number in numbers
    # Check if the number is even
    if number % 2 == 0
        println("$number is even")
    else
        println("$number is odd")
    end
end


