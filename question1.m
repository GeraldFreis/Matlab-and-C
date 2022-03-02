clc
% inputs to receive height, depth and length variables
height = input("Please input the box's height (in cm): ");
depth = input("Please enter the box's depth (in cm): ");
length = input("Please enter the box's length (in cm): ");

% calculations to determine volume: 
volume = height * depth * length;

% output: 
fprintf("The volume of the carboard box is: %0.3f cm^3 \n", volume);