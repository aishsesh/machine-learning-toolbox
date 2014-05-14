I implemented multi -level classification using logistic regression. 
lrCostFunction computes the cost function and gradient  for logistic regression. 
oneVsAll uses the built-in Octave function fminunc and the lrCostFunction to get the optimal values for Theta. It trains multiple classifiers at the same time.
predictOneVsAll uses the trained oneVsAll classifier to predict the labels for each input. 
