function fours = findingfours(matrix)
    [rows, columns] = size(matrix);
    
    % logic for fours:
    % we consider the left branch first:
    % we move 4 rows down  to centre the vector
        % and then if we are still on a black pixel we move 19 rows down and 19 columns left
        % but we will split this into two vectors one moving 7 down and left and another moving 12 down and left, as this allows us to centralise the vector
    % if every pixel we have iterated over was black we can then move 8 rows down
    % we have now iterated over the left diagonal branch of the 4, and we must now iterate flat right and then down and up along the vertical component of the 4
    % if every pixel we iterated over was black we can now move 36 columns to the right as this will take us along the horizontal branch of the 4
    % If all of the pixels iterated over in the previous vector was black we can move 15 columns backwards into the centre of the vertical branch of the 4
    % we need to now move 12 pixels down and then 46 pixels up, and if every pixel we iterate over is black we have a 4, as all of the vector tests
    % have passed. And we modeled each vector test against the 4, so we now know that we have a 4.

    % iterating over every pixel in the matrix and if that pixel is black (0) implementing our logic to test if the shape attached to the pixel
    % is a four
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0) % if the pixel is black implementing our logic to test that it is a four
                
                initial_row = row + 4;  % moving down so that we are in the centre of the shape
                initial_column = column; % initialising the variable to control the initial column

                for i = 1:7
                    if(matrix(initial_row+i, initial_column-i)~=0) % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==7) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                        new_row = initial_row + i + 8;  % updating our initial point for the next vector -> using an additional nine pixels to move to the bottom of the four left branch
                        new_column = initial_column - i;
                    end
                end

                for i = 1:12
                    if(matrix(new_row+i, new_column-i)~=0) % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==12) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                        new_row = new_row + i+8;
                        new_column = new_column - i;
                    end
                end

                for i = 1:36
                    if(matrix(new_row, new_column+i)~=0) % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==36) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                        new_column = new_column + i - 10;
                    end
                end
                
                for i = 1:12
                    if (matrix(new_row + i, new_column)~=0) % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==12) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                        new_row = new_row + i;
                    end
                end
                
                for i =1:46
                    if (matrix(new_row - i, new_column)~=0) % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    end
                end
                
                % as every vector test has passed when can return that a four was found to the main function
                fprintf("A four was found\n");
                fours = 1;
                return;
            end
        end
    end
    fours = 0;
end
