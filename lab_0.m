clc;       %limpa janela de comando
clear all; %limpa todas as variaveis
close all; %fecha todos os graficos abertos

%vetor de tempo de simulacao
t_init = 0;            %inicio da simulacao
t_final = 10;          %final da simulacao
dt = 0.001;            %passo da simulacao
t = t_init:dt:t_final  %vetor de tempo, onde se declara: inicio, passo e fim

%calcular uma funçaõ em relação ao tempo
A1 = 2;                   %amplitude da cossenoide
f1 = 1;                    %frequencia da cossenoide em hz
y1 = A1 * cos(2*pi*f1*t);  %output cossenoide

%grafico
figure, plot(t, y1,'-r')
xlabel('tempo(s)')
ylabel('Amplitude (S.I.)')
axis([-1 11 -3 3])

%calcular uma funçaõ em relação ao tempo
A2 = 1;                   %amplitude da senoide
f2 = 0.5;                    %frequencia da senoide em hz
y2 = A2 * sin(2*pi*f2*t);  %output senoide

%grafico
figure, plot(t, y1,'-xr', t, y2, '-og')
xlabel('tempo(s)')
ylabel('Amplitude (S.I.)')
axis([-2 12 -3 3])

%grafico 3d
figure,plot3(t, y1, y2)
