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

# Option 1

# Define a function to calculate the square of a number
function square(x)
    return x^2
end
# Call the function with a specific number
result = square(5)
# Print the result
println("The square of 5 is: $result")

