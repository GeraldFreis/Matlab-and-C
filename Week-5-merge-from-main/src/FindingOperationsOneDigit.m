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
            addpath("src/findingoperators/");

            if(nargin > 0) % if parameters are provided (parameterized constructor)
                object.original_pixel_matrix = pixel_matrix;

                [~, totalcolumns] = size(object.original_pixel_matrix); % finding the columns of the pixel matrix

                % initialising the column boundaries of each sub matrix
                column_boundary_1 =  round(0.5 * totalcolumns)-20;
                column_boundary_2 = round(0.5 * totalcolumns)+17;
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
            matrix_to_iterate_over = submatrix1; % setting the sub_matrix_1 to an easier to pass variable

            fprintf("\nFinding the first number:\n\n");
            if(findingones(matrix_to_iterate_over)==1) % checking if a 1 is in the first third of the image
                number_1 = 1;
            elseif(findingtwos(matrix_to_iterate_over)==1) % checking if a 2 is in the  first third of the image
                number_1 = 2;
            elseif(findingthrees(matrix_to_iterate_over)==1) % checking if a 3 is in the  first third of the image
                number_1 = 3;
            elseif(findingfours(matrix_to_iterate_over)==1) % checking if a 4 is in the  first third of the image
                number_1 = 4;
            elseif(findingfives(matrix_to_iterate_over)==1)  % checking if a 5 is in the  first third of the image
                number_1 = 5;
            elseif(findingsixes(matrix_to_iterate_over)==1)  % checking if a 6 is in the  first third of the image
                number_1 = 6;
            elseif(findingsevens(matrix_to_iterate_over)==1)  % checking if a 7 is in the  first third of the image
                number_1 = 7;
            elseif(findingeights(matrix_to_iterate_over, 1)==1)  % checking if a 8 is in the  first third of the image
                number_1 = 8;
            elseif(findingnines(matrix_to_iterate_over, 1)==1)  % checking if a 9 is in the  first third of the image
                number_1 = 9;
            else % if none of the numbers return that they were found we have an invalid character
                fprintf("Invalid character for first number"); 
                number_1 = 0;
            end
            fprintf("\n"); % adding a new line to the end of this operation
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
            matrix_to_iterate_over = submatrix3;

            % finding the second number
           if(findingones(matrix_to_iterate_over)==1) % checking if a 1 is in the second third of the image
                number_2 = 1;
            elseif(findingtwos(matrix_to_iterate_over)==1) % checking if a 2 is in the second third of the image
                number_2 = 2;
            elseif(findingthrees(matrix_to_iterate_over)==1) % checking if a 3 is in the second third of the image
                number_2 = 3;
            elseif(findingfours(matrix_to_iterate_over)==1) % checking if a 4 is in the second third of the image
                number_2 = 4;
            elseif(findingfives(matrix_to_iterate_over)==1)  % checking if a 5 is in the second third of the image
                number_2 = 5;
            elseif(findingsixes(matrix_to_iterate_over)==1)  % checking if a 6 is in the second third of the image
                number_2 = 6;
            elseif(findingsevens(matrix_to_iterate_over)==1)  % checking if a 7 is in the second third of the image
                number_2 = 7;
            elseif(findingeights(matrix_to_iterate_over, 1)==1)  % checking if a 8 is in the second third of the image
                number_2 = 8;
            elseif(findingnines(matrix_to_iterate_over, 1)==1)  % checking if a 9 is in the  second third of the image
                number_2 = 9;
            else % if none of the numbers return that they were found we have an invalid character
                fprintf("Invalid character for second number"); 
                number_2 = 0;
           end
        end
    end
end
