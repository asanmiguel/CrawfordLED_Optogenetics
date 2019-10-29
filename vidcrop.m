clear all
clc
addpath Fig1Vid
vid1=VideoReader('C:\Users\Zack\Documents\MATLAB\fig1.avi');
writerObj1 = VideoWriter('C:\Users\Zack\Documents\MATLAB\Fig1Vid\EnoL.avi');
open(writerObj1);
%% E no L 
for i=1500:1541
  im=read(vid1,i);
  imc=imcrop(im,[420 190 59 59]);% The dimention of the new video
  imc=rgb2gray(imc);
  imbig=imresize(imc,2.5);
  Idiff=imdiffusefilt(imbig);
  B=uint8(Idiff);
  C=im2bw(B,graythresh(imc));
  D=imcomplement(C);
  E=imfill(D,'holes');
  F=bwareaopen(E,80);
  G=imcomplement(F);
  H=im2uint8(G);
  writeVideo(writerObj1,H);  
%     subplot(1,3,1)
%     imshow(im)
%     subplot(1,3,2)
%     imshow(imc) 
end
close(writerObj1)
%% E with L
writerObj2 = VideoWriter('C:\Users\Zack\Documents\MATLAB\Fig1Vid\EwL.avi');
open(writerObj2);
for i=2665:2706
  im=read(vid1,i);
  imc=imcrop(im,[420 190 59 59]);% The dimention of the new video
  imc=rgb2gray(imc);
  imbig=imresize(imc,2.5);
  Idiff=imdiffusefilt(imbig);
  B=uint8(Idiff);
  C=im2bw(B,graythresh(imc));
  D=imcomplement(C);
  %E=imfill(D,'holes');
  F=bwareaopen(D,100);
  G=imcomplement(F);
  H=im2uint8(G);
  writeVideo(writerObj2,H);  
%     subplot(1,3,1)
%     imshow(im)
%     subplot(1,3,2)
%     imshow(imc) 
end

close(writerObj2)
%% C no L
writerObj3 = VideoWriter('C:\Users\Zack\Documents\MATLAB\Fig1Vid\CnoL.avi');
open(writerObj3);
for i=1500:1541
  im=read(vid1,i);
  imc=imcrop(im,[70 105 59 59]);% The dimention of the new video
  imc=rgb2gray(imc);
  imbig=imresize(imc,2.5);
  Idiff=imdiffusefilt(imbig);
  B=uint8(Idiff);
  C=im2bw(B,graythresh(imc)-.022);
  D=imcomplement(C);
  E=imfill(D,'holes');
  F=bwareaopen(E,200);
  F=imclearborder(F);
  G=imcomplement(F);
  H=im2uint8(G);
  writeVideo(writerObj3,H);  
%     subplot(1,3,1)
%     imshow(im)
%     subplot(1,3,2)
%     imshow(imc)
end
close(writerObj3)

%% C with L
writerObj4 = VideoWriter('C:\Users\Zack\Documents\MATLAB\Fig1Vid\CwL.avi');
open(writerObj4);
for i=2665:2706
  im=read(vid1,i);
  imc=imcrop(im,[70 105 59 59]);% The dimention of the new video
  imc=rgb2gray(imc);
  imbig=imresize(imc,2.5);
  Idiff=imdiffusefilt(imbig);
  B=uint8(Idiff);
  C=im2bw(B,graythresh(imc)-.022);
  D=imcomplement(C);
  E=bwareaopen(D,10);
  F=imfill(E,'holes');

  F=imclearborder(F);
  F=bwareaopen(F,120);
  G=imcomplement(F);
  G=bwareaopen(G,120);
  H=im2uint8(G);
  writeVideo(writerObj4,H);  
%     subplot(1,3,1)
%     imshow(im)
%     subplot(1,3,2)
%     imshow(imc)
end
close(writerObj4)
%% Vid Analysis
vid2=VideoReader('CwL.avi');
for i=1:40
imshow(read(vid2,i))
prompt='Next Frame?';
str=input(prompt,'s');
end
close(gcf)