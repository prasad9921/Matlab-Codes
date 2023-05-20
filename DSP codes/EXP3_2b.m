b = [1 2 0 1];
a = [1 -0.5 0.25];
n = 0:200;
x = 5*ones(size(n))+3*cos(0.2*pi*n)+4*sin(0.6*pi*n);
y = filter(b,a,x);
Hf_1 = figure;
set(Hf_1,'NumberTitle','off','Name','P0219c');
Hs = stem(n,y,'filled');
set(Hs,'markersize',2);
axis([-10,210,0,50]);
xlabel('n');
ylabel('y(n)');
title('Output response')