function sevens = findingsevens(matrix)
    [rows, columns] = size(matrix);
    % logic for seven:
    % we start at the top left of the seven so we have to move to the end of the row
        % for 72 font calibri this is 34 units right
    % we then move down the diagonal with a row increment of 2 for every column increment 24 times
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
                test = false; % sentinal variable to control the while loop
                
                while ~test
                    if(stage==1) % moving 34 pixels right and checking if every pixel iterated over was black
                        if(findingnumbers("right", 34, row, column, matrix)~=true) % if not all of the pixels passed over are black
                            fprintf("Not a 7\n");
                            sevens = 0;
                            return;
                        else % if a pixel that was iterated over was not black we do not have a 7 and hence returning to the caller function with this information
                            new_row = row;
                            new_column = column + 34; % updating the column so that the next vector can begin from that new_column
                            stage = 2;
                        end
    
                    elseif(stage==2) % moving 24 pixels left and 48 down and checking if every pixel iterated over is black
                        for i = 1:24
                            if(matrix(new_row + 2*i, new_column - i)==0 && i < 24) % if the current pixel is black and the counter is less than the vector length (24)
                                continue;
                            elseif(i == 24) % if we have reached the vector length we have passed this vector test and we have a 7
                                test=true; % ending the while loop
                            else % if the current pixel is not black we do not have a 7, and hence returning to our main function with this information
                                fprintf("Not a seven\n");
                                sevens = 0;
                                return;
                            end
                        end
                    end
                end
                
                % as all tests have passed we have a 7
                sevens = 1;
                fprintf("A seven was found\n");
                return;
            end
        end
    end
    sevens = 0;
end