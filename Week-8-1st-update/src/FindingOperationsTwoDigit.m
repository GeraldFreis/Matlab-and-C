%% class to find the numbers and operator if the operands are two digits
classdef FindingOperationsTwoDigit
    properties 
        original_pixel_matrix 
        sub_matrix_1  % first digit of first num matrix
        sub_matrix_2 % second digit of first num matrix
        sub_matrix_3  % operator matrix
        sub_matrix_4  % first digit of second num matrix
        sub_matrix_5  % second digit of first num matrix
    end

    methods
        function object = FindingOperationsTwoDigit(original_matrix)
            % adding all of the functions we will call to path
            addpath("src/findingnumbers/"); % finding numbers functions
            addpath("src/findingoperators/"); % finding operators functions
            addpath("src/checkingnumbers/"); % checking the numbers functions (iterating over every finding numbers function)

            if(nargin > 0) % if arguments are passed to the parameterized constructor
                object.original_pixel_matrix = original_matrix;
                
                % creating the column boundaries
                [~, columns] = size(original_matrix); % finding the rows and columns of the original matrix

                column_bound_1 = 389; % representes the end column for the first number
                column_bound_2 = 435; % represents the end column for the second number
                column_bound_3 = 474; % represents the end column for the operator
                column_bound_4 = 518; % represents the end column for the 1st number in the second pair of digits
                column_bound_5 = columns; % the end column for the second number in the second pair of digits is the final column of the image

                % initialising the sub_matrices
                object.sub_matrix_1 = submatrices_maker(object.original_pixel_matrix, 1, column_bound_1);
                object.sub_matrix_2 = submatrices_maker(object.original_pixel_matrix, column_bound_1, column_bound_2);
                object.sub_matrix_3 = submatrices_maker(object.original_pixel_matrix, column_bound_2, column_bound_3);
                object.sub_matrix_4 = submatrices_maker(object.original_pixel_matrix, column_bound_3, column_bound_4);
                object.sub_matrix_5 = submatrices_maker(object.original_pixel_matrix, column_bound_4, column_bound_5);

            elseif(nargin == 0) % default constructor (if no arguments are passed when initialising the object)
                object.original_pixel_matrix = zeros(544, 900); % default initialising each vector to be a zeros matrix of the typical dimensions
                object.sub_matrix_1 = zeros(544, 389);
                object.sub_matrix_2 = zeros(544, 46);
                object.sub_matrix_3 = zeros(544, 39);
                object.sub_matrix_4 = zeros(544, 44);
                object.sub_matrix_5 = zeros(544, 382);
            end
        end
        
        %% function to find the first number of the image by deconstructing it into two digits
        function number_1 = findingfirstnum(~, submatrix_1, submatrix_2)
            % initialising the sub matrices that will be iterated over
            matrix_1 = submatrix_1;
            matrix_2 = submatrix_2;

            fprintf("\nFinding the first digit of the first number:\n\n");
            first_digit_multi = parfeval(@checkingfirstnumber_digit1, 1, matrix_1, 2); % taking the process to find the first digit and parallel pooling it
            
            % finding the second digit of the first number of the image
            fprintf("\nFinding the second digit of the first number:\n\n")
            digit_2 = checkingfirstnumber_digit2(matrix_2); % variable to hold the second digit 
            
            digit_1 = fetchOutputs(first_digit_multi); % retrieving the result of the first number finder
            number_1 = digit_1 + digit_2;
        end
        
        %% function to find and return the operator in the code
        function operator = findingoperator(~, submatrix)
            matrix_to_iterate_over = submatrix; % setting the sub_matrix_3 to an easier to pass value

            fprintf("\nFinding the operator:\n\n");
            if(findingplussymbol(matrix_to_iterate_over)==1)
                operator = "plus";
            elseif(findingminuses(matrix_to_iterate_over)==1)
                operator = "minus";
            elseif(findingmultiplication(matrix_to_iterate_over)==1)
                operator = "multiply";
            elseif(findingdivision(matrix_to_iterate_over)==1)
                operator = "divide";
            else
                operator = "invalid";
            end
        end
        
        %% function to find and return the second number in the code by deconstructing it into two digits in two matrices
        function number_2 = findingsecondnum(~, submatrix1, submatrix2)

            % initialising the sub matrices that will be iterated over
            matrix_1 = submatrix1; % first digit
            matrix_2 = submatrix2; % second digit

            fprintf("\nFinding the first digit of the second number:\n\n")
            digit_1_multi = parfeval(@checkingsecondnumber_digit1,1, matrix_1, 2);  % using multithreading to evaluate this answer while evaluating the second digit
        
            % finding the second digit of the second number of the image
            fprintf("\nFinding the second digit of the second number:\n\n")
            digit_2 = checkingsecondnumber_digit2(matrix_2); % variable to hold the second digit 
            
            digit_1 = fetchOutputs(digit_1_multi); % ensuring that we have the answer to digit_1 (via multithreading) before attempting to use the result
            number_2 = digit_1+digit_2; % returning the composite of the two digits found in the image
        end
    end
end