% This program: 
% 1- calculate a proper theta
% 2- Plot cross validation for erors of 2-fold cross validation
% 3- Calculate MSE 
% On 2-oder closed form

clc
clear all
close all
tic
[pickup_month,pickup_weekday,pickup_hour,passenger_count,avgfare_premonth,cd,temp,fare_amount] = DataReader();
OneHot_pickup_weekday  = Weekday2OneHot( pickup_weekday );
OneHot_cd  = CD2OneHot( cd );
OneHot_moth = pickup_month2OneHot(pickup_month);
features = [OneHot_moth,OneHot_pickup_weekday,pickup_hour,passenger_count,avgfare_premonth,OneHot_cd,temp];
features2 = [features pickup_hour.^2 passenger_count.^2 avgfare_premonth.^2 temp.^2];
toc

% We agreed with Dr. Pineau to put 50% of dataset as training dataset 
% and 50% of it as testing dataset
[r,c] = size(features2);
new_r = floor(r/2);
Xall = features2(1:new_r,:);
Yall = fare_amount(1:new_r,:);

MSE_avg =[];
for k = 2:5 % moving from 1 fold to 5 folds
    disp(fprintf('%d-fold cross validation',k));
    tic
    MSE_val_sum = 0;
    MSE_train_sum = 0;
    for kk = 1:k
         disp(fprintf('%d-fold cross validation, Round no. %d',k,kk));
         [Xtrain, Ytrain, Xval, Yval] = create_nth_kfold_crossvalidation(Xall, Yall, k, kk);
         theta = normalEqualtion(Xtrain,Ytrain);
         h_val = MultipleVariableLR(theta, Xval);
         h_train = MultipleVariableLR(theta, Xtrain);
         MSE_val = sqrt(sum((h_val - Yval).^2)/length(Yval))
         MSE_train = sqrt(sum((h_train - Ytrain).^2)/length(Ytrain))
         MSE_val_sum = MSE_val_sum + MSE_val;
         MSE_train_sum = MSE_train_sum + MSE_train;
    end
    temp = [ MSE_train_sum/k MSE_val_sum/k];
    MSE_avg = [MSE_avg; temp]
    toc
end
save 'ClosedformLR_order2_MSE.mat' MSE_avg;