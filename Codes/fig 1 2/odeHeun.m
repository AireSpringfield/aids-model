function [T,v,x,z,n]=odeHeun(v0,x0,z0,p)
% Heun's method to solve the odes for the basic model
tmax=40; nmax=2000;
dt=1e-2;
nsteps=tmax/dt;
nsteps=fix(nsteps);

n=length(v0);

T=zeros(1,nsteps);
v=zeros(nmax,nsteps); x=zeros(nmax,nsteps); z=zeros(1,nsteps);
v(1:n,1)=v0; x(1:n,1)=x0;
z(1)=z0;


for i=1:nsteps-1
    t=(i+1)*dt;
    T(i+1)=t;
    
    
    
    ff=@(v,x,z)[dvdt(v,x,z,p); dxdt(v,x,z,p); dzdt(v,x,z,p)];
    k1 = [v(1:n,i); x(1:n,i); z(i)] + dt*ff(v(1:n,i),x(1:n,i),z(i));
    k2 = ff(k1(1:n),k1(n+1:2*n),k1(2*n+1));
    v(1:n,i+1)=v(1:n,i)+ dt/2*dvdt(v(1:n,i),x(1:n,i),z(i),p) + dt/2*k2(1:n);
    x(1:n,i+1)=x(1:n,i)+ dt/2*dxdt(v(1:n,i),x(1:n,i),z(i),p) + dt/2*k2(n+1:2*n);
    z(i+1)=z(i)+dt/2*dzdt(v(1:n,i),x(1:n,i),z(i),p)+dt/2*k2(2*n+1);
    
     if(rand(1)<p(7)*sum(v(1:n,i))*dt) % consider the creation of new mutant
        n=n+1;
      v(n,i+1)=1e-3;
     end
    
   
     
end

end