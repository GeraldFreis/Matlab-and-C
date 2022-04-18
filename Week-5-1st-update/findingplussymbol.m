function pluses = findingplussymbol(matrix)
    [rows, columns] = size(matrix); % finding the rows and columns of the matrix as we want to iterate over every pixel
    
    % iterating over every pixel and checking if the pixel is black, and if so applying our logic to test if it is a plus symbol
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

                while ~test % iterating to the bottom of the shape
                    if(matrix(r+running_downwards_counter, c)==0) % if the pixel is still black, increasing the increment factor
                        running_downwards_counter = running_downwards_counter + 1;

                    else % if the pixel is no longer black finding the row that we are now on so that we can find the distance that we have moved
                        final_row = r+running_downwards_counter-1;
                        test = true;
                    end
                end
                % finding the distance to travel for each branch of the
                % plus symbol
                distance = (final_row - r);

                % in case the distance / 2 is a half, ensuring that it will not be travelling a non-natural number
                if(mod(distance,2) == 0)
                    distance_to_each_end = distance / 2;
                else
                    distance_to_each_end = (distance+1)/2;
                end
                % moving left by the distance to each end and testing if that pixel is black
                if(matrix(r+distance_to_each_end, c-distance_to_each_end+8)~=0) % moving left
                    fprintf("Not a plus\n"); % if the pixel is not black we do not have a plus symbol
                    pluses = 0;
                    return;

                else % if the pixel is black, implementing our logic to move right and testing if the pixel that distance to the right is also black
                    if(matrix(r + distance_to_each_end, c + distance_to_each_end-8) == 0)  % moving right
                        fprintf("A plus is found\n")
                        pluses = 1;
                        return;
                    end
                end

            end
        end
    end
