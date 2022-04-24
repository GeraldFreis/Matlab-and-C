clc
clear

%% code requires using a font 72 and calibri
% tp = takingpictures;
% tp.takingpic
var = 'number_8.png';
% var = 'number_1.png';

pixelmatrix = pixeltomatrix(var); % creating a matrix of the pixels in the image
shaped_array = findingshapes(pixelmatrix); % cleaning the matrix of pixels 
pluses = findingplussymbol(shaped_array); % testing if a plus is in the image
one = findingones(shaped_array); % testing if a one is in the image
twos = findingtwos(shaped_array); % testing if a two is in the image
threes = findingthrees(shaped_array); % testing if a three is in the image
fours = findingfours(shaped_array); % testing if a four is in the image
fives = findingfives(shaped_array); % testing if a five is in the image
sixes = findingsixes(shaped_array); % testing if a six is in the image
sevens = findingsevens(shaped_array); % testing if a seven is in the image
eights = findingeights(shaped_array); % testing if an eight is in the image
