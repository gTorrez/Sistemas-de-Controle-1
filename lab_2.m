clear all
close all 
clc

t = 0:0.001:20;

disp('===================== EX 1 ======================')
b = [1 -2];
a = [1 4 0 0];
[r,p,k] = residue(b, a)

y1 = -0.375*exp(-4*t) - 0.5 * t + 0.375*t;
figure, plot(t, y1, '-b');
xlabel('x');
ylabel('x(t)');
title('Ex 1');


disp('===================== EX 2 ======================')
c = [1 3];
d = [1 3 2];
[r,p,k] = residue(c, d)

 
y2 = 2*exp(-t) - exp(-2*t);
figure, plot(t, y2, '-b');
xlabel('x');
ylabel('x(t)');


disp('===================== EX 3 ======================')
e = [2];
f = [1 5 8 4];
[r,p,k] = residue(e, f)


y3 = 2*exp(-t) - 2 * exp(-2*t) .* t - 2*exp(-2*t);
figure, plot(t, y3, '-b');
xlabel('x');
ylabel('x(t)');
 