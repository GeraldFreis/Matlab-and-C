%%finding twos in the matrices
function twos = findingtwos(matrix)
    [rows, columns] = size(matrix);

    % logic for twos:
    % we consider the left branch first:
        % we do this by having two vectors the first that moves from the first 
        % zero on the top, down by 8 and left by 8. We move 4 rows up
        % Then we move 4 down and 4 left, and the element to the left of that should be a 0
        
    %if this works we move back to the top:
        % we then move 6 down and 6 right
        % if this is still a zero we move up 5, if this is a zero we move 12 down and 12 right
    % this takes us to the rightmost point of the curve of the 2, we need to now move inward
        % if this is still a zero we move 9 down and left
        % if this is still a zero we move 6 down
        % if this is still a zero we move 20 left and 20 down
    % we are now at the bottom of the shape and we can now move along the bottom horizontal line to check if its a two
        % if this is still a zero we move 32 right
    % if this is a zero we have a 2
    
    for row = 1:rows
        for column = 1:columns

            % testing to check if it is a zero and if so progression w our logic
            if(matrix(row, column)==0)


                % moving down the left branch of the 2
                for i = 1:8
                    if(matrix(row+i, column-i)~=0)
%                        fprintf("1");
                        fprintf("not a two\n");
                        twos = 0;
                        return;
                    elseif(i==8)
                        new_row = row+i-4; % moving the row back up
                        new_column = column-i;
                    end
                end

                for i = 1:4
                    if(matrix(new_row+i, new_column-i)~=0)
%                         fprintf("2");
                        fprintf("not a two\n");
                        twos = 0;
                        return;                       
                    end
                end

                % as the number has passed these tests, we can move back to the top of the two and try
                % the rest of the shape
                for i = 1:6
                    if(matrix(row+i, column+i)~=0)
                        fprintf("not a two\n");
                         fprintf("3");
                        twos = 0;
                        return;
                    elseif(i==6)
                        new_row = row+i-5;  % balancing the movement
                        new_column = column+i;
                    end
                end
                % moving right again
                for i = 1:12
                    if(matrix(new_row+i, new_column+i)~=0)
                        fprintf("not a two\n");
                         fprintf("4");
                        twos = 0;
                        return;
                    elseif(i==12)
                        new_row = new_row + i+5;
                        new_column = new_column + i;
                    end
                end

               %moving back inwards:
               for i = 1:9
                   if(matrix(new_row+i, new_column-i)~=0)
                        fprintf("not a two\n");
%                         fprintf("5");
                        twos = 0;
                        return;
                   elseif(i==9)
                       new_row = new_row + i + 6;
                       new_column = new_column - i;
%                        fprintf("%d, %d", new_row, new_column);

                   end
               end

               for i = 1:20
                   if(matrix(new_row + i, new_column - i)~=0)
                       fprintf("not a two\n");
%                        fprintf("6");
                       twos = 0;
                       return;
                   elseif(i==20)
                       new_row = new_row + i;
                       new_column = new_column - i;

                   end
               end

               % now iterating to the bottom right of the bottom branch to determine if its a two
               for i = 1:32
                   if(matrix(new_row, new_column +i)~=0)
                       fprintf("not a two\n");
%                        fprintf("7");
                       fprintf("%d, %d ",new_row, new_column+i);
                       twos = 0;
                       return;
                   elseif(i==32)
                       new_column = new_column + i;
                   end
               end

               fprintf("A two was found\n");
               twos = 1;
               return;

            end
        end
    end
    twos = 0;
end
