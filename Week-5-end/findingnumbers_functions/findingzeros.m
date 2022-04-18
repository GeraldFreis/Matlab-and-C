function zeros = findingzeros(matrix)
   [rows, columns] = size(matrix);

   for row = 1:rows
       for column = 1:columns
            if(matrix(row, column)==0)
                test = false;  % sentinel variable
                xcrement_var = 0;
                stage = 1;  % this is going to be the variable that contains the sta
                % of the loop, i.e what vector to initialise
                column_left = column+5;
                column_right = column+5;
                new_row = row + 2;

                while ~test
                    if(stage==1)
                        if(matrix(new_row+xcrement_var, column_left-xcrement_var)==0 && matrix(new_row+xcrement_var, column_right+xcrement_var)==0 && xcrement_var < 20)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==20)
                            column_left = column_left - xcrement_var;
                            column_right = column_right + xcrement_var;
                            new_row = new_row + xcrement_var;
                            xcrement_var = 0;
                            stage = 2 ;
                        else
                            fprintf("Not a zero");
                            zeros = 0;
                            return;
                        end
                    if(stage==2)
                        if(matrix(new_row+xcrement_var, column_left-xcrement_var)==0 && matrix(new_row+xcrement_var, column_right+xcrement_var)==0 && xcrement_var < 20)
                        end
                        end
                    end
                end
            end
       end
   end
end