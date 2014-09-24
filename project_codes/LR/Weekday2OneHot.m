function [ output_args ] = Weekday2OneHot( input_args )
% Weekday2OneHot  function: Convert Weekday numbers to one hot coding
% It is written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

[r,c] = size(input_args);
output_args = zeros(r,6);

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

