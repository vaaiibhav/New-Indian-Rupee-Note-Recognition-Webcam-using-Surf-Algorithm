function newimg = scanip(input1)
%SCANIP Summary of this function goes here
%   Detailed explanation goes here

global currency_name;
global located;
global ten;
global twenty;
global fifty; 
global hundred;
matcher =30;


   match(input1,'10.jpg');
    if located >matcher
         currency_name = '10';
         disp ('Currency is 10 rupees');
         ten=1;
         twenty =0;
         fifty =0;
         hundred=0;
    end  
    
   match(input1,'101.jpg');
    if located >matcher
         currency_name = '10';
         disp ('Currency is 10 rupees');
         ten=1;
         twenty =0;
         fifty =0;
         hundred=0;
    end  
   match(input1,'201.jpg');
    if located >matcher
         currency_name = '20';
         disp ('Currency is 20 rupees');
         ten=0;
         twenty =1;
         fifty =0;
         hundred=0;
    end  
    match(input1,'20.jpg');
    if located >matcher
         currency_name = '20';
         disp ('Currency is 20 rupees');
         ten=0;
         twenty =1;
         fifty =0;
         hundred=0;
    end   
    
    match(input1,'50.jpg');
    if located >matcher
         currency_name = '30';
         disp ('Currency is 50 rupees');
         ten=0;
         twenty =0;
         fifty =1;
         hundred=0;
    end   
    
     match(input1,'100.jpg');
    if located >matcher
         currency_name = '100';
         disp ('Currency is 100 rupees');
         ten=0;
         twenty =0;
         fifty =0;
         hundred=1;
    end   
    
end

