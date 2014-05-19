

function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returs the new centroids by computing the means of the 
%data points assigned to each centroid.

[m n] = size(X);

centroids = zeros(K, n);


for i = 1:K,
	temp = X(idx == i, :);
	centroids(i, :) = sum(temp)/size(temp,1);
end;

end

