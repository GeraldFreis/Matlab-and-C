function sevens = findingsevens(matrix)
    [rows, columns] = size(matrix);
    % logic for seven:
    % we start at the top left of the seven so we have to move to the end of the row
        % for 72 font calibri this is 44 units right.
        % if every pixel we iterate over is black, we can continue onto the next stage
    % we then move down the diagonal with a row increment of 2 for every column increment
        % the diagonal is decreasing the columns while increasing the row
    % if this passes then its a seven
    
    % iterating across every pixel in the matrix and if the pixel is black implementing our logic to test that the number that pixel is attached to 
    % is a seven
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0) % if the pixel is black, implementing our logic
                
                % initialising the variables
                test = false;  % sentinel variable to control the while loop
                xcrement_var = 0; % variable to control the movement / changing of the x and y (column and row) of the pixel to emulate a vector
                % this variable will be changed (incremented) every iteration of the while loop
                
                stage = 1;  % this is going to be the variable that contains the stage
                % of the loop, i.e what vector to initialise

                while ~test
                    if(stage==1) % iterating 44 pixels right (by increasing the columns)
                        if(matrix(row, column+xcrement_var)==0 && xcrement_var < 44) % if the current pixel iterated over is black and the length of the current vector is less than the required length 
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 44)
                            new_column = column + xcrement_var;
                            new_row = row + 10;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else % if the current pixel is not black we have not passed this vector test
                            fprintf("Not a seven\n");
                            sevens = 0;
                            return;
                        end
                    elseif(stage==2) % iterating 68 rows down and 34 columns to the left, and if all of the pixels we iterate over are black
                        % we have a seven
                        if(matrix(new_row + 2*xcrement_var, new_column - xcrement_var)==0 && xcrement_var < 34) % if the current pixel iterated over is black and the length of the current vector is less than the required length 
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 34) % if all of the pixels iterated over were black we can exit the while loop
                            test = true;
                        else % if the current pixel is not black we have not passed this vector test
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
end
