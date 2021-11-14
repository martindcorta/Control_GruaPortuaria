
clc;
close all;
clear all;

%% %% %% ----------------- PLANTA ------------------ %% %% %%

       % ------------ TRASLACIÓN CARRO ------------- %

%Parámetros físicos
mc   = 50000;                       %[kg] masa total del carro
Jmt  = 10;                          %[kg*m2] momento de inercia motor
Jw   = 2;                           %[kg*m2] momento de inercia rueda
Rw   = 0.5;                         %[m] radio primitivo rueda
rt   = 15;                          %[] relación de transmisión
btEq = 30;                          %[N*m/(rad/s)] lado motor

% Parámetros equivalentes de traslación
Mt   = mc + (Jw+Jmt*rt^2) / (Rw^2); %[kg] masa equivalente
bt   = btEq*rt^2/Rw^2;              %[N*m/(rad/s)] fricción equivalente viscosa

      % -------------- IZAJE DE CARGA -------------- %

%Parámetros físicos
Jd   = 8;                           %[kg*m2] momento de inercia tambor
Jmh  = 30;                          %[kg*m2] momento de inercia motor y freno
Rd   = 0.75;                        %[m] radio primitivo de tambor
rh   = 30;                          %[] relación de transmisión
bhEq = 18;                          %[N*m/(rad/s)] lado motor

% Parámetros equivalentes izaje
Mh   = (Jd+Jmh*rh^2) / (Rd^2);      %[kg] masa equivalente
bh   = bhEq*rh^2/Rd^2;              %[N*m/(rad/s)] fricción equivalente

      % -------------- CABLE ELÁSTICO -------------- %
Kw   = 1800000;                     %[N/m] rigidez a la tracción
bw   = 30000;                       %[N/(m/s)] fricción viscosa propia

%% %% %% ------------ VARIABLES GLOBALES ----------- %% %% %%

       % -------------- CARGA COLGANTE --------------- %
mlVacio     = 15000;                %[kg] masa gancho
mContenedor = 2000;                 %[kg] masa contenedor vacío
hContenedor = 2.5;                  %[m] altura contenedor bajo gancho
bContenedor = 2.5;                  %[m] ancho contenedor bajo gancho
mlMin       = mlVacio+mContenedor;  %[kg] masa mínimo cargado
mlMax       = mlMin+48000;          %[kg] masa máximo cargado
g           = 9.80665;              %[m/s2] gravedad

       % ------------- DIMENSIONES PLANTA ------------- %
yt0     = 45;                       %[m] altura de carro y sistema de izaje
ySB     = 15;                       %[m] altura viga testera (Sill Beam)

       % ------- Velocidad y aceleración máximas ------ %
%VtMax   =  4;                       %[m/s]  con o sin carga (en Simulink)
VhMaxC  =  1.5;                     %[m/s]  con carga (Cargado)
VhMaxV  =  3;                       %[m/s]  sin carga (Vacío)
AtMax   =  1;                       %[m/s2] con o sin carga
AhMax   =  1;                       %[m/s2] con o sin carga

       % ------------- Posiciones Límite -------------- %
hLimSup = 40+2; %5;                 %[m] (40 en +Y)
hLimInf = -17.5-2; %62.5;           %[m] (-20 en Y - 2.5 altura contenedor)
tLimIzq = -30-2;                    %[m]
tLimDer = 50+2;                     %[m]

%% Carriles lado MUELLE y lado BARCO
% Nota: SB considerado como carril 1 lado barco, con 14 contenedores (+15m)
cantidadCarrilesBarco = 9+1; %9 + SB

% Contenedores iniciales en barco
%nRand = randi([1 20],1,cantidadCarrilesBarco); %(carriles aleatorios)

nRand = [14 17 20 22 20 17 14 8 8 8];      %Pirámide
%nRand = [14 7 20 7 14 8 9 18 13 18];      %Pirámide invertida
%nRand  = [14 15 14 13 12 10 9 3 20 16];   %Descendente
%nRand  = [14 16 17 18 19 20 20 21 21 14]; %Ascendente
%nRand = [14 17 20 20 17 19 19 16 7 20];   %Informe
%nRand = [14 8 16 6 1 15 19 20 14 16];     %Sesgado a derecha.

xCarrilMuelle = [-30,-25,-20,-15,-10,-5];
xCarrilBarco  = zeros(1,cantidadCarrilesBarco);
yCarrilBarcoPar  = zeros(1,cantidadCarrilesBarco);

for i=1:cantidadCarrilesBarco
     xCarrilBarco(i) = 55/(cantidadCarrilesBarco+1)*i-5;
     yCarrilBarcoPar(i) = nRand(i)*hContenedor -20;
end
yCarrilBarcoPar(1) = 15; %Coordenada y de SB

%% ------------------ GRÁFICO INICIAL -------------------- %%
graficoAux(cantidadCarrilesBarco, xCarrilBarco, bContenedor, hContenedor, nRand); 

%% --------------- CONTROLADORES NIVEL 2 ----------------- %%
[Ba_t,Ksa_t,Ksia_t] = PID_traslacion_CARRO (bt,Mt);
[Ba_h,Ksa_h,Ksia_h] = PID_izaje_CARGA (bh,Mh);
[lh,Ba_b,Ksa_b]     = PD_balanceo_CARGA_GainScheduling (mc,mlMax,Mt);
%% --------------------- SIMULACIÓN ---------------------- %%
sim('Proyecto_Global_AyCD_Ultimo2')

