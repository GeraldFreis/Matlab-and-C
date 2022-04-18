function division = findingdivision(matrix)
    [rows, columns] = size(matrix);
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, columns)==0)

                test = false;
                xcrement_var = 0;
                stage = 1;

                while ~test
                    if(stage==1)
                        new_row = row + 12;
                        if(matrix(new_row + 3 * xcrement_var, column - xcrement_var)==0 && xcrement_var < 9)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 9)
                            new_row = new_row + 3 * xcrement_var;
                            new_column = column - xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else
                            fprintf("Not a divisor\n");
                            division = 0;
                            return;
                        end
                    elseif(stage==2)
                        if(matrix(new_row + xcrement_var, new_column - xcrement_var)==0 && xcrement_var < 8)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 8)
                            division = 1;
                            fprintf("A division symbol was found\n");
                            return;
                        else
                            division = 0;
                            fprintf("Not a divisor\n");
                            return;
                        end
                    end
                end
            end
        end
        division = 1;
        fprintf("A division symbol was found\n");
        return;
    end
end