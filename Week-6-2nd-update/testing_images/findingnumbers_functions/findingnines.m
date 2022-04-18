function nines = findingnines(matrix)
    [rows, columns] = size(matrix);
    % logic for nines:
        % here we will initially do what we did for 8 and iterate through both halves of the nine at the
        % same time
        % after that is no longer possible we will continue with the column_right variable
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
%                 fprintf("%d, %d", row, column);
                column_left = column+2;
                column_right = column_left;
                new_row = row;
                test = false;
                stage = 1;
                xcrement_var = 0;
    
                while ~test
                    if(stage == 1)
                        if(matrix(new_row+xcrement_var, column_left-xcrement_var)==0 && matrix(new_row+xcrement_var, column_right+xcrement_var)==0 && xcrement_var < 5)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 5)
                            column_right = column_right+xcrement_var;
                            column_left = column_left - xcrement_var;
                            new_row = new_row + xcrement_var;
                            new_row_left = new_row - 4;
                            stage = stage + 1;
                            xcrement_var = 0;
                        else
                            fprintf("Not a nine\n");
%                             fprintf("%d, %d, %d", new_row+xcrement_var, column_left-xcrement_var, xcrement_var);
                            nines = 0;
                            return;
                        end
                        
                    elseif(stage==2)
                        if(matrix(new_row_left+xcrement_var, column_left - xcrement_var)==0 && matrix(new_row + xcrement_var, column_right+xcrement_var)==0 && xcrement_var < 10)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 10)
                            new_row_left = new_row_left + xcrement_var+2;
                            column_left = column_left - xcrement_var-2;
                            column_right = column_right + xcrement_var;
                            new_row = new_row + xcrement_var;
                            stage = stage + 1;
                            xcrement_var = 0;
                        else
                            fprintf("Not a nine\n");
%                             fprintf("%d, %d, %d", new_row+xcrement_var, column_left-xcrement_var, xcrement_var);
                            nines = 0;
                            return;
                        end
                    
                    elseif(stage==3)
                        if(matrix(new_row_left + xcrement_var, column_left)==0 && matrix(new_row+xcrement_var, column_right)==0 && xcrement_var < 12)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var ==12)
                            new_row_left = new_row_left + xcrement_var;
                            new_row = new_row + xcrement_var;
                            stage = stage + 1;
                            xcrement_var = 0;
                        else
                            fprintf("Not a nine\n");
                            fprintf("\n e \n")
%                             fprintf("%d, %d, and %d %d", new_row_left+xcrement_var, column_left, new_row+xcrement_var, column_right);
                            nines = 0;
                            return;
                        end
    
                    elseif(stage==4)  % focusing on the left vector
                            if(matrix(new_row_left+xcrement_var, column_left+xcrement_var)==0 && xcrement_var < 6)
                                xcrement_var = xcrement_var + 1;
                            elseif(xcrement_var == 6)
                                new_row_left = new_row_left + xcrement_var;
                                column_left = column_left + xcrement_var;
                                xcrement_var = 0;
                                stage = stage + 1;
                            else
                                fprintf("Not a nine\n");
%                                 fprintf("%d %d", new_row_left +  xcrement_var, column_left+xcrement_var);
                                nines = 0;
                                return;
                            end
            
                    elseif(stage==5)
                        if(matrix(new_row_left, column_left+xcrement_var)==0 && xcrement_var < 13)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 13)
                            column_left = column_left + xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else
                            fprintf("Not a nine\n");
                            nines = 0;
%                             fprintf("%d, %d", new_row_left, column_left + xcrement_var);
                            return;
                        end

                    % continuing with the right branch

                    elseif(stage==6)
%                         fprintf("%d, %d, %d\n", xcrement_var, new_row, column_right);
                        if(matrix(new_row+xcrement_var, column_right)==0 && xcrement_var < 19)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 19)
                            new_row = new_row+xcrement_var-1;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else
                            fprintf("Not a nine\n");
%                              fprintf("%d, %d, %d", xcrement_var, new_row+xcrement_var, column_right);
                            nines = 0;
                            return;
                        end
                    elseif(stage==7)
                        if(matrix(new_row+xcrement_var, column_right-xcrement_var)==0 && xcrement_var < 11)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 11)
                            new_row = new_row+xcrement_var;
                            column_right = column_right - xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                           
                        else
                            fprintf("Not a nine\n");
                            fprintf("%d, %d", new_row + xcrement_var, column_right-xcrement_var);
                            nines = 0;
                            return;
                        end
                    elseif(stage==8)
                        if(matrix(new_row, column_right-xcrement_var)==0 && xcrement_var < 19)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 19)
                            stage = stage + 1;                         
                        else
                            fprintf("Not a nine\n");
                            nines = 0;
                            return;
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