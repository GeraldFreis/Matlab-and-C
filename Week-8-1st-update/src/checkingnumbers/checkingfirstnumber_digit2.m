function digit_2 = checkingfirstnumber_digit2(submatrix)
    % iterating over each findingnumbers function to determine what number is in the second fifth of the image
    digit_2 = 0;
    if(findingones(submatrix)==1)
        digit_2 = 1;
    elseif(findingtwos(submatrix)==1)
        digit_2 = 2;
    elseif(findingthrees(submatrix)==1)
        digit_2 = 3;
    elseif(findingfours(submatrix)==1)
        digit_2 = 4;
    elseif(findingfives(submatrix)==1)
        digit_2 = 5;
    elseif(findingsixes(submatrix)==1)
        digit_2 = 6;
    elseif(findingsevens(submatrix)==1)
        digit_2 = 7;
    elseif(findingeights(submatrix, 2)==1)
        digit_2 = 8;
    elseif(findingnines(submatrix, 2)==1)
        digit_2 = 9;
    else
        fprintf("Invalid character for second number\n");
    end
end