function X = featureScaling1(X)
% scale continuous features
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

X = (X - mean(X))/(max(X) - min(X));

end