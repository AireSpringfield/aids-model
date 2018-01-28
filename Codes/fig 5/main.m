%f_c as a function of a
R=5;
a=linspace(1.1,50,10000);
f=(1-1/R)./(1-1./a);
plot(a,f);
xlim([0 50]);ylim([0 1]);
xlabel('efficiency of the immunogen (a)');
ylabel('fraction of recognized strains (f)');
legend('successful immunization');