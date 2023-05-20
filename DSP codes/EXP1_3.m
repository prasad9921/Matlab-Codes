% c) x(n) = cos(0.04*pi*n) + 0.2*w(n); 0<=n<=50, w(n): Gaussian (0,1)
n = [0:50];
x = cos(0.04*pi*n)+0.2*randn(size(n));
subplot(2,2,3);
stem(n,x);
title('Sequence')
xlabel('n');
ylabel('x(n)');
axis([0,50,-1.4,1.4])
%