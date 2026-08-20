% Number of Followers per group Counter

function nF = NF(x,n,T,nG,vG);
    
     nF = zeros(1,nG);

      for i=1:n
        for j=1:nG
             
             if abs(x(i,T+1)-vG(j))<=1e-3
                 nF(j)=nF(j)+1;
             end
          
        end
      end

end