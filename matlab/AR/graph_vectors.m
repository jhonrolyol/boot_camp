% Cleaning
clc
clear 
close all
clearvars

% Define the components of the vectors
x = [0, 1, 2];
y = [0, 1, 0];
u = [2, -1, 1];
v = [1, 0, -2];

% Create a figure
figure;

% Use quiver to plot the vectors
quiver(x, y, u, v, 1.5); % The last argument (0.5) scales the length of the vectors

% Set axis limits
xlim([-1, 3]);
ylim([-1, 2]);

% Add labels and title
xlabel('X-axis');
ylabel('Y-axis');
title('Vector Plot');

% Add a grid
grid on;

% Show the plot
axis equal; % This ensures that the axis scales are equal


