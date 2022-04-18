function threes = findingthrees(matrix)
    [rows, columns] = size(matrix);  % finding the rows and columns we have to iterate over to find the first black pixel, and
    % apply our logic for three, to test if the number is a three.

    % logic for threes:
    % we consider the left branch (from the top of the three) first:
        % We move from the top to the centre of the left branch by moving
           % moving 9 down and 9 left, and then 6 upwards
       % We then move 7 left and that takes us to the end of the left branch from the top of the three
       % if every pixel we have passed over in the previous two vectors was black, then we have passed the test for the left branch of the three
       % and we can continue with the rest of the shape
       % if not we return to the main function

    % now we must move over the rest of the shape to test if it is a three.
        % First we must move around the first curve of the 3.
            % we do this by moving 8 right and 8 down and then 7 rows up, as this brings us to the bottom of the height of the 3's branch
            % we then want to continue moving down and right to reach the rightmost point of the first curve of the 3:
                % we move 16 down and right
            % if every pixel we have iterated across was a black pixel then we have passed these two stages
        % We are now at the rightmost point of our first curve of the 3. Hence, we need to move inward
            % we move 10 down and left for our 3rd stage, and now we also want to move 5 rows down to recentre our vector
            % we now move 6 down and left and that brings us to the middle of the three
        % now that we are in the middle of the three, we need to move around the second curve of the three
            % we need to now move 20 down and right to take us to the rightmost point of the second curve
            % as we are now at the rightmost point of the second curve, we have to move inwards to take us down to the bottom of the 3
            % so we move 20 down and left
        % now we are at the tail of the 3, so we need to move 13 pixels left, and then 12 pixels up and left
        
    % if every pixel we have iterated over was a black, and we have reached this final pixel and it is still black, we have a 3.

    % iterating over every pixel in the matrix and if the pixel is black implementing our logic to test if the number the pixel is attached to is a 3
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0) % if the pixel is black
                
                % moving down the first branch
                for i = 1:9  % moving 9 down and left
                    if(matrix(row+i, column-i)~=0) % if the pixel is no longer black we return to the main function as this vector has not passed the test
                        fprintf("Not a three\n");
                        threes = 0;
                        return;
                    elseif(i==9)  % if all pixels iterated over were black and we are now at the 9th pixel, we can return the new_row and column to the 
                        % next vector, so that we can start iterating from there
                        new_row = row + i - 6;
                        new_column = column-i;
                    end
                end
                for i = 1:7 % moving 7 down and left
                    if(matrix(new_row+i, new_column-i)~=0) % if the pixel is no longer black we return to the main function as this vector has not passed the test
                        fprintf("Not a three\n");
                        threes = 0;
                        return;
                    end
                end

                % now that the 1st left branch has passed we can move on to the rest
                for i = 1:8 % moving 8 right and 8 down
                    if(matrix(row + i, column + i)~=0) % if the pixel is no longer black we return to the main function as this vector has not passed the test
                        fprintf("Not a three\n");
                        threes = 0;
                        return;
                    elseif(i==8) %if all pixels iterated over were black and we are now at the 8th pixel, we can return the new_row and column to the 
                        % next vector, so that we can start iterating from there
                        new_row = row+i-7;
                        new_column = column + i;
                    end
                end
                
                for i = 1:16 % moving 16 right and 16 down
                    if(matrix(new_row + i, new_column + i)~=0) % if the pixel is no longer black we return to the main function as this vector has not passed the test
                        fprintf("Not a three\n");
                        threes = 0;
                        return;
                    elseif(i==16)  % if all pixels iterated over were black and we are now at the 16th pixel, we can return the new_row and column to the 
                        % next vector, so that we can start iterating from there
                        new_row = new_row+i;
                        new_column = new_column + i;
                    end
                end

                for i = 1:10 % moving 10 down and left
                    if(matrix(new_row + i, new_column - i)~=0) % if the pixel is no longer black we return to the main function as this vector has not passed the test
                        fprintf("Not a three\n");
                        threes = 0;
                        return;
                    elseif(i==10)  % if all pixels iterated over were black and we are now at the 10th pixel, we can return the new_row and column to the 
                        % next vector, so that we can start iterating from there
                        new_row = new_row+i+5;
                        new_column = new_column - i;
                    end
                end

                for i = 1:6
                    if(matrix(new_row + i, new_column - i)~=0) % if the pixel is no longer black we return to the main function as this vector has not passed the test
                        fprintf("Not a three\n");
                        threes = 0;
                        return;
                    elseif(i==6)  % if all pixels iterated over were black and we are now at the 6th pixel, we can return the new_row and column to the 
                        % next vector, so that we can start iterating from there
                        new_row = new_row+i;
                        new_column = new_column - i;
                    end
                end

                for i = 1:20
                    if(matrix(new_row + i, new_column + i)~=0) % if the pixel is no longer black we return to the main function as this vector has not passed the test
                        fprintf("Not a three\n");
                        threes = 0;
                        return;

                    elseif(i==20)  % if all pixels iterated over were black and we are now at the 20th pixel, we can return the new_row and column to the 
                        % next vector, so that we can start iterating from there
                        new_row = new_row + i;
                        new_column = new_column + i;
                    end
                end
                
                for i = 1:19
                    if(matrix(new_row + i, new_column - i)~=0) % if the pixel is no longer black we return to the main function as this vector has not passed the test
                        fprintf("Not a three\n");
                        threes = 0;
%                         fprintf("1");
                        return;
                    elseif(i==19)  % if all pixels iterated over were black and we are now at the 19th pixel, we can return the new_row and column to the 
                        % next vector, so that we can start iterating from there
                        new_row = new_row + i;
                        new_column = new_column - i;

                    end
                end

                for i = 1:13
                    if(matrix(new_row, new_column - i)~=0) % if the pixel is no longer black we return to the main function as this vector has not passed the test
                        fprintf("Not a three\n");
                        threes = 0;
                        return;
                    elseif(i==13)  % if all pixels iterated over were black and we are now at the 13th pixel, we can return the new column to the 
                        % next vector, so that we can start iterating from there
                        new_column = new_column - i;
                    end
                end

                for i = 1:11
                    if(matrix(new_row - i, new_column - i)~=0) % if the pixel is no longer black we return to the main function as this vector has not passed the test
                        fprintf("Not a three");
                        threes = 0;
                        fprintf("%d, %d", new_row-i, new_column-i);
                        return;
                    elseif(i==11)  % if all pixels iterated over were black and we are now at the 11th pixel, we can return the new_row and column to the 
                        % next vector, so that we can start iterating from there
                        new_row = new_row-i;
                        new_column = new_column - i;
                    end
                end
                
                % as all of the vector tests were passed we have a three
                fprintf("A three was found\n");
                threes = 1;
                return;

            end
        end
    end
    threes=0;
end
