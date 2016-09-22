im1= imread('sp.jpg');
im2 = imread('cf.jpg');

[im1, im2] = align_images(im1, im2);

cutoff_low = 3;
cutoff_high = 12; 
im12 = hybridImage(im1, im2, cutoff_low, cutoff_high);

% %% Crop resulting image (optional)
figure(20), hold off, imagesc(im12), axis image, colormap gray
disp('input crop points');
[x, y] = ginput(2);  x = round(x); y = round(y);
im12 = im12(min(y):max(y), min(x):max(x), :);
figure(20), hold off, imagesc(im12), axis image, colormap gray

N = 5; % number of pyramid levels (you may use more or fewer, as needed)
pyramids(im12, N);
