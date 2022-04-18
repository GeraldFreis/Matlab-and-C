%% checking if the number is 1
function  one = findingones(matrix)
    [rows, columns] = size(matrix);
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
                test = false;
                final_row = 0;
                decrement_counter = 0;

                while ~test
                    if(matrix(row+decrement_counter, column)~=0)
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
                    if(matrix(final_row, column-decrement_counter)~=0)
                        if(matrix(final_row, column+decrement_counter)==0)
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
                if(matrix(row+8, column-8)==0)
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
        one = 0;
    end