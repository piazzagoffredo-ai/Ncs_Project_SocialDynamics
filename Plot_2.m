clc;
clear;
close all;

n = 200;
T = 100;
t = 100;

R = 1;        % Group Reputation
RL2 = 50;
Tn = 0.35;

% [nFfavg,RL1f] = NFfavg(n,x0,T,t,R,RL2,Tn);
[nFfavg,RL1f] = NFfavg2(n,T,t,R,RL2,Tn);

% plot(RL1f,nFfavg(:,1:2))

plot(RL1f,nFfavg(:,1),'ko-','MarkerFaceColor','r');
hold on
plot(RL1f,nFfavg(:,2),'ks-','MarkerFaceColor','b');
xlabel('Reputation of leader L1')
ylabel('Average number of followers')