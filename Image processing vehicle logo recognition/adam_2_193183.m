tiledlayout("flow");
 
img1 = imread("Case1-Front1.bmp");
img2 = imread("Case2-Front2.jpg");
img3 = imread("Case2-Rear1.jpg");
img4 = imread("Case2-Rear2.jpg");


gray1=rgb2gray(img1);
gray2=rgb2gray(img2);
gray3=rgb2gray(img3);
gray4=rgb2gray(img4);


targetSize=[50 50];
ci1=centerCropWindow2d(size(gray1),targetSize);
ci2=centerCropWindow2d(size(gray2),targetSize);
ci3=centerCropWindow2d(size(gray3),targetSize);
ci4=centerCropWindow2d(size(gray4),targetSize);

i1=imcrop(gray1,ci1);
i2=imcrop(gray2,ci2 , [1150 350 100 100]);
i3=imcrop(gray3,ci3 ,[160 250 30 30]);
i4=imcrop(gray4,ci4 ,[480 440 50 30]);


figure ,imshow(i1);
figure ,imshow(i2)
figure ,imshow(i3)
figure ,imshow(i4)

%download logos
%imwrite(i1,'1.png');
%imwrite(i2,'2.png');
%imwrite(i3,'3.png');
%imwrite(i4,'4.png');


%load database% 
d1 = imread("1.png");
d2 = imread("2.png");
d3 = imread("3.png");
d4 = imread("4.png");

%convert databse images to grayscale 
%d1=rgb2gray(d1c);
%d2=rgb2gray(d2c);
%d3=rgb2gray(d3c);
%d4=rgb2gray(d4c);

%detect feature of each database img
fftD1=fft2(double(d1));
d1features=abs(fftD1(:));
d1features=sort(d1features,'descend');
d1features=d1features(1:3);

d1features

fftD2=fft2(double(d2));
d2features=abs(fftD2(:));
d2features=sort(d2features,'descend');
d2features=d2features(1:3);

d2features

fftD3=fft2(double(d3));
d3features=abs(fftD3(:));
d3features=sort(d3features,'descend');
d3features=d3features(1:3);

d3features

fftD4=fft2(double(d4));
d4features=abs(fftD4(:));
d4features=sort(d4features,'descend');
d4features=d4features(1:3);

d4features

features=[d1features,d2features,d3features,d4features];
features

% get feature of each test case

%first case%
fftI=fft2(double(i1));
imagefeatures=abs(fftI(:));
imagefeatures=sort(imagefeatures,'descend');
imagefeatures=imagefeatures(1:3);
imagefeatures


for i=1:4
nearesy(i)=sqrt((imagefeatures(1)-features(1,i))^2+(imagefeatures(2)-features(2,i))^2+(imagefeatures(3)-features(3,i))^2);
end


nearesy
[MinResult,Index]=min(nearesy);
figure,subplot(2,2,1),imshow(gray1);
%figure ,imshow(gray1);
if Index == 1
    model = 'Opel';
elseif Index == 2
    model = 'Kia';
elseif Index == 3 || Index == 4 
    model = 'Hyundai';
end
title(model);
subplot(2,2,2),imshow(i1);

%Index;

% second case 
fftI=fft2(double(i2));
imagefeatures=abs(fftI(:));
imagefeatures=sort(imagefeatures,'descend');
imagefeatures=imagefeatures(1:3);
imagefeatures

for i=1:4
nearesy(i)=sqrt((imagefeatures(1)-features(1,i))^2+(imagefeatures(2)-features(2,i))^2+(imagefeatures(3)-features(3,i))^2);
end


nearesy
[MinResult,Index]=min(nearesy);
figure,subplot(2,2,1),imshow(gray2);
%figure ,imshow(gray2);

if Index == 1
    model = 'Opel';
elseif Index == 2
    model = 'Kia';
elseif Index == 3 || Index == 4 
    model = 'Hyundai';
end
    
title(model);
subplot(2,2,2),imshow(i2);
%third case 
fftI=fft2(double(i3));
imagefeatures=abs(fftI(:));
imagefeatures=sort(imagefeatures,'descend');
imagefeatures=imagefeatures(1:3);
imagefeatures

for i=1:4
nearesy(i)=sqrt((imagefeatures(1)-features(1,i))^2+(imagefeatures(2)-features(2,i))^2+(imagefeatures(3)-features(3,i))^2);
end


nearesy
[MinResult,Index]=min(nearesy);
figure,subplot(2,2,1),imshow(gray3);
%figure ,imshow(gray3);

if Index == 1
    model = 'Opel';
elseif Index == 2
    model = 'Kia';
elseif Index == 3 || Index == 4 
    model = 'Hyundai';
end
subplot(2,2,2),imshow(i3);    
title(model);

% fourth case 

fftI=fft2(double(i4));
imagefeatures=abs(fftI(:));
imagefeatures=sort(imagefeatures,'descend');
imagefeatures=imagefeatures(1:3);
imagefeatures

for i=1:4
nearesy(i)=sqrt((imagefeatures(1)-features(1,i))^2+(imagefeatures(2)-features(2,i))^2+(imagefeatures(3)-features(3,i))^2);
end



nearesy
[MinResult,Index]=min(nearesy);
%figure ,imshow(gray4);
figure,subplot(2,2,1),imshow(gray4);
if Index == 1
    model = 'Opel';
elseif Index == 2
    model = 'Kia';
elseif Index == 3 || Index == 4 
    model = 'Hyundai';
end
subplot(2,2,2),imshow(i4);        
title(model);


