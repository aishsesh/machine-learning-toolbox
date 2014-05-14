function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   returns the cost and gradient for the
%   collaborative filtering problem.
%   Y = num of movies * num of users - contains ratings
%   R = num of movies * num of users - contains 1 if user rated movie, 0 otherwise


% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));


diff = (X* transpose(Theta) - Y).* R;
temp = diff.^ 2;
J = sum(temp(:))/2;
RegCost = (sum(Theta(:).^2) + sum(X(:).^2))* lambda / 2;
J = J + RegCost;


X_grad = (diff * Theta) + (lambda * X);
Theta_grad = ((transpose(diff)) * X) + (lambda * Theta);


grad = [X_grad(:); Theta_grad(:)];

end
