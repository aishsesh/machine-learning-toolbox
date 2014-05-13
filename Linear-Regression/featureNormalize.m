function [X_norm, mu, sigma] = featureNormalize(X)

%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard 
%   deviation is 1. 


X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));


dim = columns(X);
for i = 1:dim,
	% computing mean for ith column
	mu(1, i) = mean(X(:,i));
	% computing standard deviation for ith column
	sigma(1, i) = std(X(:,i));
	%normalizing
	X_norm(:,i) = (X(:,i) - mu(1,i))/ sigma(1,i);
end;



end
