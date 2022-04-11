% problem:
    % the problem here is that I need to subdivide the image into thirds that are not proportional
    % first third must be from (row, column) 1:1->(row:0.5column-30)
    % second third must be from 1:0.5column-35--> row:0.5column+15
    % third must be from 1:0.5column+15-->row:columm

% solution:
% create three different matrices for each third / store each matrix in a different var
% use these different vars and conditionals to check if there's a number in the first third etc.

% this function will return an array of three values, which were derived from the conditionals

function matrices = callerfunction_one_digit(matrix)
    [rows, columns] =  size(matrix);
    addpath("findingnumbers_functions/");  % ensuring I can access the findingnumbers functions as they are in
    % their own directory

    num_columns_1 = round(0.5 * columns)-20;
    first_third = zeros(rows, num_columns_1);
    for row = 1:rows
        for column = 1:num_columns_1
            first_third(row, column) = matrix(row, column);
        end
    end

    num_columns_2 = round(0.5 * columns)+17;
    second_third = zeros(rows, abs(num_columns_2-num_columns_1));
    for row = 1:rows
        for column = num_columns_1:num_columns_2
            second_third(row, column-num_columns_1+1) = matrix(row, column);
        end
    end
    num_columns_3 = columns;
    
    final_third = zeros(rows, abs(num_columns_3-num_columns_2));

    for row = 1:rows
        for column = num_columns_2: num_columns_3
            final_third(row, column-num_columns_2+1) = matrix(row, column);
        end
    end

    % now that we have our matrices we can check each value:
    % 1st third
    fprintf("\nFinding the first number:\n\n");
    first_third_num = 0;
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
    else
        fprintf("Invalid character for first number");
        
    end

    % 2nd third
    fprintf("\n*******\n\n")
    fprintf("Finding the operator:\n\n");
    if(findingplussymbol(second_third)==1)
        operator = "plus";
    elseif(findingminuses(second_third)==1)
        operator = "minus";
    elseif(findingmultiplication(second_third)==1)
        operator = "multiply";
    elseif(findingdivision(second_third)==1)
        operator = "divide";
    else
        operator = "invalid";
    end
    fprintf("\n*******\n\n")

    %final third
    fprintf("\nFinding the second number:\n\n");

    final_third_num = 0;
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
    else
        fprintf("Invalid character for second number");
    end
    matrices = [first_third_num, operator, final_third_num];
    fprintf("\n******\n\n")
    return;
end