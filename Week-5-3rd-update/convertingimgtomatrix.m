
%% class to take the pixels of an image and transform into a multidimensional array that can be analysed
classdef convertingimgtomatrix

    properties
        pixeltomatrices
    end

    methods (Static)
        function convertingimage = pixeltomatrix
            %% initialising an object from the class in takingpictures
            pics = takingpictures;
            pics.takingpic  % calling the function takingpic --> which takes a picture and converts it to greyscale, and then saves it
            
            %% producing a matrix of gradients from the greyscaled image
            
            % initialising the image we want to read and producing the size of the
            % array we need
            img = imread("tempimg.png", 'png');
            array_of_img = [];
            
            
            % iterating through each pixel of the image and adding its greyscale  colour to the
            % matrix
            % we are going to do this by creating a new page of dimension 257*257 
            % for each iteration and append this to the array_of_img vector
            
            for i = 1:257
                sub_array = [];  % subarray to hold the gradients of the pixel in row i column j,
                % this array will be concatenated to the final array
                for j = 1:257  % j = 1: 3: 257
                    sub_array = [sub_array, impixel(img, i, j)];
                end
                array_of_img = cat(257, array_of_img, sub_array);
            end
            
            % ensuring that the program works
            fprintf("Ended\n");
            % returning the multi-dimensional array created
            return array_of_img;
        end
    end
end




