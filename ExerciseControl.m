clear a
a=arduino('com5','uno');
t_on=.01;
Hz=20;
hourtimer=tic;
while toc(hourtimer)<3600
    mintimer=tic;
    while toc(mintimer)<30
        %pulse on
        writeDigitalPin(a,'D11',1)
        pulsetimer=tic;
        while toc(pulsetimer)<t_on
            %A(floor(toc(mintimer)*1000)+1)=1;
        end
        writeDigitalPin(a,'D11',0)
        while toc(pulsetimer)<1/Hz
            %A(floor(toc(mintimer)*1000))=0;
        end
    end
    while toc(mintimer)<60
    end
end