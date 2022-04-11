function sevens = findingsevens(matrix)
    [rows, columns] = size(matrix);
    % logic for seven:
    % we start at the top left of the seven so we have to move to the end of the row
        % for 72 font calibri this is 34 units right
    % we then move down the diagonal with a row increment of 2 for every column increment
        % the diagonal is decreasing the columns while increasing the row
    % if this passes then its a seven

    % iterating through every pixel in the matrix, and if that pixel is equal to zero we can try to apply
    % our algorithm to find seven. If every vector we apply passes over only black pixels, we have a
    % seven.
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
                stage = 1;  % this is going to be the variable that contains the sta
                % of the loop, i.e what vector to initialise
                test = false; % sentinal variable to control the while loop
                xcrement_var = 0 ; % variable to contain the increment factor to increment over pixels by changing the x and y (column and row), 
                % which will emulate a vector as the terminal point of the vector is changing with every change of the xcrement_var.

                while ~test
                    if(stage==1)
                        if(matrix(row, column+xcrement_var)==0 && xcrement_var < 34) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 34) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            new_column = column + xcrement_var;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            new_row = row;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a seven\n");
                            sevens = 0;
                            return;
                        end
                    elseif(stage==2) % moving 24 columns left and 48 rows down
                        if(matrix(new_row + 2*xcrement_var, new_column - xcrement_var)==0 && xcrement_var < 24) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 24) % if every pixel iterated over was black we have made it to the end of this vector and hence can end the while loop
                            test = true;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a seven\n");
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
