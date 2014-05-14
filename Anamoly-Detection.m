function [mu sigma2] = estimateGaussian(X)
%ESTIMATEGAUSSIAN This function estimates the parameters of a 
%Gaussian distribution using the data in X
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% 

[m, n] = size(X);

mu = zeros(n, 1);
sigma2 = zeros(n, 1);

mu = transpose(sum(X)/m);
for i = 1:m,
	sigma2 += (transpose(X(i,:)) - mu).^2;
end;
sigma2 = sigma2/m;
	
end

function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
  predictions = (pval< epsilon);
	tp = sum((yval == predictions) & (yval ==1));
	fp = sum((yval != predictions) & (yval ==0));
	fn = sum((yval != predictions) & (yval ==1));
	prec = tp/ (tp + fp);
	rec = tp/ (tp + fn);
	F1 = 2* prec* rec / (prec+ rec);


    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
