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
                
                try % trying to run the loop and catching a specific error where the matrix vars are out of bounds
                    % this occurs because of a formatting problem with images of sizes greater than 590 x 1000
                    while ~ test
                        if(stage==1) % iterating 18 pixels to the right 
                            if (matrix(row, column+xcrement_var)==0 && xcrement_var < 18) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                                xcrement_var = xcrement_var + 1; % continuing to move right
                            elseif(xcrement_var == 18) % 
                                xcrement_var = xcrement_var/2;
                                stage = stage + 1;
                            else % if every pixel iterated over was black we have made it to the end of this vector and hence can move to the next stage / vector
                                fprintf("not a minus\n");
                                minus = 0;
                                return;
                            end
    
                        elseif(stage==2)
                            if (matrix(row-ycrement_var, column+xcrement_var)==0 && ycrement_var < 9) % if the current pixel iterated over is still black and the length of the current vector is less than that required
                                ycrement_var = ycrement_var + 1;
                            elseif(matrix(row-ycrement_var, column+xcrement_var)~=0 )% if the current pixel is not black ending the while loop and 
                                % returning that a minus was found
                                test = true;
                            elseif(ycrement_var == 9) % if the program could move 9 pixels upwards from the centre of the shape, we do not have a minus
                                fprintf("not a minus\n");
                                minus = 0;
                                return;
                            end
                        end
                    end
                
                % as the vector tests passed, we have a minus
                fprintf("A minus was found\n");
                minus = 1;
                return;
                
                catch % if an error was produced we have a formatting error as described previously.
                    minus = 0;
                    fprintf("Image formatting error\n");
                    return
                end
            end
        end
    end
end
