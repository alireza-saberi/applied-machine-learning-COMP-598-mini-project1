function X = featureScaling(X)
%  Freature scaling function is written to scale features into proper
%  range and scale and as a result with with have a better countors in J
%  It is  a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

% All vectors has  n*1 dimention or column vectors
% X: is input vector

X = (X - mean(X)) / (max(X) - min(X));

end