function sixes = findingsixes(matrix)
    [rows, columns] = size(matrix);
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
        % 
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
                test = false; % sentinel value for the while loop to iterate over stages
                stage = 1;  % this is going to be the variable that contains the sta
                % of the loop, i.e what vector to initialise
                
                while ~test
                    if(stage==1)  % moving down the right branch of the 6 from the initial starting position
                        for i = 1 : 5
                            if(matrix(row+i, column+2*i)==0 && i < 5)
                                continue;
                            elseif(i == 5)
                                stage = stage + 1;
                            else
                                fprintf("Not a 6\n");   
                                sixes = 0;
                                return;
                            end
                        end
                    % we can now continue on to the rest of the shape
                    elseif(stage == 2)
                        if(findingnumbers("downleft", 14, row, column, matrix)~=true) % if not every pixel passed over by the vector is black
                            fprintf("Not a 6\n");  
                            sixes = 0;
                            return;
                        else % if every pixel passed over was black
                            stage = 3;
                            new_row = row + 14; % updating the row;
                            new_column = column - 14;
                        end

                    elseif(stage == 3) % moving 33 rows downwards                        
                        if(findingnumbers("down", 33, new_row, new_column, matrix)~=true) % if not every pixel passed over by the vector is black
                            fprintf("Not a 6\n");
                            sixes = 0;
                            return;
                        else % if every pixel passed over was black
                            stage = 4;
                            new_row = new_row + 33; % updating the row;
                        end

                    elseif(stage==4) % moving 10 pixels down and right
                        if(findingnumbers("downright", 10, new_row, new_column, matrix)~=true) % if every pixel passed over was not black
                            fprintf("Not a 6\n");
                            sixes = 0;
                            return;
                        else % if every pixel iterated over by the vector was black
                            stage = 5;
                            new_row = new_row + 9;
                            new_column = new_column + 10;
%                             fprintf("%d, %d", new_row, new_column);
                        end

                    % we are now at the bottom of the six so we have to iterate right and then continue
                    % back up and around the circular bottom of the six
                    elseif(stage==5)
                        if(findingnumbers("right", 6, new_row, new_column, matrix)==false) % if every pixel passed over was not black
                            fprintf("Not a 6\n");
                            sixes = 0;
                            return;
                        else % if every pixel iterated over by the vector was black
                            stage = 6;
                            new_column = new_column + 6;
                            
                        end
                    % we now have to move up, right, and around the curve
                    elseif(stage==6)
                        if(findingnumbers("upright", 12, new_row, new_column, matrix)~=true) % if every pixel passed over was not black
                            fprintf("Not a 6\n");
                            sixes = 0;
                            return;
                        else % if every pixel iterated over by the vector was black
                            stage = 7;
                            new_row = new_row - 21; % centering the row so that the next test will pass
                            new_column = new_column + 12;                                                   
                        end

                    % moving back inwards around the curve
                    elseif(stage==7)                   
                        if(findingnumbers("upleft", 12, new_row, new_column, matrix)~=true) % if every pixel passed over was not black
                            fprintf("Not a 6\n");
                            sixes = 0;
                            return;
                        else % if every pixel iterated over by the vector was black
                            stage = 8;
                            new_row = new_row - 8; % to place the vector on the edge of the line of the 6
                            new_column = new_column - 12;
                            
                        end
                    elseif(stage == 8)
                        if(findingnumbers("left", 17, new_row, new_column, matrix)~=true) % if every pixel passed over was not black
                            fprintf("Not a 6\n");
                            sixes = 0;
                            fprintf("%d, %d", new_row, new_column);
                            return;
                        else % if every pixel iterated over by the vector was black
                            sixes = 1;
                            fprintf("A six was found");
                            return;
                        end
                    end
                end

                sixes = 0;
                fprintf("Not a 0\n");
                return;
                
            end
        end
    end
    sixes = 0;
end