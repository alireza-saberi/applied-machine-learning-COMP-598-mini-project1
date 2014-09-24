% in this file you can see the learning curve of closed form linear
% regression.

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
features3 = [features2 pickup_hour.^3 passenger_count.^3 avgfare_premonth.^3 temp.^3];
features4 = [features3 pickup_hour.^4 passenger_count.^4 avgfare_premonth.^4 temp.^4];
toc

% We agreed with Dr. Pineau to put 50% of dataset as training dataset 
% and 50% of it as testing dataset
[r,c] = size(features4);
new_r = floor(r/2);
Xall = features4(1:new_r,:);
Yall = fare_amount(1:new_r,:);
[r1,c1] = size(Xall);
stepsize = floor(r1/10);
steps = [stepsize:stepsize:r1];

X_test_val = features4(new_r+1:end,:);
Y_test_val = fare_amount(new_r+1:end,:);

MSE_test = [];
MSE_training = [];
for i = 1:10
Xall = features4(1:steps(i),:);
Yall = fare_amount(1:steps(i),:);
theta = normalEqualtion(Xall,Yall);
h_train = MultipleVariableLR(theta, Xall);
h_test = MultipleVariableLR(theta, X_test_val);
MSE_val = sqrt(sum((h_test - Y_test_val).^2)/length(Y_test_val));
MSE_val2 = sqrt(sum((h_train - Yall).^2)/length(Yall));
MSE_test = [MSE_test MSE_val]; 
MSE_training = [MSE_training MSE_val2];
end  
x_var = [10:10:100];
plot(x_var, MSE_test, 'r');
legen('test')
hold on
plot(x_var, MSE_training, 'b')
xlabel('Training sample percentage')
ylabel('RMSE')
legend('test','training')
