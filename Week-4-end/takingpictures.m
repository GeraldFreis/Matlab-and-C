
%% class to take picture, deblur, brighten, convert to greyscale and save it
classdef takingpictures
    % This class produces an image from the inbuilt camera and returns that
    % the reason this is a class is so that I can access and call the
    % functions from any file. This is useful as the image based calculator
    % I want to make will have multiple functions. Hence, I can lay it all
    % out like a proper app.

    properties
        takingpics
    end

    methods (Static)
        function pictures = takingpic
                cam = webcam(1);  % selects the camera to use as the first in the list
                
                snapped_img = snapshot(cam);  % takes the image
                % img = demosaic(snapped_img, A = demosaic(A,"rggb"));
                % processing that image so that it is clearer:
                processed_img = imlocalbrighten(snapped_img);
                deblurred_img = histeq(processed_img);
                
                % converting the image to greyscale:
                converted_img = rgb2gray(deblurred_img);
                
%                 imshow(converted_img);
                clear("cam");  % clears the camera connection
                imwrite(converted_img, 'tempimg.png', 'png');

                clc
                clear
            
        end
    end
end



% function pictures
%     cam = webcam(1);  % selects the camera to use as the first in the list
%     
%     snapped_img = snapshot(cam);  % takes the image
%     % img = demosaic(snapped_img, A = demosaic(A,"rggb"));
%     % processing that image so that it is clearer:
%     processed_img = imlocalbrighten(snapped_img);
%     deblurred_img = histeq(processed_img);
%     
%     % converting the image to greyscale:
%     converted_img = rgb2gray(deblurred_img);
%     
%     imshow(converted_img);
%     clear("cam");  % clears the camera connection
%     imwrite(converted_img, 'tempimg.png', 'png');
% 
% end
