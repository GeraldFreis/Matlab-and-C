%% checking if the number is 1
function  one = findingones(matrix)
    [rows, columns] = size(matrix); % finding the rows and columns in the matrix provided

    % iterating over every pixel in the matrix and checking if that pixel is equal to zero (black) and if
    % so we apply our logic to test if it is a one


    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0 && matrix(row, column+2)==0)
%                 fprintf("%d, %d", row, column)
                % logic for finding 1:
                % 1 in this script will be proportional by some constant K
                % we can take the top value of the 1, i.e the first 0
                % and then move to the bottom. We can move left and then measure the distance we moved
                % left we can then proportionally move right. We can then travel to the top
                % and move at a 45 degree angle left

                % initialising the variables
                test = false; % sentinal variable to control the loop
                final_row = 0; % pre-initialising the variable that will contain the row where the code can iterate no further down-wards
                increment_factor = 0; % this is the variable that will be increased in every loop of the while loop and will emulate a vector by changing the current
                % row and or column or both for each iteration

                % iterating to the bottom of the shape
                while ~test
                    if(matrix(row+increment_factor, column)~=0) % if the pixel is no longer black we have reached the bottom of the shape
                        final_row = row + increment_factor-1;
                        if(final_row - row < 50) % ensuring that the bottom of the shape is greater than 50 pixels away, as other shapes can be misrecognised if this buffer isn't here
                            fprintf("Not a one\n");
                            one = 0;
                            return;
                        end
                        test = true; % ending the loop
                    else % if the pixel is still black, continuing to increase the increment factor
                        increment_factor = increment_factor + 1;
                    end
                end
                
                % moving left and right
                increment_factor = 0; % resetting the increment factor
                while test
                    if(matrix(final_row, column-increment_factor)~=0)
                        if(matrix(final_row, column+increment_factor-4)==0)  % iterating the same distance right as we did left and if this passes we have passed the test for the
                            % bottom of the one
                            % there is an offset here because the left side and the right side of the two
                            % are not always the same distance, specifically for two digit operations
                            test = false;
                        else
                            fprintf("No ones\n");
                            one = 0;
                            return;
                        end
                    else
                        increment_factor = increment_factor + 1;
                    end
                
                end

                % going back to the top and moving down the 45 degree diagonal
                if(matrix(row+8, column-8)==0) % if the pixel 8 rows down and 8 columns left is still black, we have found a one.
                    one = 1;
                    fprintf("A one was found\n");
                    return;
                else % if the pixel is not black, it is not a one.
                    one = 0;
                    fprintf("Not a one\n");
                    return;
                end

                
            end
        end
        one = 0;
    end