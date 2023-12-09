% Cleaning
clc
clear 
close all

%% Matrix A
A = [2, 1; 7, 4];
inverse_A = inverseGaussJordan(A);
disp('Original Matrix:');
disp(A);
disp('Inverse using Gauss-Jordan:');
disp(inverse_A);

%% Matrix B
B = [6, 0, 7; 4, 0, 5; 1, 2, 3];
inverse_B = inverseGaussJordan(B);
disp('Original Matrix:');
disp(B);
disp('Inverse using Gauss-Jordan:');
disp(inverse_B);

% ¿?



