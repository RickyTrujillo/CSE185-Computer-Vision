img = im2double(imread('cameraman.jpg'));

sigma = 2.0;
hsize = 7;
scale = 5;


%% Gaussian Pyramid
I = img;
for s = 1:scale

% Gaussian filtering
I = imgaussfilt(I, sigma);
figure, imshow(I);
% Save or show image
imwrite(I, sprintf('Gaussian_scale%d.jpg', s)); % change I to the output of Gaussian filter

% Down-sampling
I = imresize(I, 1/s);

end


%% Laplacian Pyramid
I = img;
I2 = img;
for s = 1:scale

% Gaussian filtering
I = imgaussfilt(I, sigma);
% Laplacian filtering
I = I2 - I;
figure, imshow(I);
% Save or show image
imwrite(I + 0.5, sprintf('Laplacian_scale%d.jpg', s)); % change I to the output of Laplacian filter

% Down-sampling
I = imresize(I, 1/s);
I2 = I;

end

