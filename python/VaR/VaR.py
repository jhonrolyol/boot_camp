# -*- coding: utf-8 -*-
"""
Created on Fri Nov 24 12:38:59 2023

@author: Jhon Roly
"""


#%% Import library

import pandas as pd 
import numpy as np
import matplotlib.pyplot as plt

#%% Single graph - 2D 

x = [2 , 4, 6, 8]
y = [1 , 5, 7, 10]

plt.figure(figsize = (10,8))
plt.xlabel("x")
plt.ylabel("y")
plt.title("y vs x")
plt.plot(x,y)
plt.savefig("figures/fig1.png")
plt.show()

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


#%% 






