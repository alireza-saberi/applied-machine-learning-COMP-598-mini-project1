function [ output_args ] = Weekday2OneHot( input_args )
% Transform weekday numerical value into a OneHot vector
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

[r,c] = size(input_args);
%create a 6-bit vector for every weekday value
output_args = zeros(r,6); 

%transformation pattern:
%0 --> 000000
%1 --> 100000
%2 --> 010000
%3 --> 001000
%4 --> 000100
%5 --> 000010
%6 --> 000001
for i = 1:r
    num = input_args(i);
    switch num
        case 1
            output_args(i,num) = 1;
        case 2
            output_args(i,num) = 1;
        case 3
            output_args(i,num) = 1;
        case 4
            output_args(i,num) = 1;            
        case 5
            output_args(i,num) = 1;
        case 6
            output_args(i,num) = 1;              
    end    

end    
end

