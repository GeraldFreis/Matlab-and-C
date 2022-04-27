%% function to retrieve the past results from pastresultsfile.txt and create two arrays
% one array is a list of indexs of the results and the other is the past results

function [index_array, past_result_array] = retrievingpastresults()

    % opening the file that contains the data
    file = fopen("pastresultsfile.txt","r+"); % opening as read only
    
    % taking the data from the file and adding it to the array of past results
    past_results = fscanf(file, "%f\n"); % this creates a n x 1 matrix, but I need a 1 x n matrix so we have to convert this
    fclose(file);

    %% converting the vertical matrix into a horizontal array
    past_result_array = zeros(length(past_results)); % initialising the returned array of past results as horizontal (1 x n)

    for i = 1:length(past_results)
        past_result_array(i) = past_results(i); % copying the current val of past results into our returnable vector
    end

    % initialising index array as the values from 1 to the length (amount of elements) of past result
    % array
    index_array = 1:length(past_result_array);
end