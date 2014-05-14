I implemented a neural network classifier to recognize handwritten digits. 

nnCost function computes the cost (forward propogation) and gradient (back propogation). it calls sigmoidgradient to compute the sigmoid gradient function. randInitializeWeights ensures that the weights have a random value and that the hidden units are not identical. predict contains the function to predict the digit after the neural network has been trained. For convenience a prediction of 0 corresponds to the digit 10
