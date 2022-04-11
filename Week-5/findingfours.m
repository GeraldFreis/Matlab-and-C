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
    
    % iterating across every pixel in the matrix and if that pixel is black, implementing our logic to test if the number is a 4.
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0) % if the pixel is black (0)
                
                % initialising the variables
                initial_row = row + 6; % centering the row
                initial_column = column; % initialising the column

                for i = 1:13 % moving 13 pixels down and left
                    if(matrix(initial_row+i, initial_column-i)~=0) % if the current pixel is not black we have failed this vector test
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==13) % if all of the pixels were black we can continue with our vector tests
                        new_row = initial_row + i + 12; % updating the row and column so that the next vector moves from the terminal point of this vector
                        new_column = initial_column - i;
                    end
                end

                for i = 1:13
                    if(matrix(new_row+i, new_column-i)~=0) % if the current pixel is not black we have failed this vector test
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==13)  % if all of the pixels were black we can continue with our vector tests
                        new_row = new_row + i+10; % updating the row and column so that the next vector moves from the terminal point of this vector
                        new_column = new_column - i;
                    end
                end

                for i = 1:47
                    if(matrix(new_row, new_column+i)~=0) % if the current pixel is not black we have failed this vector test
                        fprintf("Not a four\n");
                        fprintf("1");
                        fprintf("%d, %d, %d", new_row, new_column+i, i);

                        fours = 0;
                        return;
                    elseif(i==47)  % if all of the pixels were black we can continue with our vector tests
                        new_column = new_column + i - 15; % updating the column so that the next vector moves from the terminal point of this vector
                    end
                end
                
                for i = 1:22
                    if (matrix(new_row + i, new_column)~=0) % if the current pixel is not black we have failed this vector test
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==22)  % if all of the pixels were black we can continue with our vector tests
                        new_row = new_row + i; % updating the row  so that the next vector moves from the terminal point of this vector
                    end
                end
                
                for i =1:56
                    if (matrix(new_row - i, new_column)~=0) % if the current pixel is not black we have failed this vector test
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    end % if every pixel iterated over is black returning to the calling function with the information that all vector tests were passed
                end

                fprintf("A four was found\n");
                fours = 1;
                return;
            end
        end
    end
end
