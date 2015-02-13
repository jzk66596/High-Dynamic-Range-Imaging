function [hdr_result] = constructHDR(images,expTimes,w,g)
    
    imageSize = size(images(:,:,:,1));
    hdr_result = zeros(imageSize);
    oneimage = zeros(imageSize);
    sum = zeros(imageSize);
    for i = 1 : length(expTimes)
        oneimage = images(:,:,:,i);
        w_matrix = w(oneimage+1);
        sum = sum + w_matrix;
        g1 = g(:,1);
        oneimage(:,:,1) = g1(oneimage(:,:,1)+1) - log(expTimes(i));
        g2 = g(:,2);
        oneimage(:,:,2) = g2(oneimage(:,:,2)+1) - log(expTimes(i));
        g3 = g(:,3);
        oneimage(:,:,3) = g3(oneimage(:,:,3)+1) - log(expTimes(i));

        hdr_result = hdr_result + w_matrix .* oneimage;
    end
    hdr_result = hdr_result./sum;
    hdr_result = exp(hdr_result);
    
    %hdr_result = hdr(images,g(:,1),g(:,2),g(:,3),w, log(expTimes));
end
