%% CLEAR
% Limpiar
    clc;
    clear all;

%%
bar([1 11 7 8 2 2 9 3 6])
f = gcf;

%% Guardar la figura 
filename = 'figures/barchart.png';
saveas(f, filename, 'png');

disp(['Gráfico guardado como "' filename '"']);