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

                for i = 1:13 % moving 13 rows down and 13 columns left along the diagonal of the four
                    if(matrix(initial_row+i, initial_column-i)~=0) % if a pixel is not black in this vector
                        % returning to the main function
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==13) % if all of the pixels were black continuing with our logic
                        new_row = initial_row + i + 12; % moving 12 down so that we are in the centre of the diagonal 
                        % branch of the 4
                        new_column = initial_column - i;
                    end
                end

                for i = 1:13 % moving 13 down and left to continue on the diagonal branch of the four.
                    if(matrix(new_row+i, new_column-i)~=0)% if a pixel is not black in this vector
                        % returning to the main function
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==13)  % if all of the pixels were black continuing with our logic
                        new_row = new_row + i+10;
                        new_column = new_column - i;
                    end
                end

                for i = 1:47 % moving 47 columns to the right to test that each pixel in that vector is black
                    % this is the central horizontal branch of the 4.
                    if(matrix(new_row, new_column+i)~=0)% if a pixel is not black in this vector
                        % returning to the main function
                        fprintf("Not a four\n");
                        fprintf("1");
                        fprintf("%d, %d, %d", new_row, new_column+i, i);

                        fours = 0;
                        return;
                    elseif(i==47)  % if all of the pixels were black continuing with our logic
                        new_column = new_column + i - 15;
                    end
                end
                
                for i = 1:22 % moving 22 rows down to the bottom of the four to check that every pixel is still black
                    if (matrix(new_row + i, new_column)~=0)% if a pixel is not black in this vector
                        % returning to the main function
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    elseif(i==22)  % if all of the pixels were black continuing with our logic
                        new_row = new_row + i;
                    end
                end
                
                for i =1:56 % moving 56 columns upwards to check that every pixel is still black
                    if (matrix(new_row - i, new_column)~=0)% if a pixel is not black in this vector
                        % returning to the main function
                        fprintf("Not a four\n");
                        fours = 0;
                        return;
                    end
                end
                
                % as all of the vector tests have passed, we know that the shape fits the model
                % of a four, and hence we can return that a four was found
                fprintf("A four was found\n");
                fours = 1;
                return;
            end
        end
    end
    fours = 0;
end
