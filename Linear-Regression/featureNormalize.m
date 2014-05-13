function [X_norm, mu, sigma] = featureNormalize(X)

%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard 
%   deviation is 1. 


X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));


dim = columns(X);
% computing mean and standard deviation for each column and normalizing 
for i = 1:dim,
	
	mu(1, i) = mean(X(:,i));
	sigma(1, i) = std(X(:,i));
	X_norm(:,i) = (X(:,i) - mu(1,i))/ sigma(1,i);
end;



end
