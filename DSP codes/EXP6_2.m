wp = 0.2*pi;                         % digital Passband freq in Hz 
  
ws = 0.3*pi;                         % digital Stopband freq in Hz 
  
Rp = 1;                              % Passband ripple in dB 
  
As = 15;                             % Stopband attenuation in dB 
  
% Analog Prototype Specifications: Inverse mapping for frequencies 
  
T = 1;                               % Set T=1 
  
OmegaP = wp * T;                     % Prototype Passband freq 
  
OmegaS = ws * T;                     % Prototype Stopband freq 
  
ep = sqrt(10^(Rp/10)-1);             % Passband Ripple parameter 
  
Ripple = sqrt(1/(1+ep*ep));          % Passband Ripple 
  
Attn = 1/(10^(As/20));               % Stopband Attenuation 
  
 
% Analog Butterworth Prototype Filter Calculation: 
  
[cs,ds] = afd_butt(OmegaP,OmegaS,Rp,As); 
  
%%*** Butterworth Filter Order =  6  
  
  
% Impulse Invariance transformation: 
  
[b,a] = imp_invr(cs,ds,T); 
  
%[C,B,A] = dir2par(b,a) 
  
%%C =  [] 
  
%%B = 1.8557   -0.6304 
  
%%   -2.1428    1.1454 
  
%%    0.2871   -0.4466 
  
%%A = 1.0000   -0.9973    0.2570 
  
%%    1.0000   -1.0691    0.3699 
  
%%    1.0000   -1.2972    0.6949 
  
  
  
% Plotting 
  
figure(1);  
subplot(1,1,1) 
  
[db,mag,pha,grd,w] = freqz_m(b,a); 
  
subplot(2,2,1);  plot(w/pi,mag);  title('Magnitude Response') 
  
xlabel('frequency in pi units');  ylabel('|H|');  
axis([0,1,0,1.1]) 
  
set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1]); 
  
set(gca,'YTickmode','manual','YTick',[0,Attn,Ripple,1]); 
  
subplot(2,2,3);  
plot(w/pi,db);  
 
title('Magnitude in dB'); 
  
xlabel('frequency in pi units'); 
ylabel('decibels');  
axis([0,1,-40,5]); 
  
set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1]); 
  
set(gca,'YTickmode','manual','YTick',[-50,-15,-1,0]);  
  
set(gca,'YTickLabelMode','manual','YTickLabels',['50';'15';' 1';' 0']) 
  
subplot(2,2,2); 
plot(w/pi,pha/pi); 
title('Phase Response') 
xlabel('frequency in pi units');  
ylabel('pi units');  
axis([0,1,-1,1]); 
  
set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1]); 
  
set(gca,'YTickmode','manual','YTick',[-1,0,1]);
subplot(2,2,4); 
plot(w/pi,grd);  
title('Group Delay')
  
xlabel('frequency in pi units');  ylabel('Samples');  
axis([0,1,0,10]) 
  
set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1]); 
  
set(gca,'YTickmode','manual','YTick',[0:2:10]); 
