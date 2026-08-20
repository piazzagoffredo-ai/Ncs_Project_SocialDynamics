% HK Model

function x = HK(n,x0,R,T,RL1,RL2,Tn,App1,App2,TL1,TL2)

x=zeros(n,T+1);
x(:,1)=x0;

% diagonal Matrice G (self-loop)
G = eye(n);
G(1,1) = RL1;
G(2,2) = RL2;

for t=1:T
    
    A=zeros(n);
    
    for i=1:n
      for j=1:n
        if i~=j

            if (i==1)||(i==2)
                
                if (j==1)||(j==2)
                    A(i,j)=0;
               
                elseif i==1
                  
                    if abs(x(i,t)-x(j,t))<=TL1
                      A(i,j)=R;
                    end

                elseif i==2
                   
                    if abs(x(i,t)-x(j,t))<=TL2
                      A(i,j)=R;
                    end

                end

            elseif (j==1)  
                
                if abs(x(i,t)-x(j,t))<=App1 % gli altri che vedono il leader 1
                    A(i,j)=RL1;
                end

             elseif (j==2) 
                
                if abs(x(i,t)-x(j,t))<=App2
                    A(i,j)=RL2;
                end

             else 
               
                if abs(x(i,t)-x(j,t))<=Tn 
                     A(i,j)=R;
                end
             
             end
        end
      end
    end
    
    % Generate the matrix:
    A = G+A;       % sum the diagonal matrice G
    g=sum(A,2);    % sums the reputations of agents
    
    x(:,t+1) = (A*x(:,t))./g;    % opinion update

end