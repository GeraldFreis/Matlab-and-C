function eights = findingeights(matrix)
    [rows, columns] = size(matrix);
    % logic for eight:
    % we start at the top of the number:
        % We can iterate the same distance down and the opposite distance sidewards
        % for each vector, as in we have opposing vectors for each stage

    % for the first step we move 11 down and 22 left and 11 down and 22 right on the other side of the 8
    % for the second step we move 9 down for both sides
    % for the third step we move 18 down and 18 right or 18 down and 18 left depending on the side of the
    % 8
    % for the fourth step we move 19 down and 19 left or 19 down and 19 right
    % for the fifth step we move 17 down and 17 right or 17 left
    % for the final step we move 6 right or left, and if the columns for both sides are equal then its an
    % 8

    % we will use two different column variables for storing the changing columns
    % columnleft will be the left vector and columnright will be the right vector
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
                test = false;  % sentinel variable
                xcrement_var = 0;
                stage = 1;  % this is going to be the variable that contains the stage
                % of the loop, i.e what vector to initialise
                column_left = column+3;
                column_right = column_left;
                new_row = row + 2;

                while ~test
                    if(stage==1)  % we can not implement the finding numbers function here as our ratio of incrementation isn't 1:1
                        if(matrix(new_row + xcrement_var, column_left - (2 * xcrement_var))==0 && matrix(new_row+xcrement_var, column_right + (2 * xcrement_var))==0 && xcrement_var < 6)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 6)
                            column_left = column_left - (2 * xcrement_var);
                            column_right = column_right + (2 * xcrement_var);
                            new_row = new_row + xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else
                            fprintf("Not a eight\n");
                            eights = 0;
                            return;
                        end
                    
                    elseif(stage==2)
                        if(matrix(new_row + xcrement_var, column_left)==0 && matrix(new_row + xcrement_var, column_right)==0 && xcrement_var < 10)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 10)
                            new_row = new_row + xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
%                             fprintf("%d", new_row, column_left);
                        else
                            fprintf("Not a eight\n");
                            
                            eights = 0;
                            return;
                        end
                    elseif(stage == 3)
                        if(matrix(new_row+xcrement_var, column_left + xcrement_var)==0 && matrix(new_row + xcrement_var, column_right - xcrement_var)==0 && xcrement_var <  9)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==9)
                            new_row = new_row + xcrement_var+2;
                            column_left = column_left + xcrement_var;
                            column_right = column_right - xcrement_var-2;
                            xcrement_var = 0;
                            stage = stage + 1;
%                             fprintf("%d, %d, %d", new_row, column_right, column_left);
                        else
                            fprintf("Not a eight\n");
                            eights = 0;
                            return;
                        end
                    elseif(stage == 4)
                        if(matrix(new_row + xcrement_var, column_left - xcrement_var)==0 && matrix(new_row + xcrement_var, column_right + xcrement_var)==0 && xcrement_var < 16)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==16)
                            new_row = new_row + xcrement_var+1;
                            column_left=  column_left - xcrement_var;
                            column_right = column_right + xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else
                            fprintf("Not a eight\n");
%                             fprintf("%d, %d, %d", xcrement_var, column_left+xcrement_var, new_row+xcrement_var);
                            eights = 0;
                            return;
                        end
                    elseif(stage == 5)
                        if(matrix(new_row + xcrement_var, column_left + xcrement_var)==0 && matrix(new_row + xcrement_var, column_right - xcrement_var)==0 && xcrement_var < 11)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 11)
                            new_row = new_row + xcrement_var;
                            column_left = column_left + xcrement_var;
                            column_right = column_right - xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else
                            fprintf("Not a eight\n");
%                              fprintf("%d, %d, %d", xcrement_var, column_left+xcrement_var, new_row+xcrement_var);
                            eights = 0;
                            return;
                        end
                    elseif(stage==6)
                        if(matrix(new_row, column_left + xcrement_var)==0 && matrix(new_row, column_right - xcrement_var)==0 && xcrement_var < 7)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 7)
                            column_left = column_left + xcrement_var;
                            column_right = column_right - xcrement_var;                            
                            if(column_left == column_right)
                                eights = 1;
                                fprintf("An eight was found\n")
                                return;
                            end
                            test = true;
                        else
                            fprintf("Not an eight\n")
                            eights = 0;
                            return;
                        end
                    end
                end

            end
        end
    end
    eights = 0;
end
