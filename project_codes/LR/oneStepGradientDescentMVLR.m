function NewTheta = oneStepGradientDescentMVLR(alpha,theta,x ,y)
% Gradient Descent function is the repeating function that calculate values
% for thetas
% This formula came from Andred NG machine learning course on Coursera(no surprise!).
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

% theta is the vector of parameters
% x : input variable, feature
% y : output variable, target
% NewTetta : updated parameters

h = MultipleVariableLR(theta, x);
m = length(y);
temp = theta - (alpha) * (1 / m) * sum((h - y)' * x);
NewTheta = temp;
end