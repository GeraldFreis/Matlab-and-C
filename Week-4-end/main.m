clc
clear


%% code requires using a font 72 and calibri
% tp = takingpictures;
% tp.takingpic
var = 'plus_symbol.png';
% var = 'number_1.png';
pixelmatrix = pixeltomatrix(var);
shaped_array = findingshapes(pixelmatrix);
pluses = findingplussymbol(shaped_array);
one = findingones(shaped_array);
