clc; clear; close all;

% =========================================================
% RLCG Transmission Line Animation
% Visualise pulse propagation along a cable
% =========================================================

%% Parameters
N  = 40;              % number of sections (more = smoother)
R  = 2;
L  = 50e-6;
C  = 500e-12;
G  = 1e-6;

RL = 100;             % load

%% Input pulse
Vpulse = 1;
pulse_width = 20e-6;

vin = @(t) Vpulse * (t >= 5e-6 && t <= (5e-6 + pulse_width));

%% Initial state
x0 = zeros(2*N,1);

%% Time
tspan = [0 150e-6];

opts = odeset('RelTol',1e-6,'AbsTol',1e-8);
[t, x] = ode45(@(t,x) rlcg_line_ode(t, x, N, R, L, C, G, RL, vin), tspan, x0, opts);

%% Extract voltage
V = x(:,N+1:end);

%% Animation
figure('Name','Transmission Line Animation');

for k = 1:10:length(t)   % skip frames for speed
    
    plot(1:N, V(k,:), 'LineWidth', 2);
    ylim([-0.2 1.2]);
    grid on;
    
    title(sprintf('Pulse Propagation at t = %.1f µs', t(k)*1e6));
    xlabel('Position along cable (section)');
    ylabel('Voltage (V)');
    
    drawnow;
end

%% =========================================================
% ODE function
% =========================================================
function dxdt = rlcg_line_ode(t, x, N, R, L, C, G, RL, vin)

    i = x(1:N);
    v = x(N+1:2*N);

    dxdt = zeros(2*N,1);

    Vs = vin(t);

    % Series branches
    for k = 1:N
        if k == 1
            v_left = Vs;
        else
            v_left = v(k-1);
        end
        v_right = v(k);

        dxdt(k) = (v_left - v_right - R*i(k)) / L;
    end

    % Shunt nodes
    for k = 1:N
        i_in = i(k);

        if k < N
            i_out = i(k+1);
            i_load = 0;
        else
            i_out = 0;
            i_load = v(k) / RL;
        end

        dxdt(N+k) = (i_in - i_out - G*v(k) - i_load) / C;
    end
end