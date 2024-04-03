%function SISModel()

    % Network parameters
    numNodes = 100;
    adjacencyMatrix = generateRandomGraph(numNodes);

    % SIS model parameters
    beta = 0.1; % Infection rate
    gamma = 0.05; % Recovery rate

    % Initial conditions
    initialInfectedNodes = randperm(2*numNodes, 5); % Initial infected nodes
    initialStates = zeros(2*numNodes, 1);
    initialStates(initialInfectedNodes) = 1;

    % ODE solver options
    options = odeset('RelTol', 1e-6, 'AbsTol', 1e-8);

    % Time span for simulation
    tspan = [0 100];

    % Solve ODEs
    [t, y] = ode45(@(t, y) sisODE(t, y, beta, gamma, adjacencyMatrix), tspan, initialStates, options);

    % Plot the results
    plot(t, y);
    title('SIS Model on a Network');
    xlabel('Time');
    ylabel('Fraction of Infected Nodes');
    legend('Node 1', 'Node 2', 'Node 3', 'Node 4', 'Node 5');
%end

function dydt = sisODE(t, y, beta, gamma, A)
    % ODE function for the SIS model
    S = 1 - y; % Susceptible fraction
    I = y; % Infected fraction

    dSdt = -beta * A * S .* I + gamma * I;
    dIdt = beta * A * S .* I - gamma * I;

    dydt = [dSdt; dIdt];
end

function A = generateRandomGraph(numNodes)
    % Generate a random graph (adjacency matrix)
    A = rand(numNodes) < 0.1; % Adjust the probability for more or fewer connections
    A = triu(A, 1) + triu(A, 1).' + eye(numNodes); % Make the matrix symmetric
end
