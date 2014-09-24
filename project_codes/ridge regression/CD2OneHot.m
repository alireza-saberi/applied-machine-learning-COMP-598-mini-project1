function [ output_args ] = CD2OneHot( input_args )
% Transform CD numerical value into a OneHot vector
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

[r,c] = size(input_args);
%create a 12-bit vector for every CD value
output_args = zeros(r,12);

%transformation pattern:
%101 --> 100000000000
%102 --> 010000000000
%103 --> 001000000000
%104 --> 000100000000
%105 --> 000000000000
%106 --> 000010000000
%107 --> 000001000000
%108 --> 000000100000
%109 --> 000000010000
%110 --> 000000001000
%111 --> 000000000100
%112 --> 000000000010
%164 --> 000000000001
for i = 1:r
    num = input_args(i);
    switch num
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