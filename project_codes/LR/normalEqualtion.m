function theta = normalEqualtion(X,y)
% normalEqualtion caculates or closed form function calculate thetas for
% mutiple variable linear regression
% it's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

% theta : parameters of our linear hypothesis
% X : design matrix ===> [1 : traing example inputs]
% y : output variable, target

[r,c] = size(X);
X = [ones(r,1) X];
theta = ((X' * X) \ X') * y;
end