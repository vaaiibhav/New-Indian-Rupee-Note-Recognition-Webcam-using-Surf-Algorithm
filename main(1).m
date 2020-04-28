clear all; close all ;clc;
% a = arduino('COM4');
% a.configureDigitalPin(13, 'OUTPUT');
% a.configureDigitalPin(8, 'OUTPUT');
% a.configureDigitalPin(9, 'OUTPUT');
% a.configureDigitalPin(10, 'OUTPUT');
% a.configureDigitalPin(11, 'OUTPUT');
% a.configureDigitalPin(3, 'INPUT');
delete(instrfindall);


s = serial('COM5','BaudRate',9600);
fopen(s);
vid = webcam(2);
preview(vid);
global currency_name;
global ten;
global twenty;
global fifty; 
global hundred;
tic
while (toc<18)

     pause(2);
%     b=a.readDigitalPin(3);
    inputser = fscanf(s);
    disp('Send a now');
    pause(2);
    disp(inputser);
    if ( inputser~=NaN)
        disp('Serial a Received');
       
        data = snapshot(vid);
        preview(vid);
        data = rgb2gray(data);
        imwrite(data,'a.jpg');
      scanip('a.jpg');
%         a.writeDigitalPin(13,1);
    else
        disp('Serial a not received');
%         a.writeDigitalPin(13,0);
    end
end


   fprintf('recognized currency is : ');
   disp(currency_name)
   if(ten == 1)
       fprintf(s,'b');
%        a.writeDigitalPin(8,1);
   %{'10 Rupee';'20 Rupee';'50 rupee';'1000 rupee'}
   elseif(twenty == 1)
       fprintf(s,'c');
%        a.writeDigitalPin(9,1);
   elseif(fifty == 1)
%        a.writeDigitalPin(10,1);
       fprintf(s,'d');
   elseif(hundred == 1)
%        a.writeDigitalPin(11,1);
       fprintf(s,'d');
   else
       disp('currency not recognized');
            
   end
   

fclose(s);
delete(s);
clear s;
 

