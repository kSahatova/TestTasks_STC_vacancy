function [A] = polynomial(x, m)
% x - N-by-1 vector of x values of points
% m - polynomial degree

n = length(x);       % length of vector x
A = ones(length(x), m+1); 

% Design of matrix A to store the values of x for polynomial coefficients
for i = 1:n
   a = ones(1, m+1); 
   for j= m:-1:1
      a(m+1-j) = x(i).^j;
   end
   A(i, :) = a;   
end