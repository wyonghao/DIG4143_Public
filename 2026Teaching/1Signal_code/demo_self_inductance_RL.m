clc; clear; close all;

% =========================================================
% Demo 1: Self-inductance effect on signal transmission
% Model: simple RL conductor
%
% Theory:
%   v_in(t) = R*i(t) + L*di/dt
%   v_out(t) = R*i(t)
%
% Transfer function:
%   H(s) = Vout/Vin = R / (L*s + R)
%
% Interpretation:
%   The conductor behaves like a first-order low-pass system.
%   Increasing L makes the response slower and smooths fast edges.
% =========================================================

%% Parameters
R = 50;            % resistance in ohms
L = 200e-6;        % inductance in henries

% Transfer function
num = R;
den = [L R];
sys = tf(num, den);

%% Time constant
tau = L / R;
fprintf('Time constant tau = L/R = %.6e s\n', tau);

%% Part A: Step response
figure('Name','Demo 1A - Step Response');
step(sys);
grid on;
title('Step Response of an RL Conductor Model');
xlabel('Time (s)');
ylabel('Output Voltage (V)');

%% Part B: Square-wave transmission
f = 2000;                          % square-wave frequency in Hz
t = 0:1e-6:3e-3;                   % time vector
vin = square(2*pi*f*t);            % input square wave
vout = lsim(sys, vin, t);          % output after RL conductor

figure('Name','Demo 1B - Square Wave Distortion');
plot(t*1e3, vin, '--', 'LineWidth', 1.2); hold on;
plot(t*1e3, vout, 'LineWidth', 1.5);
grid on;
title('Effect of Self-Inductance on a Square Wave');
xlabel('Time (ms)');
ylabel('Voltage (V)');
ylim([-1.5 1.5]);   % or use [-2 2] if you want more margin
legend('Input square wave','Output after RL conductor','Location','best');

%% Part C: Frequency response
figure('Name','Demo 1C - Frequency Response');
bode(sys);
grid on;
title('Frequency Response of RL Conductor Model');

%% notes printed in command window
fprintf('\n Interpretation:\n');
fprintf('1. Self-inductance produces a voltage L*di/dt that opposes current change.\n');
fprintf('2. Fast transitions are resisted, so edges become rounded.\n');
fprintf('3. This introduces delay, high-frequency attenuation, and phase shift.\n');