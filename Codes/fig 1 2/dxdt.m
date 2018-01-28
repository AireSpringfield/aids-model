% compute dxi/dt for i=1,2,...,n
function derivative=dxdt(v,x,z,p)
 derivative=p(4)*v-p(6)*sum(v)*x;
end