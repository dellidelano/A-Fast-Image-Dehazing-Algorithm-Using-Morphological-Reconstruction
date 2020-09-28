close all;
%Read input image using standard from directory
output_images_dir='output_images';
input_images_dir='input_images';
input_image_filename = fullfile(input_images_dir,'roof_true.png');
input_image = imread(input_image_filename);
%input_image = double(input_image);
%object = 'Bikes';

tic;
%J = imreducehaze(input_image,'method','approxdcp');
%figure('Name',append(object,'_Matlab_1.PNG'));
%imshow((J));
%toc;
%disp(memory);
%imwrite((J), fullfile(output_images_dir,append(object,'_Matlab_1.PNG')));


%PSNR & SSIM
input_true_filename = fullfile(output_images_dir,'Roof_Dehazed.png');
input_true_filename = fullfile(output_images_dir,'Roof_Matlab_1.png');
input_true_filename = fullfile(output_images_dir,'Roof_Matlab_2.png');
input_true = imread(input_true_filename);

disp(psnr(input_image, input_true));
disp(ssim(input_image, input_true));