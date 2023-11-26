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

# Example: Create a simple plot in Julia using the Plots library
# Import the Plots library
using Plots
# Generate some data for the plot
x = 1:10
y = rand(10)
# Create a line plot
plot(x, y, label="Random Data", xlabel="X-axis", 
     ylabel="Y-axis", title="Simple Plot")
# Save figure
savefig("figures/graph1.png")
savefig("figures/graph1.pdf")
