% main

% order of parameters: r    s    p    k    k_prime  u     bQ_prime
%                      p(1) p(2) p(3) p(4) p(5)     p(6)  p(7)

p1=[10 9.7 20 1 1 1 3];
p2=[1  0.9  1 1 1 1 3];

v10=1e-1; v20=1e-1;
x10=0; x20=0; 
z0=0;

[T,v1,v2,x1,x2,z,n1,n2]=odeHeun(v10,v20,x10,x20,z0,p1,p2);

virus=sum(v1)+sum(v2);
rate=(sum(v1)*p1(1)+sum(v2)*p2(1)) ./ (sum(v1)+sum(v2));
%% 
figure(2)
subplot(2,1,1)
plot(T,virus);
xlabel('time'); ylabel('virus');

subplot(2,1,2)
plot(T,rate);
xlabel('time'); ylabel('average replication rate');


