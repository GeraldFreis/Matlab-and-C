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
        
        % function to find the first number of the image by deconstructing it into two digits
        function number_1 = findingfirstnum(~, submatrix_1, submatrix_2)
            % initialising the sub matrices that will be iterated over
            matrix_1 = submatrix_1;
            matrix_2 = submatrix_2;

            digit_1 = 0; % the first digit of first num of the image
            % iterating over each findingnumbers function to determine what number is in this fifth of the image
            fprintf("\nFinding the first digit of the first number:\n\n");
            if(findingones(matrix_1)==1)
                digit_1 = 10;
            elseif(findingtwos(matrix_1)==1)
                digit_1 = 20;
            elseif(findingthrees(matrix_1)==1)
                digit_1 = 30;
            elseif(findingfours(matrix_1)==1)
                digit_1 = 40;
            elseif(findingfives(matrix_1)==1)
                digit_1 = 50;
            elseif(findingsixes(matrix_1)==1)
                digit_1 = 60;
            elseif(findingsevens(matrix_1)==1)
                digit_1 = 70;
            elseif(findingeights(matrix_1, 2)==1)
                digit_1 = 80;
            elseif(findingnines(matrix_1, 2)==1)
                digit_1 = 90;
            else
                fprintf("Invalid character for first digit of the first number\n");
            end
        
            % finding the second digit of the first number of the image
            fprintf("\nFinding the second digit of the first number:\n\n")
            digit_2 = 0; % variable to hold the second digit 
            
            % iterating over each findingnumbers function to determine what number is in this fifth of the image
            if(findingones(matrix_2)==1)
                digit_2 = 1;
            elseif(findingtwos(matrix_2)==1)
                digit_2 = 2;
            elseif(findingthrees(matrix_2)==1)
                digit_2 = 3;
            elseif(findingfours(matrix_2)==1)
                digit_2 = 4;
            elseif(findingfives(matrix_2)==1)
                digit_2 = 5;
            elseif(findingsixes(matrix_2)==1)
                digit_2 = 6;
            elseif(findingsevens(matrix_2)==1)
                digit_2 = 7;
            elseif(findingeights(matrix_2, 2)==1)
                digit_2 = 8;
            elseif(findingnines(matrix_2, 2)==1)
                digit_2 = 9;
            else
                fprintf("Invalid character for second number\n");
            end

            number_1 = digit_1+digit_2; % returning the composite of the two digits found in the image
        end

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

        function number_2 = findingsecondnum(~, submatrix1, submatrix2)

            % initialising the sub matrices that will be iterated over
            matrix_1 = submatrix1; % first digit
            matrix_2 = submatrix2; % second digit

            digit_1 = 0; % the first digit of second num of the image
            % iterating over each findingnumbers function to determine what number is in this fifth of the image
            fprintf("\nFinding the first digit of the second number:\n\n")
            if(findingones(matrix_1)==1)
                digit_1 = 10;
            elseif(findingtwos(matrix_1)==1)
                digit_1 = 20;
            elseif(findingthrees(matrix_1)==1)
                digit_1 = 30;
            elseif(findingfours(matrix_1)==1)
                digit_1 = 40;
            elseif(findingfives(matrix_1)==1)
                digit_1 = 50;
            elseif(findingsixes(matrix_1)==1)
                digit_1 = 60;
            elseif(findingsevens(matrix_1)==1)
                digit_1 = 70;
            elseif(findingeights(matrix_1, 2)==1)
                digit_1 = 80;
            elseif(findingnines(matrix_1, 2)==1)
                digit_1 = 90;
            else
                fprintf("\nInvalid character for first digit of the second number\n");
            end
        
            % finding the second digit of the second number of the image
            fprintf("\nFinding the second digit of the second number:\n\n")
            digit_2 = 0; % variable to hold the second digit 
            
            % iterating over each findingnumbers function to determine what number is in this fifth of the image
            if(findingones(matrix_2)==1)
                digit_2 = 1;
            elseif(findingtwos(matrix_2)==1)
                digit_2 = 2;
            elseif(findingthrees(matrix_2)==1)
                digit_2 = 3;
            elseif(findingfours(matrix_2)==1)
                digit_2 = 4;
            elseif(findingfives(matrix_2)==1)
                digit_2 = 5;
            elseif(findingsixes(matrix_2)==1)
                digit_2 = 6;
            elseif(findingsevens(matrix_2)==1)
                digit_2 = 7;
            elseif(findingeights(matrix_2, 2)==1)
                digit_2 = 8;
            elseif(findingnines(matrix_2, 2)==1)
                digit_2 = 9;
            else
                fprintf("\nInvalid character for second digit of the second number");
            end

            number_2 = digit_1+digit_2; % returning the composite of the two digits found in the image
        end
    end
end