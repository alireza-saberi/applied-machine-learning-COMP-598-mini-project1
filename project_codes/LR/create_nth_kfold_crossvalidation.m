function [Xtrain, Ytrain, Xval, Yval] = create_nth_kfold_crossvalidation(Xall, Yall, k, kk)
% create_nth_kfold_crossvalidation: is used for picking up nth sub matrix
% in k-flod cross calidation
% It is written as a part of ML course 
% at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

% Xall : feature matrix of dataset
% Yall :  target vector of dataset
% k: kth validation fold number
% kk : selected fold number

% Xtrain : new traning feature set
% Xval : validation feature set
% Yval : validation target set


    num = ceil(length(Yall)/k);
    Xall_tmp = Xall;
    Yall_tmp = Yall;
    stt = (kk-1)*num;
    if kk == k
        Xval = Xall(stt+1:end,:);
        Yval = Yall(stt+1:end,:);
        Xtrain = Xall(1:stt,:);
        Ytrain = Yall(1:stt,:);
    else
        Xval = Xall(stt+1:stt+num,:);
        Yval = Yall(stt+1:stt+num,:);
        Xall_tmp(stt+1:stt+num,:) = [];
        Yall_tmp(stt+1:stt+num,:) = [];
        Xtrain = Xall_tmp;
        Ytrain = Yall_tmp;
    end
end