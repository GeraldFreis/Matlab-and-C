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

                while ~test
                    if(matrix(r+running_downwards_counter, c)==0)
                        running_downwards_counter = running_downwards_counter + 1;

                    else
                        final_row = r+running_downwards_counter-1;
                        if(final_row-r < 30)
                            fprintf("Not a plus\n");
                            pluses=0;
                            return
                        end
                        test = true;
                    end
                end
                % finding the distance to travel for each branch of the
                % plus symbol
%                 fprintf("%d, %d", final_row, c);
                distance = (final_row - r);

                % in case the distance / 2 is a half
                if(mod(distance,2) == 0)
                    distance_to_each_end = distance / 2;
                else
                    distance_to_each_end = (distance+1)/2;
                end
%                 fprintf("%d, %d\n", r+distance_to_each_end, c-distance_to_each_end+8);
                if(matrix(r+distance_to_each_end, c-distance_to_each_end+8)~=0) % moving left
                    fprintf("Not a plus\n");
                    pluses = 0;
                    return;

                else
                    if(matrix(r + distance_to_each_end, c + distance_to_each_end-8) == 0)  % moving right
                        fprintf("A plus is found\n")
                        pluses = 1;
                        return;
                    end
                end

            end
        end
    end