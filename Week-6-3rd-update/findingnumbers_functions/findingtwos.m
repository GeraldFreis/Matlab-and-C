function twos = findingtwos(matrix)
    [rows, columns] = size(matrix);

    % logic for twos:
        % with this reimplementation of the code, we will be using stages as opposed to the initial for
        % loops we used. By stages I mean that there will be one while loop with conditional stages that
        % will use implement the logic for each stage. Here a stage is a vector, and the different stages
        % chooses the vector to apply to the image. We will use a while loop with a sentinal and a stages
        % variable that is initially equal to 1. For the increments of each stage we will use the
        % 'xcrement_var' that exists within all other functions, we will also update the row and column
        % that the next vector must move from after each stage. In mathematics what we are really doing
        % is taking the terminal point or termination point for the vector, and that is our initial point
        % for the next vector. I will update the initial point when the xcrement_var has reached its
        % required length of the vector, as this will decrease time complexity rather than incrementing
        % the row and column for every pixel that is a zero.
    % we consider the left branch first:
        % we do this by having two vectors the first that moves from the first zero on the top, down by 8 and left by 8. 
        % We then move 4 rows up 
        % Then we move 4 down and 4 left, and the element to the left of that should be a 0, if it is
        % then we have passed the checks for the left branch of the two
    %if this works we move back to the top, and we progress to the rest of the two:
        % we then move 6 down and 6 right
        % if this is still a zero we move up 5, if this is a zero we move 12 down and 12 right.
        % After this we move 5 down
        % if this is still a zero we move 9 down and  9 left, which takes us inwards
        % if this is still a zero we move 6 down
        % if this is still a zero we move 20 left and 20 down
        % if this is still a zero we move 32 right
        % if this is a zero we have a 2
    
    % iterating over each pixel in the matrix
    for row = 1:rows
        for column = 1:columns

            % testing to check if the pixel is a zero (black) and if so progressing w our logic
            if(matrix(row, column)==0)
                test = false; % sentinal test
                stage = 1;

                while ~test % using a while loop to iterate through the stages
                    % moving down the left branch of the two
                    if(stage==1) % commencing with the first vector that moves 8 down and left
                        if(findingnumbers("downleft", 8, row, column, matrix)==false) % if not every pixel iterated over by the vector is black
                            fprintf("Not a 2\n");
                            twos = 0;
                            return;
                        else
                            new_row = row + 4; % assigning the terminal point of this vector as an initial point for the vector of the next stage, and centering it within the line
                            new_column = column - 8;
                            stage = 2;
                        end

                    elseif(stage==2) % moving 4 pixels down and left and checking if all of the pixels iterated over are black, and if so we have passed this test
                       
                        if(findingnumbers("downleft", 4, new_row, new_column, matrix)==false) % if not every pixel iterated over in the vector was black
                            fprintf("Not a 2\n");
                            twos = 0;
                            return;
                        else % if every pixel iterated over in the vector was black
                            stage = 3; % just updating the stage as we are going to return to the top of the 2 to commence with the rest of the shape
                        end
                    
                    % continuing with the rest of the two shape
                    elseif(stage==3) % moving right and down to follow the right shape of the 2
                        if(findingnumbers("downright", 6, row, column, matrix)==false) % if not all of the pixels iterated over by the vector were black
                            fprintf("Not a 2\n");
                            twos = 0;
                            return;
                        else % if all of the pixels iterated over were black
                            new_row = row + 1;  % using the initial row + 1 as the initial point for the next vector
                            new_column = column + 6; % using the terminal column of this vector as the initial column for the next vector
                            stage = 4; % increasing the stage
                        end

                    elseif(stage==4) % continuing to move down the right side of the 2, but moving until the rightmost edge of the circular part of the two                      
                        if(findingnumbers("downright", 12, new_row, new_column, matrix)==false) % if not all of the pixels iterated over were black
                            fprintf("Not a 2\n");
                            twos = 0;
                            return;
                        else % if all of the pixels iterated over were black
                            new_row = new_row + 17; % using the terminal point of this vector + 5 rows as the initial point for the next vector
                            new_column = new_column + 12;
                            stage = 5;
                        end

                    % moving inwards
                    elseif(stage==5) % moving inwards and thus increasing the rows and decreasing the columns
                        % moving 9 pixels down and left
                        if(findingnumbers("downleft", 9, new_row, new_column, matrix)==false) % if not all of the pixels iterated over were black
                            fprintf("Not a 2\n");
                            twos = 0;
                            return;
                        else % if all of the pixels iterated over were black
                            new_row = new_row + 15; % using the terminal point of this vector as the initial point for the next vector
                            new_column = new_column - 9;
                            stage = 6;
                        end

                    elseif(stage==6) % moving inwards 20 pixels (20 rows downa and 20 columns left)
                        if(findingnumbers("downleft", 20, new_row, new_column, matrix)==false) % if not all of the pixels iterated over were black
                            fprintf("Not a 2\n");
                            twos = 0;
                            return;
                        else % if all of the pixels iterated over were black
                            new_row = new_row + 20; % using the terminal point of this vector as the initial point for the next vector
                            new_column = new_column - 20;
                            stage = 7; % moving to the next stage
                        end

                    % we are now at the bottom of the 2 and to prove it is a two we just need to move
                    % horizontally right 32 pixels. If that pixel is a zero then we have a two
                    elseif(stage==7) 
                        if(findingnumbers("right", 32, new_row, new_column, matrix)==false) % if not all of the pixels iterated over were black
                            fprintf("Not a 2\n");
                            twos = 0;
                            return;
                        else % if all of the pixels iterated over were black
                            % we know that it is a two and hence we can return back to the caller
                            % function
                            fprintf("A two was found\n");
                            twos = 1;
                            return;
                        end
                    else
                        fprintf("Not a 2\n");
                        twos = 0;
                        return;
                    end
                end
            end
        end
    end
    twos = 0; % if all of the pixels in the image were iterated over and we did not find any black pixels (numbers)
end