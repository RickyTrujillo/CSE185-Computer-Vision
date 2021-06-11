function img_filtered = gaussian_filter(img, hsize, sigma)

    kernel = fspecial('gaussian', hsize, sigma);
    
[m,n] = size(kernel);
img_filtered = im2double(zeros(m,n));

for u = 1:size(img, 2)-m
    for v = 1:size(img, 1)-n
       value=0;
       value = value+sum(sum(kernel.*img(v:v+hsize-1,u:u+hsize-1)));
       img_filtered(v,u,:) = value;
    end
end
end