%#1 Shift 01.jpg by 25 pixels in the positive vertical direction, and save as translate.jpg
img = imread('01.jpg');
img2 = zeros(300+25, 400, 3, 'uint8');
for y1 = 1 : 300
    for x1 = 1 : 400
        y2 =y1+25;
        x2 =x1;
        img2(y2, x2, :) = img(y1, x1, :);
    end
end
figure, imshow(img2);
imwrite(img2,'translate.jpg');


%#2 Rotate 01.jpg by 60 degree using forward warping, and save as rotateF.jpg
img = imread('01.jpg');
img2 = zeros(300, 400, 3, 'uint8');
for y1 = 1 : 300
    for x1 = 1 : 400
      x2= cosd(60)*(x1-200)+sind(60)*(y1-150)+200;
      y2= -sind(60)*(x1-200)+cosd(60)*(y1-150)+150;
      x2=round(x2);
      y2=round(y2);
      if((1<x2) && (x2<400) && (y2>=1) && (y2<=300))
            img2(y2, x2, :) = img(y1, x1, :);
      end
    end
end
figure, imshow(img2);
imwrite(img2,'rotateF.jpg');



%#3 Rotate 01.jpg by 60 degree using backward warping, and save as rotateB.jpg
img = imread('01.jpg');
img2 = zeros(300, 400, 3, 'uint8');
for y2 = 1 : 300
    for x2 = 1 : 400
      x1= cosd(60)*(x2-200)-sind(60)*(y2-150)+200;
      y1= sind(60)*(x2-200)+cosd(60)*(y2-150)+150;
      x1=round(x1);
      y1=round(y1);
      if((1<x1) && (x1<400) && (y1>=1) && (y1<=300))
            img2(y2, x2, :) = img(y1, x1, :);
      end
    end
end
figure, imshow(img2);
imwrite(img2,'rotateB.jpg');


%#4 Vertical flip 01.jpg, and save as flip.jpg
img = imread('01.jpg');
img2 = zeros(300, 400, 3, 'uint8');
for y1 = 1 : 300
    for x1 = 1 : 400
      x2= cosd(270)*(y1-150)-sind(270)*(x1-200)+200;
      y2= sind(270)*(y1-150)+cosd(270)*(x1-200)+150;
      x2=round(x2);
      y2=round(y2);
      if((1<x2) && (x2<400) && (y2>=1) && (y2<=300))
            img2(y2, x2, :) = img(y1, x1, :);
      end
    end
end
figure, imshow(img2);
imwrite(img2,'flip.jpg');




%#5 Down-sample 01.jpg by scale of 2, and save as scale.jpg
img = imread('01.jpg');
img2 = zeros(150, 200, 3, 'uint8');
for y1 = 1 : 300
    for x1 = 1 : 400
      x2= (cosd(0)*(x1-200)+sind(0)*(y1-150)+200)/2;
      y2= (-sind(0)*(x1-200)+cosd(0)*(y1-150)+150)/2;
      x2=round(x2);
      y2=round(y2);
      if((1<x2) && (x2<200) && (y2>=1) && (y2<=150))
            img2(y2, x2, :) = img(y1, x1, :);
      end
    end
end
figure, imshow(img2);
imwrite(img2,'scale.jpg');