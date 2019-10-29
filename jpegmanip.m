function img = jpegmanip( img_old )
global BWthresh minArea
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
BW=im2bw(img_old,BWthresh); %Change threshold for imaging
                       %Typically betwen .25 and .45
BW=imcomplement(BW);
BW=imfill(BW,'holes');
BW=bwareaopen(BW,minArea); %Change minimum area of objects
BW=imclearborder(BW);
%mid=worm_midline(BW,1);
s=size(BW);

BW=bwmorph(BW,'remove');
% for i=1:length(mid(:,1))
%     BW(mid(i,1),mid(i,2))=1;
% end
%skel=bwmorph(BW,'skel',inf);
img=BW;
%imshow(img)
end
