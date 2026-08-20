function [nFfavg,RL1f] = NFfavg2(n,T,t,R,RL2,Tn)


nFfavg = zeros(80,2);
RL1f = 1:5:400;

App1=Tn; % appeal 1
TL1=Tn;  % leader 1 bound of confidence
App2=Tn; % appeal 2
TL2=Tn;  % leader 2 bound of confidence

y = 0;

    for RL1=1:5:400 % dal paper

        y = y+1;
        nFfavg1 = zeros(80,1);
        nFfavg2 = zeros(80,1);
            
           for t = 1:t
                  x0=rand(n,1);
                  x0(1)=0.8;
                  x0(2)=0.2;
           
                  % HK Model
                  x = HK(n,x0,R,T,RL1,RL2,Tn,App1,App2,TL1,TL2);
                 
                  % Counting the number of groups (nG)
                  [nG,vG] = NG(x,n,T);
                  
                  % Counting the number of followers (nF)
                  nF = NF(x,n,T,nG,vG);

                  if nG~=1
                    nFfavg1(t) = nF(1);
                    nFfavg2(t) = nF(2);
                  end
           end
       nFfavg(y,1) = mean(nFfavg1);
       nFfavg(y,2) = mean(nFfavg2);
    end
end