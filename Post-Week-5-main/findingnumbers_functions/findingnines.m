function nines = findingnines(matrix)
    [rows, columns] = size(matrix);
    % logic for nines:
        % as with the number 8, we can multithread nine by taking two vectors at the same time, around
            % the initial circular aspect of the nine
            % we will do this by initially moving 5 rows and columns outwards from the centre of the top of
            % the 9, which we will adjust by having new variables for each vector
                % column_left will be the updated column from which the left vector must initialise itself
                    % every stage
                % column_right will be the updated column from which the right vector must initialise itself
                    % after every stage
                % new_row will be the row for both vectors, until the proportions need to differ (i.e we need
                    % to focus on applying either vector individually, at which point we will use new_row for the
                    % row element of the right vector, and new_row_left as the element for the left vector.
            % if every pixel that we iterated across in the previous vectors was black, we have passed
            % the first stage, and hence can move another 10 rows and columns outward with each vector
            % if this passes we can now move 12 rows down with either vector, as we are on the outside
                % of the curve of the nine on either side of the nine.

            % now we need to focus on the left vector, as our right vector is on the almost vertical
            % right side of the nine.
                % first we will move 6 down and right to take us inwards from the outside of the circular
                % curve of the 9, and if every pixel iterated over is black we just need to move 13
                % pixels to the right. This is because we are on the almost horizontal middle branch of
                % the 9. By moving 13 the terminal point for the left vector is on the vertical branch of
                % the 9.

            % now we can continue with the right vector
                % as we are along the vertical branch of the 9 we want to move downwards, down
                % and left, and the leftwards and this will bring us to the end of the 'tail' of the 9
                % We will do this by iterating 19 rows down with the right vector
                % if all of the pixels it iterates over are black, we will then move 11 columns down and
                % left
                % if all of these pixels are once more black, it moves 19 columns left. And if that pixel
                % is still black we have passed all of our tests for the number 9, and hence the number
                % we are iterating over is a nine.
                % we can then return nines = 1; as one nine was found and return to the calling function
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
%                 fprintf("%d, %d", row, column);
                column_left = column+2;
                column_right = column_left;
                new_row = row;
                test = false;
                stage = 1;
                xcrement_var = 0;
    
                while ~test
                    if(stage == 1)
                        if(matrix(new_row+xcrement_var, column_left-xcrement_var)==0 && matrix(new_row+xcrement_var, column_right+xcrement_var)==0 && xcrement_var < 5)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 5)
                            column_right = column_right+xcrement_var;
                            column_left = column_left - xcrement_var;
                            new_row = new_row + xcrement_var;
                            new_row_left = new_row - 4;
                            stage = stage + 1;
                            xcrement_var = 0;
                        else
                            fprintf("Not a nine\n");
%                             fprintf("%d, %d, %d", new_row+xcrement_var, column_left-xcrement_var, xcrement_var);
                            nines = 0;
                            return;
                        end
                        
                    elseif(stage==2)
                        if(matrix(new_row_left+xcrement_var, column_left - xcrement_var)==0 && matrix(new_row + xcrement_var, column_right+xcrement_var)==0 && xcrement_var < 10)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 10)
                            new_row_left = new_row_left + xcrement_var+2;
                            column_left = column_left - xcrement_var-2;
                            column_right = column_right + xcrement_var;
                            new_row = new_row + xcrement_var;
                            stage = stage + 1;
                            xcrement_var = 0;
                        else
                            fprintf("Not a nine\n");
%                             fprintf("%d, %d, %d", new_row+xcrement_var, column_left-xcrement_var, xcrement_var);
                            nines = 0;
                            return;
                        end
                    
                    elseif(stage==3)
                        if(matrix(new_row_left + xcrement_var, column_left)==0 && matrix(new_row+xcrement_var, column_right)==0 && xcrement_var < 12)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var ==12)
                            new_row_left = new_row_left + xcrement_var;
                            new_row = new_row + xcrement_var;
                            stage = stage + 1;
                            xcrement_var = 0;
                        else
                            fprintf("Not a nine\n");
                            fprintf("\n e \n")
%                             fprintf("%d, %d, and %d %d", new_row_left+xcrement_var, column_left, new_row+xcrement_var, column_right);
                            nines = 0;
                            return;
                        end
    
                    elseif(stage==4)  % focusing on the left vector
                            if(matrix(new_row_left+xcrement_var, column_left+xcrement_var)==0 && xcrement_var < 6)
                                xcrement_var = xcrement_var + 1;
                            elseif(xcrement_var == 6)
                                new_row_left = new_row_left + xcrement_var;
                                column_left = column_left + xcrement_var;
                                xcrement_var = 0;
                                stage = stage + 1;
                            else
                                fprintf("Not a nine\n");
%                                 fprintf("%d %d", new_row_left +  xcrement_var, column_left+xcrement_var);
                                nines = 0;
                                return;
                            end
            
                    elseif(stage==5)
                        if(matrix(new_row_left, column_left+xcrement_var)==0 && xcrement_var < 13)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 13)
                            column_left = column_left + xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else
                            fprintf("Not a nine\n");
                            nines = 0;
%                             fprintf("%d, %d", new_row_left, column_left + xcrement_var);
                            return;
                        end

                    % continuing with the right branch

                    elseif(stage==6)
%                         fprintf("%d, %d, %d\n", xcrement_var, new_row, column_right);
                        if(matrix(new_row+xcrement_var, column_right)==0 && xcrement_var < 19)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 19)
                            new_row = new_row+xcrement_var-1;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else
                            fprintf("Not a nine\n");
%                              fprintf("%d, %d, %d", xcrement_var, new_row+xcrement_var, column_right);
                            nines = 0;
                            return;
                        end
                    elseif(stage==7)
                        if(matrix(new_row+xcrement_var, column_right-xcrement_var)==0 && xcrement_var < 11)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 11)
                            new_row = new_row+xcrement_var;
                            column_right = column_right - xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                           
                        else
                            fprintf("Not a nine\n");
                            fprintf("%d, %d", new_row + xcrement_var, column_right-xcrement_var);
                            nines = 0;
                            return;
                        end
                    elseif(stage==8)
                        if(matrix(new_row, column_right-xcrement_var)==0 && xcrement_var < 19)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 19)
                            stage = stage + 1;                         
                        else
                            fprintf("Not a nine\n");
                            nines = 0;
                            return;
                        end
                    else
                        nines = 1;
                        fprintf("A nine was found\n");
                        return;    
                    end
                end
            end
        end
    end
    nines = 0;
end
