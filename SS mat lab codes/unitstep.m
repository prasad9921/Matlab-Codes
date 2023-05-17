function y=unitstep(t,k)
y=zeros(size(t));
y(t>=k)=1;
end