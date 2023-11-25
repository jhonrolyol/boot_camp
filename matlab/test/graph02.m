%% Create an example of data and plot a graph
x = linspace(0, 2*pi, 100);
y = sin(x);
plot(x, y);
title('Example Plot');
xlabel('X');
ylabel('Y');

%% Save the figure as a PNG image with a resolution of 300 DPI
filename = 'figures/plot.png';
saveas(gcf, filename, 'png');

disp(['Plot saved as "' filename '"']);





