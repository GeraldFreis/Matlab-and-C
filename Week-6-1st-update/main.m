clc
clear

%% code requires using a font 72 and calibri
% tp = takingpictures;
% tp.takingpic
var = 'first_test.png';
% var = 'number_1.png';

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


fprintf("The result is: %0.3f", result);
% pluses = findingplussymbol(shaped_array);
% one = findingones(shaped_array);
% twos = findingtwos(shaped_array);
% threes = findingthrees(shaped_array);
% fours = findingfours(shaped_array);
% fives = findingfives(shaped_array);
% sixes = findingsixes(shaped_array);
% sevens = findingsevens(shaped_array);
% eights = findingeights(shaped_array);
% nines = findingnines(shaped_array);