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

    for row = 1:rows
        for column = 1:columns

            % testing to check if the pixel is a zero (black) and if so progression w our logic
            if(matrix(row, column)==0)
                test = false; % sentinal test
                stage = 1;
                xcrement_var = 0;


                while ~test
                    % moving down the left branch of the two
                    if(stage==1) % commencing with the first vector that moves 8 down and left
                        if(matrix(row+xcrement_var, column-xcrement_var)==0 && xcrement_var < 8)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==8)
                            new_row = row + xcrement_var-4; % updating the row and moving it four up for the next vector
                            new_column = column - xcrement_var;
                            stage = stage + 1; % increasing the stage
                            xcrement_var = 0; % resetting the increment variable so that the next vector can move independently with a new length
                        else % this will be triggered if the pixel in the matrix of the increased row and decreased column is no longer a zero (hence the number is not a two)
                            fprintf("Not a two\n");
                            twos = 0;
                            return; 
                        end
                    elseif(stage==2)
                        if(matrix(new_row+xcrement_var, new_column-xcrement_var)==0 && xcrement_var < 4)
                            xcrement_var = xcrement_var+ 1;
                        elseif(xcrement_var == 4)
                            xcrement_var = 0;
                            stage = stage + 1;
                            % here I don't have to update the new row and new column as the left branch
                            % of the two has passed its tests, and thus I need to move back to the
                            % initial row and column and continue with the rest of the 2.
                        else
                            fprintf("Not a two\n");
                            twos = 0;
                            return;
                        end
                    % continuing with the rest of the two shape
                    elseif(stage==3) % moving right and down to follow the right shape of the 2
                        if(matrix(row+xcrement_var, column+xcrement_var)==0 && xcrement_var < 6)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==6)
                            new_row = row + xcrement_var-5; % updating the row and moving it four up for the next vector
                            new_column = column + xcrement_var;
                            stage = stage + 1; % increasing the stage
                            xcrement_var = 0; % resetting the increment variable so that the next vector can move independently with a new length
                        else 
                            fprintf("Not a two\n");
                            twos = 0;
                            return; 
                        end
                    elseif(stage==4) % continuing to move down the right size of the 2, but moving until the rightmost part of the circular part of the two
                        if(matrix(new_row+xcrement_var, new_column+xcrement_var)==0 && xcrement_var < 12)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==12)
                            new_row = new_row + xcrement_var + 5; % updating the initial row and column that must be used for the next vector
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else
                            fprintf("Not a two\n");
                            twos = 0;
                            return;
                        end
                    % moving inwards
                    elseif(stage==5) % moving inwards and thus increasing the rows and decreasing the columns
                        if(matrix(new_row+xcrement_var, new_column-xcrement_var)==0 && xcrement_var < 9)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==9)
                            new_row = new_row + xcrement_var + 6; % updating the initial row and column that must be used for the next vector
                            new_column = new_column - xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else
                            fprintf("Not a two\n");
                            twos = 0;
                            return;
                        end
                    elseif(stage==6) % continuing to move inwards but a greater length
                        if(matrix(new_row+xcrement_var, new_column-xcrement_var)==0 && xcrement_var < 20)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==20)
                            new_row = new_row + xcrement_var; % updating the initial row and column that must be used for the next vector
                            new_column = new_column - xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;
                        else
                            fprintf("Not a two\n");
                            twos = 0;
                            return;
                        end
                    % we are now at the bottom of the 2 and to prove it is a two we just need to move
                    % horizontally right 32 pixels. If that is a zero then we have a two
                    elseif(stage==7) %
                        if(matrix(new_row, new_column+xcrement_var)==0 && xcrement_var < 32)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==32)  % 
                            stage = stage + 1;
                            % we do not need to update the values as this is the final test, we just need
                            % to increase the stage so that the else condition can be triggered
                        else
                            fprintf("Not a two\n");
                            twos = 0;
                            return;
                        end
                    else
                        fprintf("A two was found\n");
                        twos = 1;
                        return;
                    end

                end
            end
        end
    end
end