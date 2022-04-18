%% function to save this result in a text file so that we can plot it and past results
function savingresult(currentresult)

    try % attempting to write to the file
        file = fopen("pastresultsfile.txt", 'w'); % opening the file and allowing the script to write to it
        fprintf(file, "%f", currentresult); % writing the current result to the file
        fclose(file); % closing the file

        fprintf("\nResult successfuly written to data file\n");

    catch % if we are thrown an error
        error("RESULT NOT WRITTEN TO DATA FILE");
    end
    
end