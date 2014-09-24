function NewTheta = oneStepGradientDescentMVLR2(alpha,theta,x ,y)
% Gradient Descent function is the repeating function that calculate values
% for teta.
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

% theta is the vector of parameters
% x : input variable, feature
% y : output variable, target
% NewTetta : updated parameters

[r,c] = size(x);
x = [ones(r,1) x];

%temp = theta - (alpha) * (1 / m) * sum((h - y)' * x);
temp = theta - (alpha) * 2 * ((x' * x * theta) - x' * y) ;
NewTheta = temp;
end