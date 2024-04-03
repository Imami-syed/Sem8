clear all
close all
% Initial Conditions and Simulation Time
figure;
%xlim([0 3.0]);
%ylim([0 2.8]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w1=3; w2=5;
K=20;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

init = [-pi 0.0];
t=0:0.1:1000;
% Runge-Kutta 4th-Order Algorithm
y_Kutta = zeros(length(t), 2);
y_Kutta(1, :) = init;
h = 0.1;%t(2)-t(1);  % Constant time step
%a=-1;


for i = 2:length(t)
    k1 = model(t(i-1), y_Kutta(i-1, :),w1,w2,K);
    k2 = model(t(i-1)+h/2, y_Kutta(i-1, :)+k1*h/2,w1,w2,K);
    k3 = model(t(i-1)+h/2, y_Kutta(i-1, :)+k2*h/2, w1,w2,K);
    k4 = model(t(i-1)+h, y_Kutta(i-1, :)+k3*h, w1,w2,K);
    y_Kutta(i, :) = y_Kutta(i-1, :)+(k1/6+k2/3+k3/3+k4/6)*h;
end

Y=wrapTo2Pi(y_Kutta);
 plot(t,Y(:,1),'-o','color',[0 0 0],'markersize',5);
 hold on;
  plot(t,Y(:,2),'-s','color',[1 0 1],'markersize',5);
 hold on;
set(findall(gcf,'-property','FontSize'),'FontName','Helvetica','FontSize',35,'linewidth',3.0,'fontweight','b')   
hold on;
xlabel('t');
ylabel('(\theta_1, \theta_2)');





function dydt = model(t,M,w1,w2,K) %% a is not required
    theta1=  M(1);
    theta2 = M(2);
    dtheta1_dt = w1+(K/2*(sin(theta2-theta1)));
    dtheta2_dt = w2+(K/2*(sin(theta1-theta2)));
    dydt = [dtheta1_dt,dtheta2_dt];
end