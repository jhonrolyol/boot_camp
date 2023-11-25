# Notes

## Description
This repository contains training in Stata, R, Python, Matlab and Dynamic Programming.

## Stata
Stata is a statistical software package that provides a suite of applications for data
management and statistical analysis. It is widely used in social science research, economics, 
and epidemiology. Stata allows users to manipulate and analyze data, 
as well as generate graphs and tables.

Stata code for time series data:

```stata
clear all

use "D:\master\MSc\boot_camp\stata\var_ptmex.dta"

tsset date // Stata complains that there are gaps in the date variable.

// We have to let Stata know what is going on by using a business calendar:
bcal create mycal, from (date) replace
bcal load mycal
generate bcaldate = bofd("mycal", date)
format %tbmycal bcaldate
tsset bcaldate

// Lag-order selection
varsoc d_metro d_metrobus d_trolley d_rtp, maxlag(5) // Most say 3 lags

// VAR(3)
var d_metro d_metrobus d_trolley d_rtp, lags(1 2 3)

// Bayesian VAR slide
bayes: var d_metro d_metrobus d_trolley d_rtp, lags(1 2 3)
bayesgraph diagnostics {d_rtp:L.d_metro}
graph export "img/g30.png", replace

```
Below is the figure created in Stata.

![](https://github.com/jhonrolyol/boot_camp/blob/master/stata/img/g30.png)

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

Matlab code example:

```matlab
% Generate random data for the VAR model
nObservations = 100;  % Number of observations
nVariables = 3;       % Number of variables

% Create a matrix of random innovations (white noise)
innovations = randn(nObservations, nVariables);

% Create a matrix of coefficients for the VAR model (matrix A)
A = [0.8 -0.4 0.2; -0.2 0.6 -0.3; 0.1 -0.2 0.5];

% Calculate and print the impulse response function
lags = 20;  % Number of lags for the impulse response function

irf_matrix = zeros(nVariables, nVariables, lags+1);
irf_matrix(:, :, 1) = eye(nVariables); % Unit impulse in the first lag

for lag = 1:lags
    irf_matrix(:, :, lag+1) = A' * squeeze(irf_matrix(:, :, lag));
end

figure;
for i = 1:nVariables
    for j = 1:nVariables
        subplot(nVariables, nVariables, (i-1)*nVariables + j);
        plot(0:lags, squeeze(irf_matrix(i, j, :)), '-o');
        title(['IRF: ' num2str(i) ' -> ' num2str(j)]);
        xlabel('Lags');
        ylabel('Response');
        print(gcf, 'figures/impulse_response_function', '-dpng');
    end
end

```

Below is the figure created in Matlab.

![](https://github.com/jhonrolyol/boot_camp/blob/master/matlab/test/figures/impulse_response_function.png)



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
