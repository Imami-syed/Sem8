%function SISModel()
%%
clear all
    % Network parameters
    numNodes = 50; p=0.25;
    %adjacencyMatrix = generateRandomGraph(numNodes);

GG11 = rand(numNodes,numNodes);
GG1=GG11< p;
GG = triu(GG1,1);
adjacencyMatrix = GG + GG';
%%%%
G1=graph(adjacencyMatrix);
figure; plot(G1)
%%
    % SIS model parameters
    beta = 0.05; % Infection rate
    %gamma = 0.05; % Recovery rate

    % Initial conditions
    initialInfectedNodes = randperm(numNodes, 5); % Initial infected nodes
    initialStates = zeros(numNodes, 1);
    initialStates(initialInfectedNodes) = 0.001;

    % ODE solver options
    options = odeset('RelTol', 1e-6, 'AbsTol', 1e-8);

    % Time span for simulation
    tspan = [0 100];

    % Solve ODEs
    [t, y] = ode45(@(t, y) siODE(t, y, beta, adjacencyMatrix), tspan, initialStates);
figure;
    % Plot the results
    semilogx(t, y);
    title('SIS Model on a Network');

%figure;
xlim([0 100]);
ylim([0.0 1]);
set(gcf, 'PaperPositionMode', 'auto','position', [0, 0, 700, 700]);
% set(legend,'color','none');
% %set(legend, 'Box', 'on');
hold on;  
  set(findall(gcf,'-property','FontSize'),'FontName','Cambria',...
       'FontSize',14,'linewidth',1.0,'fontweight','b');
%  grid on;
xlabel('t','Interpreter','LaTeX','FontSize',30);
ylabel('$i(t)$','Interpreter','LaTeX','FontSize',30);


%%
 [u lam]=eig(adjacencyMatrix);

evc_large=abs(u(:,end));
figure; subplot(321); plot(evc_large,y(10,:),'p');
subplot(322);semilogx(evc_large*exp(beta*lam(numNodes, numNodes)*t(15)),y(15,:),'o');  
title(t=t(15));
subplot(323); semilogx(evc_large*exp(beta*lam(numNodes, numNodes)*t(30)),y(30,:),'x'); 
title('t=',t(30));
subplot(324);semilogx(evc_large*exp(beta*lam(numNodes, numNodes)*t(35)),y(35,:),'x'); 
title('t=',t(35));
subplot(325); semilogx(evc_large*exp(beta*lam(numNodes, numNodes)*t(45)),y(45,:),'x'); 
title('t=',t(45));
subplot(326); semilogx(evc_large,y(55,:),'x');  title('t=',t(55));
t(40)
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
function dydt = siODE(t, y, beta, A)
    % ODE function for the SIS model
   % S = 1 - y; % Susceptible fraction
    %I = y; % Infected fraction

    didt = beta * (1-y).*A* (y);% .* y; %+ gamma * I;
   % dIdt = beta * A * S .* I - gamma * I;

    dydt = [didt];
end

% function A = generateRandomGraph(numNodes)
%     % Generate a random graph (adjacency matrix)
%     A = rand(numNodes) < 0.1; % Adjust the probability for more or fewer connections
%     A = triu(A, 1) + triu(A, 1).' + eye(numNodes); % Make the matrix symmetric
% end
