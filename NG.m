% Number of Groups Counter

function [nG,vG] = NG(x,n,T);
    
     nG=0;
     vG = [];
     c=0;

      for i=1:n
         for j=1:n
            if i~=j
                 
                 if x(i,T+1)==x(j,T+1)
                     
                     if nG==0
                         nG=nG+1;
                         vG(nG)=x(i,T+1);
                     
                     else 
                         p=0; 
                           for k=1:nG
                               if x(i,T+1)~=vG(k)
                                p=p + 1;
                               end
                           end
                           if p==nG
                             nG=nG+1;
                             vG(nG)=x(i,T+1);
                           end
                      end
                 
                 else 
                     c=c+1;
                 end
           end
         end 

        if c==n-1 
            nG=nG+1;
            vG(nG)=x(i,T+1);
        end
       
        c=0;
      end

     % Double Check
       if nG>=1
         for t=1:nG
           for u=t+1:nG
              if abs(vG(t)-vG(u))<=1e-3
                vG(u)=0;
                nG=nG-1;
              end
            end
         end
       end
       vG=vG(vG~=0);
end