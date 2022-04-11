function fives = findingfives(matrix)
    [rows, columns] = size(matrix); % finding the rows and columns of the matrix so that we can iterate over every pixel
    
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
        
    % iterating over every pixel in the matrix and if the pixel is black applying our logic to test if the pixel is attached to a five.
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0) % if the pixel is black
                
                % initialising the variables
                test = false;  % sentinel variable
                xcrement_var = 0; % variable to contain the increment factor to increment over pixels by changing the x and y (column and row), 
                % which will emulate a vector as the terminal point of the vector is changing with every change of the xcrement_var.
                stage = 1;  % this is going to be the variable that contains the sta
                % of the loop, i.e what vector to initialise

                while ~test
                    if(stage==1)  % moving right along the top right branch of the 5
                        if(matrix(row, column+xcrement_var)==0 && xcrement_var < 26) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 26) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a five\n");                         
                            fives = 0;
                            return;
                        end
                        
                    elseif(stage==2) % moving down the vertical line of the five
                        if(matrix(row+xcrement_var, column)==0 && xcrement_var < 25) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 25) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1;
                            new_row = row + xcrement_var;
                            new_column = column;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a five\n");                            
                            fives = 0;
                            return;
                        end
                    elseif(stage == 3) % moving right to get to the rounded turn of the 5
                        if(matrix(new_row, new_column+xcrement_var)==0 && xcrement_var < 16) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 16) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1;
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a five\n");
                            fives = 0;
                            return;
                        end
                    elseif(stage == 4) % moving down and right around the curve
                        if(matrix(new_row + xcrement_var, new_column+xcrement_var)==0 && xcrement_var < 14) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 14) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1;
                            new_row = new_row + xcrement_var + 4;
                            new_column = new_column + xcrement_var;
                            xcrement_var =0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a five\n");
                            fives = 0;
                            return;
                        end
                        
                    elseif(stage == 5) % moving back inwards around the curve
                        if(matrix(new_row + xcrement_var, new_column-xcrement_var)==0 && xcrement_var < 11) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 11) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1;
                            new_row = new_row + xcrement_var;
                            new_column = new_column - xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a five\n");
                            fives = 0;
                            return;
                        end
                    elseif(stage == 6) % moving back left to finish the tail of the 5
                        if(matrix(new_row, new_column-xcrement_var)==0 && xcrement_var < 22) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 22) % if every pixel iterated over was black we have made it to the end of this vector and as we have passed all tests
                            % we can end the while loop and return that we have found a five.
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

                fprintf("A five was found\n");
                fives = 1;
                return;
            end
        end
    end
    fives = 0;
end
