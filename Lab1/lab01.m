% #1
%load image
img = imread('01.jpg');
img(:,:,1)=0;
%show image
figure, imshow(img);
%save image
imwrite(img,'red.jpg');

% #2
img = imread('02.jpg');
Y = img(:,:,1)*0.299 + img(:,:,2)*0.587 + img(:,:,3)*0.114;
figure, imshow(Y);
imwrite(Y,'gray.jpg');


% #3
img = imread('03.jpg');
I = imrotate(img,90);
figure, imshow(I);
imwrite(I,'rotate.jpg');

% #4
img = imread('04.jpg');
img = img(30:270,30:370,:)
figure, imshow(img);
imwrite(img,'crop.jpg');

% #5
img = imread('04.jpg');
I = flip(img);
figure, imshow(I);
imwrite(I,'flip.jpg');


% #6
img1 = imread('01.jpg');
img2 = imread('02.jpg');
img3 = imread('03.jpg');
img4 = imread('04.jpg');

canvas = zeros(300 * 2 + 15, 400 * 2 + 15, 3, 'uint8');

canvas(1:300, 1:400,:) = img1;
canvas(315:614, 1:400,:)=img2;
canvas(1:300, 415:814,:)=img3;
canvas(315:614, 415:814,:)=img4;

figure, imshow(canvas);
imwrite(canvas,'combine.jpg');


% #7
img1 = imread('04.jpg');
img2 = imread('flip.jpg');

img1 = img1(:);
img2 = img2(:);

img3 = (img1 + img2) ./ 2;

img3 = reshape(img3, 300, 400, 3);

figure, imshow(img3);
imwrite(img3,'average.jpg');