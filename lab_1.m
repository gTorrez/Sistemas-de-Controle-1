close all;
clear all;
clc;

%vetor de tempo para simulacao
t = 0:0.001:10;

%Operador de Laplace 
s = tf('s'); %'s' vira o operador de Laplace. Ver oq e o tf()

%funcao de transferencia (tf) da planta
P = 100/(s^2 + 4*s + 5);

%calcula polos
disp('Polos')
p = pole(P)

disp(' ')
disp('Zeros')
z = zero(P)

%resposta ao impulso
y1 = impulse(P, t);

figure, plot(t, y1, '-r');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I.');
title('Resposta ao impulso');

%resposta ao degrau
y2 = step(10*P, t);

figure, plot(t, y2, '-b');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I.');
title('Resposta ao degrau');

%resposta a rampa
y3 = step(P/s, t);

figure, plot(t, y3, '-k', t, t, 'g');
legend('Saida', 'Entrada');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I.');
title('Resposta a rampa');

%entrada generica
u = 10*sin(10*t); %entrada genérica
y4 = lsim(P, u, t); %ft, entrada no tempo e vetor de tempo

figure, plot(t, y4, '-k', t, u, 'r');
legend('Saida', 'Entrada');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I.');
title('Resposta a u(t)');
