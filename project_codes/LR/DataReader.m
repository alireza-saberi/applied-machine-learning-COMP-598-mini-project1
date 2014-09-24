function  [pickup_month,pickup_weekday,pickup_hour,passenger_count,avgfare_premonth,cd,temp,fare_amount] = DataReader()
% Function ReadData reads data from CSV file and separate then into proper
% columns
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

A = xlsread('final_200kSample_plusTemp.csv');
pickup_month = A(:,3);
pickup_weekday = A(:,4);
pickup_hour = A(:,5);
passenger_count = A(:,6) ;
avgfare_premonth = A(:,7);
cd = A(:,8);
temp = A(:,9);
fare_amount = A(:,11);
end

