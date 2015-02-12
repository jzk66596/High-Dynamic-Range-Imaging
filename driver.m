files = {'./Data/exposures/img01.jpg','./Data/exposures/img02.jpg',...
    './Data/exposures/img03.jpg','./Data/exposures/img04.jpg',...
    './Data/exposures/img05.jpg','./Data/exposures/img06.jpg',...
    './Data/exposures/img07.jpg','./Data/exposures/img08.jpg',...
    './Data/exposures/img09.jpg','./Data/exposures/img10.jpg',...
    './Data/exposures/img11.jpg','./Data/exposures/img11.jpg',...
    './Data/exposures/img13.jpg'};

numFiles = 13;
expTimes = [13, 10, 4, 3.2, 1, 0.8, 0.3, 1/4, 1/60, 1/80, 1/320, 1/400, 1/1000];
images = zeros(768,1024,3,numFiles);
channel = zeros(768,1024,numFiles);
for i = 1:numFiles
    images(:,:,:,i) = imread(char(files(i)));
    channel(:,:,i) = images(:,:,1,i);
end

numPixels = 2000;
pixels = [randi(768,numPixels,1) randi(1024,numPixels,1)];

Z = zeros(numPixels,numFiles);
for i = 1 : numPixels
    pos = pixels(i,:);
    for j = 1 : numFiles
        Z(i,j) =  channel(pos(1),pos(2),j);
    end
end

zmin = min(Z(:));
zmax = max(Z(:));
w = ones(1,256);

B = zeros(numPixels,numFiles);
for i = 1: numFiles
    B(:,i) = log(expTimes(i));
end
l = 50;

[g,lE] = gsolve(Z,B,l,w);
