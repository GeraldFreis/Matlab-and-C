%% class that will handle finding the numbers / calling other classes which will find the numbers
classdef FindingOperations

    properties
        image_location 
        matrix_of_pixels 
        number_of_digits 
    end

    methods
        function obj = FindingOperations(image_filename, num_of_digits) % constructors
            addpath("testing_images/"); % enabling image files to be accessed
            
            if (nargin == 0) % if no args are provided / default constructor
                % initialising variables
                obj.image_location = 'testing_images/88_times_88.png';
                obj.matrix_of_pixels = zeros(544, 900);

            elseif(nargin > 0) % if arguments are provided / parameterized constructor
                obj.matrix_of_pixels= pixeltomatrix(image_filename); % constructing the matrix of pixels
                obj.image_location = image_filename;
                obj.number_of_digits = num_of_digits;
            end
        end

        % updating the number_1, operator and number_2  of this object via choosing which
        % FindingOperations to utilise based upon whether there are two digits or one digit.

        function [number_1, operator, number_2] = getoperations(~, matrix_of_pixels, number_of_digits)
            % if the number of digits is 1, we use the FindingOperationsOneDigit class to find the
            % operations
            % if the number of digits is 2 we use the FindingOperationsTwoDigit class to find the
            % operations
            if(number_of_digits == 1)
                % initialising the object of the FindingOperationsOneDigit class
                operations_object = FindingOperationsOneDigit(matrix_of_pixels); 

                % finding the arithmetic operation
                number_1 = operations_object.findingfirstnum(operations_object.sub_matrix_1);
                operator = operations_object.findingoperator(operations_object.sub_matrix_2);
                number_2 = operations_object.findingsecondnum(operations_object.sub_matrix_3);
                return;
                
            elseif(number_of_digits == 2)
                 % initialising the object of the FindingOperationsTwoDigit class
                operations_object = FindingOperationsTwoDigit(matrix_of_pixels); 
        
                % finding the arithmetic operation
                number_1 = operations_object.findingfirstnum(operations_object.sub_matrix_1, operations_object.sub_matrix_2);
                operator = operations_object.findingoperator(operations_object.sub_matrix_3);
                number_2 = operations_object.findingsecondnum(operations_object.sub_matrix_4, operations_object.sub_matrix_5);
                return;
            end
        end
    end
end