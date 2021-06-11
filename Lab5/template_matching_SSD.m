function [output, match] = template_matching_SSD(img, template, threshold)

[shift_v, shift_u] = size(template);
output = zeros(size(img, 1) + shift_u, size(img, 2) + shift_v);

output(shift_v:size(img, 1) + shift_v-1, shift_u:size(img, 2) + shift_u-1) = img;
cropped = zeros(size(img));
%% your code here
for u = 1 + shift_u : size(img, 2)
for v = 1 + shift_v : size(img, 1)
x1 = u - shift_u;
x2 = u-1;
y1 = v - shift_v;
y2 = v-1;
patch = img(y1:y2, x1:x2);
size(patch);
size(template);
% SSD
value = sum(sum((patch - template).^2));
output(v, u) = value;
end
end

cropped = output(shift_v:size(img, 1), shift_u:size(img, 2));

output = cropped;

%% threshold
match = (output < threshold);

end

