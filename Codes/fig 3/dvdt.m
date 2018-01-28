% compute dvi/dt for strain 1 and 2, i=1,2,...,n
function derivative=dvdt(v1,v2,x1,x2,z,p1,p2)
 derivative=[v1.*(p1(1)-p1(2)*z-p1(3)*x1);
             v2.*(p2(1)-p2(2)*z-p2(3)*x2)];
end