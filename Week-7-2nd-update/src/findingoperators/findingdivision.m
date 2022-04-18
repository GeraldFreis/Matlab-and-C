function division = findingdivision(matrix)
    [rows, columns] = size(matrix); % finding the rows and columns of the matrix 

    % logic for the division operator:

    % iterating over every pixel in the matrix passed to the function and if that pixel is black, applying our logic to test if
    % it is a division symbol
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, columns)==0) % if the pixel is black
                
                % initialising variables
                test = false; % sentinal variable to control the while loop
                xcrement_var = 0; % this is the variable that will increment the row and column to emulate a vector passing over every pixel, it will be reset after every vector
                % test has been passed
                stage = 1; % this determines what vector to apply to the number at what 'stage' we are in in verifying the number

                while ~test % while loop to enable incrementation of the row and column to emulate a vector
                    if(stage==1) % moving 3 rows down and 1 column left, 9 times and ensuring all pixels passed over are black
                        new_row = row + 12; % moving the starting point of the vector to the center of the lines of the symbol

                        if(matrix(new_row + 3 * xcrement_var, column - xcrement_var)==0 && xcrement_var < 9) % testing if the pixel is still black at the current iteration of the vector, and if it is less than the vector length
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 9) % if the vector length has been reached we have passed the test for this vector and can move onto the next stage with the updated row and column to iterate from
                            new_row = new_row + 3 * xcrement_var; % updating the row and column as the terminal point for this vector need to be used as the initial point for the next vector
                            new_column = column - xcrement_var;
                            xcrement_var = 0; % resetting the increment variable
                            stage = stage + 1; % increasing the stage to the next stage
                        else % if the pixel currently iterated over is not black (we have not passed this vector test)
                            fprintf("Not a divisor\n");
                            division = 0;
                            return; % returning to the callerfunction
                        end

                    elseif(stage==2) % moving 8 columns down and left and ensuring every pixel passed over is black
                        if(matrix(new_row + xcrement_var, new_column - xcrement_var)==0 && xcrement_var < 8) % testing if each pixel is black at the current iteration and that the iteration variable is less than the length we need to chekc
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 8) % if we have reached our vector length we have passed all tests to check if it is a division symbol and hence we can return to the caller function
                            division = 1; % represents that a division symbol was found
                            fprintf("A division symbol was found\n");
                            return;
                        else % if each pixel iterated over was not black we want to print that a divisor was not found and return 0 to the caller function to indicate this
                            division = 0;
                            fprintf("Not a divisor\n"); 
                            return;
                        end
                    end
                end
            end
        end
        division = 1;
        fprintf("A division symbol was found\n");
        return;
    end
end