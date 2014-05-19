function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example

% Set K
K = size(centroids, 1);

idx = zeros(size(X,1), 1);

for i = 1: size(X,1),
	centroid = 0;
	minValue = -1;
	for j = 1:K,
		value = sum((X(i,:) - centroids(j, :)).^ 2);
		%best choice of centroid so far
		if (minValue == -1 || value < minValue)
			minValue = value;
			centroid = j;
		endif;
	end;
	idx(i) = centroid;
end;	

