% Generate random data for the VAR model
nObservations = 100;  % Number of observations
nVariables = 3;       % Number of variables

% Create a matrix of random innovations (white noise)
innovations = randn(nObservations, nVariables);

% Create a matrix of coefficients for the VAR model (matrix A)
A = [0.8 -0.4 0.2; -0.2 0.6 -0.3; 0.1 -0.2 0.5];

% Calculate and print the impulse response function
lags = 20;  % Number of lags for the impulse response function

irf_matrix = zeros(nVariables, nVariables, lags+1);
irf_matrix(:, :, 1) = eye(nVariables); % Unit impulse in the first lag

for lag = 1:lags
    irf_matrix(:, :, lag+1) = A' * squeeze(irf_matrix(:, :, lag));
end

figure;
for i = 1:nVariables
    for j = 1:nVariables
        subplot(nVariables, nVariables, (i-1)*nVariables + j);
        plot(0:lags, squeeze(irf_matrix(i, j, :)), '-o');
        title(['IRF: ' num2str(i) ' -> ' num2str(j)]);
        xlabel('Lags');
        ylabel('Response');
        print(gcf, 'figures/impulse_response_function', '-dpng');
    end
end



