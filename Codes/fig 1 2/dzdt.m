% compute dz/dt
function derivative=dzdt(v,x,z,p)
 derivative=p(5)*sum(v)-p(6)*sum(v)*z;
end