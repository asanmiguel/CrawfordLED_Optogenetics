a=arduino('com7','uno');
    vidLength=45;
    flashLength=1;
    flashLength2=9;
    fileName='GelWellTest';
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
    while(toc(test)<=vidLength)     %record on a loop until # of frames lised above are reached
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
            timesync(time_index).time=toc(test);
            timesync(time_index).light=1;
            t1=tic;
            while toc(t1)<.1
            end
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
            timesync(time_index).time=toc(test);
            timesync(time_index).light=0;
            t1=tic;
            while toc(t1)<.1
            end
            time_index=time_index+1;
            k=k+1;
        end      
    end
    %turn light off to prevent blinding
    writeDigitalPin(a, 'D11', 0);
    %end video taking
    %create date and time folder to store vids in
    a=datetime('today');
    a=datestr(a);
    folder = strcat('C:\Users\Adriana Lab\Zack','\',a,'\',fileName,'\');
    folder = num2str(folder);
    mkdir(folder)
    %save 2 txts and mov to use in analysis programs
    save([folder 'lighttime.txt'], 't', '-ascii');
    %save([folder 'timedata.txt'], 'time', '-ascii');
    save([folder 'timesync.mat'], 'timesync', '-mat');
    %movie2avi(wormvid2, [folder 'wormvideo.avi']);
    cd ../
