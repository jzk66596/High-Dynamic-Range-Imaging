% Wrapper for gsolve
% Input : Z - Sample matrix. 
%         It should be m*p*3. m is number of pixels. p is the number of
%         images. 3 for three channels.
% Missing lE
function [g,lE] = responseCurve(Z,B,l,w)
    g = zeros(256,3);
    g(:,1) = gsolve(Z(:,:,1),B,l,w);
    g(:,2) = gsolve(Z(:,:,2),B,l,w);
    g(:,3) = gsolve(Z(:,:,3),B,l,w);
    lE = 0;
end