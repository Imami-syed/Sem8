clear all
%close all
% Initial Conditions and Simulation Time
figure;
xlim([0 100]);
ylim([0.0 0.5]);
set(gcf, 'PaperPositionMode', 'auto','position', [0, 0, 700, 700]);
% set(legend,'color','none');
% %set(legend, 'Box', 'on');
hold on;  
  set(findall(gcf,'-property','FontSize'),'FontName','Cambria',...
       'FontSize',24,'linewidth',2.0,'fontweight','b');
%  grid on;
xlabel('t','Interpreter','LaTeX','FontSize',30);
ylabel('$i(t)$','Interpreter','LaTeX','FontSize',30);
beta=0.6;
gamma=0.3;
hold on;

s0=0.98;i0=0.02;

init = [s0 i0]; 
t = linspace(0,1000,6000)';

y_euler = zeros(length(t), 2);
y_euler(1, :) = init;
h = t(2)-t(1);  % Constant time step
%a=-1;


for i = 2:length(t)
      k1 =model(t(i-1), y_euler(i-1, :),beta,gamma);
    y_euler(i, :) = y_euler(i-1, :)+h*k1;
end

p=(beta-gamma)/beta;
for j=[1:2:50 61:50:length(t)]
 plot(t(j,1),y_euler(j,2),'.','color', [0 1 1],'markersize',24)
 hold on;

 i_the=p/(1+((p/i0 -1)*(exp(-t(j,1)*(beta-gamma)))));
 plot(t(j,1),i_the,'-x','color', [1 0 1],'markersize',10)
   drawnow limitrate
   pause(0.01);


end

xlabel('time') ;
ylabel('$i$') ;



function dydt = model(t,M,beta,gamma)
    s=  M(1);
    i = M(2);
   
    ds_dt = gamma*i-beta*s*i;
    di_dt = beta*s*i-gamma*i;
  

    dydt = [ds_dt,di_dt];
end 