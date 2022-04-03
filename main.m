clc
clear

%% code requires using a font 72 and calibri
% tp = takingpictures;
% tp.takingpic
var = 'testing_images/nine_plus_three.png';

pixelmatrix = pixeltomatrix(var);
shaped_array = findingshapes(pixelmatrix);
matrix = callerfunction(shaped_array);

% working with the matrix
if(matrix(2)=="plus")
    num_1 =  str2double(matrix(1));
    num_2 =  str2double(matrix(3));
    result = num_1+num_2;
else
    result = 0;
end


fprintf("The result is: %0.2f", result);
