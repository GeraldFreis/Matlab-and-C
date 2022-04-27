%% function to produce sub matrices for the FindingOperationsOneDigit and FindingOperationsTwoDigit classes
% the function will take the original matrix, the left column boundary and the right column boundary as
% parameters, and will iterate over every pixel in that range of the original matrix and return a new
% matrix

function submatrix = submatrices_maker(original_matrix, leftboundary, rightboundary)
    [totalrows, ~] = size(original_matrix); % finding the total rows and columns of the original matrix
    submatrix = zeros(totalrows, rightboundary-leftboundary); % initialising the submatrix

    try
        % iterating over every pixel in the range we need to iterate over
        for row = 1:totalrows
            for column = leftboundary:rightboundary
                submatrix(row, (column - leftboundary) + 1) = original_matrix(row, column); % setting each pixel as its counterpart of the original matrix
            end
        end
    catch % if the index of the matrix are negative or a non natural number we catch this errror
        fprintf("THE DIMENSIONS OF THE MATRICES PRODUCED FROM 'FindingOperations' ARE INCORRECT\n");
        return;
    end
end