function [betta] = least_squares(A, y)

% x - N-by-1 vector of x values of points
% y - N-by-1 vector of responces

betta = pinv(A'*A)*A'*y;  % calculation of parameters due to the solution in 
                          % matrix form betta = (A'*A)^(-1)*A'*y 
    