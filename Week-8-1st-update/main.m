clc
clear

% including the path of all functions and class into this main file
addpath("src");

%% taking the image as a variable to pass to the FindingOperations class
image = 'testing_images/22_divided_by_33.png';
numberofdigits = input("How many digits are in the numbers of this image: ");

%% initialising the FindingOperations class to call the FindingOperationsOneDigit
% or FindingOperationsTwoDigit classes to find the numbers in the image
findingoperations_obj = FindingOperations(image, numberofdigits);
[number_1, operator, number_2] = findingoperations_obj.getoperations(findingoperations_obj.matrix_of_pixels, numberofdigits); % getting the operation

%% saving the information into the data file 'pastresultsfile' and then retrieving the past results and saving that
% into two vectors that will be our x and y axis for the plot of previous results

savingresult(solving_AO_operation(number_1, operator, number_2)); % solving the operation, printing the result and returning that to be saved
[xaxis, yaxis] = retrievingpastresults(); % retrieving past results and their indexs

plot(xaxis, yaxis);