% problem:
    % the problem here is that I need to subdivide the image into fifths that are not proportional as
    % there are now five numbers / characters to iterate over in the image
    % first fifth must be from 1:389
    % second fifth must be from 389:435
    % third must be from 435:474
    % fourth fifth must be from 474:515
    % final fifth must be from 515:total columns

% solution:
% create five different sub matrices for each fifth / store each matrix in a different var
% use these different vars and conditionals to check if there's a number in the first fifth etc.

% this function will return an array of three values, which were derived from the conditionals
% this array will be manipulated so that the first number in each pair of two fifths will be that number
% * 10, as the image will look like 57 * 12, so the first number is always in the tens.


function matrices = callerfunction_two_digit(matrix)
    [rows, columns] =  size(matrix);
    addpath("findingnumbers_functions/");  % ensuring I can access the findingnumbers functions as they are in
    % their own directory

    % initialising the bound for each number / character in the image
    column_bound_1 = 389; % representes the end column for the first number
    column_bound_2 = 435; % represents the end column for the second number
    column_bound_3 = 474; % represents the end column for the operator
    column_bound_4 = 518; % represents the end column for the 1st number in the second pair of digits
    column_bound_5 = columns; % the end column for the second number in the second pair of digits is the final column of the image

    % iterating over every pixel in each fifth and adding it to the matrix that represents each fifth
    first_fifth_pixels = zeros(rows, column_bound_1); % initialising the matrix to hold the pixels
    for row = 1:rows
        for column = 1:column_bound_1
            first_fifth_pixels(row, column) = matrix(row, column); 
        end
    end
    
    % iterating over every pixel in the second fifth and creating the new matrix to hold this
    second_fifth_pixels = zeros(rows, abs(column_bound_2-column_bound_1));  % initialising the matrix to hold the pixels
    for row = 1:rows
        for column = column_bound_1:column_bound_2
            second_fifth_pixels(row, column-column_bound_1+1) = matrix(row, column);
        end
    end
    
    % iterating over every pixel in the third fifth and created a new matrix to hold these
    third_fifth_pixels = zeros(rows, abs(column_bound_3-column_bound_2));  % initialising the matrix to hold the pixels
    for row = 1:rows
        for column = column_bound_2: column_bound_3
            third_fifth_pixels(row, column-column_bound_2+1) = matrix(row, column);
        end
    end
    
    % iterating over every pixel in the fourth fifth and creating a new matrix to hold these pixels
    fourth_fifth_pixels = zeros(rows, (column_bound_4-column_bound_3));  % initialising the matrix to hold the pixels
    for row = 1:rows
        for column = column_bound_3: column_bound_4
            fourth_fifth_pixels(row, column-column_bound_3+1) = matrix(row, column);
        end
    end
    
    % iterating over every pixel in the fourth fifth and creating a new matrix to hold these pixels
    final_fifth_pixels = zeros(rows, abs(column_bound_5-column_bound_4));  % initialising the matrix to hold the pixels
    for row = 1:rows
        for column = column_bound_4: column_bound_5
            final_fifth_pixels(row, column-column_bound_4+1) = matrix(row, column);
        end
    end

    % now that we have our matrices we can check each value:
    % 1st fifth
    fprintf("\nFinding the first number:\n\n");
    first_fifth_num = 0;
    if(findingones(first_fifth_pixels)==1) % if first number is a 1, returning the 1st digit as its tenths counterpart
        first_fifth_num = 10;
    elseif(findingtwos(first_fifth_pixels)==1) % if first number is a 2, returning the 1st digit as its tenths counterpart
        first_fifth_num = 20;
    elseif(findingthrees(first_fifth_pixels)==1) % if first number is a 3, returning the 1st digit as its tenths counterpart
        first_fifth_num = 30;
    elseif(findingfours(first_fifth_pixels)==1)% if first number is a 4, returning the 1st digit as its tenths counterpart
        first_fifth_num = 40;
    elseif(findingfives(first_fifth_pixels)==1)% if first number is a 5, returning the 1st digit as its tenths counterpart
        first_fifth_num = 50;
    elseif(findingsixes(first_fifth_pixels)==1)% if first number is a 6, returning the 1st digit as its tenths counterpart
        first_fifth_num = 60;
    elseif(findingsevens(first_fifth_pixels)==1) % if first number is a 7, returning the 1st digit as its tenths counterpart
        first_fifth_num = 70;
    elseif(findingeights(first_fifth_pixels)==1) % if first number is a 8, returning the 1st digit as its tenths counterpart
        first_fifth_num = 80;
    elseif(findingnines(first_fifth_pixels)==1) % if first number is a 9, returning the 1st digit as its tenths counterpart
        first_fifth_num = 90;
    else
        fprintf("Invalid character for first number\n");
        
    end

    % 2nd fifth
    fprintf("\nFinding the second number:\n\n")
    second_fifth_num = 0;
    if(findingones(second_fifth_pixels)==1) % if the number is a 1 returning it as the second digit
        second_fifth_num = 1;
    elseif(findingtwos(second_fifth_pixels)==1) % if the number is a 2 returning it as the second digit
        second_fifth_num = 2;
    elseif(findingthrees(second_fifth_pixels)==1) % if the number is a 3 returning it as the second digit
        second_fifth_num = 3;
    elseif(findingfours(second_fifth_pixels)==1) % if the number is a 4 returning it as the second digit
        second_fifth_num = 4;
    elseif(findingfives(second_fifth_pixels)==1) % if the number is a 5 returning it as the second digit
        second_fifth_num = 5;
    elseif(findingsixes(second_fifth_pixels)==1) % if the number is a 6 returning it as the second digit
        second_fifth_num = 6;
    elseif(findingsevens(second_fifth_pixels)==1) % if the number is a 7 returning it as the second digit
        second_fifth_num = 7;
    elseif(findingeights(second_fifth_pixels)==1) % if the number is a 8 returning it as the second digit
        second_fifth_num = 8;
    elseif(findingnines(second_fifth_pixels)==1) % if the number is a 9 returning it as the second digit
        second_fifth_num = 9;
    else
        fprintf("Invalid character for second number");
        
    end
    
    % finding the operator of the function
    fprintf("\n*******\n\n")
    fprintf("Finding the operator:\n\n");
    if(findingplussymbol(third_fifth_pixels)==1)
        operator = "plus";
    elseif(findingminuses(third_fifth_pixels)==1)
        operator = "minus";
    elseif(findingmultiplication(third_fifth_pixels)==1)
        operator = "multiply";
    elseif(findingdivision(third_fifth_pixels)==1)
        operator = "divide";
    else
        operator = "invalid";
    end
    fprintf("\n*******\n\n")

    %finding the fourth digit
    fprintf("\nFinding the third number:\n\n");

    fourth_fifth_num = 0;
    if(findingones(fourth_fifth_pixels)==1) % if the first digit is a 1 returning it as its tenths counterpart
        fourth_fifth_num = 10;
    elseif(findingtwos(fourth_fifth_pixels)==1) % if the first digit is a 2 returning it as its tenths counterpart
        fourth_fifth_num = 20;
    elseif(findingthrees(fourth_fifth_pixels)==1) % if the first digit is a 3 returning it as its tenths counterpart
        fourth_fifth_num = 30;
    elseif(findingfours(fourth_fifth_pixels)==1) % if the first digit is a 4 returning it as its tenths counterpart
        fourth_fifth_num = 40;
    elseif(findingfives(fourth_fifth_pixels)==1) % if the first digit is a 5 returning it as its tenths counterpart
        fourth_fifth_num = 50;
    elseif(findingsixes(fourth_fifth_pixels)==1) % if the first digit is a 6 returning it as its tenths counterpart
        fourth_fifth_num = 60;
    elseif(findingsevens(fourth_fifth_pixels)==1) % if the first digit is a 7 returning it as its tenths counterpart
        fourth_fifth_num = 70;
    elseif(findingeights(fourth_fifth_pixels)==1) % if the first digit is a 8 returning it as its tenths counterpart
        fourth_fifth_num = 80;
    elseif(findingnines(fourth_fifth_pixels)==1) % if the first digit is a 9 returning it as its tenths counterpart
        fourth_fifth_num = 90;
    else
        fprintf("Invalid character for first digit of the second number");
    end

    % finding the final digit
    fprintf("\nFinding the final digit:\n\n");
    final_fifth_num = 0;
    if(findingones(final_fifth_pixels)==1) % if the number is a 1 returning it as the second digit
        final_fifth_num = 1;
    elseif(findingtwos(final_fifth_pixels)==1) % if the number is a 2 returning it as the second digit
        final_fifth_num = 2;
    elseif(findingthrees(final_fifth_pixels)==1) % if the number is a 3 returning it as the second digit
        final_fifth_num = 3;
    elseif(findingfours(final_fifth_pixels)==1) % if the number is a 4 returning it as the second digit
        final_fifth_num = 4;
    elseif(findingfives(final_fifth_pixels)==1) % if the number is a 5 returning it as the second digit
        final_fifth_num = 5;
    elseif(findingsixes(final_fifth_pixels)==1) % if the number is a 6 returning it as the second digit
        final_fifth_num = 6;
    elseif(findingsevens(final_fifth_pixels)==1) % if the number is a 7 returning it as the second digit
        final_fifth_num = 7;
    elseif(findingeights(final_fifth_pixels)==1) % if the number is a 8 returning it as the second digit
        final_fifth_num = 8;
    elseif(findingnines(final_fifth_pixels)==1) % if the number is a 9 returning it as the second digit
        final_fifth_num = 9;
    else
        fprintf("Invalid character for second digit of the second number");
    end
    
    matrices = [first_fifth_num+second_fifth_num, operator, fourth_fifth_num + final_fifth_num]; % returning the components as an array
    fprintf("\n******\n\n")
    return;
end
