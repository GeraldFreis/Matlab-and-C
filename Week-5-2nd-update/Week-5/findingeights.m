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
    
    % iterating over every pixel in the matrix and if the pixel is black implementing our logic to test if the number is an eight
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0) % checking if the pixel is black and if so implementing our logic to find 8
                
                % initialising the variables
                test = false;  % sentinel variable
                xcrement_var = 0;
                stage = 1;  % this is going to be the variable that contains the stage
                % of the loop, i.e what vector to initialise
                column_left = column+5; % initialising the columns for each vector on each side of the eight
                column_right = column+5;
                new_row = row + 2; % centralising the initial row so that we can use less vectors

                while ~test
                    if(stage==1) % iterating 10 down and 20 left and right
                        if(matrix(new_row + xcrement_var, column_left - (2 * xcrement_var))==0 && matrix(new_row+xcrement_var, column_right + (2 * xcrement_var))==0 && xcrement_var < 10)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 10) % if all of the pixels that have been covered are black and we reach the 10th row down we can 
                            % progress onto the next vector to test
                            column_left = column_left - (2 * xcrement_var); % updating the columns for each vector as the terminal point for this vector needs to be the initial point for the next
                            column_right = column_right + (2 * xcrement_var);
                            new_row = new_row + xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
%                             fprintf("%d, %d\n", new_row, column_right);
%                             fprintf("%d, %d\n", new_row, column_left);
                        else % if one of the pixels are not black returning to the main script and stating that the number is not an eight
                            fprintf("Not a Eight\n");
                            eights = 0;
                            return;
                        end
                    elseif(stage==2) % moving 9 down on either side 
                        if(matrix(new_row + xcrement_var, column_left)==0 && matrix(new_row + xcrement_var, column_right)==0 && xcrement_var < 9)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 9) % if all of the pixels that have been covered are black and we reach the 10th row down we can 
                            % progress onto the next vector to test
                            new_row = new_row + xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
%                             fprintf("%d", new_row, column_left);
                        else
                            fprintf("Not a Eight\n");
                            
                            eights = 0;
                            return;
                        end
                    elseif(stage == 3) % moving 18 down and moving 18 inwards on either side of the eight
                        if(matrix(new_row+xcrement_var, column_left + xcrement_var)==0 && matrix(new_row + xcrement_var, column_right - xcrement_var)==0 && xcrement_var <  18)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==18)% if all of the pixels that have been covered are black and we reach the 10th row down we can 
                            % progress onto the next vector to test
                            new_row = new_row + xcrement_var-2;
                            column_left = column_left + xcrement_var; % updating the columns for each vector as the terminal point for this vector needs to be the initial point for the next
                            column_right = column_right - xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else % returning to the main script as not all of the pixels iterated across are black, meanining it is not an 8.
                            fprintf("Not a Eight\n");
                            eights = 0;
                            return;
                        end
                    elseif(stage == 4) % moving 21 down and outwards as we are now in the second half of the 8.
                        if(matrix(new_row + xcrement_var, column_left - xcrement_var)==0 && matrix(new_row + xcrement_var, column_right + xcrement_var)==0 && xcrement_var < 21)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==21) % if all of the pixels that have been covered are black and we reach the 10th row down we can 
                            % progress onto the next vector to test
                            new_row = new_row + xcrement_var+1;
                            column_left=  column_left - xcrement_var; % updating the columns for each vector as the terminal point for this vector needs to be the initial point for the next
                            column_right = column_right + xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else
                            fprintf("Not a Eight\n");
                            eights = 0;
                            return;
                        end
                    elseif(stage == 5) % moving 17 down and inwards from each side of the 8
                        if(matrix(new_row + xcrement_var, column_left + xcrement_var)==0 && matrix(new_row + xcrement_var, column_right - xcrement_var)==0 && xcrement_var < 17)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 17)% if all of the pixels that have been covered are black and we reach the 10th row down we can 
                            % progress onto the next vector to test
                            new_row = new_row + xcrement_var;
                            column_left = column_left + xcrement_var; % updating the columns for each vector as the terminal point for this vector needs to be the initial point for the next
                            column_right = column_right - xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else % returning to the main script as not all the pixels iterated across are black
                            fprintf("Not a Eight\n");
                            eights = 0;
                            return;
                        end
                    elseif(stage==6) % iterating six columns inwards which should bring each of the two vectors to the centre of the 8, 
                        % hence they should have the same column, and if so the number is an 8.
                        if(matrix(new_row, column_left + xcrement_var)==0 && matrix(new_row, column_right - xcrement_var)==0 && xcrement_var < 6)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 6)
                            column_left = column_left + xcrement_var;
                            column_right = column_right - xcrement_var;                            
                            if(column_left == column_right) % if the columns of the vectors meet up in the middle we can return that we have found an eight
                                eights = 1;
                                fprintf("An eight was found")
                                return;
                            end
                            test = true;
                        end
                    end
                end

            end
        end
    end
end
