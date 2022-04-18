% function pictures = takingpic
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
% %                 imshow(converted_img);
%     clear("cam");  % clears the camera connection
%     imwrite(converted_img, 'tempimg.png', 'png');
%     
%     pictures = imread("tempimg.png", 'png');
%     
%     fprintf("image taken\n");
% end
function pictures = takingpic
    cam = webcam(1);  % selects the camera to use as the first in the list
    
    snapped_img = snapshot(cam);  % takes the image
    % processing that image so that it is clearer:
    processed_img = imlocalbrighten(snapped_img);
    deblurred_img = histeq(processed_img);
    
    % converting the image to greyscale:
%     converted_img = rgb2gray(deblurred_img);
    
%                 imshow(converted_img);
    clear("cam");  % clears the camera connection
    imwrite(deblurred_img, 'tempimg.png', 'png');
    imshow(deblurred_img);

    pictures = imread("tempimg.png", 'png');
    
    fprintf("image taken\n");
end