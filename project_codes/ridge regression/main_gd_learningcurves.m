% main funtion for drawing gradient descent learning curves
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

clear all;
clc;

tic
color = ['b','m'];  %color option for different curves
lg = zeros(1,4);  %graph handle
learning_intervals = 10;  %dividing the training set into 10 parts for accumulative learning
% idx is the idx-th dimension
for idx = 1:1
    fileName = sprintf('finalDataD%d.mat',idx);
    eval(['load ' fileName]);     %load fileName
    featureName = sprintf('features%dd',idx);
    eval(['features=' featureName ';']);
    eval(['clear ' featureName]);
    pic_err_curve = sprintf('gd_pic_err_%d',idx);  %file name
    pic_var_curve = sprintf('gd_pic_var_%d',idx);  %file name

    %diving the original whole data set into 2 parts: 1st half for 
    %training and validation, 2nd half for testing
    [r,c] = size(features);
    R2 = floor(r/2);
    X = [ones(R2,1) features(1:R2,:)]; 
    y = fare_amt(1:R2,:);
    Xtest = [ones(r-R2,1) features(R2+1:end,:)];
    Ytest = fare_amt(R2+1:end,:);  %
    iterations = 1000;  %maximal interation times
    % k-folds, k = 2, 3, 4, 5
    foldNums = 2;

    %use the training and validation set for k-fold cross validation
    costTable = train_lambda(X, y, foldNums, iterations);
    
    %get the optimal lambda value that lead to the minimal cost
    cst = sum(costTable(:,2:2:end),2)/foldNums;
    [a b] = min(cst);
    %use the optimal lambda value to get training and testing data
    [train_err, test_err, train_var, test_var] = learningCurveGD(X, y, Xtest, Ytest,iterations, b);
    
    %plotting the accumulative training and testing error from 10% to 100%
    figure,plot(train_err,color(1));
    hold on
    plot(test_err,color(2));
    xlabel('Training Sample Percentage'),ylabel('RMSE');
    title(sprintf('gradient descent Learning Curve For Ridge Regression (d = %d)',idx))
    set(gca,'XTick',1:1:learning_intervals)
    set(gca,'XTickLabel',{'10%','20%','30%','40%','50%','60%','70%','80%','90%','100%'}); 
    legend('training','testing');
    axis([1 learning_intervals 7 8]);
    hold off
    print(gcf,'-dpng',pic_err_curve);
    
    %plotting the accumulative training and testing variance from 10% to 100%
    figure,plot(train_var,color(1));
    hold on
    plot(test_var,color(2));
    xlabel('Training Sample Percentage'),ylabel('variance (¦Ò2)');
    title(sprintf('gradient descent variance (¦Ò2) of the predicted outputs (d = %d)',idx));
    set(gca,'XTick',1:1:learning_intervals)
    set(gca,'XTickLabel',{'10%','20%','30%','40%','50%','60%','70%','80%','90%','100%'}); 
    legend('training','testing');
    axis([1 learning_intervals 50 61]);
    hold off
    print(gcf,'-dpng',pic_var_curve);

end

toc