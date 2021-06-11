function img_filtered = sobel_filter(img, kernel)
img_filtered = zeros(size(img));
for u = 2 : size(img, 2)-2
    for v = 2 : size(img, 1)-2
        value = 0; 
        for i = -1:1 
            for j = -1:1 
                value = value + sum(sum(img(v+i,u+j)*kernel(i+2,j+2)));
            end
        end
        img_filtered(v, u,:) = value;
    end
end
end