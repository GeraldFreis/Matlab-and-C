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
                initial_row = row + 4;  % moving down so that we are in the centre of the shape
                initial_column = column;

                for i = 1:7
                    if(matrix(initial_row+i, initial_column-i)~=0)
                        fprintf("Not a four\n");
%                         fprintf("1");

                        fours = 0;
                        return;
                    elseif(i==7)
                        new_row = initial_row + i + 8;  % updating our initial point for the next vector -> using an additional nine pixels to move to the bottom of the four left branch
                        new_column = initial_column - i;
                    end
                end

                for i = 1:12
                    if(matrix(new_row+i, new_column-i)~=0)
                        fprintf("Not a four\n");
%                         fprintf("1")
                        fours = 0;
                        return;
                    elseif(i==12)
                        new_row = new_row + i+8;
                        new_column = new_column - i;
                    end
                end

                for i = 1:36
                    if(matrix(new_row, new_column+i)~=0)
                        fprintf("Not a four\n");
%                         fprintf("1");
%                         fprintf("%d, %d, %d", new_row, new_column+i, i);
                        fours = 0;
                        return;
                    elseif(i==36)
                        new_column = new_column + i - 10;
                    end
                end
                
                for i = 1:12
                    if (matrix(new_row + i, new_column)~=0)
                        fprintf("Not a four\n");
                        fours = 0;
%                          fprintf("1");

                        return;
                    elseif(i==12)
                        new_row = new_row + i;
                    end
                end
                
                for i =1:46
                    if (matrix(new_row - i, new_column)~=0)
                        fprintf("Not a four\n");
                        fours = 0;
                        fprintf("1");
                        return;
                    end
                end

                fprintf("A four was found\n");
                fours = 1;
                return;
            end
        end
    end
    fours = 0;
end