function sevens = findingsevens(matrix)
    [rows, columns] = size(matrix);
    % logic for seven:
    % we start at the top left of the seven so we have to move to the end of the row
        % for 72 font calibri this is 44 units right
    % we then move down the diagonal with a row increment of 2 for every column increment
        % the diagonal is decreasing the columns while increasing the row
    % if this passes then its a seven
    
    % iterating through every pixel in the matrix, and if that pixel is equal to zero we can try to apply
    % our algorithm to find seven. If every vector we apply passes over only black pixels, we have a
    % seven.
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
                stage = 1;  % this is going to be the variable that contains the sta
                % of the loop, i.e what vector to initialise

                
                if(stage==1)
                    if(findingnumbers("right", 34, row, column, matrix)~=true) % if not all of the pixels passed over are black
                        fprintf("Not a 7\n");
                        sevens = 0;
                        return;
                    else
                        new_row = row;
                        new_column = column + 34; % updating the column so that the next vector can begin from that new_column
                        stage = 2;
                    end

                elseif(stage==2)
                    for i = 1:24
                        if(matrix(new_row + 2*i, new_column - i)==0 && i < 24)
                            continue;
                        elseif(i == 24)
                            stage = 3;
                        else
                            fprintf("Not a seven\n");
                            fprintf("%d, %d, %d", new_row, new_column, i);
                            sevens = 0;
                            return;
                        end
                    end
                end
            
                sevens = 1;
                fprintf("A seven was found\n");
                return;
            end
        end
    end
    sevens = 0;
end