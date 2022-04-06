function sixes = findingsixes(matrix)
    [rows, columns] = size(matrix);
    % logic for six:
    % we start in the centre of the top branch
    % as such we must move down the right arm first, as the left arm can be connected 
    %to the rest of the number
        % we can use a vector of 1 row to 3 columns for the right branch
    % we can then use another vector of -27column and 27 rows to check the left side
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
        % 
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
                test = false;  % sentinel variable
                xcrement_var = 0;
                stage = 1;  % this is going to be the variable that contains the sta
                % of the loop, i.e what vector to initialise

                while ~test
                    if(stage==1) % moving 6 rows down and 12 columns right, this is the right branch of the six, and if all of these 
                        % pixels are black then we have passed the first test for the top of the 6, and we can now move left and around
                        % the six
                        if(matrix(row+xcrement_var, column+2*xcrement_var)==0 && xcrement_var < 6)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var == 6)
                            stage = stage + 1;
                            xcrement_var=0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    % continuign with the rest of the six
                    elseif(stage == 2) % moving 27 pixels down and left around the 6 so that we are now in the middle of the six
                        % if every pixel we iterate over is black then we have passed this test
                        if(matrix(row+xcrement_var, column-xcrement_var)==0 && xcrement_var < 27)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==27)
                            stage = stage + 1;
                            new_row = row + xcrement_var;
                            new_column = column - xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    
                    elseif(stage == 3) % iterating 7 rows down and 7 columns to the right inwards from the left-most point of the six.
                        % if every pixel we iterate over is black then we have passed the test for this stage
                        if(matrix(new_row+xcrement_var, new_column+xcrement_var)==0 && xcrement_var < 7)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==7)
                            stage = stage + 1;
                            new_row = new_row + xcrement_var;
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    % iterating 28 rows down as this will take us to the centre of the left curve around the six, from which we can move inwards around
                    % around the curve
                    elseif(stage == 4)
                        if(matrix(new_row+xcrement_var, new_column)==0 && xcrement_var < 28)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==28)
                            stage = stage + 1;
                            new_row = new_row + xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    
                    % iterating 10 rows and columns down and right so that we have moved a little inward into the curve of the six
                    elseif(stage==5)
                        if(matrix(new_row+xcrement_var, new_column+xcrement_var)==0 && xcrement_var < 10)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==10)
                            stage = stage + 1;
                            new_row = new_row + xcrement_var;
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    % moving 16 columns to the right as we are now at the bottom of the 6, and we need to, afterwards, move right and upwards
                    elseif(stage==6)
                        if(matrix(new_row, new_column+xcrement_var)==0 && xcrement_var < 16)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==16)
                            stage = stage + 1;
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    % moving 14 rows upwards and 14 columns to the right around the curve of the 6, and if every pixel we iterate over is still black we
                    % have passed this stage
                    elseif(stage==7)
                        if(matrix(new_row-xcrement_var, new_column+xcrement_var)==0 && xcrement_var < 14)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==14)
                            stage = stage + 1;
                            new_row = new_row - xcrement_var;
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    % iterating 12 rows upwards so that we can now move left and around the top of the loop of the 6, and if every pixel we iterate
                    % over is still black we have passed this stage
                    
                    elseif(stage==8) 
                        if(matrix(new_row-xcrement_var, new_column)==0 && xcrement_var < 12)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==12)
                            stage = stage + 1;
                            new_row = new_row - xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");
                            
                            sixes = 0;
                            return;
                        end
                    
                    elseif(stage == 9) % moving 14 rows up and left from the rightmost part of the 6's lower loops, and if every pixel we
                    % iterate over is still black we have passed this stage
                        if(matrix(new_row-xcrement_var, new_column-xcrement_var)==0 && xcrement_var < 14)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==14)
                            stage = stage + 1;
                            new_row = new_row - xcrement_var;
                            new_column = new_column - xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");
                            fprintf("%d", xcrement_var);
                            fprintf(" %d, %d", new_row, new_column);
                            sixes = 0;
                            return;
                        end
                        
                    elseif(stage==10) % moving 7 columns left, across the top of the loop
                        if(matrix(new_row, new_column-xcrement_var)==0 && xcrement_var < 7)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==7)
                            stage = stage + 1;
                            new_column = new_column - xcrement_var;
                            xcrement_var = 0;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            fprintf("Not a six\n");
                            sixes = 0;
                            return;
                        end
                    elseif(stage==11) % moving 6 rows down and 6 columns left and if this test passes and the pixel to the left of it is still black
                        % we have a six
                        if(matrix(new_row+xcrement_var, new_column-xcrement_var)==0 && xcrement_var < 6)
                            xcrement_var = xcrement_var + 1;
                        elseif(xcrement_var==6)
                            new_row = new_row - xcrement_var;
                            new_column = new_column + xcrement_var;
                            xcrement_var = 0;
                            if(matrix(new_row, new_column-1==0))
                                stage = stage + 1;
                            end

                        else
                            test=true;
                        end
                    else
                        test = true;
                    end
                
                end
                sixes = 1;
                fprintf("A six was found\n");
                return;
            end
        end
    end
end
