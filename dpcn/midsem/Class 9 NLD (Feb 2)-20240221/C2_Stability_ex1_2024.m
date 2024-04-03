
clc
close all
clear all
%---------Parameters------------------------------------------------------
a=1;b=1;
%---------ODE solve, initial condition-------------------------------------
tspan=10;
h=figure;
axis tight manual
filename = 'Stability_ex1.gif';
%%%%% Ode solve %%%
x1=0.2;
y0=[x1];
[t,y]=ode45(@(t,y) stability_ex1(t,y,a,b),[0,tspan], y0);%[ 2.5 0 1 0]);
% %%[t,y]=ode45(@(t,y) spring_mass_model(t,y,k1,k2,k3,m1,m2), [0,tspan], y0);%[ 2.5 0 1 0]);
%%%% Theoretical analysis%%%
u_0=0.2;
sp1=(a/b)+(u_0-(a/b))*exp(-b*t);
axis([0 15 0 1]);
set(findall(gcf,'-property','FontSize'),'FontName','Helvetica','FontSize',35,'linewidth',3.0,'fontweight','b')   
hold on;
for i=1:length(t)
plot(t(i,1),y(i,1),'s-','Color','r','markersize',12);
hold on; 
plot(t(i,1),sp1(i,1),'.','Color','r','markersize',26)
hold on;
xlabel('t');
ylabel('q');
box on;
%% Save as gif
       frame = getframe(h); 
      im = frame2im(frame); 
       [imind,cm] = rgb2ind(im,256); 
       % Write to the GIF File 
       if i == 1 
           imwrite(imind,cm,filename,'gif', 'DelayTime',0.1,'Loopcount',inf); 
       else 
           imwrite(imind,cm,filename,'gif','DelayTime',0.1,'WriteMode','append'); 
       end 
end

%%
figure;
u=-0.5:0.1:2;
plot(u,a-b*u);
%%
function [yprime] = stability_ex1(t,y,a,b)

y_prime=zeros(1,1);
yprime(1) = a-b*y(1);
% yprime(3)= y(4) ;
% yprime(2)= (1/m1)*(-k1*y(1)+k2*(y(3)-y(1)));
% yprime(4)= (1/m2)*(-k3*y(3)+k2*(y(1)-y(3)));
%
yprime=yprime';

end

