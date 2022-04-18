function multiplication = findingmultiplication(matrix)
    [rows, columns] = size(matrix);
    % logic for multiplication / asterisk symbol
        % When we first hit the asterisk symbol we are at the top of the symbol. i.e the vertical line
        % however, there is a hat for the symbol so we have to move one column in.
        % we then iterate to the bottom which should be 30 pixels away and if all pixels are black we go
        % to half of the length of the that 30 vector
        % we then move simultaneously 45 degrees left and up and 45 degrees down and right. If all pixels
        % in each of these increments is still black we return to the centre and simulataneously up and
        % right and left and down. If all of this passes we have an asterisk
    
    % iterating over every pixel in the matrix and if that pixel is black (0) then applying our logic to
    % test if it is a asterisk (multiplication symbol).
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0) % if the pixel is black

                % initialising variables
                test = false; % sentinal variable for the while loop
                xcrement_var = 0; % variable to move the 'cursor' over each pixel by changing the row and column (i.e it will be added to row to symbolise moving down and added to column to symbolise moving right)
                stage = 1; % variable that determines what vector to apply at what moment in the sequence we are. i.e if the previous vector passed its test and every pixel was black we increase the stage to apply 
                % the next vector
                initial_column = column + 1; % setting the initial column of the shape 1 column to the right so it is in the centre of the shape

                while ~test
                    if(stage==1) % moving 30 rows down, as we are in the central column of the asterisk
                        if(matrix(row+xcrement_var, initial_column)== 0 && xcrement_var < 30) % if the current pixel iterated over is black and the length of the current vector is beneath the length of the final vector
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 30) % if all of the pixels were black and we are at the required length of the vector we have passed this vector test and can move on to the next
                            stage = stage + 1;
                            central_row = row + (round(xcrement_var) / 2); % establishing the central row of the number so we can use this for the other vector tests
                            xcrement_var = 0;
                        else % if the current pixel is not black 
                            fprintf("Not an asterisk\n");
                            multiplication = 0;
                            return;
                        end

                    elseif(stage==2) % moving 45 degrees left and up and 45 degrees down and right at the same time
                        if(matrix(central_row-xcrement_var+2, initial_column-xcrement_var)==0 ...
                                && matrix(central_row + xcrement_var, initial_column+2+xcrement_var)==0 ...
                                && xcrement_var < 9)  %if the current pixel iterated over is black and the length of the current vector is beneath the length of the final vector
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 9) % if all of the pixels were black and we are at the required length of the vector we have passed this vector test and can move on to the next
                            xcrement_var = 0;
                            stage = stage + 1;
                        else % if the current pixel is not black 
                            fprintf("Not an asterisk\n");
                            fprintf("\n%d, %d and %d, %d\n", central_row - xcrement_var + 1, initial_column - xcrement_var, central_row+xcrement_var, initial_column+3+xcrement_var);
                            multiplication = 0;
                            return;
                        end

                    elseif(stage==3)
                        if(matrix(central_row - xcrement_var, initial_column+3+xcrement_var)==0 ...
                                && matrix(central_row+xcrement_var, initial_column-xcrement_var)==0 ...
                                && xcrement_var < 8) % moving 8 down and right and up and left at the same time, across the branches of the asterisk
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==8) % if all of the pixels were black and we are at the required length of the vector we have passed this vector test and can move on to the next
                            stage = stage  + 1; % increasing the stage so that we can access the code to return that we have found an asterisk
                        else % if the current pixel is not black 
                            fprintf("Not an asterisk\n");
                            multiplication = 0;
                            return;
                        end
                    else % if we have exceeded the vector stages / passed all vector tests we have a asterisk and hence we can return this
                        multiplication = 1;
                        fprintf("An asterisk was found\n");
                        return;
                    end
                end

            end
        end
    end

end
