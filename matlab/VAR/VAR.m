%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Taller Introductorio a Matlab %%%%%%%%
%%%%%%%%%%%%%%% Danilo Gallardo %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

rng(1); % Semilla
%addpath Functions;

L=1; % Número de Lags del VAR
K=2; % Número de Variables del VAR

%% Cargando la Data
A=xlsread("Data.xlsx",1,"B2:C182"); % Importamos la data desde Excel
Y=A(L+1:end,:);
T=size(Y,1); % Número de observaciones
X=[ones(T,1) A(1:end-1,:)]; 

TTT=datetime(2005,01,01):calmonths(1):datetime(2019,12,01); % Vector de Fechas
TTT=TTT';

% Gráfico de la Data
 figure(1);
 subplot(1,2,1); % Indicamos que el gráfico es una matriz 1x2 y que este subgráfico va en la posición 1
 plot(TTT,Y(:,2),":r",TTT,ones(T,1),"-k",TTT,ones(T,1)+2,"-k",LineWidth=2);
 title('Inflación (Var % 12 meses)');

 subplot(1,2,2);
 plot(TTT,Y(:,1),"-.g"); % Indicamos que el gráfico es una matriz 1x2 y que este subgráfico va en la posición 2
 title('Crecimiento del PBI (Var % anualizada)');

 print(gcf, 'figures/graph1.png', '-dpng') % Save figure in .png

clear A;

%% Estimación
[beta,sigma2]=OLS(Y,X); % Estimación OLS de los coeficientes y la varianza del error

clear TTT;

%% IRFs
irf=50; % Número de Periodos para los que se va a graficar IRFs
yirf1=zeros(irf+L,K); % Matriz dónde guardaré los IRF del choque de PBI
yirf2=zeros(irf+L,K); % Matriz dónde guardaré los IRF del choque de Inflación

A0=chol(sigma2); % Matriz para identificar el VAR
v1=zeros(irf+L,K); % Matriz que contiene el shock de PBI
v1(L+1,1)=1; % Choque positivo de PBI

for i=1:irf
 yirf1(i+1,:)=[0 yirf1(i,:)]*beta+v1(i+1,:)*A0;
end
yirf1=yirf1(2:end,:);

v2=zeros(irf+L,K); % Matriz que contiene el shock de Inflación
v2(L+1,2)=1; % Choque positivo de Inflación

for i=1:irf
 yirf2(i+1,:)=[0 yirf2(i,:)]*beta+v2(i+1,:)*A0;
end
yirf2=yirf2(2:end,:);

 % Gráficos de los IRFs
 figure('Name','Respuesta ante un Choque de PBI');
 subplot(1,2,1);
 plot([yirf1(:,1) zeros(irf,1)]);
 title('Respuesta del PBI');
 axis tight;

 subplot(1,2,2);
 plot([yirf1(:,2) zeros(irf,1)]);
 title('Respuesta de la Inflación');
 axis tight;
    
 print(gcf, 'figures/graph2.png', '-dpng') % Save figure in .png

 figure('Name','Respuesta ante un Choque de Inflación');
 subplot(1,2,1);
 plot([yirf2(:,1) zeros(irf,1)]);
 title('Respuesta del PBI');
 axis tight;

 subplot(1,2,2);
 plot([yirf2(:,2) zeros(irf,1)]);
 title('Respuesta de la Inflación');
 axis tight;

 print(gcf, 'figures/graph3.png', '-dpng') % Save figure in .png

clear i A0 v1 v2 irf yirf1 yirf2;

%% Proyección
proy=12; % Número de Periodos que voy a proyectar
yproy=zeros(proy+L,K); % Matriz donde guardaré las proyecciones
yproy(1,:)=Y(T,:);

for i=1:proy
 yproy(i+1,:)=[1 yproy(i,:)]*beta+randn(1,2)*chol(sigma2);
end

TPROY=T+proy; % Total de obs incluyendo proyección
YM=[Y(133:end,:);nan(proy,K)];

yproy=[nan(47,K);yproy];

TTT=datetime(2016,01,01):calmonths(1):datetime(2020,12,01); % Vector de Fechas
TTT=TTT';

figure('Name','Proyecciones');
subplot(1,2,1);
plot(TTT,[YM(:,1) yproy(:,1)]);
title('Proyección del Crecimiento del PBI');
legend('Data','Proyección');
axis tight;

subplot(1,2,2);
plot(TTT,[YM(:,2) yproy(:,2)]);
title('Proyección de la Inflación');
axis tight;

print(gcf, 'figures/graph4.png', '-dpng') % Save figure in .png
