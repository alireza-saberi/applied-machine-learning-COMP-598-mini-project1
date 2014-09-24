function [Xtrain, Ytrain, Xval, Yval] = create_nth_kfold_crossvalidation(Xall, Yall, k, kk)
% separate the data set into training set and validation set
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

    %k is number of folds
    %kk: set the kk part as validation set, and the rest as training set 
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