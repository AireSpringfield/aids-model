% compute dz/dt
function derivative=dzdt(v1,v2,x1,x2,z,p1,p2)
 derivative=(p1(5)-p1(6)*z)*(sum(v1)+sum(v2));
end