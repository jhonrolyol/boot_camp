%% CLEAN WORK ENVIRONMENT
% Limpiar la ventana de comandos y el espacio de trabajo
    clc;
    clear all;

%% VECTOR
% Ingresar los datos en forma de vectores "x" y "y"
    x = [1 2 3 4 5 6 7 8];
    y =[1 1.5 2 3 4 5 8 10];
    
%% GRAFICAR
% Realizar la gr�fica 
    plot(x,y,'dk');
    xlabel('Eje x');
    ylabel('Eje y');
    title('Regresion lineal');
    axis([0 12, 0 12]);
    grid on;% Se usa para crear lineas 
    hold on; % Se usa para mantener la gr�fica y hacer los cambios


%% Guardar la figura como una imagen PNG con una resoluci�n de 300 DPI
    filename = 'figures/regresion.png';
    saveas(gcf, filename, 'png');

    disp(['Gr�fico guardado como "' filename '"']);





