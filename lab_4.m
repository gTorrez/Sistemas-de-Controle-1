close all;
clear all;
clc;

t_a = 0:0.001:30;
t_b = 0:0.001:6;

%ft a)
disp('============== Primeira  ordem ==============')
s = tf('s');

gamma = 5
T = 3

P_a = 5/(3*s+1);

y_a = step(P_a, t_a);

figure, plot(t_a, y_a, '-b');
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Resposta ao degrau');


%ft b)
%P_b = (4*(8.060^2))/(s^2 + 2*0.20092*8.060*s + (8.060^2));

disp('============== Segunda  ordem ============== ')
gamma = 4
pss = 100 * ((6.1 - gamma)/gamma)
E = (log(100/pss))/(pi^2 + (log(100/pss))^2)^(1/2)
wn = 4/(2.47*E)
tp = pi/(wn * (1-(E^2))^(1/2))

P_b = (gamma*(wn^2))/(s^2 + 2*E*wn*s + (wn^2));

y_b = step(P_b, t_b);

figure, plot(t_b, y_b, '-b');
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Resposta ao degrau');