%% function to be universally implemented by all other finding shapes functions
% the function will take the direction to travel, the size of the vector, the current row, column and the
% matrix
% and it will return true if all pixels passed over by that vector are black
% and false if not

% possible directions are:
        % downleft, downright, upleft, upright, right, left, down, up
        % downleft = 45 degrees down and left (by increasing rows and decreasing columns in a 1:1 ratio
        % of increments)
        % downright = 45 degrees down and right (by increasing rows and columns by 1:1 increment ratio
        % upleft = 45 degrees up and left (by decreasing rows and columns by 1:1 increment ratio
        % upright = 45 degrees up and right (by decreasing rows and increasing columns by a 1:1 increment
        % ratio
        % right = increasing columns, left = decreasing columns, down = increasing rows, up = decreasing
        % rows


function boolval = findingnumbers(direction, length, current_row, current_column, matrix)
    boolval = false;
    switch direction
        case "downleft" % if we need to move down and left, we increase row and decrease column
            for i = 1:length
                if(matrix(current_row+i, current_column-i)~=0) % increasing the row and decreasing the column
                    return;
                end
            end
            boolval = true; % as we have iterated the distance in the direction required and every pixel has been 0 or black
            % we know that we have passed this stage / vector test and we can return true to the calling
            % function
            return;
        case "downright" % if we need to move down and right we increase row and column
            for i = 1:length
                if(matrix(current_row+i, current_column+i)~=0) % increasing the row and the column
                    return;
                end
            end
            boolval = true; % as we have iterated the distance in the direction required and every pixel has been 0 or black
            % we know that we have passed this stage / vector test and we can return true to the calling
            % function
            return;

        case "upleft" % if we need to move up and left, we decrease row and column
            for i = 1:length
                if(matrix(current_row-i, current_column-i)~=0) % decreasing the row and the column
                    return;
                end
            end
            boolval = true; % as we have iterated the distance in the direction required and every pixel has been 0 or black
            % we know that we have passed this stage / vector test and we can return true to the calling
            % function
            return;

        case "upright" % if we need to move up and right we decrease row and increase column
            for i = 1:length
                if(matrix(current_row-i, current_column+i)~=0) % decreasing the row and increasing the column
                    return;
                end
            end
            boolval = true; % as we have iterated the distance in the direction required and every pixel has been 0 or black
            % we know that we have passed this stage / vector test and we can return true to the calling
            % function
            return;

        case "left" % if we need to move left we decrease column
            for i = 1:length
                if(matrix(current_row, current_column-i)~=0) % decreasing the column
                    return;
                end
            end
            boolval = true; % as we have iterated the distance in the direction required and every pixel has been 0 or black
            % we know that we have passed this stage / vector test and we can return true to the calling
            % function
            return;

        case "right" % if we need to move right we increase the column
            for i = 1:length
                if(matrix(current_row, current_column+i)~=0) % increasing the column
                     return;
                end
            end
            boolval = true; % as we have iterated the distance in the direction required and every pixel has been 0 or black
            % we know that we have passed this stage / vector test and we can return true to the calling
            % function
            return;

        case "up" % if we need to move up we decrease the row
             for i = 1:length
                if(matrix(current_row-i, current_column)~=0) % increasing the column
                    return;
                end
            end
            boolval = true; % as we have iterated the distance in the direction required and every pixel has been 0 or black
            % we know that we have passed this stage / vector test and we can return true to the calling
            % function
            return;

        case "down" % if we need to move down we increase the row
            for i = 1:length
                if(matrix(current_row+i, current_column)~=0) % increasing the column
                    return;
                end
            end
            boolval = true; % as we have iterated the distance in the direction required and every pixel has been 0 or black
            % we know that we have passed this stage / vector test and we can return true to the calling
            % function
            return;

        otherwise % if none of the commands were called
            fprintf("ERROR:\nNot a valid direction\n")
            return;
    end
end