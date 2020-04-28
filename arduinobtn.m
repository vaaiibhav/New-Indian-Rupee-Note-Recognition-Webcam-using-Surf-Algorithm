clear all;
clear a;
a = arduino('COM4');
a.configureDigitalPin(8, 'OUTPUT');
a.configureDigitalPin(12, 'INPUT');
tic
while (toc<10)
    pause(2);
    b=a.readDigitalPin(12);
    if ( b==1)
        disp('read');
        a.writeDigitalPin(13,1);
    else
        disp('cannot read');
        a.writeDigitalPin(13,0);
    end
end