function threes = findingthrees_deprecated(matrix)
    [rows, columns] = size(matrix);

    % logic for threes:
    % we consider the left branch first:
        % We move from the top to the centre of the left branch by moving
           % moving 9 down and 9 left, and then 6 upwards
           % then  7 left

    %if this works we move back to the top:
        % and go 8 right and 8 down
        % then move up 7
        % then we move 16 down and right
        % then 10 down and left
        % then 5 down
        % then 6 down and left
        % then 20 down and right
        % then 20 down and left
        % then 13 left
        % then 12 up and left
    % if this works it is a 3


    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
                % moving down the first branch
                for i = 1:9
                    if(matrix(row+i, column-i)~=0)
                        fprintf("Not a three\n");
                        threes = 0;
                        return;
                    elseif(i==9)
                        new_row = row + i - 6;
                        new_column = column-i;
                    end
                end
                for i = 1:7
                    if(matrix(new_row+i, new_column-i)~=0)
                        fprintf("Not a three\n");
                        threes = 0;
                        return;
                    end
                end

                % now that the 1st left branch has passed we can move on to the rest
                for i = 1:8 % moving 8 right and 8 down
                    if(matrix(row + i, column + i)~=0)
                        fprintf("Not a three\n");
                        threes = 0;
                        return;
                    elseif(i==8)
                        new_row = row+i-7;
                        new_column = column + i;
                    end
                end
                
                for i = 1:16 % moving 16 right and 16 down
                    if(matrix(new_row + i, new_column + i)~=0)
                        fprintf("Not a three\n");
                        threes = 0;
                        return;
                    elseif(i==16)
                        new_row = new_row+i;
                        new_column = new_column + i;
                    end
                end

                for i = 1:10 % moving 10 down and left
                    if(matrix(new_row + i, new_column - i)~=0)
                        fprintf("Not a three\n");
                        threes = 0;
                        return;
                    elseif(i==10)
                        new_row = new_row+i+5;
                        new_column = new_column - i;
                    end
                end

                for i = 1:6
                    if(matrix(new_row + i, new_column - i)~=0)
                        fprintf("Not a three\n");
                        threes = 0;
                        return;
                    elseif(i==6)
                        new_row = new_row+i;
                        new_column = new_column - i;
                    end
                end

                for i = 1:20
                    if(matrix(new_row + i, new_column + i)~=0)
                        fprintf("Not a three\n");
                        threes = 0;
                        return;

                    elseif(i==20)
                        new_row = new_row + i;
                        new_column = new_column + i;
                    end
                end
                
                for i = 1:19
                    if(matrix(new_row + i, new_column - i)~=0)
                        fprintf("Not a three\n");
                        threes = 0;
%                         fprintf("1");
                        return;
                    elseif(i==19)
                        new_row = new_row + i;
                        new_column = new_column - i;

                    end
                end

                for i = 1:13
                    if(matrix(new_row, new_column - i)~=0)
                        fprintf("Not a three\n");
                        threes = 0;
                        return;
                    elseif(i==13)
                        new_column = new_column - i;
                    end
                end

                for i = 1:11
                    if(matrix(new_row - i, new_column - i)~=0)
                        fprintf("Not a three");
                        threes = 0;
                        fprintf("%d, %d", new_row-i, new_column-i);
                        return;
                    elseif(i==11)
                        new_row = new_row-i;
                        new_column = new_column - i;
                    end
                end
                
                fprintf("A three was found\n");
                threes = 1;
                return;

            end
        end
    end
    threes=0;
end
