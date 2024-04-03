clear all
close all
% Initial Conditions and Simulation Time
figure;
xlim([0 3.0]);
ylim([0 2.8]);
set(findall(gcf,'-property','FontSize'),'FontName','Helvetica','FontSize',35,'linewidth',3.0,'fontweight','b')   
hold on;

a=2; k=0;
hold on;

for x0=[0.1 0.25 0.5 0.99  1.9 2.5 3];
    for y0=[0.25 0.5 0.99  2.2];
init = [x0 y0]; %% 2/2 1.01/1.01, 
%init = [0.99 0.99];
% y0 = [v0, w0]
t = linspace(0,100,6000)';

% Runge-Kutta 4th-Order Algorithm
y_Kutta = zeros(length(t), 2);
y_Kutta(1, :) = init;
h = t(2)-t(1);  % Constant time step
%a=-1;


for i = 2:length(t)
    k1 = model(t(i-1), y_Kutta(i-1, :),a);
    k2 = model(t(i-1)+h/2, y_Kutta(i-1, :)+k1*h/2,a);
    k3 = model(t(i-1)+h/2, y_Kutta(i-1, :)+k2*h/2, a);
    k4 = model(t(i-1)+h, y_Kutta(i-1, :)+k3*h, a);
    y_Kutta(i, :) = y_Kutta(i-1, :)+(k1/6+k2/3+k3/3+k4/6)*h;
end

hold on;
plot(init(1),init(2),'.','color',[0 1 0],'markersize',25)


for j=[1:2:50 61:20:length(t)]
plot(y_Kutta(j,1),y_Kutta(j,2),'.','color', [0 k/30 1],'markersize',10)
hold on;
   drawnow limitrate
end
hold on;
plot(y_Kutta(end,1),y_Kutta(end,2),'.','color',[0 0 0],'markersize',25)
xlabel('Rabbits') ;
ylabel('Sheep') ;
k=k+1;
    end
   
end


function dydt = model(t,M,a)
    x=  M(1);
    y = M(2);
    dx_dt = x*(3-x-2*y);
    dy_dt = y*(2-x-y);
    dydt = [dx_dt,dy_dt];
end