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
    
    % iterating over every pixel in the matrix and checking if the pixel is black and if so implementing our logic to test if the number attached to that pixel 
    % is a 8.
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0) % if the pixel is black
                
                % initialising variables
                test = false;  % sentinel variable
                xcrement_var = 0; % variable to contain the increment factor which will increment over pixels by changing the x and y (column and row),
                % this will emulate a vector as we are changing the x and y position of the terminal point of the vector in each iteration

                stage = 1;  % this is going to be the variable that contains the sta
                % of the loop, i.e what vector to initialise
                column_left = column+5;
                column_right = column+5;
                new_row = row + 2;

                while ~test % the while loop that will enable us to iterate over every pixel
                    if(stage==1)
                        if(matrix(new_row + xcrement_var, column_left - (2 * xcrement_var))==0 && ...
                        matrix(new_row+xcrement_var, column_right + (2 * xcrement_var))==0 && ...
                        xcrement_var < 10) % testing if the current row and column of each vector is on a black pixel and if the current vector length is less than the required length
                            % if so we increment the xcrement var so that we can continue moving in the required direction
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 10) % if every pixel iterated over was black and we have reached the required lenghtn of the vector
                            column_left = column_left - (2 * xcrement_var);
                            column_right = column_right + (2 * xcrement_var);
                            new_row = new_row + xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else % if the current pixel is not black, hence we have not passed this vector test and we do not have an eight
                            fprintf("Not a Eight\n");
                            eights = 0;
                            return;
                        end
                        
                    elseif(stage==2)
                        if(matrix(new_row + xcrement_var, column_left)==0 && ...
                        matrix(new_row + xcrement_var, column_right)==0 && ...
                        xcrement_var < 9)% testing if the current row and column of each vector is on a black pixel and if the current vector length is less than the required length
                            % if so we increment the xcrement var so that we can continue moving in the required direction
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 9) % if every pixel iterated over was black and we have reached the required lenghtn of the vector
                            new_row = new_row + xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
%                             fprintf("%d", new_row, column_left);
                        else % if the current pixel is not black, hence we have not passed this vector test and we do not have an eight
                            fprintf("Not a Eight\n");
                            
                            eights = 0;
                            return;
                        end
                    elseif(stage == 3)
                        if(matrix(new_row+xcrement_var, column_left + xcrement_var)==0 && ...
                        matrix(new_row + xcrement_var, column_right - xcrement_var)==0 && ...
                        xcrement_var <  18) % testing if the current row and column of each vector is on a black pixel and if the current vector length is less than the required length
                            % if so we increment the xcrement var so that we can continue moving in the required direction
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==18) % if all pixels iterated over were black and we have reached the required length of the vector
                            new_row = new_row + xcrement_var-2;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            column_left = column_left + xcrement_var;
                            column_right = column_right - xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else % if the current pixel is not black, hence we have not passed this vector test and we do not have an eight
                            fprintf("Not a Eight\n");
                            eights = 0;
                            return;
                        end
                    elseif(stage == 4)
                        if(matrix(new_row + xcrement_var, column_left - xcrement_var)==0 && ...
                        matrix(new_row + xcrement_var, column_right + xcrement_var)==0 && ...
                        xcrement_var < 21) % testing if the current row and column of each vector is on a black pixel and if the current vector length is less than the required length
                            % if so we increment the xcrement var so that we can continue moving in the required direction
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==21) % if every pixel iterated over was black and we have reached the required lenghtn of the vector
                            new_row = new_row + xcrement_var+1;  % updating the row and columns so that the terminal row and column of this vector are the initial row and columns of the next vector
                            column_left=  column_left - xcrement_var;
                            column_right = column_right + xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1; % increasing to the next stage as we have passed this vector test
                        else % if the current pixel is not black, hence we have not passed this vector test and we do not have an eight
                            fprintf("Not a Eight\n");
                            eights = 0;
                            return;
                        end
                    elseif(stage == 5)
                        if(matrix(new_row + xcrement_var, column_left + xcrement_var)==0 && ...
                        matrix(new_row + xcrement_var, column_right - xcrement_var)==0 && ...
                        xcrement_var < 17) % testing if the current row and column of each vector is on a black pixel and if the current vector length is less than the required length
                            % if so we increment the xcrement var so that we can continue moving in the required direction
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 17) % if every pixel iterated over was black and we have reached the required lenghtn of the vector
                            new_row = new_row + xcrement_var;  % updating the row and columns so that the terminal row and column of this vector are the initial row and columns of the next vector
                            column_left = column_left + xcrement_var;
                            column_right = column_right - xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1; % increasing to the next stage as we have passed this vector test
                        else % if the current pixel is not black, hence we have not passed this vector test and we do not have an eight
                            fprintf("Not a Eight\n");
%                             fprintf("%d, %d, %d", xcrement_var, column_left+xcrement_var, new_row+xcrement_var);
                            eights = 0;
                            return;
                        end
                    elseif(stage==6)
                        if(matrix(new_row, column_left + xcrement_var)==0 && ...
                        matrix(new_row, column_right - xcrement_var)==0 && ...
                        xcrement_var < 6) % testing if the current row and column of each vector is on a black pixel and if the current vector length is less than the required length
                            % if so we increment the xcrement var so that we can continue moving in the required direction
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 6) % if we have reached the length of the vector we have passed the test
                            column_left = column_left + xcrement_var;  % updating the row and columns so that the terminal row and column of this vector are the initial row and columns of the next vector
                            column_right = column_right - xcrement_var;                            
                            if(column_left == column_right) % if, when we move 6 inwards, the terminal point for the left and right vector are the same we have an eight
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
    eights = 0;
end
