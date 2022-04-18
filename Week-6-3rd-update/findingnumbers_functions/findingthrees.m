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


    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
                % variables
                stage = 1;
%                 fprintf("%d, %d", row, column);  % testing the first row and column whos pixel is black
                new_row = 0;
                new_column = 0;
                test = false;

                while ~test
                    if(stage==1) % moving down the left branch
                        if(findingnumbers("downleft", 7, row, column, matrix)~=true) % if not all of the pixels passed over are black
                            fprintf("Not a 3\n");
                            threes = 0;
                            return;
                        else % if all of the pixels iterated over were black
                            new_row = row + 3; % centering the row 
                            new_column = column - 7;
                            stage = 2; % moving onto the next stage
                        end
                  
                    elseif(stage==2) % continuing to move down the top left branch of the 3.                    
                        if(findingnumbers("downleft", 4, new_row, new_column, matrix)~=true) % if not all of the pixels passed over are black
                            fprintf("Not a 3\n");
                            threes = 0;
                            return;
                        else % if all of the pixels iterated over were black                         
                            stage = 3;
                        end
                    
                    % continuing with the rest of the three
                    elseif(stage==3) % moving 6 right and 6 down
                        if(findingnumbers("downright", 5, row, column, matrix)==false) % if not all of the pixels passed over are black
                            fprintf("Not a 3\n");
                            threes = 0;
                            return;
                        else % if all of the pixels iterated over were black
                            new_row = row + 1; % centering the row and updating it so that it's the terminal row of this vector
                            new_column = column + 6; % updating the new row so that it is the terminal column of this vector
                            stage = 4;
                        end
    
                    elseif(stage==4) % moving 12 right and 12 down
                        if(findingnumbers("downright", 12, new_row, new_column, matrix)~=true) % if not all of the pixels passed over are black
                            fprintf("Not a 3\n");
                            threes = 0;
                            return;
                        else % if all of the pixels iterated over were black
                            new_row = new_row + 12; % centering the row 
                            new_column = new_column + 12;
                            stage = 5;
                        end
    
                    % moving back inwards
                    elseif(stage==5) % moving 10 right and 10 left
                        if(findingnumbers("downleft", 8, new_row, new_column, matrix)~=true) % if not all of the pixels passed over are black
                            fprintf("Not a 3\n");
                            threes = 0;
                            return;
                        else % if all of the pixels iterated over were black
                            new_row = new_row + 10; % centering the row and updating it so that it's the terminal row of this vector
                            new_column = new_column - 8; % updating the new row so that it is the terminal column of this vector
                            stage = 6;
                        end
    
                    elseif(stage==6) % moving 4 left and 4 down                        
                         if(findingnumbers("downleft", 4, new_row, new_column, matrix)~=true) % if not all of the pixels passed over are black
                            fprintf("Not a 3\n");
                            threes = 0;
                            return;
                        else % if all of the pixels iterated over were black
                            new_row = new_row + 4; % centering the row and updating it so that it's the terminal row of this vector
                            new_column = new_column -4; % updating the new row so that it is the terminal column of this vector
                            stage = 7;
                         end
    
                    % moving back outwards
                    elseif(stage==7) % moving 15 right and down                        
                         if(findingnumbers("downright", 15, new_row, new_column, matrix)~=true) % if not all of the pixels passed over are black
                            fprintf("Not a 3\n");
                            threes = 0;
                            return;
                        else % if all of the pixels iterated over were black
                            new_row = new_row + 15; % centering the row and updating it so that it's the terminal row of this vector
                            new_column = new_column + 15; % updating the new row so that it is the terminal column of this vector
                            stage = 8;
                         end
    
                    % moving back inwards
                    elseif(stage==8) % moving 12 left and 12 down                      
                        if(findingnumbers("downleft", 12, new_row, new_column, matrix)~=true) % if not all of the pixels passed over are black
                            fprintf("Not a 3\n");
                            threes = 0;
                            return;
                        else % if all of the pixels iterated over were black
                            new_row = new_row + 12; % centering the row and updating it so that it's the terminal row of this vector
                            new_column = new_column - 12; % updating the new row so that it is the terminal column of this vector
                            stage = 9;
                        end
    
                    % finish the tail of the three
                    elseif(stage==9) % moving 20 left
                         if(findingnumbers("left", 20, new_row, new_column, matrix)~=true) % if not all of the pixels passed over are black
                            fprintf("Not a 3\n");
                            threes = 0;
                            return;
                        else % if all of the pixels iterated over were black            
                            stage = 10; % we can just increase the stage as we now have passed all tests for three
                         end             
                    else
                        fprintf("A three was found\n");
                        threes= 1;
                        return; 
                    end
                end
            threes = 0;
            fprintf("Not a 3\n");
            return;
            end
        end
    end
    threes=0;
end
