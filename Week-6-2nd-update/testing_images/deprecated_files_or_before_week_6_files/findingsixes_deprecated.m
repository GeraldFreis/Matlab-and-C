function sixes = findingsixes_deprecated(matrix)
    [rows, columns] = size(matrix);
    % logic for six:
    % we start in the centre of the top branch
    % as such we must move down the right arm first, as the left arm can be connected 
    %to the rest of the number
        % we can use a vector of 1 row to 3 columns for the right branch
    % we can then use another vector of -27column and 27 rows to check the left side
        % here we can continue using vectors, the second of which moves 7 down and right
        % we use a vertical vector next to move 28 units straight downwards
        % after this we move right and down 10 units
        % We are now at the bottom of the six so we must complete the circle of the bottom of the six
            % we can do this by having a horizontal vector of size 16 in the positive direction
            % we can have another vector that moves upwards and right by decreasing rows and increasing
            % columns by 14 
            % we have another vector that moves vertically upwards by 14
            % after this we have another vector that moves left and up by decreasing rows and decreasing
            % columns by a factor of 14
            % we then have another vector that moves horizontally left by 10, and a final vector that
            % moves 6 down and left by increasing rows and decreasing columns
            % now we check if the value next to that is a zero and if so we are back at the 'stem' of the
            % 6
        % 
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
                test = false;  % sentinel variable
                xcrement_var = 0;
                stage = 1;  % this is going to be the variable that contains the sta
                % of the loop, i.e what vector to initialise

                while ~test
                    if(stage==1)
                        if(matrix(row+xcrement_var, column+2*xcrement_var)==0 && xcrement_var < 6)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 6)
                            stage = stage + 1;
                            xcrement_var=0;
                        else
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    elseif(stage == 2)
                        if(matrix(row+xcrement_var, column-xcrement_var)==0 && xcrement_var < 27)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==27)
                            stage = stage + 1;
                            new_row = row + xcrement_var;
                            new_column = column - xcrement_var;
                            xcrement_var = 0;
                        else
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    elseif(stage == 3)
                        if(matrix(new_row+xcrement_var, new_column+xcrement_var)==0 && xcrement_var < 7)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==7)
                            stage = stage + 1;
                            new_row = new_row + xcrement_var;
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                        else
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    elseif(stage == 4)
                        if(matrix(new_row+xcrement_var, new_column)==0 && xcrement_var < 28)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==28)
                            stage = stage + 1;
                            new_row = new_row + xcrement_var;
                            xcrement_var = 0;
                        else
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    elseif(stage==5)
                        if(matrix(new_row+xcrement_var, new_column+xcrement_var)==0 && xcrement_var < 10)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==10)
                            stage = stage + 1;
                            new_row = new_row + xcrement_var;
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                        else
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    elseif(stage==6)
                        if(matrix(new_row, new_column+xcrement_var)==0 && xcrement_var < 16)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==16)
                            stage = stage + 1;
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                        else
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    elseif(stage==7)
                        if(matrix(new_row-xcrement_var, new_column+xcrement_var)==0 && xcrement_var < 14)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==14)
                            stage = stage + 1;
                            new_row = new_row - xcrement_var;
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                        else
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    elseif(stage==8)
                        if(matrix(new_row-xcrement_var, new_column)==0 && xcrement_var < 12)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==12)
                            stage = stage + 1;
                            new_row = new_row - xcrement_var;
                            xcrement_var = 0;
                        else
                            fprintf("Not a six\n");
                            
                            sixes = 0;
                            return;
                        end
                    elseif(stage == 9)
                        if(matrix(new_row-xcrement_var, new_column-xcrement_var)==0 && xcrement_var < 14)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==14)
                            stage = stage + 1;
                            new_row = new_row - xcrement_var;
                            new_column = new_column - xcrement_var;
                            xcrement_var = 0;
                        else
                            fprintf("Not a six\n");
                            fprintf("%d", xcrement_var);
                            fprintf(" %d, %d", new_row, new_column);
                            sixes = 0;
                            return;
                        end
                    elseif(stage==10)
                        if(matrix(new_row, new_column-xcrement_var)==0 && xcrement_var < 7)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==7)
                            stage = stage + 1;
                            new_column = new_column - xcrement_var;
                            xcrement_var = 0;
                        else
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    elseif(stage==11)
                        if(matrix(new_row+xcrement_var, new_column-xcrement_var)==0 && xcrement_var < 6)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==6)
                            new_row = new_row - xcrement_var;
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                            if(matrix(new_row, new_column-1==0))
                                stage = stage + 1;
                            end

                        else
                            test=true;
                        end
                    else
                        test = true;
                    end
                
                end
                sixes = 1;
                fprintf("A six was found\n");
                return;
            end
        end
    end
    sixes = 0;
end