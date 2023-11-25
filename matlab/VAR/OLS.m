function [B,sigma2]=OLS(Y,X);

 % Y --> Matriz de Variables Dependientes
 % X --> Matriz que contiene los regresores

 T=size(Y,1); % # de obs
 K=size(X,2); % # de regresores

 B=inv(X'*X)*X'*Y; % Coeficientes
 ee=Y-X*B;
 sigma2=(ee'*ee)/(T-K); % Varianza Estimada

end