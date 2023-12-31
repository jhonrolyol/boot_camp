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

# Example: Define a greet function in Julia
# Define the greet function
function greet(name)
    println("Hello, $name Welcome to Julia.")
end
# Call the greet function with a specific name
greet("Alice")


