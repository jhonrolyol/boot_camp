%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Taller Introductorio a Matlab %%%%%%%%
%%%%%%%%%%%%%%% Danilo Gallardo %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

%addpath Functions;

%% Cargando la Data
A=xlsread('Data.xlsx',1,'C2:C182'); % Importamos la data desde Excel
Y=A(2:end,:); % Obtenemos la data de inflación desde 01.2005 hasta 12.2019
T=size(Y,1); % # Obs
X=[ones(T,1) A(1:end-1,:)]; % Regresores

clear A;

%% Estimación
[Bols,sigmaols]=OLS(Y,X); % Estimación OLS de los coeficientes y la varianza del error
varols=sigmaols*inv(X'*X); % Calculamos la varianza de los coeficientes
se=[sqrt(varols(1,1)/T);sqrt(varols(2,2)/T)]; % Calculamos los errores estándar

Bols=round(Bols,4);
sigmaols=round(sigmaols,4);
se=round(se,4);

%% Reportando los resultados
cin=[Bols(1)-1.96*se(1) Bols(1)+1.96*se(1);Bols(2)-1.96*se(2) Bols(2)+1.96*se(2)]; % Calculamos los Intervalos de Confianza
cin=round(cin,4);
tt=[Bols(1)/se(1);Bols(2)/se(2)]; % Calculamos los estadísticos t

res=table(Bols,se,tt,cin,'VariableNames',["Coeficiente","Error Estándar","t","Intervalo de Confianza 95%"],'RowNames',["B0","B1"]);
disp(res);

%% Exportando a Excel
writetable(res,"AR1.xlsx");