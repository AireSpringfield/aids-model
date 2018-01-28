function [T,v1,v2,x1,x2,z,n1,n2]=odeHeun(v10,v20,x10,x20,z0,p1,p2)
% Heun's method to solve ode for the selection model
tmax=150; nmax=3000;
dt=1e-2;
nsteps=tmax/dt;
nsteps=fix(nsteps);

n1=length(v10); n2=length(v20);

T=zeros(1,nsteps);
v1=zeros(nmax,nsteps); v2=zeros(nmax,nsteps); 
x1=zeros(nmax,nsteps); x2=zeros(nmax,nsteps); 
z=zeros(1,nsteps);
v1(1:n1,1)=v10; v2(1:n1,1)=v20;
x1(1:n2,1)=x10; x2(1:n2,1)=x20;
z(1)=z0;


for i=1:nsteps-1
    t=(i+1)*dt;
    T(i+1)=t;
    
    ff=@(v1,v2,x1,x2,z)[dvdt(v1,v2,x1,x2,z,p1,p2);
                        dxdt(v1,v2,x1,x2,z,p1,p2); 
                        dzdt(v1,v2,x1,x2,z,p1,p2)];

    k1 = [v1(1:n1,i); v2(1:n2,i);
          x1(1:n1,i); x2(1:n2,i);
          z(i);]  +  dt*ff(v1(1:n1,i),v2(1:n2,i),x1(1:n1,i),x2(1:n2,i),z(i));
      
    k1_half=[v1(1:n1,i); v2(1:n2,i);
            x1(1:n1,i); x2(1:n2,i);
            z(i);]  +  dt/2*ff(v1(1:n1,i),v2(1:n2,i),x1(1:n1,i),x2(1:n2,i),z(i));
      
    k2 = ff(k1(1:n1),k1(n1+1:n1+n2),k1(n1+n2+1:2*n1+n2),k1(2*n1+n2+1:2*n1+2*n2),k1(2*n1+2*n2+1));
    
    v1(1:n1,i+1)=k1_half(1:n1) + dt/2*k2(1:n1);
    v2(1:n2,i+1)=k1_half(n1+1:n1+n2) + dt/2*k2(n1+1:n1+n2);
    x1(1:n1,i+1)=k1_half(n1+n2+1:2*n1+n2) + dt/2*k2(n1+n2+1:2*n1+n2);
    x2(1:n2,i+1)=k1_half(2*n1+n2+1:2*n1+2*n2) + dt/2*k2(2*n1+n2+1:2*n1+2*n2);
    z(i+1)=k1_half(2*n1+2*n2+1)+dt/2*k2(2*n1+2*n2+1);

    
    
     % consider the creation of new mutant
     if(rand(1)<p1(7)*sum(v1(1:n1,i))*dt)
        n1=n1+1;
      v1(n1,i+1)=1e-3;
     end
     if(rand(1)<p2(7)*sum(v2(1:n2,i))*dt)
        n2=n2+1;
      v2(n2,i+1)=1e-3;
     end
 
   
     
end

end