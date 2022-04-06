function fives = findingfives(matrix)
    [rows, columns] = size(matrix);
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
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
                test = false;  % sentinel variable
                xcrement_var = 0;
                stage = 1;  % this is going to be the variable that contains the sta
                % of the loop, i.e what vector to initialise

                while ~test
                    if(stage==1)
                        if(matrix(row, column+xcrement_var)==0 && xcrement_var < 30)
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 30)
                            stage = stage + 1;
                            xcrement_var = 0;
                        else
                            fprintf("Not a five\n");
                            
                            fives = 0;
                            return;
                        end
                    elseif(stage==2)
                        if(matrix(row+xcrement_var, column)==0 && xcrement_var < 33)
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 33)
                            stage = stage + 1;
                            new_row = row + xcrement_var;
                            new_column = column;
                            xcrement_var = 0;
                        else
                            fprintf("Not a five\n");                            
                            fives = 0;
                            return;
                        end
                    elseif(stage == 3)
                        if(matrix(new_row, new_column+xcrement_var)==0 && xcrement_var < 23)
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 23)
                            stage = stage + 1;
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                        else
                            fprintf("Not a five\n");
                            fives = 0;
                            return;
                        end
                    elseif(stage == 4)
                        if(matrix(new_row + xcrement_var, new_column+xcrement_var)==0 && xcrement_var < 16)
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 16)
                            stage = stage + 1;
                            new_row = new_row + xcrement_var + 4;
                            new_column = new_column + xcrement_var;
                            xcrement_var =0;
                        else
                            fprintf("Not a five\n");
                            fives = 0;
                            return;
                        end
                    elseif(stage == 5)
                        if(matrix(new_row - xcrement_var, new_column-xcrement_var)==0 && xcrement_var < 18)
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 18)
                            stage = stage + 1;
                            new_row = new_row + xcrement_var;
                            new_column = new_column - xcrement_var;
                            xcrement_var = 0;
                        else
                            fprintf("Not a five\n");
                            fives = 0;
                            return;
                        end
                    elseif(stage == 6)
                        if(matrix(new_row, new_column-xcrement_var)==0 && xcrement_var < 27)
                            xcrement_var =  xcrement_var + 1;
                        elseif(xcrement_var == 27)
                            test = true;
                        else
                            fprintf("Not a five\n");
%                             fprintf("1");
%                             fprintf("%d, %d", row, column+xcrement_var);
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
