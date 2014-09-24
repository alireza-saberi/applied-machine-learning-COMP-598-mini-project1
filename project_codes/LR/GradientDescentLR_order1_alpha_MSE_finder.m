% This program: 
% 1- calculate proper alpha and proper iteration number
% 2- Plot cross validation for erors of 2-fold cross validation
% 3- Calculate MSE 
% On 1-oder Gradient Discent

clc
clear all
close all
tic
% Reading data from our file
[pickup_month,pickup_weekday,pickup_hour,passenger_count,avgfare_premonth,cd,temp,fare_amount] = DataReader();

% One hot encoding of a categorical feature, you simply reserve one bit for each class
OneHot_pickup_weekday  = Weekday2OneHot( pickup_weekday );% 
OneHot_cd  = CD2OneHot( cd );
OneHot_moth = pickup_month2OneHot(pickup_month);
pickup_hour = featureScaling(pickup_hour);

% Feature scaling is applied is that gradient descent converges much faster with feature scaling than without it.
passenger_count = featureScaling(passenger_count);
avgfare_premonth = featureScaling(avgfare_premonth);
temp = featureScaling(temp);
features = [OneHot_moth,OneHot_pickup_weekday,pickup_hour,passenger_count,avgfare_premonth,OneHot_cd,temp];
toc

% We agreed with Dr. Pineau to put 50% of dataset as training dataset and 50% of it as testing dataset
[r,c] = size(features);
new_r = floor(r/2);
Xall = features(1:new_r,:);
Yall = fare_amount(1:new_r,:);

%alpha = [0.3 0.1 0.03 0.01 0.003 0.001 0.0003 0.0001];
%for al=1:length(alpha)

MSE_avg =[];
for k = 2:2 % moving from 2 fold to 5 folds : Agreement with Joelle only on K=2
    disp(fprintf('%d-fold cross validation',k));
    tic
    MSE_val_sum = 0;
    MSE_train_sum = 0;
    for kk = 1:k
         disp(fprintf('%d-fold cross validation, Round no. %d',k,kk));
         [Xtrain, Ytrain, Xval, Yval] = create_nth_kfold_crossvalidation(Xall, Yall, k, kk);
         [r2,c2] = size(Xtrain);
         theta_ideal = normalEqualtion(Xtrain,Ytrain);
         J_ideal = costMVLR(theta_ideal,Xtrain, Ytrain)
         
         %theta = zeros(c2+1,1);
         %theta = randn(c2+1,1);
         theta = theta_ideal + 0.5*randn(c2+1,1);
                  
         J1 = [0];
         iteration = 1;
         e = 10;
         while(e > 10^(-4))
            alpha = 0.1/(iteration+1);
            %alpha = 10^(-2);
            theta = oneStepGradientDescentMVLR(alpha,theta,Xtrain,Ytrain);
            NewJ = costMVLR(theta,Xtrain, Ytrain);
            e = abs(J1(length(J1)) - NewJ );   % stop condition
            J1 = [J1 NewJ];
            iteration = iteration + 1;
         end
         iteration
         alpha
         plot((J1(1,2:length(J1))));
         xlabel('# of iteration');
         ylabel('J(theta) or cost');
         title(sprintf('%d-fold cross validation with learing',k));
         hold on
          h_val = MultipleVariableLR(theta, Xval);
          h_train = MultipleVariableLR(theta, Xtrain);
          MSE_val = sqrt(sum((h_val - Yval).^2)/length(Yval));
          MSE_train = sqrt(sum((h_train - Ytrain).^2)/length(Ytrain));
          MSE_val_sum = MSE_val_sum + MSE_val;
          MSE_train_sum = MSE_train_sum + MSE_train;

    end
    temp = [ MSE_train_sum/k MSE_val_sum/k];
    MSE_avg = [MSE_avg; temp];
    toc
end
save 'GradientDescentLR_order1_MSE.mat' MSE_avg;
% end