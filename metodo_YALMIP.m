clear all;clc;close all

%% Intervalo entorno a la media (b_media)

% === 1. Cargar datos del archivo .mat ===
load('Datos_Manufacturing_media.mat');  % Carga A_media, A_hat_media, b
b_media = double(b_media);

% === 2. Dimensiones ===
[m, n] = size(A_media);  % m restricciones, n variables

% === 3. Variables ===
x = sdpvar(n, 1);              % Variables de decisión
w = sdpvar(m*n, 1);            % Perturbaciones δ_ij vectorizadas

% === 4. Construcción del conjunto de restricciones ===
constraints = [];

for i = 1:m
    expr = 0;
    for j = 1:n
        idx = (i - 1)*n + j;

        % Dominio box de la incertidumbre (Soyster)
        constraints = [constraints, -A_hat_media(i,j) <= w(idx) <= A_hat_media(i,j)];

        % Restricción con incertidumbre aditiva
        expr = expr + (A_media(i,j) + w(idx)) * x(j);
    end
    constraints = [constraints, expr <= b_media(i)];
end

% === 5. Declarar incertidumbre y dominio de x ===
constraints = [constraints, uncertain(w), x >= 0];

% === 6. Función objetivo ===
objective = sum(x);  % Ejemplo: maximizar suma de x_j

% === 7. Configuración y resolución ===
ops = sdpsettings('solver', 'gurobi');
sol = optimize(constraints, -objective, ops);  % - para maximizar

% === 8. Resultados ===
if sol.problem == 0
    disp('Solución óptima x:');
    disp(value(x));
    disp('Valor óptimo de la función objetivo:');
    disp(value(objective));
else
    disp('Error al resolver el problema:');
    disp(sol.info);
end

%% # Intervalo [min max] (b_media)

close all;clc;clear all

load('Datos_Manufacturing_MinMax.mat');
b_media = double(b_media);

% === 2. Dimensiones ===
[m, n] = size(A_MinMax);  % m restricciones, n variables

% === 3. Variables ===
x = sdpvar(n, 1);              % Variables de decisión
w = sdpvar(m*n, 1);            % Perturbaciones δ_ij vectorizadas

% === 4. Construcción del conjunto de restricciones ===
constraints = [];

for i = 1:m
    expr = 0;
    for j = 1:n
        idx = (i - 1)*n + j;

        % Dominio box de la incertidumbre (Soyster)
        constraints = [constraints, -A_hat_MinMax(i,j) <= w(idx) <= A_hat_MinMax(i,j)];

        % Restricción con incertidumbre aditiva
        expr = expr + (A_MinMax(i,j) + w(idx)) * x(j);
    end
    constraints = [constraints, expr <= b_media(i)];
end

% === 5. Declarar incertidumbre y dominio de x ===
constraints = [constraints, uncertain(w), x >= 0];

% === 6. Función objetivo ===
objective = sum(x);  % Ejemplo: maximizar suma de x_j

% === 7. Configuración y resolución ===
ops = sdpsettings('solver', 'gurobi');
sol = optimize(constraints, -objective, ops);  % - para maximizar

% === 8. Resultados ===
if sol.problem == 0
    disp('Solución óptima x:');
    disp(value(x));
    disp('Valor óptimo de la función objetivo:');
    disp(value(objective));
else
    disp('Error al resolver el problema:');
    disp(sol.info);
end

%% Intervalo entorno a la media (b_media)
% === 1. Cargar datos del archivo .mat ===
load('Datos_Manufacturing_media.mat');  % Carga A_media, A_hat_media, b
b_max = double(b_max);

% === 2. Dimensiones ===
[m, n] = size(A_media);  % m restricciones, n variables

% === 3. Variables ===
x = sdpvar(n, 1);              % Variables de decisión
w = sdpvar(m*n, 1);            % Perturbaciones δ_ij vectorizadas

% === 4. Construcción del conjunto de restricciones ===
constraints = [];

for i = 1:m
    expr = 0;
    for j = 1:n
        idx = (i - 1)*n + j;

        % Dominio box de la incertidumbre (Soyster)
        constraints = [constraints, -A_hat_media(i,j) <= w(idx) <= A_hat_media(i,j)];

        % Restricción con incertidumbre aditiva
        expr = expr + (A_media(i,j) + w(idx)) * x(j);
    end
    constraints = [constraints, expr <= b_max(i)];
end

% === 5. Declarar incertidumbre y dominio de x ===
constraints = [constraints, uncertain(w), x >= 0];

% === 6. Función objetivo ===
objective = sum(x);  % Ejemplo: maximizar suma de x_j

% === 7. Configuración y resolución ===
ops = sdpsettings('solver', 'gurobi');
sol = optimize(constraints, -objective, ops);  % - para maximizar

% === 8. Resultados ===
if sol.problem == 0
    disp('Solución óptima x:');
    disp(value(x));
    disp('Valor óptimo de la función objetivo:');
    disp(value(objective));
else
    disp('Error al resolver el problema:');
    disp(sol.info);
end

%% # Intervalo [min max] (b_max)


close all;clc;clear all

load('Datos_Manufacturing_MinMax.mat');
b_max = double(b_max);

% === 2. Dimensiones ===
[m, n] = size(A_MinMax);  % m restricciones, n variables

% === 3. Variables ===
x = sdpvar(n, 1);              % Variables de decisión
w = sdpvar(m*n, 1);            % Perturbaciones δ_ij vectorizadas

% === 4. Construcción del conjunto de restricciones ===
constraints = [];

for i = 1:m
    expr = 0;
    for j = 1:n
        idx = (i - 1)*n + j;

        % Dominio box de la incertidumbre (Soyster)
        constraints = [constraints, -A_hat_MinMax(i,j) <= w(idx) <= A_hat_MinMax(i,j)];

        % Restricción con incertidumbre aditiva
        expr = expr + (A_MinMax(i,j) + w(idx)) * x(j);
    end
    constraints = [constraints, expr <= b_max(i)];
end

% === 5. Declarar incertidumbre y dominio de x ===
constraints = [constraints, uncertain(w), x >= 0];

% === 6. Función objetivo ===
objective = sum(x);  % Ejemplo: maximizar suma de x_j

% === 7. Configuración y resolución ===
ops = sdpsettings('solver', 'gurobi');
sol = optimize(constraints, -objective, ops);  % - para maximizar

% === 8. Resultados ===
if sol.problem == 0
    disp('Solución óptima x:');
    disp(value(x));
    disp('Valor óptimo de la función objetivo:');
    disp(value(objective));
else
    disp('Error al resolver el problema:');
    disp(sol.info);
end

















