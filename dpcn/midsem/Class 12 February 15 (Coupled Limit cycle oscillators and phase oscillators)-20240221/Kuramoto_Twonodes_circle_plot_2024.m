clear all
close all


%filename = 'Kuramoto_twonodes.gif';
% h=figure;
% axis tight manual
% filename = 'Kuramoto_mixedn.gif';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w1=2; w2=7;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for K=50%[1 3:3:10]
   
init = [-pi pi];
h = 0.01;
t=0:h:6*2*pi;
% Runge-Kutta 4th-Order Algorithm
y_Kutta = zeros(length(t), 2);
y_Kutta(1, :) = init;
%t(2)-t(1);  % Constant time step
%a=-1;


for i = 2:length(t)
    k1 = model(t(i-1), y_Kutta(i-1, :),w1,w2,K);
    k2 = model(t(i-1)+h/2, y_Kutta(i-1, :)+k1*h/2,w1,w2,K);
    k3 = model(t(i-1)+h/2, y_Kutta(i-1, :)+k2*h/2, w1,w2,K);
    k4 = model(t(i-1)+h, y_Kutta(i-1, :)+k3*h, w1,w2,K);
    y_Kutta(i, :) = y_Kutta(i-1, :)+(k1/6+k2/3+k3/3+k4/6)*h;
end

Y=wrapToPi(y_Kutta);

%%

 X1=cos(Y(1:200,1));
 Y1=sin(Y(1:200,1));
plot(X1,Y1);
comet(X1,Y1);
%hold on;
X2=cos(Y(1:200,2));
Y2=sin(Y(1:200,2));
comet(X2,Y2);
%
for i=1:1:200%length(t)
     axis([-1 1  -1 1]);
 %     X1=cos(Y(1:200,1));
% Y1=sin(Y(1:200,1));
 plot(X1,Y1);
set(findall(gcf,'-property','FontSize'),'FontName','Helvetica','FontSize',35,'linewidth',3.0,'fontweight','b')   
hold on;
plot(cos(Y(i,1)), sin(Y(i,1)),'.k', MarkerSize=40);
%pause(0.1)
plot(cos(Y(i,2)), sin(Y(i,2)),'.r', MarkerSize=40);
pause(0.1)
%hold off;
%grid on;
drawnow
clf
%   frame = getframe(h); 
%       im = frame2im(frame); 
%        [imind,cm] = rgb2ind(im,256); 
%        % Write to the GIF File 
%        if i == 1 
%            imwrite(imind,cm,filename,'gif', 'DelayTime',0.1,'Loopcount',inf); 
%        else 
%            imwrite(imind,cm,filename,'gif','DelayTime',0.1,'WriteMode','append'); 
%        end
  end
end
%%
% figure;
% x=[];
% pl=floor(4*2*3.14/h);
% xx=cos(Y(pl:end,1));
% yy=cos(Y(pl:end,2));
% % % t1=0:0.001:4*pi;
% % % x=sin(8*t1);
% plot(t(pl:end),xx,'linewidth',3); hold on;  plot(t(pl:end),yy,'linewidth',3); 
% xlabel('x,y');
% ylabel('t')
% set(findall(gcf,'-property','FontSize'),'FontName','Helvetica','FontSize',35,'linewidth',3.0,'fontweight','b')   
% % hold on;
%%

x=[];
x=cos(Y(500:end,1));
Fs=1/h;
     xdft = fftshift(fft(x));
       df = Fs/length(x);
       half_res = df/2;
       freq = -Fs/2+half_res:df:Fs/2-half_res;
    figure;   plot(freq,abs(xdft));
       ii=max(abs(xdft));
     ind=find(abs(abs(xdft)-ii)<0.00000001);
%w=freq(ind(2))
w=freq(ind(2))*2*pi
%%%

%%

function dydt = model(t,M,w1,w2,K) %% a is not required
    theta1=  M(1);
    theta2 = M(2);
    dtheta1_dt = w1+(K/2*(sin(theta2-theta1)));
    dtheta2_dt = w2+(K/2*(sin(theta1-theta2)));
    dydt = [dtheta1_dt,dtheta2_dt];
end