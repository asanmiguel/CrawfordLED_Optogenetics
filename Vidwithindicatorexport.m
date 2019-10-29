filename='AdditionalVid';
file=['C:\Users\Adriana Lab\Zack\Videos\',filename,'.avi'];
v = VideoWriter(file,'Uncompressed AVI');
v.FrameRate=10.8;
open(v);
svid = load('C:\Users\Adriana Lab\Zack\07-Feb-2018\1-2\movdata.mat');%insert filename
    ts=load('C:\Users\Adriana Lab\Zack\07-Feb-2018\1-2\timesync.mat', '-mat');
    [x,y,z]=size(svid.movdata);
 
ii = 1;
while ii<z
   img=svid.movdata(:,:,ii);
  % img=vidindmanip(svid.movdata(:,:,ii));
   img(5:30,5:30)=100*ts.timesync(ii).light;
   writeVideo(v,im2uint8(img));
   ii = ii+1;
   pause(.08)
end
close(v)
