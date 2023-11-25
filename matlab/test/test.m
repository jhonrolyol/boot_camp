% Create example data for time series
tiempo = linspace(datenum('2020-01-01'), datenum('2022-12-31'), 36);
serie1 = cumsum(randn(1, 36));
serie2 = cumsum(randn(1, 36));

% Create the figure
figure;

% Plot the first time series
subplot(2, 1, 1);
plot(tiempo, serie1, 'b', 'LineWidth', 2);
title('Time Series 1');
xlabel('Date');
ylabel('Value');

% Plot the second time series
subplot(2, 1, 2);
plot(tiempo, serie2, 'r', 'LineWidth', 2);
title('Time Series 2');
xlabel('Date');
ylabel('Value');

% Adjust spacing between subplots
subplot(2, 1, 1);
datetick('x', 'mmm-yyyy', 'keepticks');
subplot(2, 1, 2);
datetick('x', 'mmm-yyyy', 'keepticks');

% Save the figure
print(gcf, 'figures/time_series', '-dpng');

        
        