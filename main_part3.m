a = rgb2gray(imread('apple.jpeg'));
b = rgb2gray(imread('orange.jpeg'));

%making a mask
[rows columns] = size(a);
mask = zeros(rows,columns);

for i = 1:rows/2
    for j = 1:columns
        mask(i,j) = 1;
    end
end
one = im2double(mask);
two = im2double(1 - mask);

[GA, LA] = pyramids(a,5);
truesize, figure;
[GB, LB] = pyramids(b,5);
truesize;
figure;
[GR, LR] = pyramids(mask,5);
truesize;
figure;
gr = 1-GR;

for i = 1:rows
    for j = 1:columns
        LS(i,j) = GR(i,j)*(LA(i,j)+GA(i,j))+ gr(i,j)*(LB(i,j)+GB(i,j));
    end
end
imshow(LS);
