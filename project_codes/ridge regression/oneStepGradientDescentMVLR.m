function NewTetta = oneStepGradientDescentMVLR(alpha,tetta,x ,y)
% Gradient Descent function is the repeating function that calculate values
% for teta.
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

% teta is the vector of parameters
% x : input variable, feature
% y : output variable, target
% NewTetta : updated parameters

h = MultipleVariableLR(tetta, x);
m = lengh(y);
temp = tetta - (alpha)*(1 / m) * sum((h - y).*x);
NewTetta = temp;
end