function  [pickup_month,pickup_weekday,pickup_hour,passenger_count,avgfare_premonth,cd,temp,fare_amount] = DataReader()
% Function ReadData reads data from CSV file and separate then into proper
% columns
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

A = xlsread('final_200kSample_plusTemp.csv'); %read data file
pickup_month = A(:,3); % feature1
pickup_weekday = A(:,4);% feature2
pickup_hour = A(:,5);% feature3
passenger_count = A(:,6) ;% feature4
avgfare_premonth = A(:,7);% feature5
cd = A(:,8);% feature6
temp = A(:,9);% feature7
fare_amount = A(:,11);% output result
end

