function sevens = findingsevens(matrix)
    [rows, columns] = size(matrix); % finding the rows and columns of the matrix so that we can iterate over every pixel in the matrix
    
    % logic for seven:
    % we start at the top left of the seven so we have to move to the end of the row
        % for 72 font calibri this is 44 units right
    % we then move down the diagonal with a row increment of 2 for every column increment
        % the diagonal is decreasing the columns while increasing the row
    % if this passes then its a seven
    
    % iterating over every pixel in the matrix and if that pixel is black (0), applying our logic to test if the pixel is part of a seven
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0) % if the pixel is black applying our logic
                
                % initialising our variables
                test = false;  % sentinel variable to control the while loop
                xcrement_var = 0; % variable to contain the increment factor to increment over pixels by changing the x and y (column and row), as
                % this will emulate a vector
                stage = 1;  % this is going to be the variable that contains the sta
                % of the loop, i.e what vector to initialise

                while ~test
                    if(stage==1) % iterating 44 pixels right (by increasing the columns) to reach the end of the seven
                        % we can return this new column to the next stage, so that it can move from that position diagonally left
                        if(matrix(row, column+xcrement_var)==0 && xcrement_var < 44)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 44) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            new_column = column + xcrement_var;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            new_row = row + 10;
                            xcrement_var = 0; % resetting the increment factor
                            stage = stage + 1; % moving to the next stage
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a seven\n");
                            sevens = 0;
                            return;
                        end
                    elseif(stage==2)% iterating 68 rows down and 34 columns to the left, and if all of the pixels we iterate over are black
                        % we have a seven
                        if(matrix(new_row + 2*xcrement_var, new_column - xcrement_var)==0 && xcrement_var < 34)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 34) % if every pixel iterated over was black we have made it to the end of this vector and hence can close the while loop
                            test = true;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a seven\n");
                            sevens = 0;
                            return;
                        end
                    end
                end
                
                % as we have passed the vector tests for a seven, we have a seven and can return this information to the calling function
                sevens = 1;
                fprintf("A seven was found\n");
                return;
            end
        end
    end
    sevens = 0;
end
