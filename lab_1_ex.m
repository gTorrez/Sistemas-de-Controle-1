clear all;
close all;
clc;

t = 0:0.001:20;

s = tf('s');

%tf planta
P = 10/(s*(s+1))

%tf controlador
K = 1.05*((s+1.5)/(s+3.75))

%tf feedback
H = 1

disp('===================== ITEM A ======================')
%ft ramo direto
G_a = P;

%tf MF
disp('T_a')
T_a = feedback(G_a, H)

p_a = pole(T_a)
z_a = zero(T_a)

disp('====================== ITEM B =====================')
%tf ramo direto
G_b = K * P;

%tf MF
disp('T_b')
T_b = feedback(G_b, H)

p_b = pole(T_b)
z_b = zero(T_b)

disp('====================== ITEM C =====================')
%resposta ao impulso unitario
y1 = impulse(T_a, t);
y2 = impulse(T_b, t);

figure, plot(t, y1, '-r', t, y2, '-k');
legend('T1(sem controlador)', 'T2(com controlador)');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I.)');
title('Resposta ao impulso');

%resposta ao degrau unitario
y3 = step(T_a, t);
y4 = step(T_b, t);

figure, plot(t, y3, '-r', t, y4, '-k');
legend('T1(sem controlador)', 'T2(com controlador)');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I.)');
title('Resposta ao degrau');

%resposta a rampa unitaria
y5 = step(T_a/s, t);
y6 = step(T_b/s, t);

figure, plot(t, y5, '-r', t, y6, '-k');
legend('T1(sem controlador)', 'T2(com controlador)');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I.)');
title('Resposta a rampa');

disp('====================== ITEM D =====================')
u = 2*sin(30*t) + 1*cos(t); %entrada genérica
y7 = lsim(T_a, u, t); %ft, entrada no tempo e vetor de tempo
y8 = lsim(T_b, u, t);

figure, plot(t, y7, '-k', t, y8, 'r');
legend('T1(sem controlador)', 'T2(com controlador)');
xlabel('Tempo (s)');
ylabel('Amplitude (S.I.');
title('Resposta a u(t)');



