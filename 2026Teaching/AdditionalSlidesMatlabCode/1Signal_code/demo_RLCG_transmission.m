clc; clear; close all;

% =========================================================
% Demo 2: RLCG transmission line using a lumped ladder model
%
% One small section of cable is modelled by:
%   - series R and L
%   - shunt G and C
%
% Repeating many sections approximates a long transmission line.
%
% State variables:
%   i_k(t)   = current through section k series branch
%   v_k(t)   = node voltage at section k
%
% We solve the differential equations numerically using ode45.
% =========================================================

%% Cable parameters per section
N  = 20;              % number of sections
R  = 2;               % series resistance per section (ohms)
L  = 20e-6;           % series inductance per section (H)
C  = 200e-12;         % shunt capacitance per section (F)
G  = 1e-6;            % shunt conductance per section (S)

RL = 100;             % load resistance at end (ohms)

%% Input signal: pulse
Vpulse = 1;           % pulse amplitude (V)
pulse_width = 20e-6;  % pulse width (s)

vin = @(t) Vpulse * (t >= 5e-6 && t <= (5e-6 + pulse_width));

%% State vector x:
% x = [i1 i2 ... iN  v1 v2 ... vN]^T
x0 = zeros(2*N,1);

%% Simulation time
tspan = [0 200e-6];

%% Solve ODE
opts = odeset('RelTol',1e-6,'AbsTol',1e-8);
[t, x] = ode45(@(t,x) rlcg_line_ode(t, x, N, R, L, C, G, RL, vin), tspan, x0, opts);

%% Extract currents and voltages
I = x(:,1:N);
V = x(:,N+1:end);

v_in  = arrayfun(vin, t);
v_mid = V(:, round(N/2));
v_out = V(:, N);

%% Plot input, mid-point, output
figure('Name','Demo 2A - Pulse Propagation');
plot(t*1e6, v_in,  '--', 'LineWidth', 1.2); hold on;
plot(t*1e6, v_mid, 'LineWidth', 1.5);
plot(t*1e6, v_out, 'LineWidth', 1.5);
grid on;
title('Pulse Propagation Along an RLCG Transmission Line');
xlabel('Time (\mus)');
ylabel('Voltage (V)');
legend('Input pulse','Mid-line voltage','Output voltage','Location','best');

%% Plot voltage snapshots along the line at selected times
sample_times = [20e-6, 50e-6, 100e-6, 150e-6];

figure('Name','Demo 2B - Voltage Along the Cable');
hold on;
for k = 1:length(sample_times)
    [~, idx] = min(abs(t - sample_times(k)));
    plot(1:N, V(idx,:), 'LineWidth', 1.5, ...
        'DisplayName', sprintf('t = %.0f us', sample_times(k)*1e6));
end
grid on;
title('Voltage Distribution Along the Transmission Line');
xlabel('Section Number');
ylabel('Node Voltage (V)');
legend('Location','best');

%% Print teaching notes
fprintf('RLCG transmission line simulation complete.\n');
fprintf('\nTeaching interpretation:\n');
fprintf('1. R causes attenuation along the cable.\n');
fprintf('2. L resists fast current changes.\n');
fprintf('3. C stores charge between conductors, causing delay and pulse spreading.\n');
fprintf('4. G models leakage through imperfect insulation.\n');
fprintf('5. Repeated RLCG sections produce distortion and spreading of the pulse.\n');

%% =========================================================
% Local function: ODE model of the RLCG ladder
% =========================================================
function dxdt = rlcg_line_ode(t, x, N, R, L, C, G, RL, vin)
    i = x(1:N);          % series currents
    v = x(N+1:2*N);      % node voltages

    dxdt = zeros(2*N,1);

    % Input source voltage
    Vs = vin(t);

    % --- Series branches: di/dt equations ---
    for k = 1:N
        if k == 1
            v_left = Vs;
        else
            v_left = v(k-1);
        end
        v_right = v(k);

        % L di/dt = v_left - v_right - R*i
        dxdt(k) = (v_left - v_right - R*i(k)) / L;
    end

    % --- Shunt nodes: dv/dt equations ---
    for k = 1:N
        i_in = i(k);

        if k < N
            i_out = i(k+1);
            i_load = 0;
        else
            i_out = 0;
            i_load = v(k) / RL;   % load current at final node
        end

        % C dv/dt = i_in - i_out - G*v - i_load
        dxdt(N+k) = (i_in - i_out - G*v(k) - i_load) / C;
    end
end