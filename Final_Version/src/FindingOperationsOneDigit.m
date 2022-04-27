%% class to find one digit operanded arithmetic operations
classdef FindingOperationsOneDigit
    properties 
        original_pixel_matrix 
        sub_matrix_1
        sub_matrix_2 
        sub_matrix_3
    end

    methods
        % constructors
        function object = FindingOperationsOneDigit(pixel_matrix)
            
            addpath("src/findingnumbers/"); % adding the functions we will use to the path of this class
            addpath("src/findingoperators/"); % adding the functions we will use to find the operator to the path
            addpath("src/checkingnumbers/"); % adding the functions that collate every finding numbers function

            if(nargin > 0) % if parameters are provided (parameterized constructor)
                object.original_pixel_matrix = pixel_matrix;

                [~, totalcolumns] = size(object.original_pixel_matrix); % finding the columns of the pixel matrix

                % initialising the column boundaries of each sub matrix
                column_boundary_1 =  round(0.5 * totalcolumns)-20;
                column_boundary_2 = round(0.5 * totalcolumns)+16;
                column_boundary_3 = totalcolumns;

                % producing the three sub matrices
                object.sub_matrix_1 = submatrices_maker(object.original_pixel_matrix, 1, column_boundary_1); % first sub matrix
                object.sub_matrix_2 = submatrices_maker(object.original_pixel_matrix, column_boundary_1, column_boundary_2); % second sub matrix
                object.sub_matrix_3 = submatrices_maker(object.original_pixel_matrix, column_boundary_2, column_boundary_3); % final sub matrix
                
            elseif(nargin == 0) % default constructor
                object.original_pixel_matrix = zeros(544, 900); % default initialising each vector to be a zeros matrix of the typical dimensions
                object.sub_matrix_1 = zeros(544, 430);
                object.sub_matrix_2 = zeros(544, 37);
                object.sub_matrix_3 = zeros(544, 433);
            end
        end
        
        % finding the first number
        function number_1 = findingfirstnum(~ ,submatrix1) % taking an object of this class as a parameter

            fprintf("\nFinding the first number:\n\n");
            number_1 = checkingfirstnumber_digit1(submatrix1, 1);
        end
        
        % finding the operator
        function operator = findingoperator(~, submatrix2)
            matrix_to_iterate_over = submatrix2; % setting the sub_matrix_2 to an easier to pass value

            fprintf("Finding the operator:\n\n");
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
            fprintf("\n"); % adding a new line to the end of this operation
        end

        function number_2 = findingsecondnum(~, submatrix3)
            % finding the second number
           number_2 = checkingsecondnumber_digit1(submatrix3, 1);
        end
    end
end
