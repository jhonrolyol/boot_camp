%% CLEAR
% Clear
    clc;
    clear all;

%%
bar([1 11 7 8 2 2 9 3 6])
f = gcf;

%% Save the figure 
filename = 'figures/barchart.png';
saveas(f, filename, 'png');

disp(['Chart saved as "' filename '"']);
