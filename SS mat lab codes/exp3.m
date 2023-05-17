
t = [-10:0.01:10]; 
alpha = -0.1+0.3j;
x = exp(-alpha*t);

 plot(t,real(x));

plot(t,imag(x));

plot(t,abs(x));

 plot(t,(180/pi)*angle(x));
