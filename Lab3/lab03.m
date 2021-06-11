
%img1 = im2double(imread('cat_static.jpg'));
%figure, imshow(img1);


%% Median filter
%{
patch_size = [3, 3];
img_median=median_filter(img1,patch_size);
figure, imshow(img_median);
imwrite(img_median,'cat_3.jpg');

patch_size = [5, 5];
img_median2=median_filter(img1,patch_size);
figure, imshow(img_median2);
imwrite(img_median2,'c_5.jpg');

%}
%% Sobel Filter
img2 = im2double(imread('colosseum.jpg'));

H = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge 
img_sobel= sobel_filter(img2, H);
figure, imshow(img_sobel);
imwrite(img_sobel, 'colosseum_sobel_h.jpg');

H = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge
img_sobel= sobel_filter(img2, H);
figure, imshow(img_sobel);
imwrite(img_sobel, 'colosseum_sobel_v.jpg');


%% Gaussian filter
hsize = 5; sigma = 2;
img3= im2double(imread('changho.jpg'));
img_gaussian= gaussian_filter(img3, hsize, sigma);
figure, imshow(img_gaussian);
imwrite(img_gaussian, 'changho_gaussian_5.jpg');


hsize = 9; sigma = 4;
img_gaussian= gaussian_filter(img3, hsize, sigma);
figure, imshow(img_gaussian);
imwrite(img_gaussian, 'changho_gaussian_9.jpg');
