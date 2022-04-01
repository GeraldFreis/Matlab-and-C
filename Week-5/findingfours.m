function fours = findingfours(matrix)
    [rows, columns] = size(matrix);

    % logic for threes:
    % we consider the left branch first:
    % we move 5 down and then 17 down and left
    % move 15 down
    % move 15 down and left
    % move 475-422
    % move 286-308 down
    % move 286-232 up


    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
                initial_row = row + 6;
                initial_column = column;

                for i = 1:13
                    if(matrix(initial_row+i, initial_column-i)~=0)
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==13)
                        new_row = initial_row + i + 12;
                        new_column = initial_column - i;
                    end
                end

                for i = 1:13
                    if(matrix(new_row+i, new_column-i)~=0)
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==13)
                        new_row = new_row + i+10;
                        new_column = new_column - i;
                    end
                end

                for i = 1:47
                    if(matrix(new_row, new_column+i)~=0)
                        fprintf("Not a four\n");
                        fprintf("1");
                        fprintf("%d, %d, %d", new_row, new_column+i, i);

                        fours = 0;
                        return;
                    elseif(i==47)
                        new_column = new_column + i - 15;
                    end
                end
                
                for i = 1:22
                    if (matrix(new_row + i, new_column)~=0)
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==22)
                        new_row = new_row + i;
                    end
                end
                
                for i =1:56
                    if (matrix(new_row - i, new_column)~=0)
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    end
                end

                fprintf("A four was found\n");
                fours = 1;
                return;
            end
        end
    end
end