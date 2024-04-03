%function SISModel()
%%
close all
clear all
    % Network parameters
   % numNodes = 50;% p=0.25; 
    %adjacencyMatrix = generateRandomGraph(numNodes);

% GG11 = rand(numNodes,numNodes);
% GG1=GG11< p;
% GG = triu(GG1,1);
% adjacencyMatrix = GG + GG';
% %%%%
% G1=graph(adjacencyMatrix);
% figure; plot(G1)
%%
     numNodes =9;% 1000; 
     n=numNodes; A=zeros(n,n);
    A(1,[2 3 8 9])=1;
    A(2,[ 4 5])=1;
    A(3,[ 6 7])=1;
    A(5,7)=1;
    A(8,9)=1;
    %%%%
%  %   A(1,2)=0; A(2,1)=0; A(7,4)=1; A(4,7)=1;
    A=A+A';
%load A_er_1000.mat
  
figure;    G=graph(A); plot(G); adjacencyMatrix=A;
C= 1;
    
    initialStates = rand(numNodes, 1)+0.1;
   

    % ODE solver options
    options = odeset('RelTol', 1e-6, 'AbsTol', 1e-8);

    % Time span for simulation
    tspan = [0 100];
deg=sum(adjacencyMatrix);
deg=deg';
    % Solve ODEs
    [t, y] = ode45(@(t, y) siODE(t, y, C,  adjacencyMatrix,deg ), tspan, initialStates);
figure;
    % Plot the results
    semilogx(t, y);
    title('Diffusion dynamics');

%figure;
xlim([0 600]);
%ylim([0.0 0.1]);
set(gcf, 'PaperPositionMode', 'auto','position', [0, 0, 700, 700]);
% set(legend,'color','none');
% %set(legend, 'Box', 'on');
hold on;  
  set(findall(gcf,'-property','FontSize'),'FontName','Cambria',...
       'FontSize',14,'linewidth',1.0,'fontweight','b');
%  grid on;
xlabel('t','Interpreter','LaTeX','FontSize',30);
ylabel('$x$','Interpreter','LaTeX','FontSize',30);


%%
%  [u lam]=eig(adjacencyMatrix);
% %%
% evc_large=abs(u(:,end));
% t1=5; t2=23; t3=34; t4=47; t5=66; t6=145;
% figure; subplot(321); plot(evc_large,y(t1,:),'p','markersize',12); title(t=t(t1));
% subplot(322); plot(evc_large,y(t2,:),'d','markersize',12); title(t=t(t2));
%  
% subplot(323); plot(evc_large,y(t3,:),'o','markersize',12); title(t=t(t3));
% subplot(324); plot(evc_large,y(t4,:),'x','markersize',12); title(t=t(t4));
% 
%  subplot(325); plot(evc_large,y(t5,:),'p','markersize',12); title(t=t(t5));
% subplot(326); plot(evc_large,y(t6,:),'<','markersize',12); title(t=t(t6));
%%
% figure;
%  subplot(321);semilogx(evc_large*exp((beta*lam(numNodes, numNodes)-mu)*t(t1)),y(t1,:),'o');  
%  title(t=t(t1));
%  subplot(322); semilogx(evc_large*exp((beta*lam(numNodes, numNodes)-mu)*t(t3)),y(t3,:),'x'); 
% title('t=',t(t3));
%  subplot(324);semilogx(evc_large*exp((beta*lam(numNodes, numNodes)-mu)*t(t6)),y(t6,:),'x'); 
%  title('t=',t(t6));
% % subplot(325); semilogx(evc_large*exp((beta*lam(numNodes, numNodes)-mu)*t(45)),y(45,:),'x'); 
% % title('t=',t(45));
% subplot(326); semilogx(evc_large*exp((beta*lam(numNodes, numNodes)-mu)*t(45)),y(55,:),'x');  title('t=',t(55));
% t(40)
%     xlabel('Time');
%     ylabel('Fraction of Infected Nodes');
%     legend('Node 1', 'Node 2', 'Node 3', 'Node 4', 'Node 5');
%end
set(gcf, 'PaperPositionMode', 'auto','position', [0, 0, 700, 700]);
% set(legend,'color','none');
% %set(legend, 'Box', 'on');
hold on;  
  set(findall(gcf,'-property','FontSize'),'FontName','Cambria',...
       'FontSize',18,'linewidth',2.0,'fontweight','b');
%%
function dydt = siODE(t, y, C, A,deg)
    % ODE function for the SIS model
   % S = 1 - y; % Susceptible fraction
    %I = y; % Infected fraction

    dxdt = -C*deg.*y+  C*A* (y);% .* y; %+ gamma * I;
   % dIdt = beta * A * S .* I - gamma * I;

    dydt = [dxdt];
end

% function A = generateRandomGraph(numNodes)
%     % Generate a random graph (adjacency matrix)
%     A = rand(numNodes) < 0.1; % Adjust the probability for more or fewer connections
%     A = triu(A, 1) + triu(A, 1).' + eye(numNodes); % Make the matrix symmetric
% end
