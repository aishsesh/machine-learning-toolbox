function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network


m = size(X, 1);
num_labels = size(Theta2, 1);

p = zeros(size(X, 1), 1);


X = [ones(m,1) X]; 

Z2 = X*transpose(Theta1);

A2 = sigmoid(Z2);

A2 = [ones(m,1) A2];

Z3 = A2 * transpose(Theta2);

H = sigmoid(Z3);

% returns the max element in each row and it's index
[val p] = max(H, [], 2);






end
