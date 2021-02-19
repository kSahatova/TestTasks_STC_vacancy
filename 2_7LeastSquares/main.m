%% Data generation
clear 
clc

dx = 0.1;                      % sample step 
N = 7;                         % right border of interval
x = 0:dx:N-0.1;                % x values of points               
x = x';
fprintf('Size of x array : [%d %d]\n', size(x)); 
                              % print size of x array to cmd line                                
noise = 3*randn(size(x));     % normally distrebited noise
y = x.^2 +6 + noise;          % generation of test data with noise
figure(1)
scatter(x, y);                % scattering of derived data
xlabel('x');
ylabel('y');
legend('Experimental data')

%% Approximation with the fifth order polynomial

A = polynomial(x, 5);       % function call with x as a input vector and
                            % n=5 as an order of the polynomial
betta = least_squares(A, y); % function call to derive function parameters
 
figure(1)
hold on
plot(x, A*betta)

