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
    
        % iterating over every pixel in the matrix and if that pixel is black (0) implementing our logic to test if the shape attached to the pixel
    % is a four
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0) % if the pixel is black implementing our logic to test if the number attached is a four
                % initialising our variables
                initial_row = row + 6;
                initial_column = column;

                for i = 1:13 % moving 13 pixels down and left
                    if(matrix(initial_row+i, initial_column-i)~=0) % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==13) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                        new_row = initial_row + i + 12; % updating the row and centering it in the line
                        new_column = initial_column - i;
                    end
                end

                for i = 1:13 % moving another 13 pixels down and left
                    if(matrix(new_row+i, new_column-i)~=0) % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==13) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                        new_row = new_row + i+10; % updating the new row and centering it
                        new_column = new_column - i;
                    end
                end

                for i = 1:47 % moving 47 pixels right
                    if(matrix(new_row, new_column+i)~=0) % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==47) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                        new_column = new_column + i - 15; % centering the column in the middle of the vertical line of the four
                    end
                end
                
                for i = 1:22 % moving 22 pixels down
                    if (matrix(new_row + i, new_column)~=0) % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==22) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                        new_row = new_row + i;
                    end
                end
                
                for i =1:56
                    if (matrix(new_row - i, new_column)~=0) % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    end
                end 
                
                % as we have passed all vector tests for the four, we know that we have a four
                fprintf("A four was found\n");
                fours = 1;
                return;
            end
        end
    end
    fours = 0;
end
