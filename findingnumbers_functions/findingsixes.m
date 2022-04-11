function sixes = findingsixes(matrix)
    [rows, columns] = size(matrix); % finding the rows and columns we need to iterate over to find the pixel gradient of each pixel and test if its black
    % logic for six:
    % we start in the centre of the top branch
    % as such we must move down the right arm first, as the left arm can be connected 
    % to the rest of the number
        % we can use a vector of 1 row to 3 columns for the right branch
    % we can then use another vector of -27 column and 27 rows to check the left side
        % here we can continue using vectors, the second of which moves 7 down and right
        % we use a vertical vector next to move 28 units straight downwards
        % after this we move right and down 10 units
        % We are now at the bottom of the six so we must complete the circle of the bottom of the six
            % we can do this by having a horizontal vector of size 16 in the positive direction
            % we can have another vector that moves upwards and right by decreasing rows and increasing
            % columns by 14 
            % we have another vector that moves vertically upwards by 14
            % after this we have another vector that moves left and up by decreasing rows and decreasing
            % columns by a factor of 14
            % we then have another vector that moves horizontally left by 10, and a final vector that
            % moves 6 down and left by increasing rows and decreasing columns
            % now we check if the value next to that is a zero and if so we are back at the 'stem' of the
            % 6
    % iterating over each pixel in the matrix and the first we encounter that is black (0), we apply our logic to see if its a six.
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0) % testing if the pixel is black and if so implementing our logic to see if the shape it's attached to is black
                
                % initialising variables
                test = false;  % sentinel variable
                xcrement_var = 0; % variable to contain the increment factor to increment over pixels by changing the x and y (column and row), 
                % which will emulate a vector as the terminal point of the vector is changing with every change of the xcrement_var.
                stage = 1;  % this is going to be the variable that contains the sta
                % of the loop, i.e what vector to initialise

                while ~test
                    if(stage==1)  % moving down the right branch of the 6 from the initial starting position
                        if(matrix(row+xcrement_var, column+2*xcrement_var)==0 && xcrement_var < 5) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 5) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1;
                            xcrement_var=0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");                          
                            sixes = 0;
                            return;
                        end
                    % we can now continue on to the rest of the shape
                    elseif(stage == 2) % iterating 14 pixels down and left
                        if(matrix(row+xcrement_var, column-xcrement_var)==0 && xcrement_var < 14) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==14) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1;
                            new_row = row + xcrement_var;
                            new_column = column - xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end

                    elseif(stage == 3) % iterating 33 rows down
                        if(matrix(new_row+xcrement_var, new_column)==0 && xcrement_var < 33) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==33) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1;
                            new_row = new_row + xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                        
                    elseif(stage==4) % iterating 10 rows down and right
                        if(matrix(new_row+xcrement_var, new_column+xcrement_var)==0 && xcrement_var < 10) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==10) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1;
                            new_row = new_row + xcrement_var;
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    % we are now at the bottom of the six so we have to iterate right and then continue
                    % back up and around the circular bottom of the six
                    elseif(stage==5) % iterating 10 columns right
                        if(matrix(new_row, new_column+xcrement_var)==0 && xcrement_var < 10) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==10) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1;
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                        
                    % we now have to move up and around the curve
                    elseif(stage==7) % iterating 12 pixels up and right
                        if(matrix(new_row-xcrement_var, new_column+xcrement_var)==0 && xcrement_var < 12) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==12) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1;
                            new_row = new_row - xcrement_var - 4;
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                        
                    % moving back inwards around the curve
                    elseif(stage==8) % iterating 12 pixels up and left
                        if(matrix(new_row-xcrement_var, new_column - xcrement_var)==0 && xcrement_var < 12) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==12) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1;
                            new_row = new_row - xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");                   
                            sixes = 0;
                            return;
                        end
                        
                    elseif(stage == 9) % iterating 17 pixels left around the top of the 6
                        if(matrix(new_row, new_column-xcrement_var)==0 && xcrement_var < 17) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==17) % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                            stage = stage + 1;                        
                            new_column = new_column - xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    else % as we have passed every vector test we can end the while loop
                        test = true;
                    end               
                end
                
                % returning that a six was found to the calling function
                sixes = 1;
                fprintf("A six was found\n");
                return;
            end
        end
    end
    sixes = 0;
end
