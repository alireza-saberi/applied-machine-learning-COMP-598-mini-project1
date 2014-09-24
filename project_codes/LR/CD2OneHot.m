function [ output_args ] = CD2OneHot( input_args )
% CD2OneHot function: Convert district one hot coding 
% It is written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

[r,c] = size(input_args);
output_args = zeros(r,12);

for i = 1:r
    num = input_args(i);
    switch num
%         case 105
%             output_args(i,num) = 1;
        case 101
            output_args(i,1) = 1;
        case 102
            output_args(i,2) = 1;
        case 103
            output_args(i,3) = 1;            
        case 104
            output_args(i,4) = 1;
        case 106
            output_args(i,5) = 1;
        case 107
            output_args(i,6) = 1;
        case 108
            output_args(i,7) = 1;
        case 109
            output_args(i,8) = 1; 
        case 110
            output_args(i,9) = 1;
        case 111
            output_args(i,10) = 1; 
        case 112
            output_args(i,11) = 1;
        case 164
            output_args(i,12) = 1;    
    end    

end    
end