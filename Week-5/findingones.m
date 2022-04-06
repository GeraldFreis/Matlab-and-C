%% checking if the number is 1
function  one = findingones(matrix)
    [rows, columns] = size(matrix);
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0 && matrix(row, column+2)==0) % checking to see if the pixel is black and if so implementing our logic
                % for finding ones
                
%                 fprintf("%d, %d", row, column)
                % logic for finding 1:
                % 1 in this script will be proportional by some constant K
                % we can take the top value of the 1, i.e the first 0 (or black pixel encountered)
                % and then move to the bottom. We can move left and then measure the distance we moved
                % left we can then proportionally move right. We can then travel to the top
                % and move at a 45 degree angle left and if every pixel we iterate across (matrix(current_row, current_column)==0) is black
                % we have the number 1

                % initialising the variables
                test = false;
                final_row = 0;
                decrement_counter = 0;

                while ~test
                    if(matrix(row+decrement_counter, column)~=0) % checking to see if the pixel we are iterating over is no longer black
                        % and if so finding the distance we have moved, and finding that row, so we can check if we move proportionally left and
                        % right on that row if our pixels are always black
                        % also checking if the distance is greater than 50, because if it isn't it is likely not a 1, as a 1 in 72 font calibri is longer
                        % than 50 pixels
                        
                        final_row = row + decrement_counter-1;
                        if(final_row - row < 50)
                            fprintf("Not a one\n");
                            one = 0;
                            return;
                        end
                        test = true;
%                         fprintf("%d, %d\n", row+decrement_counter, column)

                    else
                        decrement_counter = decrement_counter + 1;
                    end
                end
                
                % moving left and right
                test = false;
                decrement_counter = 0;
                while ~test
                    if(matrix(final_row, column-decrement_counter)~=0) % checking to see if the pixel is no longer black and if so finding the distance we
                        % moved from the centre of the shape, and moving that same distance right
                        if(matrix(final_row, column+decrement_counter)==0) % we now know that we can move proportionally left and right so we have to move
                                % to the top of the shape and down the 45 degree diagonal. Hence we will end the conditional loop
%                             fprintf("A one was found\n");
%                             one = 1;
                            test = true;
%                             return;
                        else
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
                if(matrix(row+10, column-10)==0)
                    one = 1;
                    fprintf("A one was found\n");
                    return;
                else
                    one = 0;
                    fprintf("Not a one\n");
                    return;
                end

            end
        end
    end
