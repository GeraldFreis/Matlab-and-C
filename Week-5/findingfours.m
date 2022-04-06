function fours = findingfours(matrix)
    [rows, columns] = size(matrix);

    % logic for fours:
    % we consider the left branch first:
    % we move 5 rows down  to centre the vector
        % and then if we are still on a black pixel we move 17 rows down and 17 columns left
    % if every pixel we have iterated over was black we can then move 15 rows down
    % if every pixel we iterated over was black we can now move 15 rows down and 15 columns left
    % we have now iterated over the left diagonal branch of the 4, and we must now iterate flat right and then up and down
    % if every pixel we iterated over was black we can now move 47 columns to the right as this will take us down the horizontal branch of the 4
    % If all of the pixels iterated over in the previous vector was black we can move 15 columns backwards into the centre of the vertical branch of the 4
    % we need to now move 22 pixels down and then 56 pixels up, and if every pixel we iterate over is black we have a 4, as all of the vector tests
    % have passed. And we modeled each vector test against the 4, so we now know that we have a 4.

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
