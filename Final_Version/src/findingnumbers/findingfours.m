function fours = findingfours(matrix)
    [rows, columns] = size(matrix);  % finding the rows and columns of the matrix

     % logic for fours:
    % we consider the left branch first:
    % we move 4 rows down  to centre the vector
        % and then if we are still on a black pixel we move 7 rows down and 7 columns left
    % if every pixel we have iterated over was black we can then move 12 rows down
    % we have now iterated over the left diagonal branch of the 4, and we must now iterate flat right and then up and down
    % if every pixel we iterated over was black we can now move 36 columns to the right as this will take us down the horizontal branch of the 4
    % If all of the pixels iterated over in the previous vector was black we can move 10 columns backwards into the centre of the vertical branch of the 4
    % we need to now move 12 pixels down and then 46 pixels up, and if every pixel we iterate over is black we have a 4, as all of the vector tests
    % have passed. And we modeled each vector test against the 4, so we now know that we have a 4.
    
    %% iterating over every pixel in the matrix, and if it is black applying our logic for the number four
    % onto it. If it passes each test / stage / vector, we have a four
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)

                %% initialising variables
                initial_row = row + 5;  % moving down so that we are in the centre of the shape
                initial_column = column;
                
                % program takes 0.067 seconds just with for loops and 0.045 with the modular
                % findingnumbers function
                
                %% the first stage, where we want to move 7 down and left
                 if(findingnumbers("downleft", 7, initial_row, initial_column, matrix)~=true) % if every pixel iterated over in the vector is not black
                     fprintf("Not a 4\n");
                     fours = 0;
                     return;
                 else % if every pixel iterated over in the vector was black
                     new_row = initial_row + 15;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                     new_column = initial_column - 7;
                 end
                
                 %% the second stage, where we want to move 12 down and left
                if(findingnumbers("downleft", 12, new_row, new_column, matrix)~=true) % if every pixel iterated over in the vector is not black
                     fprintf("Not a 4\n");
                     fours = 0;
                     return;
                else % if every pixel iterated over in the vector was black
                     new_row = new_row + 20;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                     new_column = new_column - 12;
                 end
                
                 %% the third stage where we are now on the horizontal of the four and to test if it is a
                 % four, we need to move 36 horizontally right
                if(findingnumbers("right", 36, new_row, new_column, matrix)~=true) % if every pixel iterated over in the vector is not black
                     fprintf("Not a 4\n");
                     fours = 0;
                     return;
                else % if every pixel iterated over in the vector was black
                     new_column = new_column + 26;  % 26 as we have to move 10 back inward to be in the vertical component of 4
                end
                
                %% the fourth stage where we need to move to the bottom of the vertical component of the 4
                if(findingnumbers("down", 12, new_row, new_column, matrix)~=true) % if every pixel iterated over in the vector is not black
                     fprintf("Not a 4\n");
                     fours = 0;
                     return;
                else % if every pixel iterated over in the vector was black
                     new_row = new_row + 12;  % updating the row so that the terminal row and column of this vector are the initial row and columns of the next vector
                end
                
                %% the final stage where we need to iterate to the top of the 4, and if all pixels passed
                % over are black we have a 4.
                if(findingnumbers("up", 7, new_row, new_column, matrix)~=true) % if every pixel iterated over in the vector is not black
                     fprintf("Not a 4\n");
                     fours = 0;
                     return;
                 end
                
                 % as we have passed all vector tests we have a four
                fprintf("A four was found\n");
                fours = 1;
                return;
            end
        end
    end
    fours = 0;
end