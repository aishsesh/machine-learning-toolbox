function [J, grad] = lrCostFunction(theta, X, y, lambda)

%LRCOSTFUNCTION Compute cost and gradient for logistic regression with regularization; X is input for the training data, y is the output

% Initializing values
m = length(y); % number of training examples
J = 0; % Cost function
grad = zeros(size(theta)); %gradient


len = length(theta);

H = sigmoid(X*theta);

OneTerm = -y.*log(H);
ZeroTerm = (1-y).*log(1-H);

ThetaSq = (theta(2:len,1)).^2;
RegTerm = (lambda/(2 * m))* sum(ThetaSq); 

J = ((sum(OneTerm -ZeroTerm))/m) + RegTerm;


%gradient

temp = theta;
temp(1) = 0; %first term (Theta0) is not regularized
XTranspose = transpose(X);
prod = XTranspose * (H-y); 
grad = (prod + (lambda * temp))/m;

grad = grad(:);

end
