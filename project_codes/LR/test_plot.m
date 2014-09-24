clc
clear all
close all
tic
[pickup_month,pickup_weekday,pickup_hour,passenger_count,avgfare_premonth,cd,temp,fare_amount] = DataReader();
OneHot_pickup_weekday  = Weekday2OneHot( pickup_weekday );
OneHot_cd  = CD2OneHot( cd );
OneHot_moth = pickup_month2OneHot(pickup_month);

pickup_hour = featureScaling(pickup_hour);
passenger_count = featureScaling(passenger_count);
avgfare_premonth = featureScaling(avgfare_premonth);
temp = featureScaling(temp);


features = [OneHot_moth,OneHot_pickup_weekday,pickup_hour,passenger_count,avgfare_premonth,OneHot_cd,temp];


%plot(pickup_hour, fare_amount,'+')
%plot(passenger_count, fare_amount,'+')
%plot(avgfare_premonth, fare_amount,'+')
plot(smooth(fare_amount,11))
%plot3(passenger_count,avgfare_premonth,fare_amount)