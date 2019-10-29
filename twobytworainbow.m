directory='C:/Users/Zack/Documents/MATLAB/Fig1Vid/';
z=dir(fullfile(directory,'*.avi'));
%%
i=4;
file=strcat(directory,z(i).name);%
video=z(i).name(1:end);
xyloObj = VideoReader(file);
info = get(xyloObj);
%% 
obj=VideoReader(file);
totalframes=obj.NumberofFrames;
f1=rgb2gray(read(obj,1));
imshow(imadjust(f1),[]);
impixelinfo();
rect=getrect();
% rect=round(rect);
% SEGMENT FIRST FRAME BASED ON INTENSITY
close all
% new=zeros(size(ni,1),size(ni,2),3);
%%
rainbow=[255,0,0;255,127,0;255,255,0;127,255,0;0,255,0;0,255,127;0,255,255;...
    0,127,255;0,0,255;127,0,255;255,0,255;255,0,127];
rainbow=rainbow./255;
% rainbow=rB;
%%

st=1;
skip=4;
en=st+10*skip;
f=length([st:skip:en]);
rainbow=hot(f);

newold=[];
clear newr newg newb composite
ct=0;
% figure(1)
for k=st:skip:en
    ct=ct+1;
    f1=read(obj,k);
    f1g=double(f1);
    ni=imcomplement(mat2gray(f1g(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3))));
%     subplot(2,5,ct);
%     imshow(ni);
%     thr=graythresh(ni);
%     nil=im2bw(ni,0.5);
%     nil = bwmorph(BW3,'skel',Inf);
    newr(k).img=rainbow(ct,1)*ni;
    newg(k).img=rainbow(ct,2)*ni;
    newb(k).img=rainbow(ct,3)*ni;
%     =new;
end
allr=zeros(size(ni,1),size(ni,2),1);
allg=zeros(size(ni,1),size(ni,2),1);
allb=zeros(size(ni,1),size(ni,2),1);

for k=st:skip:en
    allr=allr+newr(k).img;
    allg=allg+newg(k).img;
    allb=allb+newb(k).img;
end

composite(:,:,1)=allr;
composite(:,:,2)=allg;
composite(:,:,3)=allb;

figure;
imshow(composite)

