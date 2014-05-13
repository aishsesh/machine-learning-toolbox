function J = computeCost(X, y, theta)

%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

m = length(y); % number of training examples
J = 0;
H = X*theta;
sqDev = (H-y).^2;
J = sum(sqDev)/(2*m)

end




function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)

%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha
%   J_history contains the values of the cost function

m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
dev = (X*theta) - y;
len = length(theta);
for j = 1:len,
	prod = dev .* X(:, j);
	theta(j) = theta(j) - (sum(prod)* alpha / m);
end;
	J_history(iter) = computeCostMulti(X, y, theta);

end

end
