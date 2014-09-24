% main function of closed form for ridge regression
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong
clear all;
clc;

tic
color = ['k','g','b','m']; %color option for different curves
lg = zeros(1,4);%graph handle
% idx is the idx-th dimension
for idx = 1:4
    fileName = sprintf('finalDataD%d.mat',idx);
    %load fileName
    eval(['load ' fileName]);
    featureName = sprintf('features%dd',idx);
    eval(['features=' featureName ';']);
    eval(['clear ' featureName]);
    pic_name = sprintf('pic_%d',idx-1); %file name

    %diving the original whole data set into 2 parts: 1st half for 
    %training and validation, 2nd half for testing
    [r,c] = size(features);
    R2 = floor(r/2);
    X = [ones(R2,1) features(1:R2,:)];
    y = fare_amt(1:R2,:);  %
    Xtest = [ones(r-R2,1) features(R2+1:end,:)];
    Ytest = fare_amt(R2+1:end,:);  %
    % k-folds, k = 2, 3, 4, 5
    foldNums = 2;

    %use cross-validation to get cost value for different lambda options
    costTable = Ridge_closed_form(X, y, foldNums);
    %get the optimal lambda value that lead to the minimal cost
    cst = sum(costTable(:,2:2:end),2)/foldNums;
    [a b] = min(cst);

    %plot cost value for different lambda options
    if idx == 1
       plot(b,a,'or','markersize',10);
       hold on
        lg(idx) = plot(cst,color(idx));
        xlabel('Lambda'),ylabel('RMSE');
        set(gca,'XTick',1:1:length(cst))
        set(gca,'XTickLabel',{'1e-5','1e-4','1e-3','0.01','0.1','1','10','100','1e3','1e4','1e5'}); 
        hold off
    else
        hold on
        plot(b,a,'or','markersize',10);
        lg(idx) = plot(cst,color(idx));
        hold off
    end
    
    % use optimal lambda to get training and testing error
    [train_val_err test_err trainVar testVar] = Ridge_closed_form_test(X, y, Xtest, Ytest, b);
    fprintf('for (d = %d):\n Valid error is %f, Train error is %f, test error is %f\n',idx, a, train_val_err, test_err);
    fprintf('train variance is %f, test variance is %f\n\n',trainVar, testVar);

end
legend([lg(1), lg(2), lg(3), lg(4)],'d = 1','d = 2','d = 3','d = 4');
print(gcf,'-dpng',pic_name)
toc
