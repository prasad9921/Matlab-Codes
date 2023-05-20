% d) x(n) = {...,5,4,3,2,1,5,4,3,2,1,...}; -10<=n<=9
n=[-10:9];
x=[5,4,3,2,1];
xtilde=x' * ones(1,4);
xtilde=(xtilde(:))';
subplot(2,2,4);
stem(n,xtilde);
title('Sequence')
xlabel('n');
ylabel('xtilde(n)');
axis([-10,9,-1,6])