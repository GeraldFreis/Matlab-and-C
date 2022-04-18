clc
clear

%% code requires using a font 72 and calibri with a image around 544 x 900 in size
% tp = takingpictures;
% tp.takingpic
% initialising the image we wish to test / solve
% var = 'testing_images/58_divided_by_37.png';
var = 'testing_images/83_divided_by_97.png';
% var = 'testing_images/nine_divided_by_four.png';

% asking the user how many digits the numbers in the image are:
% digits_amount = input("How many digits are on either side of the image: ");
digits_amount = 2;


pixelmatrix = pixeltomatrix(var); % producing a matrix of pixels that are either black or white from the image

if(digits_amount == 1) % using the caller function for 1 digit numbers
    matrix = callerfunction_one_digit(pixelmatrix);
elseif(digits_amount == 2) % using the caller function for two digit numbers
    matrix = callerfunction_two_digit(pixelmatrix);
else
    fprintf("We do not currently handle that number of digits");
end

% retrieving what operator was found in the picture and using that to determine the result of the
% operation based upon the numbers we have returned in the matrix

if(matrix(2)=="plus")
    num_1 =  str2double(matrix(1));
    num_2 =  str2double(matrix(3));
    result = num_1+num_2;
elseif(matrix(2)=="minus")
    num_1 =  str2double(matrix(1));
    num_2 =  str2double(matrix(3));
    result = num_1-num_2;
elseif(matrix(2)=="multiply")
    num_1 =  str2double(matrix(1));
    num_2 =  str2double(matrix(3));
    result = num_1*num_2;
elseif(matrix(2)=="divide")
    num_1 =  str2double(matrix(1));
    num_2 =  str2double(matrix(3));
    result = num_1 / num_2;
else
    result = 0;
end


fprintf("The result is: %0.2f\n", result);
