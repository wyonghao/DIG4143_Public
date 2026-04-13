%% balanced_audio_demo.m
% Scientific demonstrations for teaching:
% 1) Common / reference vs earth and small ground-potential differences
% 2) Unbalanced vs balanced transmission under common-mode interference
% 3) Differential signalling and common-mode rejection
% 4) Ground-loop hum in unbalanced audio
% 5) Phantom power on balanced lines
% 6) Transformer turns ratio (voltage/current)
%
% Run the whole script section by section in MATLAB.
% Each section produces figures and short quantitative outputs.

clear; close all; clc;

fs = 48000;                 % sample rate
T  = 0.03;                  % duration for most time plots
t  = (0:1/fs:T-1/fs).';
f0 = 1000;                  % wanted audio tone
fm = 50;                    % mains frequency (UK)

fprintf('Balanced / Unbalanced / Phantom / Transformer Demonstration\n');
fprintf('Sample rate = %d Hz\n', fs);
fprintf('Audio tone f0 = %d Hz, Mains frequency fm = %d Hz\n\n', f0, fm);

%% 1) Signal, common reference, and a small ground difference
% The key idea: two devices may both be connected to "earth", but the
% earth/reference at their local chassis points may not be exactly equal.

Vsig = 0.2*sin(2*pi*f0*t);          % 200 mV audio signal
Vground_diff = 0.01*sin(2*pi*fm*t); % 10 mV, 50 Hz ground difference

figure('Name','1. Signal and small ground-potential difference');
plot(t*1000, Vsig, 'LineWidth', 1.2); hold on;
plot(t*1000, Vground_diff, 'LineWidth', 1.2);
grid on;
xlabel('Time (ms)'); ylabel('Voltage (V)');
legend('Wanted audio signal','Ground potential difference (50 Hz)');
title('A tiny ground difference can already be significant compared with low-level audio');

fprintf('Section 1:\n');
fprintf('Peak audio signal      = %.1f mV\n', 1000*max(abs(Vsig)));
fprintf('Peak ground difference = %.1f mV\n\n', 1000*max(abs(Vground_diff)));

%% 2) Unbalanced connection: interference directly corrupts the signal
% Unbalanced: one signal conductor + shield/common return.
% Any voltage developed on the common path is effectively added to the signal.

% Use the same common-mode interference as in the balanced example so that
% we can demonstrate its effect on an unbalanced connection as well.
noise_cm = 0.03*sin(2*pi*fm*t) + 0.01*sin(2*pi*150*t); % common-mode interference

% For the unbalanced case, the common-mode noise appears on the shield/common
% and is therefore added to the single-ended signal.
unbalanced_received = Vsig + noise_cm;

figure('Name','2. Unbalanced connection');
plot(t*1000, Vsig, 'LineWidth', 1.2); hold on;
plot(t*1000, unbalanced_received, 'LineWidth', 1.2);
grid on;
xlabel('Time (ms)'); ylabel('Voltage (V)');
legend('Original signal','Received unbalanced signal (with CM noise)');
title('Unbalanced line: common-mode noise on the return adds directly to the signal');

snr_unbalanced = 20*log10(rms(Vsig)/rms(noise_cm));
fprintf('Section 2:\n');
fprintf('Unbalanced SNR (signal vs injected common-mode noise) = %.2f dB\n\n', snr_unbalanced);

%% 3) Balanced connection: two opposite signals, same interference on both
% Send +signal on hot, -signal on cold.
% Common-mode interference (same noise_cm) appears approximately equally on both conductors.
% Differential receiver computes Vout = Vhot - Vcold.

Vhot  = +0.5*Vsig + noise_cm;   % balanced conductor 1
Vcold = -0.5*Vsig + noise_cm;   % balanced conductor 2
Vdiff_out = Vhot - Vcold;       % ideal differential receiver

figure('Name','3. Balanced differential signalling');
subplot(3,1,1);
plot(t*1000, Vhot, 'LineWidth', 1.1); hold on;
plot(t*1000, Vcold, 'LineWidth', 1.1);
grid on; ylabel('V');
legend('Hot conductor','Cold conductor');
title('Balanced line conductors: equal/opposite signal + same common-mode noise');

subplot(3,1,2);
plot(t*1000, noise_cm, 'LineWidth', 1.1);
grid on; ylabel('V');
title('Common-mode interference');

subplot(3,1,3);
plot(t*1000, Vsig, '--', 'LineWidth', 1.1); hold on;
plot(t*1000, Vdiff_out, 'LineWidth', 1.1);
grid on; xlabel('Time (ms)'); ylabel('V');
legend('Original signal','Differential receiver output');
title('After subtraction, the wanted signal is recovered while common-mode noise is rejected');

% Since we sent +/-0.5*Vsig, subtraction gives back Vsig.
err_balanced = Vdiff_out - Vsig;
snr_balanced = 20*log10(rms(Vsig)/rms(err_balanced + eps));

fprintf('Section 3:\n');
fprintf('Balanced output recovery error RMS = %.6f V\n', rms(err_balanced));
fprintf('Balanced effective SNR             = %.2f dB (ideal model)\n\n', snr_balanced);

%% 4) Why 180 degree phase opposition does NOT cancel the wanted signal
% A common student confusion: "+sig and -sig cancel".
% They would cancel only if you ADDED them. Differential input SUBTRACTS.

sum_case  = (+0.5*Vsig) + (-0.5*Vsig);
sub_case  = (+0.5*Vsig) - (-0.5*Vsig);

figure('Name','4. Add versus subtract');
subplot(2,1,1);
plot(t*1000, sum_case, 'LineWidth', 1.2); grid on;
ylabel('V'); title('If you add the two conductors, the opposite signals cancel');
subplot(2,1,2);
plot(t*1000, sub_case, 'LineWidth', 1.2); grid on;
xlabel('Time (ms)'); ylabel('V');
title('If you subtract them, the wanted signal is recovered');

fprintf('Section 4:\n');
fprintf('RMS(addition result)    = %.6f V\n', rms(sum_case));
fprintf('RMS(subtraction result) = %.6f V\n\n', rms(sub_case));

%% 5) Ground loop intuition: loop hum added into an unbalanced system
% Here we model a low-level audio source and a small 50 Hz loop current creating
% an unwanted voltage on the shield/common return.

Vaudio_small = 0.02*sin(2*pi*800*t);      % 20 mV signal, e.g. sensitive source
Vloop_hum    = 0.008*sin(2*pi*50*t);      % 8 mV hum from loop-related voltage
Vrx_loop     = Vaudio_small + Vloop_hum;

figure('Name','5. Ground-loop hum in a low-level unbalanced signal');
plot(t*1000, Vaudio_small*1000, 'LineWidth', 1.2); hold on;
plot(t*1000, Vrx_loop*1000, 'LineWidth', 1.2);
grid on;
xlabel('Time (ms)'); ylabel('mV');
legend('Wanted low-level signal','Received with hum');
title('For low-level sources, even a few mV of hum are very audible');

fprintf('Section 5:\n');
fprintf('Low-level signal peak = %.1f mV\n', 1000*max(abs(Vaudio_small)));
fprintf('Hum peak              = %.1f mV\n\n', 1000*max(abs(Vloop_hum)));

%% 6) Phantom power on a balanced line (clarified plots and explanations)
% Phantom power applies +48 V DC equally to BOTH signal conductors through matched resistors.
% Differential audio sees no DC difference because the same DC appears on both lines.
% For clarity we plot both the absolute voltages (showing the 48 V offset) and the
% differential (which is the recovered audio around 0 V). We also show the audio
% alone (zero-mean) so it's easy to compare amplitude and waveform shape.
%
% Note about how phantom power is supplied to the microphone:
% - The +48 V is a DC bias applied equally to both signal conductors (pins 2 and 3)
%   with respect to the cable shield / ground (pin 1). The microphone's electronics
%   typically draw current from these DC supplies through its internal circuitry.
% - The audio itself is an AC (time-varying) voltage superimposed on top of that DC.
%   The differential receiver subtracts the two conductors, removing the DC and
%   recovering the AC audio. In the absolute-voltage plots you will see the DC offset;
%   in the differential plot you see the audio centered around 0 V.

Vphantom = 48;
audio_bal = 0.05*sin(2*pi*1000*t); % 50 mV audio (AC)
line2 = Vphantom + 0.5*audio_bal;  % pin 2 (hot)  -> DC + AC/2
line3 = Vphantom - 0.5*audio_bal;  % pin 3 (cold) -> DC - AC/2
Vaudio_recovered = line2 - line3;  % receiver sees difference = audio_bal
Vdc_diff = mean(line2 - line3);

figure('Name','6. Phantom power over balanced lines (clarified)');
subplot(3,1,1);
% Show absolute voltages including the 48 V DC so the offset is obvious.
plot(t(1:800)*1000, line2(1:800), 'LineWidth', 1.1); hold on;
plot(t(1:800)*1000, line3(1:800), 'LineWidth', 1.1);
yline(Vphantom,'k--','48 V DC','LabelHorizontalAlignment','left');
grid on; ylabel('V');
legend('Pin 2 (V_{phantom}+audio/2)','Pin 3 (V_{phantom}-audio/2)','Location','best');
title('+48 V DC applied equally to both signal conductors (absolute voltages shown)');

subplot(3,1,2);
% Show the audio AC component alone (zero-mean) so you can see its amplitude and shape.
plot(t(1:800)*1000, audio_bal(1:800), 'LineWidth', 1.1);
grid on; ylabel('V');
title('Audio AC component alone (zero mean, 50 mV peak)');

subplot(3,1,3);
% Show the recovered differential audio (what the receiver actually sees), centered at 0 V.
plot(t(1:800)*1000, Vaudio_recovered(1:800), 'LineWidth', 1.1);
grid on; xlabel('Time (ms)'); ylabel('V');
title('Differential receiver output (DC removed, audio recovered)');

fprintf('Section 6:\n');
fprintf('Mean differential DC at receiver = %.6f V (approximately zero)\n', Vdc_diff);
fprintf('Recovered audio RMS              = %.6f V\n\n', rms(Vaudio_recovered));

%% 7) Transformer turns ratio demonstration
% Ideal transformer equations:
% Vs/Vp = Ns/Np
% Ip/Is = Ns/Np
% This script shows the ratios numerically.

Vp = 10;         % primary voltage, RMS
Np = 100;        % primary turns
Ns = 500;        % secondary turns
load_power = 5;  % W, ideal power transfer example

turns_ratio = Ns/Np;
Vs = Vp*turns_ratio;
Is = load_power / Vs;
Ip = load_power / Vp;

fprintf('Section 7: Transformer ratios\n');
fprintf('Np = %d turns, Ns = %d turns\n', Np, Ns);
fprintf('Turns ratio Ns/Np = %.2f\n', turns_ratio);
fprintf('Primary voltage   = %.2f V RMS\n', Vp);
fprintf('Secondary voltage = %.2f V RMS\n', Vs);
fprintf('Primary current   = %.3f A\n', Ip);
fprintf('Secondary current = %.3f A\n\n', Is);

figure('Name','7. Transformer turns-ratio concept');
bar([Vp Vs; Ip Is]);
grid on;
set(gca,'XTickLabel',{'Voltage (V)','Current (A)'});
legend('Primary','Secondary');
title('Ideal transformer: voltage follows turns ratio, current scales inversely');

%% 8) Optional frequency-domain comparison: hum in unbalanced vs balanced
Nfft = length(t);
f = (0:Nfft-1)*(fs/Nfft);
idx = f <= 5000;

Xu = abs(fft(unbalanced_received));
Xb = abs(fft(Vdiff_out));
Xs = abs(fft(Vsig));

figure('Name','8. Frequency-domain view');
plot(f(idx), 20*log10(Xu(idx)+eps), 'LineWidth', 1.1); hold on;
plot(f(idx), 20*log10(Xb(idx)+eps), 'LineWidth', 1.1);
plot(f(idx), 20*log10(Xs(idx)+eps), '--', 'LineWidth', 1.1);
grid on;
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB, arbitrary)');
legend('Unbalanced received','Balanced differential output','Original signal');
title('The 50 Hz interference is prominent in the unbalanced case and suppressed in the balanced case');

%% 9) Short teaching summary printed in Command Window
fprintf('Teaching summary:\n');
fprintf('1) Common/reference is usually 0 V, but real ground paths are not ideal.\n');
fprintf('2) Unbalanced lines use the shield/common as return, so interference can add directly.\n');
fprintf('3) Balanced lines carry equal/opposite signals; the receiver subtracts them.\n');
fprintf('4) Common-mode interference is therefore rejected.\n');
fprintf('5) Phantom power works because +48 V is applied equally to both signal conductors.\n');
fprintf('6) An ideal 1:1 audio transformer preserves voltage but provides isolation/balancing.\n');
