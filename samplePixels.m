% Sample pixels from images
% Input: images - images matrix(m*n*3*p)
%        numPixels - number of pixels needed to sample
% Output: Z - Sample matrix. 
%         It should be m*p*3. m is number of pixels. p is the number of
%         images. 3 for three channels.
%         sampleIndex - the index of sample position
function [Z, sampleIndex] = samplePixels(images)
    % Number of images
    p = size(images,4);
    numPixels = size(images,1)*size(images,2);
    % Create the vector of sample indices    
    % We need N(P-1) > (Zmax - Zmin)
    % Assuming the maximum (Zmax - Zmin) = 255, 
    % N = (255 * 2) / (P-1) clearly fulfills this requirement
    numSamples = ceil(255*2 / (size(images,4) - 1)) * 2;
    % create a random sampling matrix, telling us which
    % pixels of the original image we want to sample
    % using ceil fits the indices into the range [1,numPixels+1],
    % i.e. exactly the range of indices of zInput
    step = numPixels / numSamples;
    sampleIndex = floor((1:step:numPixels));
    sampleIndex = sampleIndex';
    Z = zeros([length(sampleIndex) p 3]);
    for k = 1 : p
        channel = images(:,:,1,k);
        Z(:,k,1) = channel(sampleIndex);
        channel = images(:,:,2,k);
        Z(:,k,2) = channel(sampleIndex);
        channel = images(:,:,3,k);
        Z(:,k,3) = channel(sampleIndex);

    end
end