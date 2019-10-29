function E = curvature( img_old )
global BWthresh minArea
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
BW=im2bw(img_old,BWthresh); %Change threshold for imaging
                       %Typically betwen .25 and .45
BW=imcomplement(BW);
BW=imfill(BW,'holes');
BW=bwareaopen(BW, minArea); %Change minimum area of objects
BW=imclearborder(BW);
skel=bwmorph(BW,'skel',inf);
s=regionprops(skel,'Eccentricity');
try
    E=s.Eccentricity;
catch
    E=1;
    noobj=noobj+1;
end
end
