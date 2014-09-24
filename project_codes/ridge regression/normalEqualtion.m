function theta = normalEqualtion(X,y,lambda)
% normalEqualtion caculates tetas for mutiple variable linear regression
% it's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

% theta : parameters of our linear hypothesis
% X : design matrix ===> [1 : traing example inputs]
% y : output variable, target

%theta = ((X' * X) \ X') * y;
n = size(X, 2);
imtrx = eye(n);
imtrx(1,1) = 0;
theta = pinv(X'*X + lambda*imtrx)*X'*y;
end