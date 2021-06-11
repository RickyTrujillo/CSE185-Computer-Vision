function [magnitude, orientation] = sobel_feature(img)

Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge
Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge
[shift_v, shift_u] = size(Hx);
img1 = zeros(size(img, 1) + 2, size(img, 2) + 2);
img1(2:size(img, 1)+1, 2:size(img, 2)+1, :) = img(1:size(img,1),1:size(img,2), :);
Gy = zeros(size(img, 1) + 2, size(img, 2) + 2);
Gx = zeros(size(img, 1) + 2, size(img, 2) + 2);
%% Sobel filtering
for u = 2 : size(Gy, 2) -1
for v = 2 : size(Gy, 1) -1
value1 = 0;
value2 = 0;
for i = -1:1
for j = -1:1
value1 = value1 + sum(sum(img1(v+i,u+j) * Hy(i+2,j+2)));
value2 = value2 + sum(sum(img1(v+i,u+j) * Hx(i+2,j+2)));
end
end
Gy(v,u) = value1;
Gx(v,u) = value2;
end
end
%% compute gradient magnitude and orientation
magnitude = sqrt(Gy.^2 + Gx.^2); % change img to your gradient magnitude
orientation = atan2(Gy,Gx); % change img to your gradient orientation
end

