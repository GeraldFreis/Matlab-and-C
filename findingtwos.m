%%finding twos in the matrices
function twos = findingtwos(matrix)
    [rows, columns] = size(matrix); % finding the rows and columns of the matrix so we can iterate over every pixel in the matrix

    % logic for twos:
    % we consider the left branch first:
        % we do this by having two vectors the first that moves from the first 
        % zero on the top, down by 10 and left by 10. We move 10 rows up
        % Then we move 4 down and 4 left, and the element to the left of that should be a 0
    %if this works we move back to the top:
        % we then move 11 down and 11 right
        % if this is still a zero we move up 9, if this is a zero we move 15 down and 15 right
        % if this is still a zero we move 10 down and left
        % if this is still a zero we move 11 down
        % if this is still a zero we move 32 left and 32 down
        % if this is still a zero we move 5 down and then 45 right
        % if this is a zero we have a 2
    
    % iterating over every pixel in the matrix and testing if the pixel is black (0) and if so implementing our logic to test if the number
    % attached to this pixel is a two
    for row = 1:rows
        for column = 1:columns

            % testing to check if it is a zero and if so progression w our logic
            if(matrix(row, column)==0)


                % moving down the left branch of the 2
                for i = 1:8
                    if(matrix(row+i, column-i)~=0) % if the current pixel iterated over is not black we do not have a two and hence return to the calling function w this information
                        fprintf("not a two\n");
                        twos = 0;
                        return;
                    elseif(i==8) % if every pixel iterated over was black we update the row and column to the terminal row and colum of this vector
                        new_row = row+i-4; % moving the row back up
                        new_column = column-i;
                    end
                end

                for i = 1:4
                    if(matrix(new_row+i, new_column-i)~=0) % if the current pixel iterated over is not black we do not have a two and hence return to the calling function w this information
                        fprintf("not a two\n");
                        twos = 0;
                        return;                       
                    end
                end

                % as the number has passed these tests, we can move back to the top of the two and try
                % the rest of the shape
                for i = 1:6
                    if(matrix(row+i, column+i)~=0) % if the current pixel iterated over is not black we do not have a two and hence return to the calling function w this information
                        fprintf("not a two\n");
                         fprintf("3");
                        twos = 0;
                        return;
                    elseif(i==6) % if every pixel iterated over was black we update the row and column to the terminal row and colum of this vector
                        new_row = row+i-5;  % balancing the movement
                        new_column = column+i;
                    end
                end
                
                % moving right and down to the rightmost part of the curve of the 2.
                for i = 1:12
                    if(matrix(new_row+i, new_column+i)~=0) % if the current pixel iterated over is not black we do not have a two and hence return to the calling function w this information
                        fprintf("not a two\n");
                         fprintf("4");
                        twos = 0;
                        return;
                    elseif(i==12) % if every pixel iterated over was black we update the row and column to the terminal row and colum of this vector
                        new_row = new_row + i+5;
                        new_column = new_column + i;
                    end
                end

               %moving back inwards:
               for i = 1:9
                   if(matrix(new_row+i, new_column-i)~=0) % if the current pixel iterated over is not black we do not have a two and hence return to the calling function w this information
                        fprintf("not a two\n");
                        twos = 0;
                        return;
                   elseif(i==9) % if every pixel iterated over was black we update the row and column to the terminal row and colum of this vector
                       new_row = new_row + i + 6;
                       new_column = new_column - i;
                   end
               end

               for i = 1:20
                   if(matrix(new_row + i, new_column - i)~=0) % if the current pixel iterated over is not black we do not have a two and hence return to the calling function w this information
                       fprintf("not a two\n");
                       twos = 0;
                       return;
                   elseif(i==20) % if every pixel iterated over was black we update the row and column to the terminal row and colum of this vector
                       new_row = new_row + i;
                       new_column = new_column - i;

                   end
               end

               % now iterating to the bottom right of the bottom branch to determine if its a two
               for i = 1:32
                   if(matrix(new_row, new_column +i)~=0) % if the current pixel iterated over is not black we do not have a two and hence return to the calling function w this information
                       fprintf("not a two\n"); 
                       twos = 0;
                       return;
                   elseif(i==32) % if every pixel iterated over was black we update the row and column to the terminal row and colum of this vector
                       new_column = new_column + i;
                   end
               end
                
               % as all of the vector tests have passed, we know that we have a two and need to return this information to the calling function
               fprintf("A two was found\n");
               twos = 1;
               return;

            end
        end
    end
    twos = 0;
end
