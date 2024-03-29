clc;
close all;
a = 1;
b = [1 -1];
n1 = 0:22;
[x11,nx11] = stepseq(0,0,22);
[x12,nx12] = stepseq(20,0,22);
x1 = 5*(x11 - x12);
y1 = filter(b,a,x1);
Hf_1 = figure;
set(Hf_1,'NumberTitle','off','Name','P0220a');
Hs = stem(n1,y1,'filled');
set(Hs,'markersize',2);

axis([-1,23,-6,6]);
xlabel('n');
ylabel('y(n)');
ytick = [-6:6];
title('Output response for rectangular pulse ');
set(gca,'YTickMode','manual','YTick',ytick);