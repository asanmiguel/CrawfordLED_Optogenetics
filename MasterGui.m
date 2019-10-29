function varargout = MasterGui(varargin)
% MasterGui MATLAB code for MasterGui.fig
%      MasterGui, by itself, creates a new MasterGui or raises the existing
%      singleton*.
%
%      H = MasterGui returns the handle to a new MasterGui or the handle to
%      the existing singleton*.
%
%      MasterGui('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MasterGui.M with the given input arguments.
%
%      MasterGui('Property','Value',...) creates a new MasterGui or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MasterGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MasterGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MasterGui

% Last Modified by GUIDE v2.5 13-Feb-2017 14:03:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MasterGui_OpeningFcn, ...
                   'gui_OutputFcn',  @MasterGui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
% --- Executes just before MasterGui is made visible.
function MasterGui_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
 addpath('C:\Users\Adriana Lab\Zack\fig_export_package');
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = MasterGui_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

%%
function edit1_Callback(hObject, eventdata, handles)
global vidLength
vidLength = str2num(get(handles.edit1,'string'));
                                                          %VID LENGTH
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%
function edit2_Callback(hObject, eventdata, handles)
global flashLength
flashLength = str2num(get(handles.edit2,'string'));
                                                          %FLASH LENGTH
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%
function edit3_Callback(hObject, eventdata, handles)
global flashLength2
flashLength2 = str2num(get(handles.edit3,'string'));
                                                          %FLASH LENGTH 2
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%
function edit4_Callback(hObject, eventdata, handles)
global fileName
fileName = get(handles.edit4,'String');
                                                          %SAVEAS FILE NAME
function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%
function axes1_CreateFcn(hObject, eventdata, handles)     %AXES CREATE
%%
function edit5_Callback(hObject, eventdata, handles)
global movfileName
movfileName = get(handles.edit5,'String');
                                                          %MOV FILE PATH
function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%

function edit6_Callback(hObject, eventdata, handles)
global BWthresh
BWthresh = str2num(get(handles.edit6,'String'));
                                                          %THRESH VALUE
function edit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%
function edit7_Callback(hObject, eventdata, handles)
global minArea
minArea = str2num(get(handles.edit7,'String'));
                                                          %MIN AREA
function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%
function edit8_Callback(hObject, eventdata, handles)
global figfileName
figfileName = get(handles.edit8,'String');
                                                          %FIG FILE NAME
function edit8_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%
function popupmenu1_Callback(hObject, eventdata, handles)  %PROGRAM 2 RUN
global program2run
program2run=get(handles.popupmenu1,'Value');   
%%
function pushbutton1_Callback(hObject, eventdata, handles) %STOP BUTTON
manualstop = get(handles.pushbutton1,'Value')
if manualstop ==1;
    button=questdlg('Are you sure you want to exit?','Force Quit', 'Yes','No','Yes');
end
switch button
    case 'Yes'
        quit force
    case 'No'
end
%%
function pushbutton2_Callback(hObject, eventdata, handles) %GO BUTTON
global program2run movfileName
%%
if program2run == 1
    display('You must choose a program')
end
%%
if program2run==2                                          %IMAGE

    handles.video = videoinput('lumeneraimaq',1,'640x480');
    
    set(handles.video,'TimerPeriod', 0.05, ...
    'TimerFcn',['if(~isempty(gco)),'...
    'handles=guidata(gcf);'... % Update handles
    'image(getsnapshot(handles.video));'... % Get picture using GETSNAPSHOT and put it into axes using IMAGE
    'set(handles.axes1,''ytick'',[],''xtick'',[]),'... % Remove tickmarks and labels that are inserted when using IMAGE
    'else '...
    'delete(imaqfind);'... % Clean up - delete any image acquisition objects
    'end']);
    triggerconfig(handles.video,'immediate');
    axes(handles.axes1);
        vidRes = handles.video.VideoResolution;
        nBands = handles.video.NumberOfBands;
        hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
        preview(handles.video, hImage);
    %running_camera = getselectedsource(handles.video);
    axes(handles.axes1);
    %Set Up Arduino and parameters for flashing
    a=arduino('com5','uno');
    vidLength=str2num(get(handles.edit1,'String'));
    flashLength=str2num(get(handles.edit2,'String'));
    flashLength2=str2num(get(handles.edit3,'String'));
    fileName=get(handles.edit4,'String');
    handles.video.TriggerRepeat = vidLength-1;
    %Test Flash to warm up system
    writeDigitalPin(a, 'D11', 1);
    pause(1)
    writeDigitalPin(a, 'D11', 0);
    pause(3)
    t=zeros(vidLength+100,1);
    %Set up video object for recording
    %timer for light purposes
    timerVal=tic;
    %timer for fps purposes
    fpstic=tic;
    timer=0;
    ii=0;
    n=0;
    numAvail = vidLength;
    k=1;
    test=tic;
    time_index=1;
    while(k<=vidLength)     %record on a loop until # of frames lised above are reached
        axes(handles.axes1);
        writeDigitalPin(a, 'D11', 1);
        t3=tic;
        %timer loop for light off
        
        while toc(t3)<flashLength
            
            ii=(round(toc(timerVal)*10));
            
            if ii==0
                n=n+1;
                ii=n;
            end
            t(ii)=1;
            movdata(1:vidRes(2),1:vidRes(1),k)=rgb2gray(getsnapshot(handles.video));
            timesync(time_index).time=toc(test);
            timesync(time_index).light=1;
            time_index=time_index+1;
            %image(handles.axes1,movdata(:,:,k))
            k=k+1;
            
        end
        
        writeDigitalPin(a, 'D11', 0);
        t2=tic;
        %timer loop for light on
        while toc(t2)<flashLength2
            ii=round(toc(timerVal)*10);
            t(ii)=0;
            movdata(1:vidRes(2),1:vidRes(1),k)=rgb2gray(getsnapshot(handles.video));
            timesync(time_index).time=toc(test);
            timesync(time_index).light=0;
            time_index=time_index+1;
            k=k+1;
        end      
    end
    %turn light off to prevent blinding
    writeDigitalPin(a, 'D11', 0);
    %Calculate fps due to lack of this function with Lumenera camera
    timeelapsed=toc(fpstic);
    [a,b,c]=size(movdata);
    disp(['# of Frames',num2str(c)])
    fps=c/timeelapsed;
    disp(['fps',num2str(fps)])
    %end video taking
    stoppreview(handles.video);
    %start data extraction
    %get rid of leftover vid object to speed up rest of program
    clear handles.video
    %play video
    %create date and time folder to store vids in
    a=datetime('today');
    a=datestr(a);
    doc2=[timeelapsed, fps];
    folder = strcat('C:\Users\Adriana Lab\Zack','\',a,'\',fileName,'\')
    folder = num2str(folder);
    mkdir(folder)
    %save 2 txts and mov to use in analysis programs
    save([folder 'lighttime.txt'], 't', '-ascii');
    %save([folder 'timedata.txt'], 'time', '-ascii');
    save([folder 'other.txt'], 'doc2', '-ascii');
    save([folder 'movdata.mat'], 'movdata', '-mat');
    save([folder 'timesync.mat'], 'timesync', '-mat');
    %movie2avi(wormvid2, [folder 'wormvideo.avi']);
    cd ../
end

%%
if program2run==3                                            %PREVIEW
    handles.video = videoinput('lumeneraimaq',1,'640x480');
    set(handles.video,'TimerPeriod', 0.05, ...
    'TimerFcn',['if(~isempty(gco)),'...
    'handles=guidata(gcf);'... % Update handles
    'image(getsnapshot(handles.video));'... % Get picture using GETSNAPSHOT and put it into axes using IMAGE
    'set(handles.axes1,''ytick'',[],''xtick'',[]),'... % Remove tickmarks and labels that are inserted when using IMAGE
    'else '...
    'delete(imaqfind);'... % Clean up - delete any image acquisition objects
    'end']);
    triggerconfig(handles.video,'immediate');
    axes(handles.axes1);
        vidRes = handles.video.VideoResolution;
        nBands = handles.video.NumberOfBands;
        hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
        preview(handles.video, hImage);
    %running_camera = getselectedsource(handles.video);
    axes(handles.axes1);
end
%%
if program2run==4                                         %THRESHOLD

workingDir = tempname;
    mkdir(workingDir)
    mkdir(workingDir,'images')

    s = load(strcat(movfileName,'\','movdata.mat'));%insert filename
    [x,y,z]=size(s.movdata);
    zzzz=1;
    for zzzz=1:z
    threshold_otsu(zzzz)=graythresh(s.movdata(:,:,zzzz));
    end
        recthresh=['Recommended Threshold: ',num2str(mean(threshold_otsu))];
        disp(recthresh)
    iio = 1;
    %hold on
    while iio<(z+1)
       img_old = s.movdata(:,:,iio);
       %save jpegs
       img=jpegmanip(img_old);     
       
       filename = [sprintf('%03d',iio) '.jpg'];
       fullname = fullfile(workingDir,'images',filename);
       imwrite(img,fullname)
       iio = iio+1;
    end
        %OUTPUT TO BINARIZED AVI
        imageNames = dir(fullfile(workingDir,'images','*.jpg'));
        imageNames = {imageNames.name}';
        outputVideo = VideoWriter(fullfile(workingDir,'worm_out.avi'));
        outputVideo.FrameRate = 20;
        open(outputVideo)
    for iio = 1:length(imageNames)
       img = imread(fullfile(workingDir,'images',imageNames{iio}));
       writeVideo(outputVideo,img)
    end
        close(outputVideo)
        wormAvinew = VideoReader(fullfile(workingDir,'worm_out.avi'));
    iio = 1;
    while hasFrame(wormAvinew)
       mov(iio) = im2frame(readFrame(wormAvinew));
       iio = iio+1;
    end
        axes( handles.axes1 )
        axis off
        movie(handles.axes1,mov,1,wormAvinew.FrameRate)
    end
%%
if program2run==5                          %Eccentricity
       wormVideoecc =load(strcat(movfileName,'\','movdata.mat'));%insert filename
    ts=load(strcat(movfileName,'\','timesync.mat'), '-mat');
    other=fopen(strcat(movfileName,'\','other.txt'));
    other=textscan(other,'%f');
    other=cell2mat(other);
    %lighttime=lighttime/10;
    iin = 1;
    noobj=0;
    toomanyobj=0;
    [d,f,g]=size(wormVideoecc.movdata);
    numframe=g;
    ix=1;
    while ix<(numframe+1);
    tt(ix)=ts.timesync(ix).time;
    tl(ix)=ts.timesync(ix).light;
    ix=ix+1;
    end
    while iin < (g+1)
       img_older = wormVideoecc.movdata(:,:,iin);
       try
           E(iin)=curvature(img_older);
       catch
           E(iin)=1;
           toomanyobj=toomanyobj+1;
       end
       iin = iin+1;
    end

    %Fixing missing data points
    nonzero=find(E);
    zero=find(~E);
    pointsinterp=-1;
    zero=find(~E);
    A=zeros(numframe,2);
    B=zeros(length(tt(find(tl))),2);
    A(:,1)=tt(:);
    A(:,2)=E(:);
    B(:,1)=tt(find(tl));
    B(:,2)=E(find(tl));
    xlswrite(strcat(movfileName,'\','Eccentricity Data'), A)
    xlswrite(strcat(movfileName,'\','Time Data'), B);
    %Fixing the last data point
    try 
        E(zero)=(E(zero-1)+E(zero+1))/2;
        pointsinterp=pointsinterp+1;
    catch
        disp('Error-could not fix last data point!')
    end
    minpt=min(E);
   
    minfrm=find(abs(E-min(E)) < 0.0001);
    axes( handles.axes1 )
    %pp=pchip(tt(:),E(:));
    %fitline=ppval(pp,tt(:));
    plot(handles.axes1,tt(:),E(:)),...
             title ('Eccentricity vs. Time'),... 
             xlabel ('t(s)'), ylabel ('Eccentricity');
    


     ylim([.97*minpt 1]);
    hold on
    scatter(tt(find(tl)),E(find(tl)),'b')
    hold off
    
    disp(['Total Errors:',num2str(noobj+toomanyobj)])
    disp(['Missing Frame Errors:',num2str(noobj)])
    disp(['Extra Object Errors:',num2str(toomanyobj)])
    disp(['Missing Data Points Fixed:',num2str(pointsinterp)])
    disp(['Frame:', num2str(minfrm), ' Had the Lowest Eccentricity of:', num2str(minpt)])
    %ANALYSIS
    
end
%%
if program2run==6                                            %VID VIEW
     %VID VIEW
    workingDir = tempname;
    mkdir(workingDir)
    mkdir(workingDir,'images')
    s = load(strcat(movfileName,'\','movdata.mat'));%insert filename
    other=fopen(strcat(movfileName,'\','other.txt'));
    other=textscan(other,'%f');
    other=cell2mat(other);
    ts=load(strcat(movfileName,'\','timesync.mat'), '-mat');
    [x,y,z]=size(s.movdata);
    iio = 1;
    for iio=1:z
        s.movdata(5:30,5:30,iio)=100*ts.timesync(iio).light;
        iio=iio+1;
    end
    iio=1;
    %hold on
    while iio<(z+1)
       img = s.movdata(:,:,iio);    
       %save jpegs
       filename = [sprintf('%03d',iio) '.jpg'];
       fullname = fullfile(workingDir,'images',filename);
       imwrite(img,fullname)
       iio = iio+1;
    end
        %OUTPUT TO BINARIZED AVI
        imageNames = dir(fullfile(workingDir,'images','*.jpg'));
        imageNames = {imageNames.name}';
        outputVideo = VideoWriter(fullfile(workingDir,'worm_out.avi'));
        outputVideo.FrameRate = 20;
        open(outputVideo)


    for iio = 1:length(imageNames)
       img = imread(fullfile(workingDir,'images',imageNames{iio}));
       writeVideo(outputVideo,img)
    end
        close(outputVideo)
        wormAvinew = VideoReader(fullfile(workingDir,'worm_out.avi'));
    iio = 1;
    while hasFrame(wormAvinew)
       mov(iio) = im2frame(readFrame(wormAvinew));
       iio = iio+1;
    end
        axes( handles.axes1 )
        axis off
        movie(handles.axes1,mov,1,other(2))


    end
%%
if program2run==7                                          %FRAME VIEW
    svid = load(strcat(movfileName,'\','movdata.mat'));%insert filename
    ts=load(strcat(movfileName,'\','timesync.mat'), '-mat');
    [x,y,z]=size(svid.movdata);
    frnm=str2num(get(handles.edit6,'String'));
    img=vidindmanip(svid.movdata(:,:,frnm));
    img(5:30,5:30)=100*ts.timesync(frnm).light;
    axes(handles.axes1);
    imshow(img);
    
end


%%
function pushbutton3_Callback(hObject, eventdata, handles) %SAVE FIG BUTTON
global figfileName movfileName
F = getframe(handles.axes1);
Image = frame2im(F);
file=[movfileName,'\',figfileName]
axes(handles.axes1)
export_fig(gca,file,'-jpg')
%%
function pushbutton4_Callback(hObject, eventdata, handles) %RESET AXES
axes(handles.axes1);
 cla(handles.axes1,'reset');
