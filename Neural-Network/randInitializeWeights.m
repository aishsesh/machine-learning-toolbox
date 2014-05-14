function W = randInitializeWeights(L_in, L_out)
%L_in = number of units in input layer
%L_out = number of units in output layer 

W = zeros(L_out, 1 + L_in);

% randomly choosing a small value
epsilon_init = 0.12;

% randomly initializes values between -epsilon and +epsilon
W = rand(L_out, 1+L_in)*2*epsilon_init - epsilon_init;



end
