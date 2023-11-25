%% Crear un ejemplo de datos y trazar un gr�fico
    x = linspace(0, 2*pi, 100);
    y = sin(x);
    plot(x, y);
    title('Ejemplo de Gr�fico');
    xlabel('X');
    ylabel('Y');

%% Guardar la figura como una imagen PNG con una resoluci�n de 300 DPI
    filename = 'figures/grafico.png';
    saveas(gcf, filename, 'png');

    disp(['Gr�fico guardado como "' filename '"']);




