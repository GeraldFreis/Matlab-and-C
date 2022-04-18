%% function to find the digit in the third fifth of the image, or the third third of the image depending on
% whether the function was called in FindingOperationsTwoDigit or FindingOperationsOneDigit

function digit_1 = checkingsecondnumber_digit1(submatrix, numberofdigits)
    digit_1 = 0; % initialising the return value

    % if the function was called in findingOperationsOneDigit
    if(numberofdigits == 1)       
        if(findingones(submatrix)==1) % checking if a 1 is in the first third of the image
            digit_1 = 1;
        elseif(findingtwos(submatrix)==1) % checking if a 2 is in the  first third of the image
            digit_1 = 2;
        elseif(findingthrees(submatrix)==1) % checking if a 3 is in the  first third of the image
            digit_1 = 3;
        elseif(findingfours(submatrix)==1) % checking if a 4 is in the  first third of the image
            digit_1 = 4;
        elseif(findingfives(submatrix)==1)  % checking if a 5 is in the  first third of the image
            digit_1 = 5;
        elseif(findingsixes(submatrix)==1)  % checking if a 6 is in the  first third of the image
            digit_1 = 6;
        elseif(findingsevens(submatrix)==1)  % checking if a 7 is in the  first third of the image
            digit_1 = 7;
        elseif(findingeights(submatrix, 1)==1)  % checking if a 8 is in the  first third of the image
            digit_1 = 8;
        elseif(findingnines(submatrix, 1)==1)  % checking if a 9 is in the  first third of the image
            digit_1 = 9;
        else % if none of the numbers return that they were found we have an invalid character
            fprintf("Invalid character for first number"); 
            digit_1 = 0;
        end
        fprintf("\n"); % adding a new line to the end of this operation
   
    % if the function was called from FindingOperationsTwoDigit
    elseif(numberofdigits == 2) % checking if a 2 is the first digit of the second number in the image
        if(findingones(submatrix)==1)% checking if a 1 is the first digit of the second number in the image
            digit_1 = 10;
        elseif(findingtwos(submatrix)==1) % checking if a 2 is the first digit of the second number in the image
            digit_1 = 20;
        elseif(findingthrees(submatrix)==1)% checking if a 3 is the first digit of the second number in the image
            digit_1 = 30;
        elseif(findingfours(submatrix)==1) % checking if a 4 is the first digit of the second number in the image
            digit_1 = 40;
        elseif(findingfives(submatrix)==1) % checking if a 5 is the first digit of the second number in the image
            digit_1 = 50;
        elseif(findingsixes(submatrix)==1) % checking if a 6 is the first digit of the second number in the image
            digit_1 = 60;
        elseif(findingsevens(submatrix)==1) % checking if a 7 is the first digit of the second number in the image
            digit_1 = 70;
        elseif(findingeights(submatrix, 2)==1) % checking if a 8 is the first digit of the second number in the image
            digit_1 = 80;
        elseif(findingnines(submatrix, 2)==1) % checking if a 9 is the first digit of the second number in the image
            digit_1 = 90;
        else
            fprintf("\nInvalid character for first digit of the second number\n");
        end
    else % if the function was neither called from FindingOperationsTwoDigit or FindingOperationsOneDigit
        fprintf("ERROR: WE DO NOT SUPPORT THIS NUMBER OF DIGITS\n");
    end
end