
clc;
t=-5:0.001:5;
k=-5;
x=exp(-1*t).*unitstep(t,k);
h=exp(-1*t).*unitstep(t,k);
y=conv(x,h);
plot(y)