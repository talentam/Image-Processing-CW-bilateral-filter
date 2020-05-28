rng('default');
% clc;
% clear;
img=imread('./source/retina_images_01_10/1.tif');
mask=imread('./source/mask_images/1.tif');
best=im2double(imread('./source/label_images/1.tif'));
img = im2double(rgb2gray(img));
mask = double(imbinarize(mask));
img = img.*mask;        % mask the image
[rows,columns] = size(img);
subplot(2,4,1);
imshow(best);
title('best');


%% sobel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% x = [-1 0 1
%      -2 0 2
%      -1 0 1];
% y = [-1 -2 -1
%       0 0 0
%       1 2 1];
% img_x = conv2(img_origin, x, 'same');
% img_y = conv2(img_origin, y, 'same');
% % img = sqrt(img_x.^2 + img_y.^2);
% 
% img = abs(img_x) + abs(img_y);
% 
% for i = 1:rows
%     for j = 1:columns
%         if mask(i, j) == 0
%             img(i, j) = 0;
%         end
%     end
% end
% 
% 
% for i = 1:rows
%     for j = 1:columns
%         if img(i, j) <= 0.15
%             img(i, j) = 0;
%         else
%             img(i, j) = 1;
%         end
%     end
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% se = strel('diamond',2);
% img=imclose(img,se);
% 
% se = strel('diamond',1);
% img = imerode(img,se);

% J = edge(img, 'sobel', 0.02);
% [img_eq,T]=histeq(img);
% % unmask
% for i = 1:rows
%     for j = 1:columns
%         if mask(i, j) == 0
%             img(i, j) = 0;
%         end
%     end
% end

%% canny
%Matlab自带的边缘检测
% ed = double(edge(img, 'canny', 0.06));
% se = strel('diamond',3);
% ed = imclose(ed,se);
% se = strel('diamond',1);
% ed = imerode(ed,se);

%% Kirsch

% f1 = [5 5 5
%     -3 0 -3
%     -3 -3 -3];
% f2 = [5 5 -3
%     5 0 -3
%     -3 -3 -3];
% f3 = [5 -3 -3
%     5 0 -3
%     5 -3 -3];
% f4 = [-3 -3 -3
%     5 0 -3
%     5 5 -3];
% f5 = [-3 -3 -3
%     -3 0 -3
%     5 5 5];
% f6 = [-3 -3 -3
%     -3 0 5
%     -3 5 5];
% f7 = [-3 -3 5
%     -3 0 5
%     -3 -3 5];
% f8 = [-3 5 5
%     -3 0 5
%     -3 -3 -3];
% 
% img_1 = conv2(img, f1, 'same');img_2 = conv2(img, f2, 'same');
% img_3 = conv2(img, f3, 'same');img_4 = conv2(img, f4, 'same');
% img_5 = conv2(img, f5, 'same');img_6 = conv2(img, f6, 'same');
% img_7 = conv2(img, f7, 'same');img_8 = conv2(img, f8, 'same');
% img = sqrt(img_1.^2 + img_2.^2 + img_3.^2 + img_4.^2 + img_5.^2 + img_6.^2 + img_7.^2 + img_8.^2);
% img=adapthisteq(img);
% for i = 1:rows
%     for j = 1:columns
%         if img(i, j) <= 0.5
%             img(i, j) = 0;
% %             else
% %             img(i, j) = 1;
%         end
%     end
% end

% img = bwareaopen(img, 15, 4);
% se = strel('diamond',1);
% img = imclose(img,se);
% for i = 3:rows-2
%     for j = 3:columns-2
%         temp = 0;
%         for m = -2:2
%             for n = -2:2
%                 if img(i+m, j+n) > img(i, j) && m ~= 0 && n ~= 0 && img(i+m, j+n) > 0.9
%                     temp = temp + 1;
%                 end
%             end
%         end
%         if temp >= 15
%             img(i, j) = 1;
%         end
%     end
% end

% img = bilateralFiltering(img,5,1,10);
% [img,T]=histeq(img);
% 
% % img = medfilt2(img, [3, 3]);
% 二值化
% for i = 1:rows
%     for j = 1:columns
%         if img(i, j) <= 0.7
%             img(i, j) = 0;
%         else
%             img(i, j) = 1;
%         end
%     end
% end
%去掉小的噪声
% img = bwareaopen(img, 10, 4);

%闭合
% se = strel('square',3);
% img = imclose(img,se);


% se = strel('diamond',8);
% mask = imerode(mask,se);

% unmask
% for i = 1:rows
%     for j = 1:columns
%         if mask(i, j) == 0
%             img(i, j) = 0;
%         end
%     end
% end
% % 
% % img = bwareaopen(img, 10, 4);
% % se = strel('square',2);
% % img = imclose(img,se);
% % 
% % 
% % 
% % % unmask
% % for i = 1:rows
% %     for j = 1:columns
% %         if mask(i, j) == 0
% %             img(i, j) = 0;
% %         end
% %     end
% % end

%% LoG filters

% img = imcomplement(img);
% filter = [-2 -4 -4 -4 -2
%             -4 0 8 0 -4
%             -4 8 24 8 -4
%             -4 0 8 0 -4
%             -2 -4 -4 -4 -2];
% img = conv2(img, filter, 'same');

% img = bwareaopen(img, 15, 4);
% se = strel('square',2);
% img = imclose(img,se);
% filter = [0 0 1 0 0
%             0 -1 -2 -1 0
%             -1 -2 16 -2 -1
%             0 -1 -2 -1 0
%             0 0 1 0 0]; 
%% High-frequency emphasis
img=adapthisteq(img);
img=fft2(img); %二维傅立叶变换
img=fftshift(img);  %频移
d0=30;
[M,N]=size(img);
m=fix(M/2);
n=fix(N/2);
% for i=1:M
%    for j=1:N
%         d = ((i-m)^2+(j-n)^2);
%         
%         if d<=d0
%             h(i,j)=0.9+0;
%         else
%             h(i,j)=0.9+1;
%         end
%         img(i,j)=h(i,j)*img(i,j); 
%    end
% end
for i=1:M
   for j=1:N
        d = ((i-m)^2+(j-n)^2);
        high_filter(i,j)=0.5 + 1 - exp(-(d)^2/(2*(d0^2)));        
   end
end
img=img.*high_filter;


img=real(ifft2(ifftshift(img)));  %傅里叶反变换
% img=adapthisteq(img);
% [img,T]=histeq(img);
% img = bilateralFiltering(img,7,1,10);

subplot(2,4,2);
imshow(img);
title('after high-pass filter');

hsize = 11;
sigma = 0.3;
filter = fspecial('log', hsize, sigma);
img=double(imfilter(img, filter));

subplot(2,4,3);
imshow(img);
title('after log');

% img = imbinarize(img);
% img=histeq(img);
%  unmask
% se = strel('diamond',1);
% mask = imdilate(mask,se);

img = img.*mask;

img=adapthisteq(img);
subplot(2,4,4);
imshow(img);
title('after eq and remove boundary');

% se = strel('diamond',1);
% img = imopen(img,se);
for i = 1:rows
    for j = 1:columns
        if img(i, j) <= 0.72
            img(i, j) = 0;
        else
            img(i, j) = 1;
        end
    end
end

subplot(2,4,5);
imshow(img);
title('after thresholding');

% se = strel('diamond',1);
% img = imclose(img,se);
img = bwareaopen(img, 20, 4);

subplot(2,4,6);
imshow(img);
title('after delete small');

se = strel('square',2);
img = imclose(img,se);
% img = bwareaopen(img, 20, 4);

subplot(2,4,7);
imshow(img);
title('close operation');

filled = imfill(img, 'holes');
holes = filled & ~img;
bigholes = bwareaopen(holes, 150);
smallholes = holes & ~bigholes;
img = img | smallholes;
img = bwareaopen(img, 110, 8);

% se = strel('square',2);
% img = imdilate(img,se);

subplot(2,4,8);
imshow(img);
title('fill small holes');
% 
% filter = [-2 -4 -4 -4 -2
%             -4 0 8 0 -4
%             -4 8 24 8 -4
%             -4 0 8 0 -4
%             -2 -4 -4 -4 -2];
% img = conv2(img, filter, 'same');



% img = imcomplement(img);

%% log
% img=fft2(img); %二维傅立叶变换
% img=fftshift(img);  %频移
% n1=2;   %巴特沃斯滤波器阶数为2
% % D0=0.05*rows;  %截止频率5%的图像宽度
% d0=50;
% [M,N]=size(img);
% m=fix(M/2);
% n=fix(N/2);
% for i=1:M
%    for j=1:N
% %         D=sqrt((i-m)^2+(j-n)^2);
% %         h1=1/(1+(D/D0)^(2*n1));   %计算高通滤波器传递函数
% %         h2=0.5+2*h1;    %设计high-frequency emphasis其中a=0.5,b=2.0
% %         s1(i,j)=h1*img(i,j);  %用设计的滤波器处理原图像
%         d = sqrt((i-m)^2+(j-n)^2);
% %         h(i,j) = 1 - exp(-d/(2*(d0^2))); 
%         if d<=d0
%             h(i,j)=0;
%         else
%             h(i,j)=1;
%         end
%         img(i,j)=img(i, j)*h(i,j);
%    end
% end

% img = h.*img;
% img=real(ifft2(ifftshift(img)));  %傅里叶反变换

% for i = 1:rows
%     for j = 1:columns
%         if img(i, j) <= 0.4
%             img(i, j) = 0;
%         else
%             img(i, j) = 1;
%         end
%     end
% end
% se = strel('square',2);
% img = imclose(img,se);
% img = bwareaopen(img, 20, 4);
% se = strel('square',3);
% img = imclose(img,se);
%% accuracy calculation
pixel_num = sum(mask(:));
vessel_num = sum(best(:));
background_num = pixel_num - vessel_num;

background = im2double(imcomplement(best));
background = background.*mask; 

img_reverse = imcomplement(img);
img_reverse = img_reverse.*mask;

vessel_accurate = 0;
background_accurate = 0;
for i = 1:rows
    for j = 1:columns
        if best(i, j) == 1 && img(i, j) == 1
            vessel_accurate = vessel_accurate + 1;
        end
        if background(i, j) == 1 && img_reverse(i, j) == 1
            background_accurate = background_accurate + 1;
        end
    end
end
vessel_rate = vessel_accurate/vessel_num;
background_rate = background_accurate/background_num;
total_rate = (vessel_accurate+background_accurate)/pixel_num;
fprintf("vessel = %f background = %f total = %f\n", vessel_rate, background_rate, total_rate);
%% plot
% test = edge(img, 'sobel');
% subplot(1,2,1);
% imshow(best);
% title('before');

% subplot(2,2,2);
% imshow(img);
% title('origin');

% subplot(1,2,2);
% imshow(img);
% title('LOG');

% subplot(2,2,4);
% imshow(img_bi);
% title('img_bi');
% 
% subplot(3,2,5);
% imshow(img_reverse);
% title('reverse');
% 
% subplot(3,2,6);
% imshow(background);
% title('background');









