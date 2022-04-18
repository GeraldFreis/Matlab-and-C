function fives = findingfives(matrix)
    [rows, columns] = size(matrix);
    % logic for five:
    % fives, from the highest and most leftmost point have a right branch
        % for font 72 we move 23 right initially 
    % and then move down and around that curve
        % moving down we will move until the end is zero, take the row above that
        % and then use 3 vectors to move right down and back around
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
                stage = 1;  % this is going to be the variable that contains the stage
                % of the loop, i.e what vector to initialise and apply
                test = false; % sentinel to control the loop
                
                while ~ test
                    if(stage==1)  % moving right along the top right branch of the 5
                        if(findingnumbers("right", 23, row, column, matrix)~=true) % if all of the pixels iterated over are not black
                            fprintf("Not a 5\n");
                            fives = 0;
                            return;
                        else % if all of the pixels in the direction and length we wanted that were iterated over were black
                            % we can increase the stage as the number has passed the first step 
                            stage = 2;
                        end
    
                    elseif(stage==2) % moving down the vertical line of the five
                        if(findingnumbers("down", 25, row, column, matrix)~=true) % if all the pixels iterated over are not black we return false
                            fprintf("Not a 5\n");
                            fives = 0;
                            return;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            new_row = row + 25; % increasing the row to the row at the end of the operation
                            new_column = column;
                            stage = 3;
                        end
    
                    elseif(stage == 3) % moving right to get to the rounded turn of the 5
                        if(findingnumbers("right", 16, new_row, new_column, matrix)~=true) % if all the pixels iterated over are not black we return false
                            fprintf("Not a 5\n");
                            fives = 0;
                            return;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            new_column = new_column + 16; % increasing the column to the column at the end of the operation as this is where we want 
                            new_row = new_row - 1; % centering the row
                            % our next vector to begin
                            stage = 4;
                        end

                    elseif(stage == 4) % moving down and right around the curve
                        if(findingnumbers("downright", 14, new_row, new_column, matrix)~=true) % if all the pixels iterated over are not black we return false
                            fprintf("Not a 5\n");
                            fives = 0;
                            fprintf("%d, %d", new_row, new_column);
                            return;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            new_row = new_row + 18; % increasing the row to the row at the end of the operation, and increasing by 4
                            % so that we are at the centre of the right most part of the 5's curve.
                            new_column = new_column + 14; % increasing the column to the column at the end of the operation as this is where we want 
                            % our next vector to begin
                            stage = 5;                     
                        end
    
                    elseif(stage == 5) % moving back inwards around the curve
                        if(findingnumbers("downleft", 11, new_row, new_column, matrix)~=true) % if all the pixels iterated over are not black we return false
                            fprintf("Not a 5\n");
                            fives = 0;
                            return;
                        else % if a pixel we iterate over is not black returning to the main file as the vector test has not been passed
                            new_row = new_row + 11; 
                            new_column = new_column - 16;
                            stage = 6;
                        end
    
                    elseif(stage == 6) % moving back left to finish the tail of the 5
                        if(findingnumbers("left", 17, new_row, new_column, matrix)==false) % if all the pixels iterated over are not black
                            fprintf("Not a 5\n");
                            fives = 0;
                            return;
                        else % if all of the pixels iterated over were black we have passed all vector tests for the number 5, and hence the number is a five
                            fprintf("A five was found\n");
                            fives = 1;
                            return;
                        end
                    end
                end
                
                fprintf("Not a 5\n");
                fives = 0;
                return;
            end
        end
    end
    fives = 0;
end