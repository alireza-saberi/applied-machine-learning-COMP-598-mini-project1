function J = costMVLR(theta,x, y)
% cost function or minimum square error or minimum square cost error is 
% written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

% theta is parameter vector of our linear hypothesis
% Y: is real output of the system
% J is the cost

h = MultipleVariableLR(theta, x);
m = length(h);
J = (1 / (2 * m)) * sum((h - y).^2);

end