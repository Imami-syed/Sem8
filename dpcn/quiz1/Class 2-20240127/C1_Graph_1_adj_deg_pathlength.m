clear all
%%% 1 Load the .mat file. Check whether it is directed or not
%%% 2. Graph plot, What do you learn?
%%% 3. Degree, Avg Degree, link density
%%% 4. Pathlength from A^k, drawback, Trace(A^k) significance
%%%    Diameter
%%% 5. Other algorithm (djikstra?) How to find intermediate nodes?
%%%%%%%%%%%  1. %%%%%%%%%%%%%% 
% clear all;
load A_9.mat;
issymmetric(A);
%%
%%%%%%%%%%%% 2. %%%%%%%%%%%%%%
G=graph(A);
figure; plot(G)
set(findall(gcf,'-property','FontSize'),'FontName','Cambria',...
       'FontSize',38,'linewidth',2.0,'fontweight','b');
  grid on;
%%
%%%%%%%%%%%% 3. %%%%%%%%%%%%%%
%%%%%%%%%%%% Degree %%%%%%%%%%
degree=sum(A);
figure; plot(degree,'.','MarkerSize',24);
xlabel('Node Index','Interpreter','LaTeX','FontSize',30);
ylabel('$k_i$ (Degree)','Interpreter','LaTeX','FontSize',30);
% title('Cluster distribution (subcritical: $p<p_c$)');
set(gcf, 'PaperPositionMode', 'auto','position', [0, 0, 700, 700]);
set(legend,'color','none');
set(legend, 'Box', 'on');
hold on;  
  set(findall(gcf,'-property','FontSize'),'FontName','Cambria',...
       'FontSize',24,'linewidth',2.0,'fontweight','b');
  grid on;
%  
 %  xlim([-40 4000])
  % ylim([ 10^-6 2])
avgdeg=sum(degree)/length(A);
maxdeg=max(degree);
%%%%%%%%%%%%% 4.%%%%%%%%%%%%%%
%%%%%%%%%%%%% Pathlength %%%%%
%%%
A1=A^2;
DD= pathlength(A);
Diameter_g=max(max(DD));