%% Crear un ejemplo de datos y trazar un gráfico
    x = linspace(0, 2*pi, 100);
    y = sin(x);
    plot(x, y);
    title('Ejemplo de Gráfico');
    xlabel('X');
    ylabel('Y');

%% Guardar la figura como una imagen PNG con una resolución de 300 DPI
    filename = 'figures/grafico.png';
    saveas(gcf, filename, 'png');

    disp(['Gráfico guardado como "' filename '"']);




