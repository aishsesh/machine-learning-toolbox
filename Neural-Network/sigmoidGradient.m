function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon

g = 1.0 ./ (1.0 + exp(-z));
end




function g = sigmoidGradient(z)
%SIGMOIDGRADIENT returns the gradient of the sigmoid function
%evaluated at z

g = zeros(size(z));

g = sigmoid(z).* (1 - sigmoid(z));

end

