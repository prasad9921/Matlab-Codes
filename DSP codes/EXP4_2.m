n = 0:100;
x = 10*(0.8) .^ n;
y = x(mod(-n,11)+1);
subplot(2,1,1);
stem(n,x);
title('Original sequence')
xlabel('n');
ylabel('x(n)');
subplot(2,1,2);
stem(n,y);
title('Circularly folded sequence')
xlabel('n');
ylabel('x(-n mod 10)')