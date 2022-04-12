clc
clear

% including the path of all functions and class into this main file
addpath("src");

% taking the image as a variable to pass to the FindingOperations class
image = 'testing_images/83_divided_by_97.png';
numberofdigits = input("How many digits are in the numbers of this image: ");

% initialising the FindingOperations class to call the FindingOperationsOneDigit
% or FindingOperationsTwoDigit classes to find the numbers in the image
findingoperations_obj = FindingOperations(image, numberofdigits);
[number_1, operator, number_2] = findingoperations_obj.getoperations(findingoperations_obj.matrix_of_pixels, numberofdigits); % finding the arithmetic operation from the image

solving_AO_operation(number_1, operator, number_2); % solving the operation and printing the result