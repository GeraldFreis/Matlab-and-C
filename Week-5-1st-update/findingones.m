%% checking if the number is 1
function  one = findingones(matrix)
    % finding the rows and columns of the image / matrix of pixels
    [rows, columns] = size(matrix);
    
    % iterating over every pixel in the image and checking, via a conditional, whether the pixel being iterated
    % over is black, and if so implementing our logic to test if it is a one.
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
                test = false;  % sentinal variable to control our while loop
                final_row = 0;  % initialising the end row that will be travelled to
                decrement_counter = 0; % initialising the decrement variable that will be increased for every iteration of the loop
                 % this variable will test if the xth value beneath the row is still black, and if so continuing to iterate down
                 % if not we are at the bottom of the one and then can move proceed with our logic.

                while ~test % iterating to the bottom of the shape
                    if(matrix(row+decrement_counter, column)~=0)
                        final_row = row + decrement_counter-1;                        
                        test = true;
%                         fprintf("%d, %d\n", row+decrement_counter, column)

                    else
                        decrement_counter = decrement_counter + 1;
                    end
                end
                
                % moving left and right
                test = false;
                decrement_counter = 0;
                while ~test % moving left and incrementing the movement counter
                    if(matrix(final_row, column-decrement_counter)~=0) % decreasing the columns so that we iterate leftwards and checking if the pixel is black
                        % if the pixel is not black we want to take the distance we moved left, and if we can move that distance right and 
                        % the pixel we land on when we move right is still black then we have passed this test.
                        
                        if(matrix(final_row, column+decrement_counter)==0) % moving the distance we moved left right and che
%                             fprintf("A one was found\n");
%                             one = 1;
                            test = true;
%                             return;
                        else % if the pixel is not black (as the gradient is not zero)
                            fprintf("No ones\n");
                            one = 0;
                            test = true;
                            return;
                        end
%                         test = true;
                    else
                        decrement_counter = decrement_counter + 1; % incrementing the movement as the pixel is still black
%                         fprintf("%d\n", decrement_counter);
                    end
                
                end

                % going back to the top and moving down the 45 degree diagonal
                if(matrix(row+10, column-10)==0) % if the pixel is still black after we move 10 pixels down and left we have a one
                    one = 1;
                    fprintf("A one was found\n");
                    return;
                else % if the pixel is not black we do not have a one
                    one = 0;
                    fprintf("Not a one\n");
                    return;
                end

            end
        end
    end
