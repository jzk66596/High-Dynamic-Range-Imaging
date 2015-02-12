% Sample pixels from images
% Input: images - images matrix(m*n*3*p)
%        numPixels - number of pixels needed to sample
% Output: Z - Sample matrix. 
%         It should be m*p*3. m is number of pixels. p is the number of
%         images. 3 for three channels.
%         sampleIndex - the index of sample position
function [Z, sampleIndex] = samplePixels(images, numPixels)
    % Number of images
    p = size(images,4);
    Z = zeros([numPixels p 3]);
    sampleIndex = randperm(size(images,1)*size(images,2));
    sampleIndex = sampleIndex(1:numPixels);
    for k = 1 : p
        for i = 1 : length(sampleIndex)
            % Transform sample index to matrix subscript
            colIndx = int32(sampleIndex(i)/size(images,2))+1;
            rowIndx = mod(sampleIndex(i),size(images,1))+1;
      
            Z(i,k,:) = images(rowIndx,colIndx,:,k);
        end
    end
end