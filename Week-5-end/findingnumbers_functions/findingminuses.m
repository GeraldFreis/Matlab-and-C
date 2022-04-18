%% finding minuses within the image
function minus = findingminuses(matrix)
    [rows, columns] = size(matrix);
    % logic for minuses:
        % we take the top left / first zero encountered and we then iterate to the end of the row
        % we take that distance, move back left that distance, then up and down that distance
        % if that does not pass then we have a minus
        
    % iterating through the matrix and checking if the current pixel iterated over is black and if so applying our logic to test if its a minus symbol
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0) % if the pixel is black applying our logic
                
                % variables
                test = false; % sentinal variable to control the while loop
                xcrement_var = 0; % variable to contain the increment factor to increment over pixels by changing the x and y (column and row), 
                % which will emulate a vector as the terminal point of the vector is changing with every change of the xcrement_var.
                stage = 1; % the stage is a variable that controls what vector test will be applied to the number / symbol
                ycrement_var = 0; % variable to contain the y-axis (row) movement of the vector

                while ~ test
                    if(stage==1) % iterating to the right of the shape until the pixel is no longer black
                        if (matrix(row, column+xcrement_var)==0)
                            xcrement_var = xcrement_var + 1;
                        else % if the pixel is no longer black, taking that distance moved and halfing it
                            xcrement_var = xcrement_var/2;
                            stage = stage + 1;
                        end

                    elseif(stage==2) % returning to halfway to the end of the shape and moving 10 rows upwards, and if we can do that and the pixel is black
                        % we do not have a minus, instead likely having a plus
                        if (matrix(row-ycrement_var, column+xcrement_var)==0 && ycrement_var < 10)
                            ycrement_var = ycrement_var + 1;
                        elseif(matrix(row-ycrement_var, column+xcrement_var)~=0) % if the pixel is not black we know that it is a minus symbol
                            test = true; % ending the while loop 
                        elseif(ycrement_var == 10)
                            fprintf("not a minus");
                            minus = 0;
                            return;
                        end
                    end
                end
            % as we have passed the vector tests for this symbol we know that we have a minus symbol
            fprintf("A minus was found");
            minus = 1;
            return;
            end
            
        end
    end
end
