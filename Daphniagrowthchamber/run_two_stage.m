clear

%per capita birth rate of the Daphnia 
beta = 10;
 
%per capita death rate of the Daphnia 
muj = 0.3;
 
%per capita death rate of the Daphnia 
mua = 0.1;

%Gestation period of the Daphnia
tau1 = 7;

%Gestation period of the Daphnia
tau2 = 4;

%Population density at which Daphnia population reproduces maximally 
No = 1000;

%Half saturation constant
%This has to be large otherwise the algae concentration curve will become
%negative 
Ka=10000;

%Concentration of algae entering the growth chamber
So=16000;

%Dilution rate - W=F/V where F is the volumetric flow rate into the growth
%chamber and V is the volume of the growth chamber 
W=10;

%If the product of So and W in the model are large, this will result in the
%exponential growth of the algae concentration curve and thus replicate a
%situation where the Daphnia are growing in an environment with unlimted
%resources.

%Yield constant
Y=0.04;

%Setting the tolerance for the DDE solver
options = ddeset('RelTol',2.22045e-14);

%This is the DDE solver. 
%The first input is the fucntion of the system you want to solve.
%The second input is a vector with the delays of the system (in the order 
%you gave them in the system defintion).
%The third is a vector giving the initial history function (for the sake of 
%the growth chamber, the initial history element corresponding to the 
%Daphnia population denisty can just be any value and the initial history 
%element corresponding to the algae is the concentration of the algae 
%entering the growth chamber).
%The fourth element is the time period for which you want the solver to
%run.
%The fifth element is the tolerance of the solver if you want to set it; if 
%not, put [] instead.

sol= dde23(@two_stage,[tau2,tau2+tau1],[100;100;So],[0,100],options,beta, muj, mua,tau1,tau2,No,Ka,So,W,Y);

% Figure plotting the solution curves
figure;
 
subplot(2,1,1);

plot(sol.x,sol.y(1,:))

xlabel('t (Days)');
 
ylabel('Population Density');
 
hold on

plot(sol.x,sol.y(2,:))

hold off

legend('Juvenile (J)', ' Adult (A)');   

subplot(2,1,2);

plot(sol.x,sol.y(3,:))

xlabel('t (Days)');
 
ylabel('Algae Concentration');

% figure(1)
% 
% plot(sol.x,sol.yp(3,:))
% 
% ylim([8.4e5 9.8e5])
% 
% figure(2)
% 
% plot(sol.x,sol.y(3,:),sol.x,sol.yp(3,:))
% 
% ylim([8.4e5 9.8e5])

