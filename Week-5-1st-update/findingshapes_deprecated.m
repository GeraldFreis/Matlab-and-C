%% This function is going to take the matrix composed in pixeltomatrix and look for adjacent elements to find shapes

% iteratively taking the value of all pixels that are black and capturing that in a new matrix, and every other pixel will be converted to white.

function array_of_shapes = findingshapes(matrix)
    [rows, columns] = size(matrix);  % finding the rows and columns of the initial image matrix
    array_of_shapes = zeros(rows, columns/3);  % initialising the new array: we have learnt that captured images are usually 3 times the width
    % that we need
    row = 1;
    while row <= rows
        for column = 1:columns/3
            if(matrix(row, column) == 0)
                array_of_shapes(row, column) = matrix(row, column);
            else
                array_of_shapes(row, column) = 255;
            end
            
        end
        row = row + 1;
    end
    
    %% looking for plus symbols in the new matrix.
    % we are going to do this by moving having a for loop that moves from a black pixel downwards until the pixel that it is currently on 
    % is no longer black. We will then take this distance, half it, and then move to that row. That row will be halfway between the beginning of the shape
    % and the end of the shape. We will then move left half of the distance to the bottom of the shape, and if every pixel when moving that distance left 
    % is black we will move right. We will move right half of the distance to the bottom of the shape, and if every pixel when moving that distance right
    % is black we will have a plus.
    for r = 1:rows
        for c = 1:columns

            if (matrix(r, c)==0 && matrix(r, c+2)==0)  % testing if the character is a plus symbol
                test = false;  % sentinal test
                running_downwards_counter = 0;  % decreasing the columns to the bottom of the symbol
                final_row = 0;  % storing the final column

                % logic for this process:
                % we iterate to the bottom of the symbol and this gives us
                % a distance to the bottom. Plus symbols have this distance
                % on each branch of the symbol, so we can go to the centre
                % of the plus, move left that distance/2 and move right
                % that distance/2 and if we can do that then we have a plus
                % symbol

                while ~test
                    if(matrix(r+running_downwards_counter, c)==0)
                        running_downwards_counter = running_downwards_counter + 1;

                    else
                        final_row = r+running_downwards_counter;
                        test = true;
                    end
                end
                % finding the distance to travel for each branch of the
                % plus symbol
                distance =(final_row - r);

                % in case the distance / 2 is a half
                if(mod(distance,2)== 0)
                    distance_to_each_end = distance / 2;
                else
                    distance_to_each_end = (distance+1)/2;
                end

                if(matrix(r+distance_to_each_end, c-distance_to_each_end)~=0) % moving left
                    fprintf("Not a plus\n");
                    imshow(array_of_shapes);
                    fprintf("Finding shapes compiled\n");
                    return;

                else
                    if(matrix(r+distance_to_each_end, c+distance_to_each_end) == 0)  % moving right
                        fprintf("A plus is found\n")
                        imshow(array_of_shapes);
                        fprintf("Finding shapes compiled\n");
                        return;
                    end
                end

            end
        end
    end
    
    %testing if the value is 1
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
                % logic for finding 1:
                % 1 in this script will be proportional by some constant K
                % we can take the top value of the 1, i.e the first 0
                % and then move to the bottom. We can move left and then measure the distance we moved
                % left we can then proportionally move right. We can then travel to the top
                % and move at a 45 degree angle left

                % initialising the variables
                test = false;
                final_row = 0;
                decrement_counter = 0;

                while ~test. % iterating to the bottom of the shape, from the initial black pixel.
                    if(matrix(row, column)~=0)
                        final_row = row + decrement_counter;                        
                        test = true;
                    else
                        decrement_counter = decrement_counter + 1;
                    end
                end
                
                % moving left and right
                test = false;
                decrement_counter = 0;
                distance = 0;
                
                while ~test % iterating left, by decreasing the columns, for a unspecified distance. If we move right this same distance, from the initial
                    % column, and all of the pixels from that initial column to the end column are still black, we will have a one.
                    if(matrix(row, column-decrement_counter)~=0)
                        distance = decrement_counter;
                        if(matrix(row, column+decrement_counter)==0)
                            fprintf("A plus was found/n");
                            return;
                        else
                            fprintf("Not a plus\n");
                            return;
                        end
%                         test = true;
                    else
                        decrement_counter = decrement_counter + 1;
                    end
                
                end

            end
        end
    end
    
end
