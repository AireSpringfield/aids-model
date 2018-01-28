% compute dvi/dt for i=1,2,...,n
function derivative=dvdt(v,x,z,p)
 derivative=v.*(p(1)-p(2)*z-p(3)*x);
end