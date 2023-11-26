# Shorcuts 
    # ctrl + s: save
    # ctrl + ñ: open terminal
    # pip install matplotlib

# Library import
import matplotlib.pyplot as plt
import numpy as np
# Data for the line plot
x_line = np.linspace(0, 10, 100)
y_line = np.sin(x_line)
# Data for the bar plot
categories = ['Category A', 'Category B',
               'Category C', 'Category D']
values = [25, 50, 75, 100]
# Creating the line plot
plt.figure(figsize=(10, 4))
plt.subplot(1, 2, 1)  # 1 row, 2 columns, this is the first plot
plt.plot(x_line, y_line, label='sin(x)',
          color='blue', marker='o')
plt.title('Line Plot')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')
plt.legend()
# Creating the bar plot
plt.subplot(1, 2, 2)  # 1 row, 2 columns, this is the second plot
plt.bar(categories, values, color='green')
plt.title('Bar Plot')
plt.xlabel('Categories')
plt.ylabel('Values')
# Adjust layout to prevent overlapping
plt.tight_layout()
# Save figure
plt.savefig("figures/graph1.png")
# Show the plots
plt.show()

