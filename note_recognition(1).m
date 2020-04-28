
%% clear workspace and command window
clear all; close all ;clc;
% a = arduino('COM5');
% a.configureDigitalPin(13, 'OUTPUT');
% a.configureDigitalPin(8, 'OUTPUT');
% a.configureDigitalPin(9, 'OUTPUT');
% a.configureDigitalPin(10, 'OUTPUT');
% a.configureDigitalPin(11, 'OUTPUT');
% a.configureDigitalPin(3, 'INPUT');
s = serial('COM5','BaudRate',9600);
fopen(s);
vid = webcam();
preview(vid);
tic
while (toc<15)
    pause(2);
%     b=a.readDigitalPin(3);
    inputser = fscanf(s);
    if ( inputser=='a')
        disp('Serial a Received');
       
        data = snapshot(vid);
        preview(vid);
%         a.writeDigitalPin(13,1);
    else
        disp('Serial a not received');
%         a.writeDigitalPin(13,0);
    end
end
%% read image
%[imname,impath]=uigetfile({'*.jpg;*.png'});
%im=imread([impath,'/',imname]);
im =data;
%preprocessing
%resize image
im=imresize(im,[128 128]);
%remove noise;
%seperate channels
 r_channel=im(:,:,1);
 b_channel=im(:,:,2);
 g_channel=im(:,:,3);
 %denoise each channel
 r_channel=medfilt2(r_channel);
 g_channel=medfilt2(g_channel);
 b_channel=medfilt2(b_channel);
 %restore channels
 rgbim(:,:,1)=r_channel;
 rgbim(:,:,2)=g_channel;
 rgbim(:,:,3)=b_channel;
 %featureextraction
fet=totalfeature(rgbim);
load db;
k=length(currency);
for j=1:k
    D(j)=dist(fet',currency(j).feature);
end
[value,index]=min(D);

if value<.001
   currency_name=currency(index).name;
   fprintf('recognized currency is : ');
   disp(currency_name)
   if(currency_name =='10 rupee')
       fprintf(s,'b');
%        a.writeDigitalPin(8,1);
   %{'10 Rupee';'20 Rupee';'50 rupee';'1000 rupee'}
   elseif(currency_name =='20 Rupee')
       fprintf(s,'c');
%        a.writeDigitalPin(9,1);
   elseif(currency_name =='50 Rupee')
%        a.writeDigitalPin(10,1);
       fprintf(s,'c')
   elseif(currency_name =='100 rupee')
%        a.writeDigitalPin(11,1);
   end
else
    disp('no matches found');
end
fclose(s);
delete(s);
clear s;
 
    
