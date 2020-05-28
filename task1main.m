rng('default');
%load img
img=imread('./source/lena/lena.jpg');
img_gray = rgb2gray(img);
%% Gaussian noise
sigma = 20;
imgSize = size(img_gray);
Gaussian_noise = randn(imgSize)*sigma;
img_Gau_noise = uint8(double(img_gray)+Gaussian_noise);

% subplot(3,5,5);
% imshow(img_Gau_noise);
% title('img_Gau_noise');

%% uniform noise
a = 50;
imgSize = size(img_gray);
uniform_noise = (rand(imgSize)-0.5)*2*a;
img_uni_noise = uint8(double(img_gray)+uniform_noise);

% subplot(3,5,10);
% imshow(img_uni_noise);
% title('img_uni_noise');

%% Salt & pepper noise
img_sp = imnoise(img_gray,'salt & pepper',0.1);

% subplot(3,5,15);
% imshow(img_sp);
% title('img_sp');

%% Mean filter
img_mean_filter_Gau_noise = filter2(fspecial('average',3),img_Gau_noise)/255;
img_mean_filter_uni_noise = filter2(fspecial('average',3),img_uni_noise)/255;
img_mean_filter_sp_noise = filter2(fspecial('average',3),img_sp)/255;

SNR_img_mean_filter_Gau_noise = snr(img_mean_filter_Gau_noise, img_mean_filter_Gau_noise - im2double(img_gray));
SNR_img_mean_filter_uni_noise = snr(img_mean_filter_uni_noise, img_mean_filter_uni_noise - im2double(img_gray));
SNR_img_mean_filter_sp_noise = snr(img_mean_filter_sp_noise, img_mean_filter_sp_noise - im2double(img_gray));

% plot
subplot(3,5,1);
imshow(img_mean_filter_Gau_noise);
title('Gau noise and mean filter');
subplot(3,5,6);
imshow(img_mean_filter_uni_noise);
title('uni noise and mean filter');
subplot(3,5,11);
imshow(img_mean_filter_sp_noise);
title('sp noise and mean filter');

%% Gaussian filter
gausFilter = fspecial('gaussian',[5 5],1);   %¸ßË¹ÂË²¨
img_Gau_filter_Gau_noise = im2double(imfilter(img_Gau_noise,gausFilter,'replicate'));
img_Gau_filter_uni_noise = im2double(imfilter(img_uni_noise,gausFilter,'replicate'));
img_Gau_filter_sp_noise = im2double(imfilter(img_sp,gausFilter,'replicate'));

SNR_img_Gau_filter_Gau_noise = snr(img_Gau_filter_Gau_noise, img_Gau_filter_Gau_noise - im2double(img_gray));
SNR_img_Gau_filter_uni_noise = snr(img_Gau_filter_uni_noise, img_Gau_filter_uni_noise - im2double(img_gray));
SNR_img_Gau_filter_sp = snr(img_Gau_filter_sp_noise, img_Gau_filter_sp_noise - im2double(img_gray));

% plot
subplot(3,5,2);
imshow(img_Gau_filter_Gau_noise);
title('Gau noise and Gaussian filter');
subplot(3,5,7);
imshow(img_Gau_filter_uni_noise);
title('uni noise and Gaussian filter');
subplot(3,5,12);
imshow(img_Gau_filter_sp_noise);
title('sp noise and Gaussian filter');

%% Median filter
img_median_filter_Gau_noise = im2double(medfilt2(img_Gau_noise, [3, 3]));
img_median_filter_uni_noise = im2double(medfilt2(img_uni_noise, [3, 3]));
img_median_filter_sp_noise = im2double(medfilt2(img_sp, [3, 3]));

SNR_img_median_filter_Gau_noise = snr(img_median_filter_Gau_noise, img_median_filter_Gau_noise - im2double(img_gray));
SNR_img_median_filter_uni_noise = snr(img_median_filter_uni_noise, img_median_filter_uni_noise - im2double(img_gray));
SNR_img_median_filter_sp_noise = snr(img_median_filter_sp_noise, img_median_filter_sp_noise - im2double(img_gray));

% plot
subplot(3,5,3);
imshow(img_median_filter_Gau_noise);
title('Gau noise and median filter');
subplot(3,5,8);
imshow(img_median_filter_uni_noise);
title('uni noise and median filter');
subplot(3,5,13);
imshow(img_median_filter_sp_noise);
title('sp noise and median filter');
%% Anisotropic filter

img_anisotropic_filter_Gau_noise = anisotropicFilter(img_Gau_noise, 3);
img_anisotropic_filter_uni_noise = anisotropicFilter(img_uni_noise, 3);
img_anisotropic_filter_sp_noise = anisotropicFilter(img_sp, 3);

SNR_img_anisotropic_filter_Gau_noise = snr(img_anisotropic_filter_Gau_noise, img_anisotropic_filter_Gau_noise - im2double(img_gray));
SNR_img_anisotropic_filter_uni_noise = snr(img_anisotropic_filter_uni_noise, img_anisotropic_filter_uni_noise - im2double(img_gray));
SNR_img_anisotropic_filter_sp_noise = snr(img_anisotropic_filter_sp_noise, img_anisotropic_filter_sp_noise - im2double(img_gray));

subplot(3,5,4);
imshow(img_anisotropic_filter_Gau_noise);
title('Gau noise and Anisotropic filter');
subplot(3,5,9);
imshow(img_anisotropic_filter_uni_noise);
title('uni noise and Anisotropic filter');
subplot(3,5,14);
imshow(img_anisotropic_filter_sp_noise);
title('sp noise and Anisotropic filter');

%% Bilateral filtering  
img_bilateral_filter_Gau_noise = bilateralFiltering(img_Gau_noise,5,1,10);
img_bilateral_filter_uni_noise = bilateralFiltering(img_uni_noise,5,1,10);
img_bilateral_filter_sp_noise = bilateralFiltering(img_sp,5,1,10);

SNR_img_bilateral_filter_Gau_noise = snr(img_bilateral_filter_Gau_noise, img_bilateral_filter_Gau_noise - im2double(img_gray));
SNR_img_bilateral_filter_uni_noise = snr(img_bilateral_filter_uni_noise, img_bilateral_filter_uni_noise - im2double(img_gray));
SNR_img_bilateral_filter_sp_noise = snr(img_bilateral_filter_sp_noise, img_bilateral_filter_sp_noise - im2double(img_gray));

subplot(3,5,5);
imshow(img_bilateral_filter_Gau_noise);
title('Gau noise and Bilateral filter');
subplot(3,5,10);
imshow(img_bilateral_filter_uni_noise);
title('uni noise and Bilateral filter');
subplot(3,5,15);
imshow(img_bilateral_filter_sp_noise);
title('sp noise and Bilateral filter');



%% output
filepath=pwd;
cd('source/task1img');
imwrite(img_mean_filter_Gau_noise,'mean_Gau.jpg');
imwrite(img_mean_filter_uni_noise,'mean_uni.jpg');
imwrite(img_mean_filter_sp_noise,'mean_sp.jpg');

imwrite(img_Gau_filter_Gau_noise,'Gau_Gau.jpg');
imwrite(img_Gau_filter_uni_noise,'Gau_uni.jpg');
imwrite(img_Gau_filter_sp_noise,'Gau_sp.jpg');

imwrite(img_median_filter_Gau_noise,'median_Gau.jpg');
imwrite(img_median_filter_uni_noise,'median_uni.jpg');
imwrite(img_median_filter_sp_noise,'median_sp.jpg');

imwrite(img_anisotropic_filter_Gau_noise,'anisotropic_Gau.jpg');
imwrite(img_anisotropic_filter_uni_noise,'anisotropic_uni.jpg');
imwrite(img_anisotropic_filter_sp_noise,'anisotropic_sp.jpg');

imwrite(img_bilateral_filter_Gau_noise,'bilateral_Gau.jpg');
imwrite(img_bilateral_filter_uni_noise,'bilateral_uni.jpg');
imwrite(img_bilateral_filter_sp_noise,'bilateral_sp.jpg');
cd(filepath);




