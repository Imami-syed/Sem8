for N=  [3 5 10 50]
A=ones(N,N);
A(1:N+1:N*N)=0;
G=graph(A);
figure;    plot(G);
deg = degree(G);
%deg = degree(h2);
nSizes = 8+4*sqrt(deg-min(deg)+0.5);
% NC=cell2mat(data(j,7));
nColors = rand(N,1)*0+3;%NC(:,3);% deg;
%%
%p=plot(G,'MarkerSize',nSizes,'NodeCData',...
 %   nColors,'EdgeAlpha',0.5);
p=plot(G,'MarkerSize',nSizes,'EdgeAlpha',0.5);
p.NodeFontSize=0.3;
p.NodeFontWeight='b';
 p.EdgeColor='k';
 p.LineWidth=2;
 p.NodeColor='r';
 A=[];
set(findall(gcf,'-property','FontSize'),'FontName','Cambria',...
     'FontSize',24,'linewidth',2.0,'fontweight','b') 

set(gcf,'InvertHardCopy','off','Color','white');

%    view(2)
%   pp=cell2mat(ADj_listeeg(j,2))/200;
% [t]=title('N= ', N);
  % m =  month(N,'name');  
  % Isolate Month Name
  pp=mat2str(N);
 [t]=   title(sprintf('N= %s', pp));  

%   title(['Time= ',num2str(pp), 'Sec'])
%   pp=[];
 t.FontSize = 16;
 t.FontAngle = 'italic';
 axis off
end


