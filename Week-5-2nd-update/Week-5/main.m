clc
clear

%% code requires using a font 72 and calibri
% tp = takingpictures;
% tp.takingpic
var = 'number_8.png';
% var = 'number_1.png';
pixelmatrix = pixeltomatrix(var);
shaped_array = findingshapes(pixelmatrix);
pluses = findingplussymbol(shaped_array);
one = findingones(shaped_array);
twos = findingtwos(shaped_array);
threes = findingthrees(shaped_array);
fours = findingfours(shaped_array);
fives = findingfives(shaped_array);
sixes = findingsixes(shaped_array);
sevens = findingsevens(shaped_array);
eights = findingeights(shaped_array);