close all;
clear all;
clc;

s = tf('s');

t = 0:0.001:15;
%=========================== LAB 01 ===============================
P_a = (s^2+4*s+8)/(s^2*(s+4));
G_a= P_a;
H = 1;

k_a = 7.57;
G_2 = P_a * k_a;
T_a = feedback(G_2, H);
pole(T_a)

figure, rlocus(P_a*H)

%=========================== LAB 02 ===============================
P = (5)/(s*(s+3));
K = 2.97*((s+2)/(s+2.85));
G = P*K;
T = feedback(G, H); %com controlador
T_2 = feedback(P, H); %sem controlador
pole(T)

y1 = step(T, t); %com controlador
y2 = step(T_2, t); %sem controlador

figure, plot(t, y1, '-b', t, y2, 'r');
legend('com controlador', 'sem controlador')
xlabel('Tempo (s)');
ylabel('Amplitude (S.I.');
title('Resposta ao degrau');

F = (K)/(1+K*P*H);
y3 = step(F, t);
figure, plot(t, y3, '-g');
legend('sinal de controle')
xlabel('Tempo (s)');
ylabel('Amplitude (S.I.');
title('Resposta ao degrau');