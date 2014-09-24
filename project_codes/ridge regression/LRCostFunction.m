function J = LRCostFunction(X, y, theta, lambda)
% calculate the cost function for ridge regression
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

m = length(y); % number of training examples

J = (X*theta - y)'* (X*theta - y) / m / 2 + lambda*(theta'*theta - theta(1)*theta(1))/2/m;

end