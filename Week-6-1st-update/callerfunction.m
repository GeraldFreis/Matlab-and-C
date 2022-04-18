% problem:
    % the problem here is that I need to subdivide the image into thirds that are not proportional
    % first third must be from (row, column) 1:1->(row:0.5column-30)
    % second third must be from 1:0.5column-35--> row:0.5column+15
    % third must be from 1:0.5column+15-->row:columm

% solution:
% create three different matrices for each third / store each matrix in a different var
% use these different vars and conditionals to check if there's a number in the first third etc. by using the findingnumbers functions
% if there is this number in the third that is being checked it will be stored in the functions array

% this function will return an array of three values, which were derived from the conditionals
% the function will take the main matrix as a parameter and create three new matrices which are thirds of this original matrix
% the first third houses the first number, the second the arithmetic operator and the third the final number
% the findingnumber functions will be called and the first and last matrices will be passed into them as they will search for numbers
% the second matrix will be passed to the findingnumber functions that find operators .
% conditionals will be used to check if the value returned by each function is a 1 (indicating that the number / operator was found in the matrix)
% if so that number in the return array will be assigned the value of the test which passed.
% i.e if the image looks like 1+2, the return array will house the first number, the operator, and the final number:
% [1, plus, 2]. the main file will take the return array and look for the operator (second element) and evaluate this to determine what operation should
% be carried out.

function matrices = callerfunction(matrix)
    [rows, columns] =  size(matrix); % finding the rows and columns of the original pixel matrix
    addpath("findingnumbers_functions/");  % ensuring I can access the findingnumbers functions as they are in their own file

    num_columns_1 = round(0.5 * columns)-30; % finding the boundary for the first matrix of the first third of the image
    first_third = zeros(rows, num_columns_1); % initialising the matrix for the first third
    for row = 1:rows
        for column = 1:num_columns_1
            first_third(row, column) = matrix(row, column); % adding each pixel in the first third of the image to the matrix of the first third
        end
    end

    num_columns_2 = round(0.5 * columns)+15; % finding the boundary for the second matrix of the second third of the image
    second_third = zeros(rows, abs(num_columns_2-num_columns_1)); % initialising the matrix that holds the pixels in the second third of the image
    for row = 1:rows
        for column = num_columns_1:num_columns_2
            second_third(row, column-num_columns_1+1) = matrix(row, column); % adding each pixel in the second third of the image to the matrix
        end
    end
    
    num_columns_3 = columns; % setting the boundary for the final third as the total number of columns
    
    final_third = zeros(rows, abs(num_columns_3-num_columns_2)); % initialising the matrix that holds the pixels of the third third of the original image

    for row = 1:rows
        for column = num_columns_2: num_columns_3
            final_third(row, column-num_columns_2+1) = matrix(row, column); % adding each pixel in the final third of the image to this new matrix
        end
    end

    % now that we have our matrices we can check each value:
    % 1st third
    fprintf("\nFinding the first number:\n\n");
    first_third_num = 0; % initialising the variable that holds the the value of the first third of the image
    % testing all of the findingnumbers functions to see what  number is in the first third
    if(findingones(first_third)==1)
        first_third_num = 1;
    elseif(findingtwos(first_third)==1)
        first_third_num = 2;
    elseif(findingthrees(first_third)==1)
        first_third_num = 3;
    elseif(findingfours(first_third)==1)
        first_third_num = 4;
    elseif(findingfives(first_third)==1)
        first_third_num = 5;
    elseif(findingsixes(first_third)==1)
        first_third_num = 6;
    elseif(findingsevens(first_third)==1)
        first_third_num = 7;
    elseif(findingeights(first_third)==1)
        first_third_num = 8;
    elseif(findingnines(first_third)==1)
        first_third_num = 9;
    else % if none of the finding numbers functions could determine the number it is an invalid character
        fprintf("Invalid character for first number");
        
    end

    % 2nd third
    fprintf("\n*******\n\n")
    fprintf("Finding the operator:\n\n");
    operator = ""; % initialising the variable that holds the operator to return to the main file
    % testing the operator functions to determine what operator exists in the middle third
    if(findingplussymbol(second_third)==1)
        operator = "plus";
    elseif(findingminuses(second_third)==1)
        operator = "minus";
    elseif(findingmultiplication(second_third)==1)
        operator = "multiply";
    elseif(findingdivision(second_third)==1)
        operator = "divide";
    else % if none of the operators were validated / found we have an infalid character for the arithmetic operator
        operator = "invalid";
    end
    fprintf("\n*******\n\n")

    %final third
    fprintf("\nFinding the second number:\n\n");
    % testing each findingnumbers function to determine what number exists in the final third
    
    final_third_num = 0; % variable to store the number found in the final third
    if(findingones(final_third)==1)
        final_third_num = 1;
    elseif(findingtwos(final_third)==1)
        final_third_num = 2;
    elseif(findingthrees(final_third)==1)
        final_third_num = 3;
    elseif(findingfours(final_third)==1)
        final_third_num = 4;
    elseif(findingfives(final_third)==1)
        final_third_num = 5;
    elseif(findingsixes(final_third)==1)
        final_third_num = 6;
    elseif(findingsevens(final_third)==1)
        final_third_num = 7;
    elseif(findingeights(final_third)==1)
        final_third_num = 8;
    elseif(findingnines(final_third)==1)
        final_third_num = 9;
    else % if none of the numbers were recognised we do not have a valid character for the second number
        fprintf("Invalid character for second number");
    end
    matrices = [first_third_num, operator, final_third_num]; % setting the matrix to return the first number, operator and second number
    fprintf("\n******\n\n");
    return;
end
