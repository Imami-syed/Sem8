clc
clear all
 close all
global mu lambda
mu=1;lambda=0.5;
a=0.001*rand(1,11);
b=.1*rand(1,11);
op=odeset('Abstol',1e-9,'Reltol',1e-9);
 %intial=[0.00001*rand(1,4),0,0.00001*rand(1,6),ones(1,11)];
 intial=[b(1,1),0,0,a(1,4),a(1,5),0,0,0,a(1,9),b(1,10),0,1-b(1,1),1,1,1-a(1,4),1-a(1,5),1,1,1,1-a(1,9),1-b(1,10),1];
% c=.001
% p=c/33*ones(1,11); q=(1-c/33)*ones(1,11);
% intial=[p,q,0*ones(1,11)];

for i=1:1
[t,x]=ode45(@sir_multi_update,[0:0.01:200],intial,op);
end


V1=[0.4235,0.3011,0.2816,0.2922,0.1054,0.1054,0.2922,0.3379,0.2812,0.4307,0.2812];

% N=1:1:11;

X=x(:,1:11);
x(end,:);
 S=x(:,12:22);

 


c1=abs(X(:,4)-X(:,7));
c2=abs(X(:,5)-X(:,6));
c3=abs(X(:,9)-X(:,11));
c=[c1,c2,c3];
n_c=sqrt((X(:,3)-X(:,1)).^2+(X(:,3)-X(:,2)).^2+(X(:,3)-X(:,8)).^2+(X(:,3)-X(:,10)).^2);
 % r=xabs(X(:,4)-X(:,7));(:,23:33);
%  L=3.7726;
%  t1=7.99;
%   u1=exp(lambda*L-mu)*t1;
%   N1=V1*u1;
% % 
% % t2=7;
% % u2=exp(lambda*L-mu)*t2;
% % N2=V1*u2;
% % 
% % t3=500;
% % u3=exp(lambda*L-mu)*t3;
% % N3=V1*u3;
% 
% for j=1:11
%     plot(j,S(2401,j))
%     hold on
% end
%  t2=100; S1=V1; 
% S2=X(t2,:)/max(X(t2,:));
% plot(S1(9),S2(9),'rs');
% hold on
% plot(S1(11),S2(11),'rs');
% plot(S1(4),S2(4),'gs');
% plot(S1(7),S2(7),'gs');
% plot(S1(5),S2(5),'bs');
% plot(S1(6),S2(6),'bs');
% plot(S1(1),S2(1),'ks');
% plot(S1(2),S2(2),'ks');
% plot(S1(3),S2(3),'ks');
% plot(S1(8),S2(8),'ks');
% plot(S1(10),S2(10),'ks');
% hold on
% 
% 
% t4=700; M1=V1; 
%  M2=X(t4,:)/max(X(t4,:));
% plot(M1(9),M2(9),'r*');
% hold on
% plot(M1(11),M2(11),'r*');
% plot(M1(4),M2(4),'g*');
% plot(M1(7),M2(7),'g*');
% plot(M1(5),M2(5),'b*');
% plot(M1(6),M2(6),'b*');
% plot(M1(1),M2(1),'k*');
% plot(M1(2),M2(2),'k*');
% plot(M1(3),M2(3),'k*');
% plot(M1(8),M2(8),'k*');
% plot(M1(10),M2(10),'k*');
% 
% T1=V1; T2=abs(X(end,:));
% 
% plot(T1(9),T2(9),'ro');
% hold on
% plot(T1(11),T2(11),'ro');
% plot(T1(4),T2(4),'go');
% plot(T1(7),T2(7),'go');
% plot(T1(5),T2(5),'bo');
% plot(T1(6),T2(6),'bo');
% plot(T1(1),T2(1),'ko');
% plot(T1(2),T2(2),'ko');
% plot(T1(3),T2(3),'ko');
% plot(T1(8),T2(8),'ko');
% plot(T1(10),T2(10),'ko');

% for i=1:1:11
%     plot(i,X(700,i))
%    hold on 
% end

%hold on
% plot(V1/max(V1), X(690,:)/max(X(690,:)),'-');

% p=[.99,.99,.99,.99,.99,.99,.99,.99,.99,.99,.99];
% q=[6.89,6.89,6.89]

% plot(S11,S22,'*')
%     t2=500000;  plot(V1/max(V1), abs(X(t2,:))/abs(max(X(t2,:))),'r.');
%     t2=100;  plot([V1(1:4) V1(7:end)]./max(V1), X(t2,[1:4 7:end])./max(X(t2,:)),'r*');
%       t5=500001;  plot(V1/max(V1), (abs(X(end,:)))/max(abs(X(end,:))),'k-');
 % t5=500001;  plot(V1/max(V1), (abs(X(690,:)))/(max(abs(X(690,:)))),'-');

%   figure;   t1=1200;  plot(V1/max(V1), S(t1,:)/max(S(t1,:)),'bs');
%  hold on
%   t1=400;  plot(V1/max(V1), S(t1,:)/max(S(t1,:)),'r*');
%     t1=140;  plot(V1/max(V1), X(t1,:)/max(X(t1,:)),'
%  t1=10000;  plot(V1, X(t1,:)/max(X(t1,:)),'bs');gv');
%   t1=50001;  plot(V1/max(V1), S(t1,:)/max(S(t1,:)),'mo');
loglog(t,n_c)
hold on
loglog(t,c)
 