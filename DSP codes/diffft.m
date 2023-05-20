function y=diffft(x,N)
%Pad zeros
P=length(x);

if (P < N)
xi=[x,zeros(1,N-P)];
else
xi=x;
end
%Compute number of butterfly stages
r=0;
while ((2^r) < N)
r=r+1;
end
%Compute N point DIT FFT
for i=0:r-1 %Loop through each butterfly stage
tmp=[zeros(1,N)];
lim1=N/(2^(r-i));
for j=0:lim1-1 %Loop through each butterfly group
lim2=N/(2^(i+1));
for k=0:lim2-1 %Loop through each butterfly computation
m=(2^(r-i))*j;
n=N/(2^(i+1));
p=2^i;
s=2^(r-1-i);
w=exp((-1*sqrt(-1)*2*pi*p*k)/N);
tmp(k+m+1)=x(k+m+1)+x(k+m+s+1);
tmp(k+m+n+1)=(x(k+m+1)-x(k+m+s+1))*w;
end %End butterfly computaion
end %End butterfly group
for q=0:N-1
x(q+1)=tmp(q+1);
end
end %End butterfly stage
%Perform bit-reversal
for i=0:N-1
br='';
for j=0:r-1
br=[br,num2str(bitget(i,j+1))];
end
dr=bin2dec(br);
xi(dr+1)=x(i+1);
end
x=xi;
y=x;