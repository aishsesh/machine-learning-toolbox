function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% number of example in training set
m = size(X, 1);
         
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

%adding bias unit
X = [ones(m,1) X]; 

Z2 = X*transpose(Theta1);

A2 = sigmoid(Z2);

A2 = [ones(m,1) A2];

Z3 = A2 * transpose(Theta2);

H = sigmoid(Z3); %output from our neural network

logH = log(H);
logOneMinusH = log(1-H);

sumJ = 0;

for(i = 1:m)
	newY = zeros(1,num_labels);
	newY(y(i)) = 1;
	temp = (1 - newY).* logOneMinusH(i,:);
	temp += newY .* logH(i,:);
	sumJ -= sum(temp);
end;

J = sumJ/m;

T1 = (Theta1(:, 2:input_layer_size+1)).^ 2;
T2 = (Theta2(:, 2:hidden_layer_size+1)).^ 2;

% adding regularization
J += (lambda * (sum (T1(:)) + sum(T2(:)) ) /(2*m)); 


%---------------Gradient------------------



for(k = 1:m)
	
	a1 = X(k,:);
	z2 = a1 * transpose(Theta1);
	a2 = [1 sigmoid(z2)];
	z3 = a2 * transpose(Theta2);
	a3 = sigmoid(z3);
	x = 1: num_labels;
	yVec = (x == y(k));
	del3 = a3 - yVec;
	del2 = (del3 * Theta2) .* sigmoidGradient([1 z2]);
	del2 = del2(2:end);
	Theta1_grad += transpose(del2) * a1;
	Theta2_grad += transpose(del3) * a2;
end;

Theta1_grad = Theta1_grad / m;
Theta2_grad = Theta2_grad / m;

RegT1 = [zeros(hidden_layer_size,1) Theta1(:, 2:end)];
RegT2 = [zeros(num_labels,1) Theta2(:, 2:end)];

Theta1_grad += RegT1 * lambda / m;
Theta2_grad += RegT2 * lambda / m;




% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
