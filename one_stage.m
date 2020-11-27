function dNdt = one_stage(t,y,Z, beta,tau2,Ka,So,W,Y,alpha,delta)

    %There is one delay in this system and when a variable is delayed we
    %define this with "lag1" before the variable number. 
    ylag1 = Z(:,1);
 

    dNdt =[(beta*((ylag1(2))/(Ka+ylag1(2)))*ylag1(1)*exp(-(alpha*ylag1(1)))*exp(-(delta*tau2)))-(delta*y(1))
           (So*W)-(((beta)/(Y))*exp(-(alpha*y(1)))*((y(2))/(Ka+y(2)))*y(1))];
