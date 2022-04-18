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

    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)             
                test = false;
                xcrement_var = 0;
                stage = 1;
                initial_column = column + 1;

                while ~test
                    if(stage==1)
                        if(matrix(row+xcrement_var, initial_column)== 0 && xcrement_var < 30)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 30)
                            stage = stage + 1;
                            central_row = row + (round(xcrement_var) / 2);
                            xcrement_var = 0;
                        else
                            fprintf("Not an asterisk\n");
%                             fprintf("h");
                            multiplication = 0;
                            return;
                        end

                    elseif(stage==2) % moving 45 degrees left and up and 45 degrees down and right at the same time
                        if(matrix(central_row-xcrement_var+1, initial_column-xcrement_var)==0 ...
                                && matrix(central_row + xcrement_var, initial_column+3+xcrement_var)==0 ...
                                && xcrement_var < 9)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 9)
                            xcrement_var = 0;
                            stage = stage + 1;
                        else
                            fprintf("Not an asterisk\n");
                            fprintf("\n%d, %d and %d, %d\n", central_row - xcrement_var + 1, initial_column - xcrement_var, central_row+xcrement_var, initial_column+3+xcrement_var);
                            multiplication = 0;
                            return;
                        end
                    elseif(stage==3)
                        if(matrix(central_row - xcrement_var, initial_column+3+xcrement_var)==0 ...
                                && matrix(central_row+xcrement_var, initial_column-xcrement_var)==0 ...
                                && xcrement_var < 8)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==8)
                            stage = stage  + 1;
                        else
                            fprintf("Not an asterisk\n");
                            multiplication = 0;
                            return;
                        end
                    else
                        multiplication = 1;
                        fprintf("An asterisk was found\n");
                        return;
                    end
                end

            end
        end
    end

end