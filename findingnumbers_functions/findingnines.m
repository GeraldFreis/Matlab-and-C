function nines = findingnines(matrix)
    [rows, columns] = size(matrix); % finding the number of rows and columns in the matrix

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
             
    % iterating over every pixel in the matrix to check if the pixel is a zero (black) and if so applying
    % our logic to test if it is a nine onto that pixel and the surrounding number.
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
                column_left = column+2;
                column_right = column_left;
                new_row = row;
                test = false;
                stage = 1;
                xcrement_var = 0;
    
                while ~test
                    if(stage == 1) % iterating down and outwards around the top circle of the nine, and checking to ensure that every pixel iterated over is black
                        if(matrix(new_row+xcrement_var, column_left-xcrement_var)==0 && matrix(new_row+xcrement_var, column_right+xcrement_var)==0 && xcrement_var < 5)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 5) % if every pixel iterated over was black and we have reached the length of our vector
                            column_right = column_right+xcrement_var;  %updating the right column variable so that our next stage will use the updated right vector
                            column_left = column_left - xcrement_var; % updating the left column variable so that our next stage will use this terminal value as its initial value
                            new_row = new_row + xcrement_var; % updating the row so that our next vector picks up from this row with each column variable to form the next variable
                            new_row_left = new_row - 4; % updating the row for the left vector, and ensuring that it is in the centre of the lines for the 9, as the 9 is not proportional
                            stage = stage + 1; % moving to the next stage
                            xcrement_var = 0; % resetting the increment variable
                        else % if not every pixel iterated over is black we print that a nine was not found and we return to the calling function
                            fprintf("Not a nine\n");
                            nines = 0;
                            return;
                        end
                        
                    elseif(stage==2) % iterating 10 pixels outwards and downards from the terminal points of the last vector
                        if(matrix(new_row_left+xcrement_var, column_left - xcrement_var)==0 && matrix(new_row + xcrement_var, column_right+xcrement_var)==0 && xcrement_var < 10)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 10) % if every pixel iterated over was black and we have reached the required length of the vector
                            new_row_left = new_row_left + xcrement_var+2; % updating the left row variable so that it is in line with the new_row variable for the right, as the 9 shape is not proportional
                            column_left = column_left - xcrement_var-2; % updating the column for the left vector
                            column_right = column_right + xcrement_var; % updating the column for the right vector
                            new_row = new_row + xcrement_var; % updating the row for the right vector
                            stage = stage + 1; % increasing the stage as we have passed this vector test
                            xcrement_var = 0;
                        else % if not all of the pixels passed over in this vector were black
                            fprintf("Not a nine\n");
                            nines = 0;
                            return;
                        end
                    
                    elseif(stage==3) % iterating downwards so that we can move back inwards with the left vector, and so that the right vector is in the centre of the right vertical branch of the 9
                        if(matrix(new_row_left + xcrement_var, column_left)==0 && matrix(new_row+xcrement_var, column_right)==0 && xcrement_var < 12)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var ==12) % if every pixel iterated over was black and we have reached our required length of the vector
                            new_row_left = new_row_left + xcrement_var; % updating the row variable for the left vector
                            new_row = new_row + xcrement_var; % updating the row for the right vector
                            stage = stage + 1; % increasing the stage as we have passed the test for this stage
                            xcrement_var = 0;
                        else % if not all of the pixels passed over in this vector were black
                            fprintf("Not a nine\n");
                            nines = 0;
                            return;
                        end
    
                    elseif(stage==4)  % focusing on the left vector                           
                            if(findingnumbers("downright", 6, new_row_left, column_left, matrix)==false) % if not all of the pixels iterated over by the vector are black
                                fprintf("Not a 9\n");
                                nines = 0;
                                return;
                            else
                                new_row_left = new_row_left + 6; % updating the new_row_left so that this row can be used for the next vector
                                column_left = column_left + 6; % updating the column so that this column can be used for the next vector
                                stage = 5;
                            end

                    elseif(stage==5) % iterating thirteen pixels to the right around the bottom side of the curve for the 9.                       
                        if(findingnumbers("right", 13, new_row_left, column_left, matrix)==false) % if not all of the pixels iterated over by the vector are black
                            fprintf("Not a 9\n");
                            nines = 0;
                            return;
                        else % if all of the pixels iterated over were black we can just increase the stage as we will be using the right vector for testing 
                            % the rest of the shape
                            stage = 6;
                        end
                    
                    % our left vector is now on the right side of the nine, along that almost vertical
                    % branch of the 9, and hence we can continue with the right branch.

                    elseif(stage==6) % moving 17 rows down with our right vector
                        if(findingnumbers("down", 17, new_row, column_right, matrix)==false) % if not all of the pixels iterated over by the vector are black
                            fprintf("Not a 9\n");
                            nines = 0;
                            return;
                        else % if all of the pixels itearted over were black:
                            new_row = new_row + 17; % updating the new_row so that this row can be used as the initial row for the next vector
                            stage = 7;
                        end

                    elseif(stage==7) % moving 11 columns down and left                    
                        if(findingnumbers("downleft", 11, new_row, column_right, matrix)==false) % if not all of the pixels iterated over by the vector are black
                            fprintf("Not a 9\n");
                            nines = 0;
                            return;
                        else
                            new_row = new_row + 11; % updating the new_row_left so that this row can be used for the next vector
                            column_right = column_right - 11; % updating the column so that this column can be used for the next vector
                            stage = 8; % increasing the stage so that we can apply the next vector onto the shape
                        end
                    % now we are at the bottom of the nine and hence we just need to move left to check
                    % whether or not the tail of the shape fits that of a nine.
                    elseif(stage==8) % moving 19 columns left                        
                        if(findingnumbers("left", 19, new_row, column_right, matrix)==false) % if not all of the pixels iterated over were black
                            fprintf("Not a 9\n");
                            nines = 0;
                            return;
                        else % if all of the pixels iterated over were black we can increase the stage so that we can return that a nine was found
                            stage = 9;
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