% Read images 
% Input: files - the name of images
% Output: images - m*n*3*p matrix. m*n is the image size. p is the number 
%         of images

function [images] = readImages(files)
    % Number of files
    p = length(files);
    % Get image size
    imagesSize = size(imread(char(files(1))));
    % Declare images matrix
    images = zeros([imagesSize p]);
    
    for i = 1:p
        images(:,:,:,i) = imread(char(files(i)));
    end
end