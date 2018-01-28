% compute dxi/dt for strain 1 and 2, i=1,2,...,n
function derivative=dxdt(v1,v2,x1,x2,z,p1,p2)
 derivative=[p1(4)*v1-p1(6)*(sum(v1)+sum(v2))*x1;
             p2(4)*v2-p2(6)*(sum(v1)+sum(v2))*x2];
end