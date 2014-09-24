function [theta, J_record] = GradientDescent(X, y, num_iters, lambda)
% gradient descent for ridge regression
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

m = length(y);  % number of training examples
J_record = zeros(num_iters+1, 1);
c = size(X,2);
theta = zeros(c, 1);

for iter = 1:num_iters
    %Robinson-Moore method for choosing alpha value
    alpha = 1 / (iter + 250);  %optimal method
    theta1 = theta;
    theta1(1) = 0;
    %calculate gradient value
    grad = ((X*theta - y)'*X + lambda*theta1')' / m;
    theta_previous = theta;
    theta = theta - alpha * grad;
    J_record(iter+1) = LRCostFunction(X, y, theta, lambda);
    %if theta increment little, quit the for loop
    if sum((theta - theta_previous).^2) < 2e-07
        break; 
    end
end

end