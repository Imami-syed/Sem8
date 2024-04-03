clear all
%close all
% Initial Conditions and Simulation Time
%figure;
% xlim([0 100]);
% ylim([0 1]);
%set(findall(gcf,'-property','FontSize'),'FontName','Helvetica','FontSize',35,'linewidth',3.0,'fontweight','b')   
hold on;
zz=[];
for beta=0.01:0.001:0.9;
gamma=0.1;
hold on;

s0=0.99;i0=0.01;r0=0;

init = [s0 i0 r0]; %% 2/2 1.01/1.01, 
%init = [0.99 0.99];
% y0 = [v0, w0]
t = linspace(0,100,10000)';

% Runge-Kutta 4th-Order Algorithm
y_euler = zeros(length(t), 3);
y_euler(1, :) = init;
h = t(2)-t(1);  % Constant time step
%a=-1;


for i = 2:length(t)
      k1 =model(t(i-1), y_euler(i-1, :),beta,gamma);
%     k2 = model(t(i-1)+h/2, y_Kutta(i-1, :)+k1*h/2,a);
%     k3 = model(t(i-1)+h/2, y_Kutta(i-1, :)+k2*h/2, a);
%     k4 = model(t(i-1)+h, y_Kutta(i-1, :)+k3*h, a);
    y_euler(i, :) = y_euler(i-1, :)+h*k1;
end

zz=[zz; beta,gamma, y_euler(end,1), y_euler(end,2), y_euler(end,3)];
end
%%
%plot(zz(:,1),zz(:,2));
hold on;
plot(zz(:,1),zz(:,5),'-o');
%%
% hold on;
% plot(init(1),init(2),'.','color',[0 1 0],'markersize',25)

% 
% for j=[1:2:50 61:20:length(t)]
% plot(t(j,1),y_euler(j,1),'o','color', [0 1 1],'markersize',10)
% hold on;
% plot(t(j,1),y_euler(j,2),'o-','color', [1 0  1],'markersize',10)
% hold on;
% plot(t(j,1),y_euler(j,3),'o-','color', [0 0 1],'markersize',10)
% hold on;
%    drawnow limitrate
% end
% hold on;
% plot(y_euler(end,1),y_euler(end,2),'.','color',[0 0 0],'markersize',25)
set(findall(gcf,'-property','FontSize'),'FontName','Helvetica','FontSize',35,'linewidth',3.0,'fontweight','b')   
hold on;
  xlabel('$\beta$','Interpreter','LaTeX','FontSize',35)
%  ylabel('$\rho_R,\rho_P,\rho_S$','Interpreter','LaTeX','FontSize',35) 
 ylabel('$r$','Interpreter','LaTeX','FontSize',35) 
 %clear all
set(gcf, 'PaperPositionMode', 'auto','position', [0, 0, 750, 750]);
set(legend,'color','none');
%set(legend, 'Box', 'on');
grid on
hold on;     


function dydt = model(t,M,beta,gamma)
    s=  M(1);
    i = M(2);
    r=  M(3);
    ds_dt = -beta*s*i;
    di_dt = beta*s*i-gamma*i;
    dr_dt=gamma*i;

    dydt = [ds_dt,di_dt,dr_dt];
end