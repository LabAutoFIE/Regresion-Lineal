% --- PROGRAMA DE REGRESI�N LINEAL ---

clc; % Limpio pantalla de comandos
clear all; % Borro todos los valores que pudiera tener las variables de calculos anteriores en MATLAB
% Se ingresan los vectores x e y para trazar la recta de regresi�n
y = [4.000938415 5.00125122 6.001564025 7.00187683 7.987259594 9.002502441 10.00281525]; % Rc
x = [0 49 98 147 195 244 293]; % Indicaci�n del contador

% C�lculo de la regresi�n
n = length(x);
Sx = sum(x);
Sy = sum(y);
Sxy = sum(x.*y);
Sx2 = sum(x.^2);
Sy2 = sum(y.^2);

% Pendiente m y ordenada al origen b
m = (n*Sxy - Sx*Sy) / (n*Sx2 - Sx^2);
b = (Sy - m(1)*Sx) / n;

% C�lculo del error de m y b
sd2 = sum((y - m*x - b).^2);
m_error = sqrt(sd2 / (n-2)) / sqrt(Sx2 - Sx^2/n);
b_error = sqrt(Sx2/n - (Sx/n)^2) * m_error;

% Factor de correlaci�n
R = (n*Sxy - Sx*Sy) / sqrt((n*Sx2 - Sx^2) * (n*Sy2 - Sy^2));

% Mostrar resultados
fprintf('pendiente m= %2.5f, error %1.5f\n',m,m_error); %imprimo en pantalla pendiente �m� y error
fprintf('ordenada b= %3.3f, error %3.3f\n',b,b_error); %imprimo en pantalla ordenada �b� y error
fprintf('ordenada R= %1.5f\n',R); %imprimo en pantalla factor �R�

% Gr�fica:
figure;
plot(x,y,'ro','markersize',8,'markerfacecolor','r')
Xmin=min(x); %asigno valor de abscisa m�nima
Ymin=m(1)*Xmin+b(1); %determino valor de ordenada m�nima
Xmax=max(x); %asigno valor de abscisa m�xima, en funci�n de pendiente y ordenada al origen
Ymax=m(1)*Xmax+b(1); %determino valor de ordenada m�xima, en funci�n de pendiente y ordenada al origen
line([Xmin Xmax],[Ymin Ymax]); %trazo de recta de regresi�n

xlabel('Indicador contador [ ]') %etiqueta del eje �x� del gr�fico
ylabel('Rc [ ]') %etiqueta del eje �y� del gr�fico
grid on%Muestra la grilla
title('Regresi�n lineal Rc')%T�tulo del gr�fico
