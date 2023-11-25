# Notes

## Description
This repository contains training in Stata, R, Python, Matlab and Dynamic Programming.

## Stata
Stata is a statistical software package that provides a suite of applications for data
management and statistical analysis. It is widely used in social science research, economics, 
and epidemiology. Stata allows users to manipulate and analyze data, 
as well as generate graphs and tables.

-

## R
R is a programming language and free software environment for statistical computing and graphics.
It provides a wide variety of statistical and graphical techniques and is highly extensible. 
R is widely used for statistical analysis, data visualization, and machine learning.

R code for time series data:
```r
# Cleaning ----------------------------------------------------------------
  rm(list = ls())

# Install packages --------------------------------------------------------
  #install.packages("readxl")
  #install.packages("tseries")
  #install.packages("ggplot2")
  install.packages("svglite")
# Load library ------------------------------------------------------------
  library(readxl)
  library(tseries)
  library(ggplot2)
  library(svglite)  

# Data import of excel ----------------------------------------------------
  bcp <- read_excel("data/bcp.xlsx", sheet = "bbdd")
  View(bcp)
  head(bcp)
  bcp$fecha <- as.Date(bcp$fecha)

# bcp series chart --------------------------------------------------------
  graph1 <- ggplot(bcp, aes(x = fecha, y = bcp)) +
    geom_line() +
    labs(title = "bcp series chart",
         x = "Date",
         y = "Value") + 
    theme( plot.margin = unit(c(0, 0, 0, 0), "cm"), # Margin of graph
           panel.margin = unit(c(0, 0, 0, 0), "cm") # Margin of panel
           )
  
  graph1
  
  ggsave("figures/bcp_series_chart.png", plot = graph1)
  ggsave("figures/bcp_series_chart.pdf", plot = graph1)
  ggsave("figures/bcp_series_chart.svg", plot = graph1)
  
# r series chart ----------------------------------------------------------
  graph2 <- ggplot(bcp, aes(x = fecha, y = r)) +
    geom_line() +
    labs(title = "r series chart",
         x = "Date",
         y = "Value") + 
    theme( plot.margin = unit(c(0, 0, 0, 0), "cm"), # Margin of graph
           panel.margin = unit(c(0, 0, 0, 0), "cm") # Margin of panel
           )
  graph2
  
  ggsave("figures/r_series_chart.png", plot = graph2)
  ggsave("figures/r_series_chart.pdf", plot = graph2)
  ggsave("figures/r_series_chart.svg", plot = graph2)
```
Below is the figure created in R.

![](https://github.com/jhonrolyol/boot_camp/blob/master/r/VaR/figures/bcp_series_chart.png)
![](https://github.com/jhonrolyol/boot_camp/blob/master/r/VaR/figures/r_series_chart.png)

## Python 
Python is a high-level, general-purpose programming language known for its readability and versatility.
It supports multiple programming paradigms, including procedural, object-oriented, and functional 
programming. Python is widely used in various domains, including web development, data science,
artificial intelligence, and automation.

Python code for time series data:
```python
import pandas as pd 
import numpy as np
import matplotlib.pyplot as plt

#%% Data import 

df= pd.read_excel("data/bcp.xlsx", sheet_name = "data")
df["fecha"] = pd.to_datetime(df["fecha"])
df.set_index("fecha", inplace = True)


#%% Time Series graph
 
plt.figure(figsize=(12, 6))
plt.plot(df.index, df['cierre_anterior_corregido'],
         label='bcp', linewidth = 3, 
         color = "cyan")
plt.title(' ')
plt.xlabel(' ')
plt.ylabel(' ')
plt.legend()
plt.grid(True)
plt.savefig('figures/ts_bcp.png')
plt.show()

```
Below is the figure created in Python.

![](https://github.com/jhonrolyol/boot_camp/blob/master/python/VaR/figures/ts_bcp.png)


## Matlab 
MATLAB (Matrix Laboratory) is a programming language and numerical computing environment designed
for matrix manipulation, data analysis, signal processing, and visualization. It is commonly used
in engineering, science, and mathematics for tasks such as simulation, modeling, and algorithm development.

-

## Dynamic Programming
Dynamic Programming is a mathematical optimization technique used to solve problems that can be broken
down into smaller overlapping subproblems. It involves breaking down a problem into simpler, smaller
subproblems and solving each subproblem only once, storing the solutions to subproblems to avoid
redundant computations. Dynamic programming is commonly used in optimization problems and algorithms
for efficient computation.


-


## How to Contribute
If you find errors or want to add more information, feel free
to contribute! You can open an issue or submit a pull request.

## Contact
- Email: [rolyordonezleon@gmail.com]
- Twitter: [@JhonRoly5]
