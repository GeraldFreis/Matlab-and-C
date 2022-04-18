%% finding the number in the final fifth of the image (i.e the second digit of the second number)
function digit_2 = checkingsecondnumber_digit2(matrix_2)
    digit_2 = 0; % variable to hold the second digit 
            
    % iterating over each findingnumbers function to determine what number is in this fifth of the image
    if(findingones(matrix_2)==1)
        digit_2 = 1;
    elseif(findingtwos(matrix_2)==1)
        digit_2 = 2;
    elseif(findingthrees(matrix_2)==1)
        digit_2 = 3;
    elseif(findingfours(matrix_2)==1)
        digit_2 = 4;
    elseif(findingfives(matrix_2)==1)
        digit_2 = 5;
    elseif(findingsixes(matrix_2)==1)
        digit_2 = 6;
    elseif(findingsevens(matrix_2)==1)
        digit_2 = 7;
    elseif(findingeights(matrix_2, 2)==1)
        digit_2 = 8;
    elseif(findingnines(matrix_2, 2)==1)
        digit_2 = 9;
    else
        fprintf("\nInvalid character for second digit of the second number");
    end
end
