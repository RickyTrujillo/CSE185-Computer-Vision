%%
run('vlfeat-0.9.21/toolbox/vl_setup');

img1 = im2single(imread('denny/denny/denny02.jpg'));
img2 = im2single(imread('denny/denny/denny03.jpg'));

%% SIFT feature extraction
I1 = rgb2gray(img1);
I2 = rgb2gray(img2);

[f1, d1] = vl_sift(I1);
[f2, d2] = vl_sift(I2);

d1 = double(d1);
d2 = double(d2);

plot_sift(img1, f1, d1)
plot_sift(img2, f2, d2)

%% feature matching
[matches, scores] = vl_ubcmatch(d1, d2);
plot_match(img1, img2, f1, f2, matches);
%% RANSAC
e = 0.1;
s = 2;
p = 1.25;
delta = 5;
n = 2;

best_tx = 0;
best_ty = 0;

k = log(1-p) / log(1-((1-e)^n));
max_inlier = 0;

for i = 1:round(k)
    p = randi([1 size(matches, 2)]);
    p1 = f1(1:2, matches(1, p));
    p2 = f2(1:2, matches(2, p));
    
    tx_0 = p1(1) - p2(1);
    ty_0 = p1(2) - p2(2);
    
    inlier = 0;
    
    for j = 1:size(matches, 2)
        p1 = f1(1:2, matches(1, j));
        p2 = f2(1:2, matches(2, j));

        tx = p1(1) - p2(1);
        ty = p1(2) - p2(2);
        if (tx - tx_0)^2 + (ty - ty_0)^2 < delta
            inlier = inlier + 1;
        end
        
        if inlier > max_inlier
            best_tx = tx_0;
            best_ty = ty_0;   
            max_inlier = inlier;
        end  
    end
 end



%% Stitching
tx = round(best_tx);
ty = round(best_ty);

H = size(img1, 1);
W = size(img1, 2);

output = zeros(H + ty, W + tx, 3);
output(1:H, 1:W, :) = img1;

for y2 = 1:size(img2, 1)
    for x2 = 1:size(img2, 2)
    
        y1 = y2 + ty;
        x1 = x2 + tx;
        
        if( y1 >= 1 && y1 <= H + ty && x1 >= 1 && x1 <= W + tx )
            output(y1, x1, :) = img2(y2, x2, :);
        end
        
    end
end

figure, imshow(output);
imwrite(output, 'result3.png');



