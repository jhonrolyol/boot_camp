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

# Import the Plots library
using Plots
# Set the Plots backend (you can choose a different one based on your preference)
gr()
# Generate some example data
x = 1:10
y = rand(10)
# Create a line plot with custom styling
plot(x, y, label="Random Data", xlabel="X-axis", 
    ylabel="Y-axis", title="Nice Plot for Paper",
    linewidth=2, legend=:bottomright)
# Customize the appearance further if needed
# For example, adjust the font size
plot!(titlefontsize=12, tickfontsize=10,
    legendfontsize=8)
# Save the plot to a file (PDF is often a good choice for inclusion in papers)
savefig("figures/graph2.png")
savefig("figures/graph2.pdf")
