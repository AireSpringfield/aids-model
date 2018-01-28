% main

% order of parameters: r    s    p    k    k_prime  u     bQ_prime
%                      p(1) p(2) p(3) p(4) p(5)     p(6)  p(7)

p=[5 4.5 5 1 1 1 2]; % for fig 1
% p=[5 4.5 5 1 1 1 1.75]; % for fig 2

v0=1e-1; x0=0; z0=0;
[T,v,x,z,n]=odeHeun(v0,x0,z0,p);

virus=sum(v);
lymphocytes=sum(x)+z;

%% 
figure(1)
subplot(2,1,1)
plot(T,virus,T,lymphocytes,'--');
xlim([0 30]); ylim([0 3]);
xlabel('time'); ylabel('virus/density of lymphocytes');
legend('virus','lymphocytes specific to HIV');

subplot(2,1,2)
hold on
for i=1:8
    plot(T,v(i,:));
end
legend('1','2','3','4','5','6','7','8');
xlim([0 30]); ylim([0 0.2]);
xlabel('time'); ylabel('virus density');


