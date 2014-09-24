function [ output_args ] = pickup_month2OneHot( input_args )
% pickup_month2OneHot function: Convert months numbers to one hot coding
% It is written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

[r,c] = size(input_args);
output_args = zeros(r,1);

for i = 1:r
    num = input_args(i);
    switch num
        case 2
            output_args(i,1) = 0;
        case 3
            output_args(i,1) = 1;
    end    

end 

end

