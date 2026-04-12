%% microphone_sensitivity_db_demo.m
% Teaching demo:
% Convert between sound pressure (Pa), sound pressure level (dB SPL),
% microphone output voltage (mV), and output level (dBV).
%
% Assumption:
% Microphone sensitivity = 1.85 mV at 1 Pa
% which is approximately -54.5 dBV/Pa.

clear; close all; clc;

%% References and microphone sensitivity
p_ref = 20e-6;           % 20 uPa reference for dB SPL
v_ref = 1;               % 1 V reference for dBV
mic_sens_v_per_pa = 1.85e-3;  % 1.85 mV per Pa

%% Pressure range for teaching examples
p = logspace(log10(20e-6), log10(10), 500);   % 20 uPa to 10 Pa
dBSPL = 20*log10(p / p_ref);
v_out = mic_sens_v_per_pa * p;                % assume linear microphone
dBV_out = 20*log10(v_out / v_ref);

%% Key reference point
p_key = 1;                                    % 1 Pa
dBSPL_key = 20*log10(p_key / p_ref);
v_key = mic_sens_v_per_pa * p_key;
dBV_key = 20*log10(v_key / v_ref);

fprintf('Microphone sensitivity demo\n\n');
fprintf('Reference pressure p0 = %.0f uPa\n', p_ref*1e6);
fprintf('Microphone sensitivity = %.2f mV/Pa\n\n', mic_sens_v_per_pa*1e3);

fprintf('Key reference point:\n');
fprintf('Pressure = %.2f Pa\n', p_key);
fprintf('Sound pressure level = %.2f dB SPL\n', dBSPL_key);
fprintf('Output voltage = %.2f mV\n', v_key*1e3);
fprintf('Output level = %.2f dBV\n\n', dBV_key);

%% Example classroom points
spl_examples = [34 54 74 94 114];
p_examples = p_ref * 10.^(spl_examples/20);
v_examples = mic_sens_v_per_pa * p_examples;
dBV_examples = 20*log10(v_examples / v_ref);

fprintf('Example values:\n');
fprintf(' dB SPL      Pa         Output (mV)      dBV\n');
for k = 1:numel(spl_examples)
    fprintf('%7.1f   %8.5f      %8.4f      %7.2f\n', ...
        spl_examples(k), p_examples(k), v_examples(k)*1e3, dBV_examples(k));
end
fprintf('\n');

%% Plot 1: Pressure to dB SPL
figure('Name','Pressure and dB SPL');
semilogx(p, dBSPL, 'LineWidth', 1.8); hold on;
plot(p_key, dBSPL_key, 'ro', 'MarkerFaceColor', 'r');
grid on;
xlabel('Sound pressure (Pa)');
ylabel('Level (dB SPL)');
title('Sound Pressure to dB SPL');
text(p_key, dBSPL_key, '  1 Pa = 94 dB SPL');

%% Plot 2: Pressure to microphone output voltage
figure('Name','Pressure and Microphone Output');
loglog(p, v_out*1e3, 'LineWidth', 1.8); hold on;
plot(p_key, v_key*1e3, 'ro', 'MarkerFaceColor', 'r');
grid on;
xlabel('Sound pressure (Pa)');
ylabel('Microphone output (mV)');
title('Microphone Output Voltage Versus Sound Pressure');
text(p_key, v_key*1e3, '  1 Pa -> 1.85 mV');

%% Plot 3: dB SPL to dBV
figure('Name','dB SPL and dBV');
plot(dBSPL, dBV_out, 'LineWidth', 1.8); hold on;
plot(dBSPL_key, dBV_key, 'ro', 'MarkerFaceColor', 'r');
grid on;
xlabel('Input level (dB SPL)');
ylabel('Output level (dBV)');
title('From Acoustic Input to Electrical Output');
text(dBSPL_key, dBV_key, '  94 dB SPL -> -54.7 dBV');

%% Plot 4: Example bar chart for revision
figure('Name','Example SPL Values and Output Voltage');
bar(spl_examples, v_examples*1e3);
grid on;
xlabel('Input level (dB SPL)');
ylabel('Microphone output (mV)');
title('Example Output Voltage for Different Sound Pressure Levels');

%% Teaching summary
fprintf('Teaching summary:\n');
fprintf('1) dB SPL describes acoustic input relative to 20 uPa.\n');
fprintf('2) dBV describes electrical output relative to 1 V.\n');
fprintf('3) 1 Pa corresponds to about 94 dB SPL.\n');
fprintf('4) With 1.85 mV/Pa sensitivity, 1 Pa produces 1.85 mV output.\n');
fprintf('5) 1.85 mV corresponds to about -54.7 dBV.\n');
fprintf('6) The microphone therefore maps acoustic pressure to output voltage.\n');
