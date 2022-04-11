%% This function is going to take the matrix composed in pixeltomatrix and look for adjacent elements to find shapes

% iteratively taking the value of all pixels less than 50 and capturing
% that in a new matrix
function array_of_shapes = findingshapes(matrix)
    [rows, columns] = size(matrix); % finding the rows and columns of the original matrix
    array_of_shapes = zeros(rows, columns/3); % initialising the new matrix, but the columns for some reason duplicated 3 times in the original image, so getting rid of that error too
    row = 1;
    % iterating over the rows and incrementing the rows for every loop
    while row <= rows
        for column = 1:columns/3 % iterating over the columns we need
            if(matrix(row, column) == 0) % checking if the pixel is black, and if so saving it to the new matrix and if not saving a white pixel to the new matrix
                array_of_shapes(row, column) = matrix(row, column);
            else
                array_of_shapes(row, column) = 255;
            end
            
        end
        row = row + 1;
    end
    
    imshow(array_of_shapes); % displaying the new, cleaned, image / shape
    fprintf("Finding shapes compiled\n");
end
