# Documentation -----------------------------------------------------------
  # Topic: VaR calculation (VaR: Value at Risk)
  # Author: Jhon Roly
  # Date: november 24, 2023


# Shorcuts ----------------------------------------------------------------
  # ctrl + s: save
  # ctrl + shift + r: new section
  # ...
  

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
         y = "Value") 
  
  graph1
  
  ggsave("figures/bcp_series_chart.png", plot = graph1)
  ggsave("figures/bcp_series_chart.pdf", plot = graph1)
  ggsave("figures/bcp_series_chart.svg", plot = graph1)
  
# r series chart ----------------------------------------------------------
  graph2 <- ggplot(bcp, aes(x = fecha, y = r)) +
    geom_line() +
    labs(title = "r series chart",
         x = "Date",
         y = "Value") 
  
  ggsave("figures/r_series_chart.png", plot = graph2)
  ggsave("figures/r_series_chart.pdf", plot = graph2)
  ggsave("figures/r_series_chart.svg", plot = graph2)
  
  
  
  
  
  
  
  
  
   