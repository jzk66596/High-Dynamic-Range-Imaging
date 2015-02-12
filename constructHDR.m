function [hdr] = constructHDR(images,expTimes,w,g)
    imageSize = size(images(:,:,:,1));
    hdr = zeros(imageSize);
    oneimage = zeros(imageSize);
    sum = zeros(imageSize);
    for i = 1 : length(expTimes)
        oneimage = images(:,:,:,i);
        w_matrix = w(oneimage+1);
        sum = sum + w_matrix;
        oneimage(:,:,1) = g(oneimage(:,:,1)+1) - expTimes(i);
        oneimage(:,:,2) = g(oneimage(:,:,2)+1) - expTimes(i);
        oneimage(:,:,3) = g(oneimage(:,:,3)+1) - expTimes(i);

        hdr = hdr + w_matrix .* oneimage;
    end
    hdr = hdr./sum;
    hdr = exp(hdr);
end
