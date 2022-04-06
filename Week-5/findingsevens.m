function sevens = findingsevens(matrix)
    [rows, columns] = size(matrix);
    % logic for seven:
    % we start at the top left of the seven so we have to move to the end of the row
        % for 72 font calibri this is 44 units right
    % we then move down the diagonal with a row increment of 2 for every column increment
        % the diagonal is decreasing the columns while increasing the row
    % if this passes then its a seven

    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
                test = false;  % sentinel variable
                xcrement_var = 0;
                stage = 1;  % this is going to be the variable that contains the sta
                % of the loop, i.e what vector to initialise

                while ~test
                    if(stage==1) % iterating 44 pixels right (by increasing the columns) to reach the end of the seven
                        % we can return this new column to the next stage, so that it can move from that position diagonally left
                        if(matrix(row, column+xcrement_var)==0 && xcrement_var < 44)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 44)
                            new_column = column + xcrement_var;
                            new_row = row + 10;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else
                            fprintf("Not a seven\n");
                            sevens = 0;
                            return;
                        end
                    elseif(stage==2)% iterating 68 rows down and 34 columns to the left, and if all of the pixels we iterate over are black
                        % we have a seven
                        if(matrix(new_row + 2*xcrement_var, new_column - xcrement_var)==0 && xcrement_var < 34)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 34)
                            test = true;
                        else
                            fprintf("Not a seven\n");
                            fprintf("%d, %d, %d", new_row, new_column, xcrement_var);
                            sevens = 0;
                            return;
                        end
                    end
                end
                sevens = 1;
                fprintf("A seven was found\n");
                return;
            end
        end
    end
    sevens = 0;
end
