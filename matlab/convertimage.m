I=imread('lena.png');
I2=imresize(I,[128 128]);
imwrite(I2,'img128lena.jpg');
Mask_maker('img128lena.jpg','imagemMIFlena128.mif')



% img = imread('img128lena.jpg');
% img =rgb2gray(img);
% img = im2uint8(img)/16;
% 
% sobelx=[-1 0 1; -2 0 2; -1 0 1];
% sobely=[-1 -2 -1; 0 0 0; 1 2 1];
% 
% imgX=imfilter(img, sobelx);
% imgY=imfilter(img, sobely);
% 
% 
% img_g= imgX+ imgY;
% imshow(img_g,[])