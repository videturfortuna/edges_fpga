function t = Mask_maker(image_name, text_name)
% Read a RGB image file and write to YCbCr text files
% for Y, Cb, and Cr channels
% ---------------------------
% The format of text file:
% W  ; Width size
% H  ; Height size
% N  ; number of frame
% XXXXXX ; YCbCr data in Hex
% XXXXXX
% .....
% ---------------------------
im = imread(image_name);
im =rgb2gray(im);
im = im2uint8(im);
fid = fopen(text_name,'W'); 
imsize = size(im);
count = 0;
if (fid)     
    %% Write the RGB data
    fprintf(fid,'WIDTH = 12;\n');
    fprintf(fid,'DEPTH = %d;\n',imsize(1)*imsize(2));
    fprintf(fid,'ADDRESS_RADIX = HEX;\n');
    fprintf(fid,'DATA_RADIX = HEX;\n');
    fprintf(fid,'CONTENT BEGIN\n\n');
    for i=1:imsize(1)
       for j=1:imsize(2)
          fprintf(fid,'%x  : ',count);
          count = count + 1;
          %B=bitand(0xF0, im(i,j,1));
          %          fprintf(fid,'%x', B);  
%           H= dec2hex(im(i,j,1));
%              fprintf(fid,'%c', H(1));
%            H= dec2hex(im(i,j,2));
%              fprintf(fid,'%c', H(1));
          H= dec2hex(im(i,j)/16);
             fprintf(fid,'%c; \n', H(1));

       end    
    end 
    fprintf(fid,'END;\n');
    fclose(fid);
    t = 0; % successful
	
else
    t = 1; % error
end



