clear all
close all
% Initial Conditions and Simulation Time
figure;
% xlim([0 100]);
% ylim([0 18]);

w=2; mu=0.5;
hold on;
k=1;
for x0=[1 .2 -2]
%x0=1;
y0=[-3];

init = [x0 y0*x0]; %% 2/2 1.01/1.01, 
%init = [0.99 0.99];
% y0 = [v0, w0]
t = 0:0.01:800;
w=1;
% Runge-Kutta 4th-Order Algorithm
y_euler = zeros(length(t), 2);
y_euler(1, :) = init;
h = t(2)-t(1);  % Constant time step
%a=-1;


for i = 2:length(t)
      k1 =model(t(i-1), y_euler(i-1, :),w,mu);
%     k2 = model(t(i-1)+h/2, y_Kutta(i-1, :)+k1*h/2,a);
%     k3 = model(t(i-1)+h/2, y_Kutta(i-1, :)+k2*h/2, a);
%     k4 = model(t(i-1)+h, y_Kutta(i-1, :)+k3*h, a);
    y_euler(i, :) = y_euler(i-1, :)+h*k1;
end

% hold on;
% plot(init(1),init(2),'.','color',[0 1 0],'markersize',25)


% for j=[1:10:length(t)/5]
% plot(t(j,1),y_euler(j,1),'.','color', [0 1 1],'markersize',18)
% hold on;
% plot(t(j,1),y_euler(j,2),'.','color', [1 0  1],'markersize',18)
% hold on;
%    drawnow limitrate
% end
%%hold on;
%%
  % figure;
plot(y_euler(:,1),y_euler(:,2),'.','color',[1-k/3 k/3 k/3],'markersize',5)

  k=k+1;
 figure; plot(t,y_euler(:,2),'.','color',[1-k/3 k/3 k/3],'markersize',5)
    y_euler=[];
end
% xlabel('time') ;
% ylabel('predator/prey') ;
set(findall(gcf,'-property','FontSize'),'FontName','Helvetica','FontSize',35,'linewidth',3.0,'fontweight','b')   
hold on;
axis tight;
%%
 
%  semilogy(t(1:1500,1),y_euler(1:1500,3),'.','color',[0 0 0],'markersize',25)
%xlabel('time') ;
%ylabel('i') ;  


function dydt = model(t,M,w,mu)
    x=  M(1);
    y = M(2);
    dx_dt = (mu*x-w*y)-x*(x^2+y^2);   %%% prey
    dy_dt = (w*x+mu*y)-y*(x^2+y^2); %% predator
    

    dydt = [dx_dt,dy_dt];
end