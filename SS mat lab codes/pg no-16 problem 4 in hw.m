syms x y z
u=(x^2-y^2)/(x^2+y^2);
v=2*x*y/(x^2+y^2);
J=jacobian([u,v],[x,y]);
k=[J];
if(double(k)==0)
    fprintf('given function is finally dependent');
else
     fprintf('given function is not finally dependent');
    