%% function to convert the image to a cleaned matrix of its pixels (either black (0) or white (255))
function array_of_img = pixeltomatrix(pics)
    
    %% producing a matrix of gradients from the greyscaled image
    
    % initialising the image we want to read and producing the size of the
    % array we need
    img = imread(pics, 'png');
    [rows, columns] = size(img);
    array_of_img = zeros(rows, columns/3); % counteracting an error where the image is 3 times the size it needs to be
    
    % iterating through each pixel of the image and if it is black adding it to the matrix, otherwise
    % making making the element at (row, column) in the matrix white
    for row = 1:rows
        for column = 1:columns/3 
            if(img(row, column) == 0)
                array_of_img(row, column) = img(row, column);
            else
                array_of_img(row, column) = 255;
            end
            
        end
    end
    
    fprintf("pixel to matrix compiled\n\n");
end
