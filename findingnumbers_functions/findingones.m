%% checking if the number is 1
function  one = findingones(matrix)
    [rows, columns] = size(matrix); % finding the rows and columns of the provided matrix so that we can iterate over every pixel
    
    % iterating over every pixel and checking if the pixel is black and if the pixel 2 columns inwards is black, and if so we can apply our logic
    % to see if the number is a one
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0 && matrix(row, column+2)==0)
                % logic for finding 1:
                % 1 in this script will be proportional by some constant K
                % we can take the top value of the 1, i.e the first 0
                % and then move to the bottom. We can move left and then measure the distance we moved
                % left we can then proportionally move right. We can then travel to the top
                % and move at a 45 degree angle left

                % initialising the variables
                test = false; % controls the loop
                final_row = 0;
                decrement_counter = 0; % variable to contain the increment factor to increment over pixels by changing the x and y (column and row), 
                % which will emulate a vector as the terminal point of the vector is changing with every change of the xcrement_var.

                while ~test
                    if(matrix(row+decrement_counter, column)~=0) % if the current pixel is no longer black
                        final_row = row + decrement_counter-1; % finding the row ended up on
                        if(final_row - row < 50) % checking that the distance is greater than 50, as otherwise it is likely not a one but a subset of another number
                            fprintf("Not a one\n");
                            one = 0;
                            return;
                        end
                        test = true; % ending the test
                    else % if the current pixel is still black continuing to move downwards until it is not
                        decrement_counter = decrement_counter + 1;
                    end
                end
                
                % moving left and right
                test = false;
                decrement_counter = 0;
                
                while ~test
                    if(matrix(final_row, column-decrement_counter)~=0) % iterating left
                        if(matrix(final_row, column+decrement_counter)==0) % if the pixel to the left is no longer black, iterating that same distance to the right
                            test = true; % if this test passes, and the pixel at column+decrement_counter to the right is also black we can move to the top of the shape
                        else % if the pixel to the right is not black we have not passed this test
                            fprintf("No ones\n");
                            one = 0;
                            test = true;
                            return;
                        end
%                         test = true;
                    else
                        decrement_counter = decrement_counter + 1;
                    end
                
                end

                % going back to the top and moving down the 45 degree diagonal
                if(matrix(row+8, column-8)==0) % if the pixel 8 pixels down and left is black we have a one
                    one = 1;
                    fprintf("A one was found\n");
                    return;
                else % we do not have a one
                    one = 0;                    
                    fprintf("Not a one\n");
                    return;
                end

                
            end
        end
        one = 0;
    end
