%% function to iterate over every findingnumbers function and check if that number exists in the provided matrix
function digit_1 = checkingfirstnumber_digit1(submatrix, numberofdigits)
    digit_1 = 0;    
    if(numberofdigits == 2) % if it is a 2 digit operation
        digit_1 = 0;
        if(findingones(submatrix)==1) % checking if a 1 is the first digit of the first number in the image
            digit_1 = 10; % setting the first digit to be the version of that number in the tenth's realm
        elseif(findingtwos(submatrix)==1) % checking if a 2 is the first digit of the first number in the image
            digit_1 = 20;  % setting the first digit to be the version of that number in the tenth's realm
        elseif(findingthrees(submatrix)==1) % checking if a 3 is the first digit of the first number in the image
            digit_1 = 30;  % setting the first digit to be the version of that number in the tenth's realm
        elseif(findingfours(submatrix)==1) % checking if a 4 is the first digit of the first number in the image
            digit_1 = 40;  % setting the first digit to be the version of that number in the tenth's realm
        elseif(findingfives(submatrix)==1) % checking if a 5 is the first digit of the first number in the image
            digit_1 = 50;  % setting the first digit to be the version of that number in the tenth's realm
        elseif(findingsixes(submatrix)==1) % checking if a 6 is the first digit of the first number in the image
            digit_1 = 60;  % setting the first digit to be the version of that number in the tenth's realm
        elseif(findingsevens(submatrix)==1) % checking if a 7 is the first digit of the first number in the image
            digit_1 = 70;  % setting the first digit to be the version of that number in the tenth's realm
        elseif(findingeights(submatrix, 2)==1) % checking if a 8 is the first digit of the first number in the image
            digit_1 = 80;  % setting the first digit to be the version of that number in the tenth's realm
        elseif(findingnines(submatrix, 2)==1) % checking if a 9 is the first digit of the first number in the image
            digit_1 = 90;  % setting the first digit to be the version of that number in the tenth's realm
        else
            fprintf("Invalid character for first digit of the first number\n");
        end

    elseif(numberofdigits==1)%  % if it is a one digit operation
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
    else
        fprintf("ERROR: WE DO NOT FULLY SUPPORT THAT NUMBER OF DIGITS\n");
    end
end