clear all
%close all
% Initial Conditions and Simulation Time
figure;
xlim([0 1]);
ylim([0.0 1]);
set(gcf, 'PaperPositionMode', 'auto','position', [0, 0, 700, 700]);
% set(legend,'color','none');
% %set(legend, 'Box', 'on');
hold on;  
  set(findall(gcf,'-property','FontSize'),'FontName','Cambria',...
       'FontSize',24,'linewidth',2.0,'fontweight','b');
%  grid on;
xlabel('$\beta$','Interpreter','LaTeX','FontSize',30);
ylabel('$i_ee$','Interpreter','LaTeX','FontSize',30);
zz=[];
for beta=0.01:0.01:1
gamma=0.3;
beta

s0=0.98;i0=0.02;

init = [s0 i0]; 
t = linspace(0,100, 2000)';

y_euler = zeros(length(t), 2);
y_euler(1, :) = init;
h = t(2)-t(1);  % Constant time step
%a=-1;


for i = 2:length(t)
      k1 =model(t(i-1), y_euler(i-1, :),beta,gamma);
    y_euler(i, :) = y_euler(i-1, :)+h*k1;
end

p=(beta-gamma)/beta;
zz=[zz; beta,p, mean(y_euler(end-100:end,2))];
end
%%
plot(zz(:,1),zz(:,2),'-o');
hold on;
plot(zz(:,1),zz(:,3),'-');
%%


function dydt = model(t,M,beta,gamma)
    s=  M(1);
    i = M(2);
   
    ds_dt = gamma*i-beta*s*i;
    di_dt = beta*s*i-gamma*i;
  

    dydt = [ds_dt,di_dt];
end 