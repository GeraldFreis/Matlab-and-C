clc
clear


%% code requires using a font 72 and calibri
% tp = takingpictures;
% tp.takingpic
var = 'plus_symbol.png';
% var = 'number_1.png';
pixelmatrix = pixeltomatrix(var); % matrix of pixels from the image
shaped_array = findingshapes(pixelmatrix); % cleaning the matrix and returning the new cleaned matrix
pluses = findingplussymbol(shaped_array); % checking if a plus is present in the image
one = findingones(shaped_array); % checking if a one is present in the image
