% % T1 % Time varying signal 
 
t = 0:0.001:1; 
y = chirp(t,0,1,250);
 subplot(511) 
plot(t,y),title('Non Linear signal')
 % DWT with HAAR Wavelet 
 [A1,D1] = dwt(y,'haar');
 [A2,D2] = dwt(A1,'haar');
 [A3,D3] = dwt(A2,'haar');
 subplot(512) 
plot(A1),title('Approx Coefficients')
 subplot(513) 
plot(D1),title('Details Level-1 Coefficients')
 subplot(514) 
plot(D2),title('Details Level-2 Coefficients')
 subplot(515)
 plot(D3),title('Details Level-3 Coefficients')
 %% T2 
Y = fft(y); 
figure 
subplot(211),plot(20*log10(abs(Y)+1)),title('DFT')
 subplot(212),plot(A1),title('DWT') 
%% T3 
Fs = 40; %Sampling Rate/Frequency Hz
 st = 1/Fs;  % Sample in between time interval in Sec 
t = 0:st:10; Fc = 20;  % Sine wave frequency Hz
 x = sin(2*pi*Fc/Fs*t); t = t/Fs;
 figure 
subplot(221),plot(t,x)
 % Add Noise Randomly 
a = 2; % Noise Intensity
 Noisy_dataIn = randn(1,401)./a+x;
 subplot(222),plot(t,Noisy_dataIn) 
[A1,D1] = dwt(Noisy_dataIn,'haar');
 [A2,D2] = dwt(A1,'haar');
 [A3,D3] = dwt(A2,'haar');
 [A4,D4] = dwt(A3,'haar');
 % D3 = zeros(1,length(D3)); 
D2 = zeros(1,length(D2)+1);
 D1 = zeros(1,length(D1)+3); 
a2 = idwt(A3,D3,'haar');
 a1 = idwt(a2,D2,'haar');
 a0 = idwt(a1,D1,'haar'); 
a21 = upsample(a2,4);
 DWT_filt = a0(1:401); 
subplot(223),plot(DWT_filt),title('DWT De-Noised Signal')
 % Noise removal using fft
 Y = fft(Noisy_dataIn);
 mean_value = mean(abs(Y)); 
threshold  = 1.1*mean_value;
 % Fine-tune this
 Y(abs(Y) < threshold) = 0;
 filtered_FFT = ifft(Y);
 subplot(224),plot(filtered_FFT),,title('FFT De-Noised Signal')
 %% T4
 mse_n = (sum((x-Noisy_dataIn).^2)/(length(x))^2) 
psnr_noisy = 10*log10(max(x)/mse_n)
 mse_fft = (sum((x-filtered_FFT).^2)/(length(x))^2)
 psnr_fft = 10*log10(max(x)/mse_fft)
 mse_dwt = (sum((x-DWT_filt).^2)/(length(x))^2)
 psnr_dwt = 10*log10(max(x)/mse_dwt)
