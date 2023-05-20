figure(1);
clf
% a) x(n) = 2*delta(n+2) - delta(n-4), -5<=n<=5
n = [-5:5];
x = 2*impseq(-2,-5,5)-impseq(4,-5,5);
subplot(2,2,1);
stem(n,x);
title('Sequence')
xlabel('n');
ylabel('x(n)');
axis([-5,5,-2,3])
%