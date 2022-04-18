clc
clear


%% code requires using a font 72 and calibri
% tp = takingpictures;
% tp.takingpic
var = 'testing_images/number_9.png';
% var = 'number_1.png';
pixelmatrix = pixeltomatrix(var);
shaped_array = findingshapes(pixelmatrix);
pluses = findingplussymbol(shaped_array);
one = findingones(shaped_array);
twos = findingtwos_deprecated(shaped_array);
threes = findingthrees_deprecated(shaped_array);
fours = findingfours_deprecated(shaped_array);
fives = findingfives_deprecated(shaped_array);
sixes = findingsixes_deprecated(shaped_array);
sevens = findingsevens_deprecated(shaped_array);
eights = findingeights_deprecated(shaped_array);
nines = findingnines_deprecated(shaped_array);