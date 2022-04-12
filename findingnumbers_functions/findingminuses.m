%% finding minuses within the image
function minus = findingminuses(matrix)
    [rows, columns] = size(matrix);
    % logic for minuses:
        % we take the top left / first zero encountered and we then iterate to the end of the row
        % we take that distance, move back left that distance, then up and down that distance
        % if that does not pass then we have a minus
    for row = 1:rows
        for column = 1:columns
            if(matrix(row, column)==0)
                % variables
                test = false;
                xcrement_var = 0;
                stage = 1;
                ycrement_var = 0;
                try
                    while ~ test
                        if(stage==1)
                            if (matrix(row, column+xcrement_var)==0 && xcrement_var < 18)
                                xcrement_var = xcrement_var + 1;
                            elseif(xcrement_var == 18)
                                xcrement_var = xcrement_var/2;
                                stage = stage + 1;
                            else
                                fprintf("not a minus\n");
                                minus = 0;
                                return;
                            end
    
                        elseif(stage==2)
                            if (matrix(row-ycrement_var, column+xcrement_var)==0 && ycrement_var < 9)
                                ycrement_var = ycrement_var + 1;
                            elseif(matrix(row-ycrement_var, column+xcrement_var)~=0 )
                                test = true;
                            elseif(ycrement_var == 9)
                                fprintf("not a minus\n");
                                minus = 0;
                                return;
                            end
                        end
                    end
                    
                fprintf("A minus was found\n");
                minus = 1;
                return;
                
                catch
                    minus = 0;
                    fprintf("Not a minus\n");
                    return
                end
            end

            
        end
    end
end