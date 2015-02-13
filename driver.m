files = {'./Data/exposures/img01.jpg','./Data/exposures/img02.jpg',...
    './Data/exposures/img03.jpg','./Data/exposures/img04.jpg',...
    './Data/exposures/img05.jpg','./Data/exposures/img06.jpg',...
    './Data/exposures/img07.jpg','./Data/exposures/img08.jpg',...
    './Data/exposures/img09.jpg','./Data/exposures/img10.jpg',...
    './Data/exposures/img11.jpg','./Data/exposures/img11.jpg',...
    './Data/exposures/img13.jpg'};

numFiles = 13;
expTimes = [13, 10, 4, 3.2, 1, 0.8, 0.3, 1/4, 1/60, 1/80, 1/320, 1/400, 1/1000];

fprintf('Reading Images\n');
images = readImages(files);
fprintf('Done\n');

fprintf('Sampling from Images\n');
Z = samplePixels(images);
fprintf('Done\n');

w = [1:128 128:-1:1];

B = zeros(size(Z,1),numFiles);
for i = 1: numFiles
    B(:,i) = log(expTimes(i));
end

l = 50;
fprintf('Calculating Response Curve\n');
[g,lE] = responseCurve(Z,B,l,w);
fprintf('Done\n');

figure;
hold on;
plot(g(:,1),1:256,'-rs');
plot(g(:,2),1:256,'-gs');
plot(g(:,3),1:256,'-bs');
hold off;

fprintf('Constructing HDR\n');
hdr = constructHDR(images,expTimes,w,g);
fprintf('Done\n');

imshow(tonemap(hdr));