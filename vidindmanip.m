function img = vidindmanip( img_old )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
BW=im2bw(img_old,.08); %Change threshold for imaging
                       %Typically betwen .25 and .45
BW=imcomplement(BW);
BW=imfill(BW,'holes');
BW=bwareaopen(BW,1600); %Change minimum area of objects
BW=imclearborder(BW);
img=BW;
end
