function pluses = findingplussymbol(matrix)
    [rows, columns] = size(matrix);
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
                
                % iterating to the bottom of the shape
                while ~test
                    if(matrix(r+running_downwards_counter, c)==0) % if the pixel is still black, increasing the incrementing variable
                        running_downwards_counter = running_downwards_counter + 1;

                    else
                        final_row = r+running_downwards_counter-1; % finding the final row so that we can find the distance that the loop moved and then half that
                        if(final_row-r < 30) % if the distance is less than 30 it is not a plus symbol, this is to ensure that the code doesn't misidentify other numbers as plus symbols
                            fprintf("Not a plus\n");
                            pluses=0;
                            return
                        end
                        test = true;
                    end
                end

                % finding the distance to travel for each branch of the
                % plus symbol
                distance = (final_row - r);

                % in case the distance is not even
                if(mod(distance,2) == 0) % if distance is even
                    distance_to_each_end = distance / 2;
                else % if distance is not even, ensuring that the distance_to_each_end is not a half
                    distance_to_each_end = (distance+1)/2;
                end

                if(matrix(r+distance_to_each_end, c-distance_to_each_end+8)~=0) % moving the distance left and checking if that pixel is still black, and if not it is not a plus
                    fprintf("Not a plus\n");
                    pluses = 0;
                    return;

                else % if the pixel that distance left is black, moving that same distance right
                    if(matrix(r + distance_to_each_end, c + distance_to_each_end-8) == 0)  % moving the distance right and checking if that pixel is still black, and if not it is not a plus
                        fprintf("A plus is found\n")
                        pluses = 1;
                        return;
                    end
                end

            end
        end
    end