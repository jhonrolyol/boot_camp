% Crear datos de ejemplo para las series de tiempo
    tiempo = linspace(datenum('2020-01-01'), datenum('2022-12-31'), 36);
    serie1 = cumsum(randn(1, 36));
    serie2 = cumsum(randn(1, 36));

% Crear la figura
figure;

% Graficar la primera serie de tiempo
    subplot(2, 1, 1);
    plot(tiempo, serie1, 'b', 'LineWidth', 2);
    title('Serie de Tiempo 1');
    xlabel('Fecha');
    ylabel('Valor');

% Graficar la segunda serie de tiempo
    subplot(2, 1, 2);
    plot(tiempo, serie2, 'r', 'LineWidth', 2);
    title('Serie de Tiempo 2');
    xlabel('Fecha');
    ylabel('Valor');

% Ajustar el espaciado entre subtramas
    subplot(2, 1, 1);
    datetick('x', 'mmm-yyyy', 'keepticks');
    subplot(2, 1, 2);
    datetick('x', 'mmm-yyyy', 'keepticks');
% Guardar la figura
        print(gcf, 'figures/time_series', '-dpng')
        
        