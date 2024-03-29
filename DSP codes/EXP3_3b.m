a = 1;
b = [1 -1];
n2 = 0:21;
[x11,nx11] = stepseq(0,0,21);
[x12,nx12] = stepseq(10,0,21);
[x13,nx13] = stepseq(20,0,21);
x2 = n2.*(x11 - x12) + (20 - n2).*(x12 - x13);
y2 = filter(b,a,x2);
Hf_1 = figure;
set(Hf_1,'NumberTitle','off','Name','P0220b');
Hs = stem(n2,y2,'filled');
set(Hs,'markersize',2);
axis([min(n2)-1,max(n2)+1,min(y2)-0.5,max(y2) + 0.5]);
xlabel('n');
ylabel('y(n)');
title('Output response for triangular pulse');