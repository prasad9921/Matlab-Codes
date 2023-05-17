syms x y
f=@(x,y) -x^3+4*x*y-2*y^2+1;
pdx=diff(f,x);
pdy=diff(f,y);
[sol_x,sol_y]=solve(pdx,pdy);
if(isreal(double(sol_x))&&isreal(double(sol_y)))
sol_x=double(sol_x);
sol_y=double(sol_y);
end
r=diff(pdx,x);
s=diff(pdx,y);
t=diff(pdy,y);
n=length(sol_x);
for i=1:n
    r_val=double(subs(r,[x,y],[sol_x(i),sol_y(i)]));
    s_val=double(subs(s,[x,y],[sol_x(i),sol_y(i)]));
    t_val=double(subs(t,[x,y],[sol_x(i),sol_y(i)]));
    f_val=double(f(sol_x,sol_y));
    d=double(r_val*t_val-s_val^2);
    if(d>0&&r<0)
        fprintf('max val at (%.2f,%.2f) and max val is %.2f',sol_x(i),sol_y(i),f_val)
    else if(d>0&&r>0)
            fprintf('min val at (%.2f,%.2f) and min val is %.2f',sol_x(i),sol_y(i),f_val)
        else if(d<0)
                fprintf('saddle point at (%.2f,%.2f)',sol_x(i),sol_y(i))
            else if(d==0)
                    fprintf('Further investigation needed')
                end
            end
        end
    end
end
