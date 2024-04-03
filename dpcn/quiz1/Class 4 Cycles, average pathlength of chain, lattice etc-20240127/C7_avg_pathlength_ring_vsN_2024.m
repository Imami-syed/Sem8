ZZ=[];
for n=10:20:500;

%for n=100%:1000
  n
 % c=2;
%addpath('C:\Users\chitt\OneDrive\Desktop\Chitta_Folder\IIIThyd\Course\IIIIT_Course\Network_Dynamics_course\Course_Module Wise\code')
for c=2%1:3:20
A = smallw(n,c,0);
A=zeros(n,n)+A;
%A=A+A;
deg=sum(A);
avg_deg=mean(deg);
l=pathlength(A);
% ll=triu(l);
% sum(ll)
%avg_l=mean(mean(l));
avg_l=(sum(sum(l)))/(n*(n-1));
avg_l1 = avg_l;%ave_path_length(A);
%A=[];
 ZZ=[ZZ;n,2*c,n/(2*avg_deg),avg_l,avg_l1, max(max(l)),n/(avg_deg)];
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

