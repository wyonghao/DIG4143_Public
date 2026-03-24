Amp=0.5;
f=1200;
fs = 44100;
ts= 1/fs;
t = 0:1/fs:(1-ts);
sig = Amp*sin(2*pi*f*t);
sound(sig,fs);
plot(t,sig);
% audiowrite('sine1.wav',sig,fs);

