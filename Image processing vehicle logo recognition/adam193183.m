 tiledlayout("flow");
 
img1 = imread("Case1-Front1.bmp");
img2 = imread("Case2-Front2.jpg");
img3 = imread("Case2-Rear1.jpg");
img4 = imread("Case2-Rear2.jpg");

[logo] = img2Logo(img4);
nexttile;
imshow(logo);
function [logo, brandName] = img2Logo(originalImage)
    img = rgb2gray(originalImage);
    nexttile;
    imshow(img);
    [rows, cols] = size(img);
     imgCenter = zeros(2,1);
     imgCenter(1) = cols / 2;
     imgCenter(2) = rows / 2;
     cropBox = [imgCenter(1)-cols/8, imgCenter(2)-rows/8, cols/4, rows/4];
     rec = drawrectangle("Position", cropBox);
     mask = createMask(rec);
     img = img .* uint8(mask);
     nexttile;
     imshow(img);
     img = imcrop(img, [(imgCenter(1)+5-cols/8), (imgCenter(2)+5-rows/8), cols/4-10, rows/4-10]);
     nexttile;
     imshow(img);
     canny = edge(img, "canny");
     nexttile;
     imshow(canny);
     close = imclose(canny, strel('disk', 1));
     nexttile;
     imshow(close);
     fill = imfill(close, "holes");
     nexttile;
     imshow(fill);
     erode = imerode(fill, strel('disk', 3));
     nexttile;
     imshow(erode);
     CC = regionprops(erode, 'BoundingBox');
     logoOnly = imcrop(img, CC(1).BoundingBox);
     logo = logoOnly;
end