close all
clear all
ZZ=[];
for n=4:20:500;

%for n=100%:1000
  n
 % c=2;
%addpath('C:\Users\chitt\OneDrive\Desktop\Chitta_Folder\IIIThyd\Course\IIIIT_Course\Network_Dynamics_course\Course_Module Wise\code')
for c=1
A = smallw(n,c,0); %%% Construction of ring. c is the neighbour in one side
A=zeros(n,n)+A;
A(1,n)=0;
A(n,1)=0;
%A=A+A;

deg=sum(A); %%% Degree vector:regular 2*c if it is ring
avg_deg=mean(deg); %%% 2c
l=pathlength(A); %%% all pathlengths are stored in l
% ll=triu(l);
% sum(ll)
%=mean(mean(ll));%
avg_l= (sum(sum(l)))/(n*(n-1)); %%Average pathlength
avg_l1 = avg_l;%ave_path_length(A);

 ZZ=[ZZ;n,c,(n+1)/3,avg_l,avg_l1, max(max(l)),n-1,avg_deg];
A=[];
%  figure(10);
% G=graph(A);
% plot(G); A=[];
end
end
%%%%%%%%%%%%%%%%%%%%%% Average Pathlength %%%%%%%%%%
%%
figure;
plot(ZZ(:,1),ZZ(:,3),'-','LineWidth',3);
hold on;
scatter(ZZ(:,1),ZZ(:,4),'o','filled','LineWidth',10)
hold on;
% scatter(ZZ(:,2),ZZ(:,5),'s','filled','LineWidth',10)
% hold on;
set(gcf,'InvertHardCopy','off','Color','white');
xlabel('N','Interpreter','LaTeX','FontSize',30);
ylabel('$\langle l \rangle $','Interpreter','LaTeX','FontSize',30);
% title('Cluster distribution (subcritical: $p<p_c$)');
set(gcf, 'PaperPositionMode', 'auto','position', [0, 0, 700, 700]);
set(legend,'color','none');
set(legend, 'Box', 'on');
hold on;  
  set(findall(gcf,'-property','FontSize'),'FontName','Cambria',...
       'FontSize',24,'linewidth',2.0,'fontweight','b');
  grid on;


%%%%%%%%%%%%%%%%%%%%%% Maximum pathlength %%%%%%%%%%%%%%%
%%
figure ;
plot(ZZ(:,1),ZZ(:,6),'-','LineWidth',3);
hold on;
scatter(ZZ(:,1),ZZ(:,7),'o','filled','LineWidth',10)
hold on;


xlabel('N','Interpreter','LaTeX','FontSize',30);
ylabel('$l_{\rm max} $','Interpreter','LaTeX','FontSize',30);
% title('Cluster distribution (subcritical: $p<p_c$)');
set(gcf, 'PaperPositionMode', 'auto','position', [0, 0, 700, 700]);
set(legend,'color','none');
set(legend, 'Box', 'on');
hold on;  
  set(findall(gcf,'-property','FontSize'),'FontName','Cambria',...
       'FontSize',24,'linewidth',2.0,'fontweight','b');
  grid on;


% 
%  xlabel('c');
%  ylabel('l_{max}')
% set(findall(gcf,'-property','FontSize'),'FontName','Cambria',...
%      'FontSize',24,'linewidth',2.0,'fontweight','b') 
% 
% set(gcf,'InvertHardCopy','off','Color','white');

