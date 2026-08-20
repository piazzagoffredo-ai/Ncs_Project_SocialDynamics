clc;
clear;
close all;

n = 200;
x0 = rand(n,1);
T = 50;

% Stubburn's Opinion
x0(1) = 0.8;
x0(2) = 0.2;

R = 1;        % Group Reputation

y = 0;
for RL1=1:10:400 % Reputation Leader 1  % dal paper
    k=0;
    y=y+1;
  
    for Tn=0.05:0.01:0.5 % dal paper
      k=k+1;
      App1=Tn; % appeal 1
      App2=Tn; % appeal 2
      TL1=Tn;  % leader 1 bound of confidence
      TL2=Tn;  % leader 2 bound of confidence
      RL2=RL1; % reputation of Leader 2
     
      % HK Model
      x = HK(n,x0,R,T,RL1,RL2,Tn,App1,App2,TL1,TL2);
     
      % Counting the number of groups (nG)
      [nG,vG] = NG(x,n,T);
      
      nGf(y,k)=nG; % matrice numero dei gruppi
      Tnf(y,k)=Tn; % funzione group bound of confidence
     end

     Rlf(y)=RL1; % funzione reputetion
end

style = {'ks-','ko-','b*-','ko-','ks-','r*--'};
color = {'b','r','b','k','g','r'};

% Plot (Avarege nG, Tn) at different Rl
figure(1), plot(Tnf(1,:),nGf(1,:),style{1},'MarkerFaceColor',color{1}), hold on
figure(1), plot(Tnf(1,:),sum(nGf(1:5,:))/5,style{2},'MarkerFaceColor',color{2}), hold on
xlabel('Group bound of confidence (Tn)'), ylabel('Average number of groups')

int = 10;
step = y/int;
f = 1;
for i=1:step
  g=i*int;
    for q=1:k
      ngfTn(i,q)=(sum(nGf(f:g,q)))/int;
    end
  figure(1)  
  plot(Tnf(i,:),ngfTn(i,:),style{i+2},'MarkerFaceColor',color{i+2});
  hold on
  f=f+int;
end

% Plot (Avarege nG, Rl) at different Tn
int = 5;
step = k/int;
f = 3;
for j=1:step
    g=(j*int)+2;
    for q=1:y
      ngfRl(j,q) = sum(nGf(q,f:g))/int;
    end
  figure(2)
  plot(Rlf(:),ngfRl(j,:)); % ,style{j},'MarkerFaceColor',color{j});
  hold on
  f=f+int;
end

% style = {'ks-','r*--','ko-','b*-','k.-'};
% color = {'b','r','r','k','b','k'};

% ngfRl(2,6:y) = 3;
% ngfRl(4,4:y) = 2;
% ngfRl(5,11:y) = 2;
% ngfRl(6,:) = 1;

figure(3)
plot(Rlf(:),ngfRl(2:7,:)) %,style{1:6},'MarkerFaceColor',color{1:6})
xlabel('Reputation of opinion leaders'), ylabel('Average number of groups')
