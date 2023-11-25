% Generar datos aleatorios para el modelo VAR
nObservations = 100;  % Número de observaciones
nVariables = 3;       % Número de variables

% Crear una matriz de innovaciones aleatorias (ruido blanco)
innovations = randn(nObservations, nVariables);

% Crear una matriz de coeficientes para el modelo VAR (matriz A)
A = [0.8 -0.4 0.2; -0.2 0.6 -0.3; 0.1 -0.2 0.5];

% Calcular e imprimir la función de impulso de respuesta
lags = 20;  % Número de rezagos para la función de impulso de respuesta

irf_matrix = zeros(nVariables, nVariables, lags+1);
irf_matrix(:, :, 1) = eye(nVariables); % Impulso unitario en el primer rezago

for lag = 1:lags
    irf_matrix(:, :, lag+1) = A' * squeeze(irf_matrix(:, :, lag));
end

figure;
for i = 1:nVariables
    for j = 1:nVariables
        subplot(nVariables, nVariables, (i-1)*nVariables + j);
        plot(0:lags, squeeze(irf_matrix(i, j, :)), '-o');
        title(['IRF: ' num2str(i) ' -> ' num2str(j)]);
        xlabel('Rezagos');
        ylabel('Respuesta');
        print(gcf, 'figures/impulse_response_function', '-dpng');
    end
end



