%% This function is going to take the matrix composed in pixeltomatrix and look for adjacent elements to find shapes

% iteratively taking the value of all pixels that are black and adding them to a matrix, and any pixel that is not black
% is stored as white in the new array
function array_of_shapes = findingshapes(matrix)
    [rows, columns] = size(matrix); % finding the rows and columns of the original matrix of pixels
    
    array_of_shapes = zeros(rows, columns/3); % initialising the new matrix to hold the cleaned / filtered pixels
    
    % iterating over every pixel and if it is black then adding it to the matrix and if not adding a white pixel to the matrix
    row = 1;
    while row <= rows
        for column = 1:columns/3
            if(matrix(row, column) == 0) % if the pixel is black
                array_of_shapes(row, column) = matrix(row, column);
            else % if the pixel is not black
                array_of_shapes(row, column) = 255;
            end
            
        end
        row = row + 1; % incrementing the row
    end
    
    imshow(array_of_shapes); % showing the cleaned image
    fprintf("Finding shapes compiled\n");
end
