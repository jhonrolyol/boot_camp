
% Cleaning
    clc
    clear 
    close all

% Helps files
    help plot 
    doc plot 
    
% Plot
    plot(100:5:120);
    x1 = 100:5:120;
    
    plot(100:5:120,'.');

 % Graph 
    clc
    clearvars
    close all

    x2  = 1:10;
    y = x2.^2;
    plot(x2,y);
    plot(x2,y,'b*');
    plot(x2,y,'kd');

    help plot;

% Include title and axis
    plot(x2,y,'b*')
    title('Plot 1')
    xlabel('x-values')
    ylabel('y-values')
    grid on 

% Other option
    plot(x2,y,'b*')
    title('Plot of Y = X^2')
    xlabel('x')
    ylabel('Y = X^2')
    grid on 

% 

