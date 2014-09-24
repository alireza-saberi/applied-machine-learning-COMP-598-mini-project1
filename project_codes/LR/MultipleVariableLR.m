function Y = MultipleVariableLR(theta, X)
%  Function MultipleVariableLR or multiple variables linear regression is written
%  as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

% All vectors has  n*1 dimention or column vectors
% theta: vector of parameters
% X: matrix of vector of input variables or features
% Y: vector of output variables or targets
% (X(i),Y(i)): is the i-th training example

[r,c] = size(X);
X = [ones(r,1) X];
Y = X * theta;

end