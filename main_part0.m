a = imread('beach.jpg');
subplot(1, 2, 1);
imshow(a), axis image, truesize;
figure;
A = double(a);

%impulse filter
o = [ 0 0 0; 0 1 0; 0 0 0];
o = double(o);

%blur filter
b = [ 1 2 1; 2 4 2; 1 2 1];
b = double(b);
b = b/16;

%unsharpen mask
d = o - b + o;
D2 = convn(A, d);
D2 = uint8(D2);
imshow(D2),axis image, truesize;