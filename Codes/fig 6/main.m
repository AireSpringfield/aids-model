% probability of extinction changes with time 
t=linspace(0,10,10000);
s=0.99;
P2=s.^(2.^t);
P5=s.^(5.^t);
P10=s.^(10.^t);
plot(t,P2,t,P5,t,P10);
xlim([0 10]); ylim([0 1]);
xlabel('time of starting immunotherapy');
ylabel('probability of extinction');
legend('R=2','R=5','R=10');