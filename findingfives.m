function fives = findingfives(matrix)
    [rows, columns] = size(matrix); % finding the rows and columns of the matrix so that we can iterate over every pixel
     % logic for five:
    % fives, from the highest and most leftmost point have a right branch
        % for font 72 calibri we move 30 pixels right initially
        % if all of the pixels we iterate across are black then we have passed the vector test for the first stage of the 5
        % as in we know that the top of the number we are analysing complies with the top right branch of a 5
    % and then move down and around that curve
        % We will then move down 33 rows and this will bring us to the bottom of the vertical branch from the top left of the 5.
        % If all of the pixels in that movement down are black, we will continue with the rest of our tests which involve moving down and around the 
        % curve of the 5.
        % we will then move 23 pixels to the right (23 columns) and this allows us to use a smaller number of diagonal vectors for testing
        % If all of the pixels in the previous test are black we can then move 16 rows down and 16 columns to the right. 
        % just like the previous tests, we will move 18 down and to the left, which takes us inwards from the curve
        % if all of these pixels are still black we will move 27 to the left for the tail of the 5, and if these tests pass we have a 5.
        
    % iterating over every pixel in the matrix and checking if the pixel is black. If so, we implement our tests to see if the number attached
    % to the pixel is black
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0) % checking if the pixel is black (0)
                
                % initialising variables
                test = false;  % sentinel variable to control the while loop
                xcrement_var = 0; % variable to contain the increment factor to increment over pixels by changing the x and y (column and row), 
                % which will emulate a vector as the terminal point of the vector is changing with every change of the xcrement_var.
                stage = 1;  % this is going to be the variable that contains the sta
                % of the loop, i.e what vector to initialise

                while ~test
                    if(stage==1)% moving 30 columns to the right as this should take us to the end of the top branch of the 5. If this passes 
                        % we have passed the first stage of our tests to check if the number is a 5.
                        if(matrix(row, column+xcrement_var)==0 ...
                        && xcrement_var < 30) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 30) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1;
                            xcrement_var = 0; % resetting the increment variable
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a five\n");                            
                            fives = 0;
                            return;
                        end
                        
                    elseif(stage==2) % moving 33 down to start moving right to reach the curve
                        if(matrix(row+xcrement_var, column)==0 ...
                        && xcrement_var < 33) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 33) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1;
                            new_row = row + xcrement_var;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            new_column = column;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a five\n");                            
                            fives = 0;
                            return;
                        end
                        
                    elseif(stage == 3) % moving right so that we can start the curve of the 5, if all of the pixels while moving right are
                        % still black then we can progress to the next stage
                        if(matrix(new_row, new_column+xcrement_var)==0 ...
                        && xcrement_var < 23) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 23)  % if all of the pixels are black we can start moving down to the next stage where we move around the
                            % curve
                            stage = stage + 1;
                            new_column = new_column + xcrement_var;  % updating the column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            xcrement_var = 0; 
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a five\n");
                            fives = 0;
                            return;
                        end
                        
                    elseif(stage == 4) % moving outwards to reach the rightmost point of the curve of the five
                        if(matrix(new_row + xcrement_var, new_column+xcrement_var)==0 ...
                        && xcrement_var < 16) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 16) % as we have passed the tests to ensure that all pixels we have passed over are still black
                            % we can now move to the next stage.
                            stage = stage + 1;
                            new_row = new_row + xcrement_var + 4;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            new_column = new_column + xcrement_var;
                            xcrement_var =0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a five\n");
                            fives = 0;
                            return;
                        end
                        
                    elseif(stage == 5) % moving inwards to move to the bottom of the 5
                        if(matrix(new_row - xcrement_var, new_column-xcrement_var)==0 ...
                        && xcrement_var < 18) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 18) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1;
                            new_row = new_row + xcrement_var;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            new_column = new_column - xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a five\n");
                            fives = 0;
                            return;
                        end
                        
                    elseif(stage == 6) % checking the tail end of the shape to ensure that it matches with that of a 5, and if so
                        % we have a five
                        if(matrix(new_row, new_column-xcrement_var)==0 ...
                        && xcrement_var < 27) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 27) % if every pixel iterated over was black we have made it to the end of this vector and hence we have passed all vector tests
                            % and can end the while loop
                            test = true;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a five\n");
                            fives = 0;
                            return;
                        end
                    else
                        test = true;
                    end
                end
                
                % as we passed all the vector tests we have a 5.
                fprintf("A five was found\n");
                fives = 1;
                return;
            end
        end
    end
    fives = 0;
end
