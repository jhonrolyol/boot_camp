%% CLEAN WORK ENVIRONMENT
% Clear the command window and workspace
    clc;
    clear all;

%% VECTOR
% Enter data in the form of vectors "x" and "y"
    x = [1 2 3 4 5 6 7 8];
    y = [1 1.5 2 3 4 5 8 10];
    
%% PLOT
% Plot the graph
    plot(x, y, 'dk');
    xlabel('X-axis');
    ylabel('Y-axis');
    title('Linear Regression');
    axis([0 12, 0 12]);
    grid on; % Used to create grid lines 
    hold on; % Used to maintain the plot and make changes

%% Save the figure as a PNG image with a resolution of 300 DPI
    filename = 'figures/regression.png';
    saveas(gcf, filename, 'png');

    disp(['Plot saved as "' filename '"']);






