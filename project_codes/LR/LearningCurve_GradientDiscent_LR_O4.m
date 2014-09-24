% in this file you can see the learning curve of closed form Gradient
% Descent

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
% I put the theta that I got from the last step
theta = [10.7629827583734;-0.0267609898106474;-0.472477226187664;-0.398790520598473;-0.214096483471589;0.290073180085207;0.265672211679012;0.237798000385392;-1.99356549762941;1.87189721024330;-0.741254523563519;2.26457865948078;-0.191547449873913;-0.0551837863136826;0.0296242829189128;-0.0739324187031710;-0.664665479854935;-0.844777808510566;1.41440896398106;1.86203208439879;1.43941775843945;4.87842888659950;-0.0927929334440284;0.418819793456063;3.99110591870611;-5.69344514167131;62.3348862091000;0.522441826296242;0.610088504588579;7.89157274359091;-143.530738529819;0.695477745123046;-3.43655470068367;-3.52236099742969;77.8187243668470;-0.327953106318129];
        J1 = [0];
        iteration = 1;
         e = 10;
         while(e > 10^(-4))
            alpha = 0.0000001;
            theta = oneStepGradientDescentMVLR(alpha,theta,Xall,Yall);
            NewJ = costMVLR(theta,Xall, Yall);
            e = abs(J1(length(J1)) - NewJ );   % stop condition
            iteration = iteration + 1;
         end   
h_train = MultipleVariableLR(theta, Xall);
h_test = MultipleVariableLR(theta, X_test_val);
MSE_val = sqrt(sum((h_test - Y_test_val).^2)/length(Y_test_val));
MSE_val2 = sqrt(sum((h_train - Yall).^2)/length(Yall));
MSE_test = [MSE_test MSE_val]; 
MSE_training = [MSE_training MSE_val2];
end  
x_var = [10:10:100];
plot(x_var, MSE_test, 'r');
hold on
plot(x_var, MSE_training, 'b')
xlabel('Training sample percentage')
ylabel('RMSE')
legend('test','training')
