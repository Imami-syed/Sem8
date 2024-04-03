%function C3_LC_Aging

N =50;                          
trans=4000;                          
tend=2000;                        
q2=1; 
a=-2; b=2; 
mu_a=2; mu_ia=-1;
w=3;
ic1=a+(b-a)*rand(2*N,1);
pp=[1:-0.04:0.0];
zz=[];
for k=[1 28]
 for jj=1:length(pp);%0.1:0.2:1
    p=pp(jj);
    mm=floor(p*2*N);
   ic=ic1;
    fprintf('p=%f; k=%f ac=%f\n',p,k,p*2*N)
  tspan=[0  trans];
[~,x] = ode45(@(t,x)lc_coupnet(t,x,N,w,mu_a,mu_ia,k,p,mm),[0 trans],ic);
ic2 = x(end,:);
[t1,xx] =    ode45(@(t1,x)lc_coupnet(t1,x,N,w,mu_a,mu_ia,k,p,mm),[0:0.01:tend],ic2);

xc=xx(end-5000:end,2:2:end);
yc=xx(end-5000:end,2:2:end);
xcm=mean(xc'); %% nodal average of xvariable in each time
ycm=mean(yc'); %% nodal average of yvariable in each time 

Q_ce=mean(xcm.^2+ycm.^2);
zz=[zz;p,Q_ce];
t=[]; xx=[]; xcm=[]; ycm=[];
    end




      
plot(1-zz(:,1),zz(:,2)/zz(1,2),'-o','linewidth',2,'color',[1 0 1]);  

zz=[];
hold on; 
end
set(findall(gcf,'-property','FontSize'),'FontName','Helvetica','FontSize',35,'linewidth',3.0,'fontweight','b')   
hold on;
%end
%end
function y=lc_coupnet(t,x,N,w,mu_a,mu_ia,k,p,mm);
x11=x(1:2:2*N);
x22=x(2:2:2*N);

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
