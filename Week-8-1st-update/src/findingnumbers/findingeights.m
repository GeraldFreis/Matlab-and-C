function eights = findingeights(matrix, numberofdigits)
    % for the number 8 and 9 there are some adjustments made in the code that enables two digit
    % numbers to be recognised, that infringes on the ability of the code to recognise 1 digit operations
        % as such we have to use an adjustment_factor variable that adjusts the length of the vector and
        % pixels iterated over, we will reset this factor after each time it is used 

    [rows, columns] = size(matrix); % finding the rows and columns of the matrix so that we can iterate over every pixel


    %% logic for eight:
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


    %% iterating over every pixel in the matrix and checking to see whether the pixel is black or not and
    % if so applying our logic to test if the number is an eight or not.
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)

                %% initialising variables
                test = false;  % sentinel variable
                xcrement_var = 0; % variable to move the 'cursor' over each pixel by changing the row and column (i.e it will be added to row to symbolise moving down and added to column to symbolise moving right)
                stage = 1;  % this is going to be the variable that contains the stage
                % of the loop, i.e what vector to initialise
                column_left = column+3; 
                column_right = column_left;
                new_row = row + 1;
                
                %% implementing each vector
                while ~test
                    
                    % iterating 6 pixels down and 12 outwards (1 row for every 2 columns)
                    if(stage==1)  % we can not implement the finding numbers function here as our ratio of incrementation isn't 1:1
                        if(matrix(new_row + xcrement_var, column_left - (2 * xcrement_var))==0 ...
                                && matrix(new_row+xcrement_var, column_right + (2 * xcrement_var))==0 ...
                                && xcrement_var < 6) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;

                        elseif(xcrement_var == 6)
                            column_left = column_left - (2 * xcrement_var);  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            column_right = column_right + (2 * xcrement_var);
                            new_row = new_row + xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;

                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a 8\n");
                            eights = 0;
                            return;
                        end
                    
                    elseif(stage==2) % moving 10 pixels downwards
                        if(matrix(new_row + xcrement_var, column_left)==0 ...
                                && matrix(new_row + xcrement_var, column_right)==0 ...
                                && xcrement_var < 10) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;

                        elseif(xcrement_var == 10)
                            new_row = new_row + xcrement_var+1;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            xcrement_var = 0;
                            stage = stage + 1;

                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a 8\n");
                            eights = 0;
                            return;
                        end

                    elseif(stage == 3) % iterating 9 pixels down and inwards by each vector
                        if(matrix(new_row+xcrement_var, column_left + xcrement_var)==0 ...
                                && matrix(new_row + xcrement_var, column_right - xcrement_var)==0 ...
                                && xcrement_var <  9) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        
                        elseif(xcrement_var==9) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            new_row = new_row + xcrement_var;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            column_left = column_left + xcrement_var;
                            column_right = column_right - xcrement_var+2;
                            xcrement_var = 0;
                            stage = stage + 1;
                        
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a eight\n");
                            eights = 0;
                            return;
                        end
                    
                    % as mentioned the vectors slightly differ between 2 digit and 1 digit operations
                    %% initialising the adjustment factors
                    if(numberofdigits==1)
                        adjustment_factor_row = 2; % controls the initial row
                        adjustment_factor_updated_row = 1; % controls the updated row at if the vector passes
                        adjustment_factor_column = -4; % controls the right column adjustment
                        adjustment_factor_veclen = 2; % controls the adjustment of the vector's length
                    
                    elseif(numberofdigits == 2)
                        adjustment_factor_row = 0;
                        adjustment_factor_column = 0;
                        adjustment_factor_veclen = 0;
                        adjustment_factor_updated_row = 0;
                    else
                        fprintf("\nWe do not cover that number of digits currently\n");
                    end

                    elseif(stage == 4) % iterating 14 pixels down and outwards by each vector if it is two digits and 16 digits down and outwards if it is 1 digit
                        if(matrix(new_row + xcrement_var + adjustment_factor_row, column_left - xcrement_var)==0 ...
                                && matrix(new_row + xcrement_var + adjustment_factor_row, column_right + xcrement_var + adjustment_factor_column)==0 ...
                                && xcrement_var < (14 + adjustment_factor_veclen)) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        
                        elseif(xcrement_var==(14+adjustment_factor_veclen)) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            new_row = new_row + xcrement_var + 2 + adjustment_factor_updated_row;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            column_left=  column_left - xcrement_var;
                            column_right = column_right + xcrement_var + adjustment_factor_column;
                            xcrement_var = 0;
                            stage = stage + 1;
                        
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a eight\n");
                            fprintf("Here");
                            eights = 0;
                            return;
                        
                        end

                    elseif(stage == 5) % iterating 11 pixels down and inwards by each vector
                        if(matrix(new_row + xcrement_var, column_left + xcrement_var)==0 ...
                                && matrix(new_row + xcrement_var, column_right - xcrement_var)==0 ...
                                && xcrement_var < 11) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        
                        elseif(xcrement_var == 11) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            new_row = new_row + xcrement_var;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            column_left = column_left + xcrement_var;
                            column_right = column_right - xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                        
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a eight\n");
                            eights = 0;
                            return;
                        end

                    elseif(stage==6) % iterating 7 pixels down and inwards by each vector
                        if(matrix(new_row, column_left + xcrement_var)==0 ...
                                && matrix(new_row, column_right - xcrement_var)==0 ...
                                && xcrement_var < 7) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                            
                        elseif(xcrement_var == 7) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            column_left = column_left + xcrement_var;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            column_right = column_right - xcrement_var;                            
                            
                            if(column_left == column_right) % if the two vectors can meet in the middle of the shape and have the same column we have an eight
                                eights = 1;
                                fprintf("An eight was found\n")
                                return;
                            end
                            test = true;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not an eight\n")
                            eights = 0;
                            return;
                        end
                    end
                end

            end
        end
    end
    eights = 0; % returning 0 eights if no pixels iterated over were black
end
