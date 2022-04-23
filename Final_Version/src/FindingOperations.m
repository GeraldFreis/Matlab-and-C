%% class that will handle finding the numbers / calling other classes which will find the individual numbers
% based upon whether it is a two digit or one digit operation
classdef FindingOperations

    properties
        image_location 
        matrix_of_pixels 
        number_of_digits 
    end

    methods
        function obj = FindingOperations(image_filename, num_of_digits) %% constructors
            addpath("testing_images/"); % enabling image files to be accessed
            
            if (nargin == 0) % if no args are provided / default constructor
                % initialising variables

                obj.image_location = 'testing_images/88_times_88.png';
                obj.matrix_of_pixels = zeros(544, 900);

            elseif(nargin > 0) % if arguments are provided / parameterized constructor
                
                % creating / assigning the properties of the class
                obj.matrix_of_pixels= pixeltomatrix(image_filename); % constructing the matrix of pixels
                obj.image_location = image_filename;
                obj.number_of_digits = num_of_digits;

            end
        end

        %% updating the number_1, operator and number_2  of this object via choosing which
        % FindingOperations to utilise based upon whether there are two digits or one digit.

        function [number_1, operator, number_2] = getoperations(~, matrix_of_pixels, number_of_digits)

            % if the number of digits is 1, we use the FindingOperationsOneDigit class to find the
            % operations
            % if the number of digits is 2 we use the FindingOperationsTwoDigit class to find the
            % operations
            
            if(number_of_digits == 1)

                % initialising the object of the FindingOperationsOneDigit class
                operations_object = FindingOperationsOneDigit(matrix_of_pixels); 

                % finding the arithmetic operation asynchronously
                number_1_future = parfeval(@operations_object.findingfirstnum, 1, ...
                    operations_object.sub_matrix_1); % computing the 1st number asynchronously

                operator_future = parfeval(@operations_object.findingoperator, 1, ...
                    operations_object.sub_matrix_2); % computing operator asynchronously

                number_2_future = parfeval(@operations_object.findingsecondnum, 1,...
                    operations_object.sub_matrix_3); % computing the 2nd number asynchronously

                % retrieving the async objects
                number_1 = fetchOutputs(number_1_future);
                operator = fetchOutputs(operator_future);
                number_2 = fetchOutputs(number_2_future);
                
                return;
                
            elseif(number_of_digits == 2)

                 % initialising the object of the FindingOperationsTwoDigit class
                operations_object = FindingOperationsTwoDigit(matrix_of_pixels); 
        
                % finding the arithmetic operation and using async programming to compute all numbers and
                % operators

                number_1_future = parfeval(@operations_object.findingfirstnum, 1,...
                    operations_object.sub_matrix_1,...
                    operations_object.sub_matrix_2); % finding the 1st number asynchronously
        
                operator_future = parfeval(@operations_object.findingoperator, 1, ...
                    operations_object.sub_matrix_3); % finding the operator asynchronously

                number_2_future = parfeval(@operations_object.findingsecondnum, 1,...
                    operations_object.sub_matrix_4,...
                    operations_object.sub_matrix_5); % finding the second number asynchronously

                % retrieving the async objects
                number_1 = fetchOutputs(number_1_future);
                number_2 = fetchOutputs(number_2_future);
                operator = fetchOutputs(operator_future);

                return;
            end
        end
    end
end