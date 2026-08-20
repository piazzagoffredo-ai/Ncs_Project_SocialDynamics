clc;
clear;
close all;

n = 100;
x0 = rand(n,1);
T = 200;

% Stubburn's Opinion
x0(1) = 0.8;
x0(2) = 0.2;

R = 1;        % Group Reputation

y = 0;
for Rl=1:10:400 % dal paper
    k=0;
    y=y+1;
  
    for Tn=0.05:0.01:0.5 % dal paper
      k=k+1;
      App=Tn; % appeal
      Tl=Tn;  % leader bound of confidence
      x = HK(n,x0,R,T,Rl,Tn,App,Tl);
     
      % Counting the number of groups (nG)
      [nG,vG] = NG(x,n,T);
      
      % nA = NA(x,n,T,nG,vG);
      % nAf(y,k)
      nGf(y,k)=nG; % matrice numero dei gruppi
      Tnf(y,k)=Tn; % funzione group bound of confidence
     end
 Rlf(y)=Rl; % funzione reputetion
end

% Plot (Avarege nG, Tn) at different Rl
int = 10;
step = y/int;
f = 1;
for i=1:step
  g=i*int;
    for q=1:k
      ngfTn(i,q)=(sum(nGf(f:g,q)))/int;
    end
  figure(1)  
  plot(Tnf(i,:),ngfTn(i,:));
  hold on
  f=f+int;
end

% Plot (Avarege nG, Rl) at different Tn
int = 5;
step = k/int;
f = 1;
for j=1:step
  g=j*int;
    for q=1:y
      ngfRl(j,q) = sum(nGf(q,f:g))/int;
    end
  figure(2)   
  plot(Rlf(:),ngfRl(j,:));
  hold on
  f=f+int;
end