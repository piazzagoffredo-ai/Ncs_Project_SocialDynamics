% HK Graph

clc;
clear;
close all;

n = 200;           % number of agents
x0 = rand(n,1);    % initial opinion
T = 10;            % time instant 

% Leader's Initial Opinion
x0(1) = 0.2;
x0(2) = 0.8;

Tn = 0.2;              % Group Bound of Confidence
App1 = 0.5;             % Appeal 1
App2 = 0.5;             % Appeal 2
TL1 = 0.5;              % Leader 1 Bound of Confidence
TL2 = 0.5;              % Leader 2 Bound of Confidence
Stab1 = 1-TL1;            % Stubbornness 1
Stab2 = 1-TL2;            % Stubbornness 2
R = 1;                  % Group Reputation
RL1 = 10;                % Reputation Leaders 1
RL2 = 10;                % Reputation Leaders 2
E = 2*abs(0.5-x0(1));   % Extremnes


% HK model function
x = HK(n,x0,R,T,RL1,RL2,Tn,App1,App2,TL1,TL2);

%  Calculate the number of groups (nG)
[nG,vG] = NG(x,n,T)

% Calculate the number of followers in each group (nF)
nF = NF(x,n,T,nG,vG)

% Plot
figure(5)
for i= 1:n
plot(x(i,:))
hold on
end
xlabel('Time');
ylabel('Agents Opinion');