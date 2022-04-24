%% This function is going to take the matrix composed in pixeltomatrix and look for adjacent elements to find shapes

% iteratively taking the value of any pixel that is zero (black) and storing that in a new matrix of pixels, and any other value is white. 
% This is to clean the image such that shapes are easier to find as we now have the constraint that any number must be in complete black font.

function array_of_shapes = findingshapes(matrix)
    [rows, columns] = size(matrix); % finding the total rows and columns of the matrix
    array_of_shapes = zeros(rows, columns/3); % initialising the matrix to store the cleaned pixels and accounting for an error where the image is repeated 3 times
    row = 1;
    
    % iterating over every pixel in the matrix and if its black transferring it to the clean array and if not making that pixel white
    while row <= rows
        for column = 1:columns/3
            if(matrix(row, column) == 0)
                array_of_shapes(row, column) = matrix(row, column);
            else
                array_of_shapes(row, column) = 255;
            end
            
        end
        row = row + 1; % incrementing the row
    end
    
    imshow(array_of_shapes); % showing the image
    fprintf("Finding shapes compiled\n");
end
