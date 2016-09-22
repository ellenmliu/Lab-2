function [g, l, A] = pyramids(im, N)

im = im2double(im);
old = im;

for i = 1:N
    %gaussian with sigma 2^level
    G = fspecial('gaussian', i*4+1, 2^i);
    I = convn(im, G, 'same');
    
    %laplacian stack where L = g[i] - g[i+1]
    L = old - I;
    old = I;
    L = imadjust(L);
    
    subplot(2,N,i), imshow(I);
    subplot(2,N,N+i), imshow(L);
    g = I;
    l = L;
end
% truesize;