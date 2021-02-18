function [chord] = karplus_strong(f0 , fs, duration)

% f0 - set of frequencies
% fs - sample rate
% duration - duration of signal in seconds

% Generation of matrix of delays for different notes
delay = zeros(1, length(f0));    
for i=1:length(f0)
     delay(i) = round(fs/f0(i));   
end


alpha = 0.9785;     % damping factor
number_of_samples = fs*duration;    % the total number of samples in the 
                                    % output signal
                                    
% Define vector y with size [number_of_samples,length(delay)]
y = zeros(number_of_samples, length(delay));    

for j=1:length(delay)
    x = randn(round(delay(j)),1);   % white noise generation
    y(1:length(x), j) = x;
    
    % Cycle for y values calculation with Karplus-Strong algorithm
    for i=length(x)+1:length(y)
        y(i, j) = alpha*(y((i-length(x)+1), j)+ y((i-length(x)), j))/2; 
    end
end

% Define the output vector chord with size [number_of_samples , 1]
chord = zeros(number_of_samples , 1);
for j=1:size(y,2)
   chord = chord + y(:, j);  % sum of y columns
end
