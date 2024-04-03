%--------------------------------------------------------------------------
%-------------- RC circuit--------------------------------------------
%--------------------------------------------------------------------------

clc
close all
clear all




%---------Parameters------------------------------------------------------

V_0=1.5;C=0.5;R=1;
%---------ODE solve, initial condition-------------------------------------

tspan=20;
h=figure;
axis tight manual
filename = 'RCcircuit_mixednn.gif';
%%%%% Ode solve %%%
x1=0;
y0=[x1];
[t,y]=ode45(@(t,y) RC_circuit(t,y,V_0,C,R),[0,tspan], y0);%[ 2.5 0 1 0]);
% %%[t,y]=ode45(@(t,y) spring_mass_model(t,y,k1,k2,k3,m1,m2), [0,tspan], y0);%[ 2.5 0 1 0]);


sp1=C*V_0*(1-exp(-t/(C*R)));
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
q=-0.5:0.1:1;
plot(q,1/R*(V_0-(q/C)));
%%
function [yprime] = RC_circuit(t,y,V_0,C,R)

y_prime=zeros(1,1);
yprime(1) = 1/R*(V_0-(y(1)/C));
% yprime(3)= y(4) ;
% yprime(2)= (1/m1)*(-k1*y(1)+k2*(y(3)-y(1)));
% yprime(4)= (1/m2)*(-k3*y(3)+k2*(y(1)-y(3)));
%
yprime=yprime';

end

