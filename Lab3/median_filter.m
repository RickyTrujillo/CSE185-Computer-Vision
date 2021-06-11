function img_filtered = median_filter(img, patch_size)
[m,n] = size(img);
img_filtered = im2double(zeros(m,n));

for i=patch_size(1)+1: size(img_filtered,2)
    for j=patch_size(2)+1: size(img_filtered,1)
        patch = img(i-patch_size(2):i, j-patch_size(1):j);
        patch= median(patch(:));
        img_filtered(i,j,:) = patch;
    end 
end