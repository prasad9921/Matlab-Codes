

% % SA_FT_1.m
% 
% % Fourier Transform of exponentially decaying signals:
% % Developed by Dr. M. Venu Gopala Rao, Professor, Dept. of ECE,
% % KL University, Vaddeswaram, Guntur Dt., A.P., India.
% % Email: mvgr03@kluniversity.in,  mvgr03@gmail.com.
% 

clear all; close all; clc;
syms t;
x = exp(-t)*heaviside(t);

figure();
ezplot(x,[-1 6]); title('Original Signal e^-t u(t)');
axis([-1 6 0 1.2]);

X = fourier(x)

% %==========   Spectrum    ================

w = -pi:0.001:pi;
X = 1./(i*w + 1);
Xm = abs(X);
Xp = angle(X);

figure();
subplot(2,1,1);plot(w,Xm,'r','LineWidth',3);title('Magnitude Spectrum');
axis([-pi pi 0 1.2]);
subplot(2,1,2);plot(w,Xp,'b','LineWidth',3);title('Phase Spectrum');
axis([-pi pi -pi/2 pi/2]);

