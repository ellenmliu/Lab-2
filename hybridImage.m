function [im] = hybridImage(im1, im2, low, high)

imshow(im1);
imshow(im2);

im1 = im2double(im1);
im2 = im2double(im2);
im1 = imresize(im1, [512 512]);
im2 = imresize(im2, [512 512]);

%makking the lowpass and highpass filter
g = fspecial('gaussian', low*4+1, low);
g2 = fspecial('gaussian', high*4+1, high);

%convolution
L = convn(im1, g, 'same');
h = convn(im2, g2, 'same');

%im = I1*L + I2(1-H)
H = im2 - h;
im = H + L;
