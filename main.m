clc
clear

%% code requires using a font 72 and calibri
% tp = takingpictures;
% tp.takingpic
% initialising the image we wish to test / solve
var = 'testing_images/nine_divided_by_four.png';

pixelmatrix = pixeltomatrix(var);
% shaped_array = findingshapes(pixelmatrix);
matrix = callerfunction(pixelmatrix);

% retrieving what operator was found in the picture and using that to determine the result of the
% operation

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
