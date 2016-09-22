%basically the same as pyramids.m but with minor changes

im = imread('abe.jpg');

N = 5;
im = im2double(im);
old = im;

for i = 1:N
    G = fspecial('gaussian', i*4+1, 2^i);
    I = convn(im, G, 'same');
    
    L = old - I;
    old = I;
    L = mat2gray(L);
    
    subplot(2,N,i), imshow(I);
    subplot(2,N,N+i), imshow(L);
end
truesize;