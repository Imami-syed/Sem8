%function C3_LC_Aging

N =10;                          
trans=2000;                          
tend=600;                        
q2=1; 
a=-2; b=2; 
mu_a=-0.5; mu_ia=1;
w=1;
ic1=a+(b-a)*rand(2*N,1);
pp=0.1:0.2:0.9;
for k=[3]
 for jj=1:length(pp);%0.1:0.2:1
    p=pp(jj);
   ic=ic1;
    fprintf('p=%f; k=%f\n',p,k)
  tspan=[0  trans];
[~,x] = ode45(@(t,x)lc_coupnet(t,x,N,w,mu_a,mu_ia,k,p),[0 trans],ic);
ic2 = x(end,:);
[t1,xx] =    ode45(@(t1,x)lc_coupnet(t1,x,N,w,mu_a,mu_ia,k,p),[0:0.01:tend],ic2);
figure;
ylim([-1 1]);hold on;
len = length(xx);          
plot(t1(end-5000:end),xx(end-5000:end,2:2:end),'linewidth',2,'color',[1-q2/6 q2/6 1]);  
set(findall(gcf,'-property','FontSize'),'FontName','Helvetica','FontSize',15,'linewidth',3.0,'fontweight','b')   
hold on;
q2=q2+1;
xlabel('time') ;
ylabel('y') ; 
t=[]; xx=[]; 
    end
end
%end
%end
function y=lc_coupnet(t,x,N,w,mu_a,mu_ia,k,p);
x11=x(1:2:2*N);
x22=x(2:2:2*N);
mm=floor(p*2*N);
x1p=x(1:2:mm);
x2p=x(2:2:mm);
x1n=x((mm)+1:2:2*N);
x2n=x((mm)+2:2:2*N);
mf1=mean(x11);
mf2=mean(x22);

 coupling2p=k*(mf2-x2p);
 coupling2n=k*(mf2-x2n);
 coupling1p=k*(mf1-x1p);
 coupling1n=k*(mf1-x1n);
%     dx_dt = (mu*x-w*y)-x*(x^2+y^2);   %%% prey
%     dy_dt = (w*x+mu*y)-y*(x^2+y^2);

 y(1:2:mm) =(mu_a*x1p-w*x2p)-x1p.*(x1p.^2+x2p.^2)+coupling1p; %((x1p-(x1p.*x1p.*x1p)/3-x2p)/0.01)+coupling1p;%+light;
 y(2:2:mm) =(mu_a*x2p+w*x1p)-x2p.*(x1p.^2+x2p.^2)+coupling2p;
 y((mm)+1:2:2*N) =(mu_ia*x1n-w*x2n)-x1n.*(x1n.^2+x2n.^2)+coupling1n;%;%+coupling2n;%+light;
 y((mm)+2:2:2*N) =(mu_ia*x2n+w*x1n)-x2n.*(x1n.^2+x2n.^2)+coupling2n;



y=y';
end
