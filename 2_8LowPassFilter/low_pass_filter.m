%% Signals generation

clear 
clc

fs = 10000;       % sampling frequency(Hz)
N = 1000;         % max value of the interval
t = (0:N-1)'/fs;  % time vector
f1 = [900 1400];        % vector of frequencies in function 1
f2 = [500 1000 1500];   % vector of frequencies in function 2

y1 = sin(2*pi*t*f1(1))+square(t*f1(2)); % output signal 1

y2 = cos(2*pi*f2.*t);     % output signal 2
a = [0.2; 0.8; 0.6];      % different magnitudes for each signal
y2 = y2*a;                % merger of three signal to one with various
                          % magnitudes
F = (0:N-1)'/N*fs;        % frequency-domain values 

spectrum_y1 = fft(y1);    % Fast Furier Transformation for output signal 1
spectrum_y2 = fft(y2);    % Fast Furier Transformation for output signal 2

% Graphs of the output signals and their spetrums
figure(1)

subplot(211)
plot(t, y1')

subplot(212)
plot(F, abs(spectrum_y1))

figure(2)

subplot(211)
plot(t, y2)

subplot(212)
plot(F, abs(spectrum_y2))

%% Butterworth Lowpass Filter Implementation

% Extraction of b and a vectors for further difference equation with
% 6th order lowpass Butterworth filter 
[b1, a1] = butter(6, f1(1)/(fs/2)); % cutoff frequency 900 Hz
[b2, a2] = butter(6, f2(2)/(fs/2)); % cutoff frequency 1000 Hz

% Magnitude and phase characteristics of recieved filters
w = logspace(-1, 1);  
figure(3)
freqs(b1, a1, w)

figure(4)
freqs(b2, a2, w)

%% Signals filtering

% filter function implementes a differnce equation to find the values 
% of the output filtered signal  
y3 = filter(b1, a1, y1);
y4 = filter(b2, a2, y2);

% Spectrum analysis of filtered signals
spectrum_y3 = fft(y3);
spectrum_y4 = fft(y4);

figure(5)

subplot(211)
plot(t, y3)

subplot(212)
plot(F, abs(spectrum_y3))

figure(6)

subplot(211)
plot(t, y4)

subplot(212)
plot(F, abs(spectrum_y4))

