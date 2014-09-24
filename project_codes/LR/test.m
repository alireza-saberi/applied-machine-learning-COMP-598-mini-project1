x = randn(1,100)';
y = (x.^2);
plot(x,y, '*')
features = x;

%%
% We agreed with Dr. Pineau to put 50% of dataset as training dataset 
% and 50% of it as testing dataset
[r,c] = size(features);
new_r = floor(r/2);
Xall = features(1:new_r,:);
Yall = y(1:new_r,:);
%alpha = [0.3 0.1 0.03 0.01 0.003 0.001 0.0003 0.0001];
%for al=1:length(alpha)
    
MSE_avg =[];
for k = 2:5 % moving from 2 fold to 5 folds
    disp(fprintf('%d-fold cross validation',k));
    tic
    MSE_val_sum = 0;
    MSE_train_sum = 0;
    for kk = 1:k
         disp(fprintf('%d-fold cross validation, Round no. %d',k,kk));
         [Xtrain, Ytrain, Xval, Yval] = create_nth_kfold_crossvalidation(Xall, Yall, k, kk);
         [r2,c2] = size(Xtrain);
         %theta_ideal = normalEqualtion(Xtrain,Ytrain);
         %J_ideal = costMVLR(theta_ideal,Xtrain, Ytrain)
         
         theta = randn(c2+1,1);
         J1 = [];
         for i = 1:200
         theta = oneStepGradientDescentMVLR(1.0/(i+1),theta,Xtrain,Ytrain);
         J1 = [J1 costMVLR(theta,Xtrain, Ytrain)];
         end
         plot(J1);
         xlabel('# of iteration');
         ylabel('J(theta) or cost');
         title(sprintf('%d-fold cross validation with learing',k));
         hold on
%          
%          h_val = MultipleVariableLR(theta, Xval);
%          h_train = MultipleVariableLR(theta, Xtrain);
%          MSE_val = sqrt(sum((h_val - Yval).^2)/length(Yval));
%          MSE_train = sqrt(sum((h_train - Ytrain).^2)/length(Ytrain));
%          MSE_val_sum = MSE_val_sum + MSE_val;
%          MSE_train_sum = MSE_train_sum + MSE_train;
    end
    figure;
%     temp = [ MSE_train_sum/k MSE_val_sum/k];
%     MSE_avg = [MSE_avg; temp];
    toc
end
%end

