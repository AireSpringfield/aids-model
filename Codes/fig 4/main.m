% make the plot of probability of viral persistence (1-s0^n) vesus R

R=linspace(1.001,8,10000);
s0=zeros(1,length(R));
for i=1:length(R)
    fun=@(s)(exp(R(i)*(s-1))-s);
    s0(i)=fzero(fun,[0 0.99999]);
end

%%
figure(4)
plot(R,1-s0,R,1-s0.^2,R,1-s0.^10);
legend('n=1','n=2','n=10');
xlim([0 8]);ylim([0 1]);
xlabel('diversification rate (R)');ylabel('probabilityof viral persistence');
    