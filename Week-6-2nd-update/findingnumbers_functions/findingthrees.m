function threes = findingthrees(matrix)
    [rows, columns] = size(matrix);

    % logic for threes:
    % just like the number two we can use vectors to describe the number 3
        % we have a left branch that we must iterate through using two vectors. And if this passes we can
        % move on to the rest of the shape. We will then use two vectors for each turn of the 3, and
        % We will do this through iterating through every pixel in the straight line (vector) and
        % ensuring that that pixel is black, and if it is not then it will not be the number 3. 

    % we consider the left branch first:
        % We move from the top to the centre of the left branch by moving
           % moving 9 down and 9 left, and then 6 upwards
           % then  7 left and down

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

    % this is the new file for three, the deprecated version can be found in findingthrees_deprecated.m
    % we will be using one while loop with a sentinal. And we will have conditionals to check what stage,
    % what vector needs to be implemented.
        % this is because the vector that must be used is different for each stage, so we can use a stage
        % variable to check what vector needs to be used, and by updating this stage variable we can
        % access the different vectors that need to be used. If these vectors pass the tests then we have
        % a three.
        % Again we use the 'xcrement_var' to increment the row and column we are iterating through to fit
        % the vector we need to implement.

    % iterating over every pixel in the matrix and if that pixel is black (0) applying our logic to test if the number attached to that pixel is a three
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0) % if the pixel is black (0)
            
                % initialising the variables
                test = false; % sentinal variable to control the while loop
                xcrement_var = 0; % variable to contain the increment factor to increment over pixels by changing the x and y (column and row), 
                % which will emulate a vector as the terminal point of the vector is changing with every change of the xcrement_var.
                stage = 1; % this variable dictates what vector will be applied given the circumstance

                while ~test
                    if(stage==1) % moving down the left branch
                        if(matrix(row + xcrement_var, column - xcrement_var)==0 && ...
                        xcrement_var < 7) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 7) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            new_row = row + xcrement_var-4;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            new_column = column - xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;                        
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a three\n");
                            threes = 0;
                            return;                    
                        end

                    elseif(stage==2)
                        if(matrix(new_row + xcrement_var, new_column - xcrement_var)==0 && ...
                        xcrement_var < 4) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==4) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1; % i dont need to update the row and column as I have now passed the tests for the left branch of the top of the 3
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a three\n");
                            threes=0;
                            return;
                        end
                    
                    % continuing with the rest of the three
                    elseif(stage==3) % moving 6 right and 6 down
                        if(matrix(row + xcrement_var, column + xcrement_var)==0 && ...
                        xcrement_var < 6) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 6) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            new_row = row + xcrement_var-5;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            new_column = column + xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;                        
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a three\n");
                            threes = 0;
                            return;                   
                        end
                        
                    elseif(stage==4) % moving 13 right and 13 down
                        if(matrix(new_row + xcrement_var, new_column + xcrement_var)==0 && ...
                        xcrement_var < 12) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 12) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            new_row = new_row + xcrement_var;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;                        
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a three\n");
                            threes = 0;
                            return;                   
                        end
                        
                    % moving back inwards
                    elseif(stage==5) % moving 10 right and 10 left
                        if(matrix(new_row + xcrement_var, new_column - xcrement_var)==0 && ...
                        xcrement_var < 8) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 8) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            new_row = new_row + xcrement_var+2;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            new_column = new_column - xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;                        
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a three\n");
                            threes = 0;
                            return;                   
                        end
                    elseif(stage==6) % moving 4 left and 4 down
                        if(matrix(new_row + xcrement_var, new_column - xcrement_var)==0 && ...
                        xcrement_var < 4) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 4) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            new_row = new_row + xcrement_var;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            new_column = new_column - xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;                        
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a three\n");
                            threes = 0;
                            return;                   
                        end
                    % moving back outwards
                    elseif(stage==7) % moving 15 right and down
                        if(matrix(new_row + xcrement_var, new_column + xcrement_var)==0 && ...
                        xcrement_var < 15) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 15) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            new_row = new_row + xcrement_var;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;                        
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a three\n");
%                             fprintf("%d, %d ", new_row+xcrement_var, new_column-xcrement_var);

                            threes = 0;
                            return;                   
                        end
                    % moving back inwards
                    elseif(stage==8) % moving 12 left and 12 down
                        if(matrix(new_row + xcrement_var, new_column - xcrement_var)==0 && ...
                        xcrement_var < 12) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 12) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            new_row = new_row + xcrement_var;  % updating the row and column so that the terminal row and column of this vector are the initial row and columns of the next vector
                            new_column = new_column - xcrement_var;
                            xcrement_var = 0;
                            stage = stage + 1;                        
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a three\n");
                            threes = 0;
                            return;                   
                        end
                    % finish the tail of the three
                    elseif(stage==9) % moving 20 left
                        if(matrix(new_row, new_column - xcrement_var)==0 && ...
                        xcrement_var < 20) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 20) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector                     
                            test = true;  % ending the while loop 
                             % we dont need to update the values as we know that we have a three as it has
                            % passed all the vector tests
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a three\n");
                            threes = 0;
                            return;                   
                        end
                    end
                end
                % as all vector tests were passed we have a three
                fprintf("A three was found\n");
                threes= 1;
                return; 
                
            end
        end
    end
    threes=0;
end
