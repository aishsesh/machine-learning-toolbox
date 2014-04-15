function p = predictOneVsAll(all_theta, X)

%PREDICTONEVSALL Predicts the label for a trained one-vs-all classifier. The labels are in the range 1..K, where K = size(all_theta, 1). 


m = size(X, 1);
num_labels = size(all_theta, 1);

p = zeros(size(X, 1), 1);

X = [ones(m, 1) X];

H = sigmoid(X*transpose(all_theta));

% retrieving the index of max element from each row and storing in p

[val, p] = max(H, [], 2); 



end
