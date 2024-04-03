clear all
% Initial Conditions and Simulation Time
global a
figure;
xlim([-0.12 0.12]);
ylim([-0.12 0.12]);
set(findall(gcf,'-property','FontSize'),'FontName','Helvetica','FontSize',35,'linewidth',3.0,'fontweight','b')   
hold on;
 xlabel('x') ;
ylabel('y') ;
%a=-2; 
k=0;
% figure;
% xlim([0 3.0]);
% ylim([0 2.8]);
for x0=[-1 0 1]/10;
    for y0=[- 1 0 1]/10;
init = [x0 y0];  % y0 = [v0, w0]
t = linspace(0,100,5000)';

% Runge-Kutta 4th-Order Algorithm
y_euler = zeros(length(t), 2);
y_euler(1, :) = init;
h = t(2)-t(1);  % Constant time step
%a=-1;


for i = 2:length(t)
    k1 = model(t(i-1), y_euler(i-1, :),a);
%     k2 = model(t(i-1)+h/2, y_Kutta(i-1, :)+k1*h/2,a);
%     k3 = model(t(i-1)+h/2, y_Kutta(i-1, :)+k2*h/2, a);
%     k4 = model(t(i-1)+h, y_Kutta(i-1, :)+k3*h, a);
    y_euler(i, :) = y_euler(i-1, :)+h*k1;
end
hold on;
plot(init(1),init(2),'.','color',[0 1 0],'markersize',25)
%%
% hold on;
% plot(init(1),init(2),'.','color',[0 0 k/12],'markersize',25)
% for j=1:15:length(t)
% plot(y_Kutta(j,1),y_Kutta(j,2),'.r','markersize',16)
% hold on;
% drawnow
% end
%%%'
for j=[1:2:50 51:5:length(t)]
plot(y_euler(j,1),y_euler(j,2),'.','color', [0 k/30 1],'markersize',10)
hold on;
   drawnow limitrate
end
hold on;
plot(y_euler(end,1),y_euler(end,2),'.','color',[0 0 0],'markersize',25)
 k=k+1;
 hold on;

 %%%%%% Tgheoretical %%%%
 plot(x0*exp(a*t),y0*exp(-t));
hold on; 
    end
   
end



