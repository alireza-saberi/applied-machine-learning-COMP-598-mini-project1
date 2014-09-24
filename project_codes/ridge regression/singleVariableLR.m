function Y = singleVariableLR(teta, Xj)
%  Function singleVariableLR or single variable linear regression is written
%  as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

% All vectors has  n*1 dimention or column vectors
% theta: vector of parameters
% Xi: vector of input variables or features
% Y: vector of output variables or targets
% (X(i),Y(i)): is the i-th training example

L = length(Xj);
X = [ones(L,1): Xj];
Y =  Xj * teta;
 
end