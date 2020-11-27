function dNdt = two_stage(t,y,Z, beta, muj, mua,tau1,tau2,No,Ka,So,W,Y)

    %There are two delays in this system. When a variable is delayed with 
    %the first delay we define this with "lag1" before the variable number 
    %and when a variable is delayed with the second delay we define this 
    %with "lag2" before the variable number.  
    
    %The first delay
    ylag1 = Z(:,1);
 
    %The second delay
    ylag2 = Z(:,2);
    
    %You have to keep this order for the delays across all the code.

    dNdt=[(beta*((ylag1(3))/(Ka+ylag1(3)))*exp(-(ylag1(1)+ylag1(2))/No)*exp(-(mua*tau2))*ylag1(2)) - (beta*((ylag2(3))/(Ka+ylag2(3)))*exp(-(ylag2(1)+ylag2(2))/No)*exp(-(mua*tau2))*exp(-(muj*tau1))*ylag2(2))- (muj*y(1))
          (beta*((ylag2(3))/(Ka+ylag2(3)))*exp(-(ylag2(1)+ylag2(2))/No)*exp(-(mua*tau2))*exp(-(muj*tau1))*ylag2(2)) - (mua*y(2))
          (So*W)- ((beta/Y)*exp(-(y(1)+y(2))/No)*((y(3))/(Ka+y(3)))*y(2))];
