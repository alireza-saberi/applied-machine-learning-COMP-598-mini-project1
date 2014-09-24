% read original data from the .csv file, scaling continuous data and save
% data into .mat(more easily used in matlab environment)
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

clear all;
clc;

tic
% read original data into variables
[pickup_month,pickup_weekday,pickup_hour,passenger_count,avgfare_premonth,cd,temp,fare_amount] = DataReader();
% create a 6-bit vector for every weekday value
OneHot_pickup_weekday  = Weekday2OneHot( pickup_weekday );
%create a 12-bit vector for every CD value
OneHot_cd  = CD2OneHot( cd );
%create a 1-bit vector for pickup_month value
pickup_month = pickup_month - 2;

%scale the 1-d continuous data
hour = featureScaling1(pickup_hour);
psgr_cnt = featureScaling1(passenger_count);
avf_prem = featureScaling1(avgfare_premonth);
temptr = featureScaling1(temp);
%output data
fare_amt = fare_amount;
%scale the 2-d continuous data
hour2 = featureScaling1(pickup_hour.^2);
psgr_cnt2 = featureScaling1(passenger_count.^2);
avf_prem2 = featureScaling1(avgfare_premonth.^2);
temptr2 = featureScaling1(temp.^2);
%scale the 3-d continuous data
hour3 = featureScaling1(pickup_hour.^3);
psgr_cnt3 = featureScaling1(passenger_count.^3);
avf_prem3 = featureScaling1(avgfare_premonth.^3);
temptr3 = featureScaling1(temp.^3);
%scale the 4-d continuous data
hour4 = featureScaling1(pickup_hour.^4);
psgr_cnt4 = featureScaling1(passenger_count.^4);
avf_prem4 = featureScaling1(avgfare_premonth.^4);
temptr4 = featureScaling1(temp.^4);

%add all features into a vector
features1d = [pickup_month,OneHot_pickup_weekday,hour,psgr_cnt,avf_prem,OneHot_cd,temptr];
features2d = [pickup_month,OneHot_pickup_weekday,hour,psgr_cnt,avf_prem,OneHot_cd,temptr,...
    hour2,psgr_cnt2,avf_prem2,temptr2];
features3d = [pickup_month,OneHot_pickup_weekday,hour,psgr_cnt,avf_prem,OneHot_cd,temptr,...
    hour2,psgr_cnt2,avf_prem2,temptr2,hour3,psgr_cnt3,avf_prem3,temptr3];
features4d = [pickup_month,OneHot_pickup_weekday,hour,psgr_cnt,avf_prem,OneHot_cd,temptr,...
    hour2,psgr_cnt2,avf_prem2,temptr2,hour3,psgr_cnt3,avf_prem3,temptr3,...
    hour4,psgr_cnt4,avf_prem4,temptr4];
%save features and output into mat file
save('finalDataD1.mat', 'features1d', 'fare_amt');

save('finalDataD2.mat', 'features2d', 'fare_amt');

save('finalDataD3.mat', 'features3d', 'fare_amt');

save('finalDataD4.mat', 'features4d', 'fare_amt');
toc

