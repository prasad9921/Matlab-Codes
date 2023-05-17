clear all; close all; clc;
syms t;
x = exp(-t)*heaviside(t);

figure();
ezplot(x,[-1 6]); title('Original Signal e^-t u(t)');
axis([-1 6 0 1.2]);

X = fourier(x)