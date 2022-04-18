%% This function is going to take the matrix composed in pixeltomatrix and look for adjacent elements to find shapes

% iteratively taking the value of all pixels that are black, and making every other pixel white
% producing a new matrix from this and returning that cleaned matrix.

function array_of_shapes = findingshapes(matrix)
    [rows, columns] = size(matrix); % finding the rows and columns of the initial matrix
    array_of_shapes = zeros(rows, columns/3); % initialising the new cleaned matrix, however, the columns in the initial are triple of what is required
    row = 1;
    
    while row <= rows
        for column = 1:columns/3
            if(matrix(row, column) == 0) % iterating over every pixel and checking if the pixel is black and if so storing it in the vector
                array_of_shapes(row, column) = matrix(row, column);
            else % if the pixel is not black storing a white pixel in the matrix, this will clean the image
                array_of_shapes(row, column) = 255;
            end
            
        end
        row = row + 1;
    end
    
    imshow(array_of_shapes); % displaying the new, cleaned image
    fprintf("Finding shapes compiled\n");
end
