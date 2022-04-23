%% function to save this result in a text file so that we can plot it and past results
function past_result_array = savingresult(currentresult)

     try % attempting to write to the file
        currentfile = fopen("pastresultsfile.txt", 'r'); % opening the file
        A = fscanf(currentfile, "%f\n");
        fclose(currentfile);
        

        file = fopen("pastresultsfile.txt", 'w'); % opening the file and allowing the script to write to it

        % vertically concatenating the current result to the vertical array
        past_result_array = [A; currentresult];
        fprintf(file, "%f\n", past_result_array); % writing the current array to the file
        fclose(file); % closing the file
        
        fprintf("\nResult successfuly written to data file\n");
        return;

     catch % if we are thrown an error
         past_result_array = []; % ensuring that a result is returned regardless of error
         error("RESULT NOT WRITTEN TO DATA FILE");
     end
    
end