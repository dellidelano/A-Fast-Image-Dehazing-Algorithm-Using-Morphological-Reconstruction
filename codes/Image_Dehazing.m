%{
Name: Delano Thomas
Student ID: 201970904
Date: July 19, 2020
Comment: This is the main method used to run the operations. It will call
scripts in the directory to perform the dehazing steps.

%}

close all;
%Read input image using standard from directory
output_images_dir='output_images';
input_images_dir='input_images';
input_image_filename = fullfile(input_images_dir,'forest_input.png');
input_image = imread(input_image_filename);
input_image = double(input_image);
object = 'Roof';

%Show Original
%figure('Name','Original');
%imshow(uint8(input_image));
%imwrite(uint8(input_image), fullfile(output_images_dir,append(object,'_Original.PNG')));

%---------------------------------START ----------------------------------%
%Code is executed sequentially
tic;
%---------------------------------PHASE 1---------------------------------%
%Step 1 - Dark Channel Prior using Grayscale Erosion
DCP = morphologyDCP(input_image,'square',15);
%imwrite(uint8(DCP), fullfile(output_images_dir,append(object,'_DCP.PNG')));

%Step 2 - Atmospheric Light Computation
AtmostpherLight = atmostphericLight(input_image,DCP);

%Step 3 - Normalizing the input image using the Atmospheric Light
normalizedInput = normalizeImage(input_image,AtmostpherLight);
%imwrite(normalizedInput, fullfile(output_images_dir,append(object,'_Normalized.PNG')));

%Step 4 - Normalizing the input image using the Atmospheric Light
minimalChannel = minimumChannel(normalizedInput);
%imwrite(minimalChannel, fullfile(output_images_dir,append(object,'_MinChannel.PNG')));

%Step 5 - Normalizing the input image using the Atmospheric Light
t1 = initialTransMap(minimalChannel);
%imwrite(t1, fullfile(output_images_dir,append(object,'_InitTransMap.PNG')));

%---------------------------------PHASE 2---------------------------------%
%Step 1 - Performs Morphological Reconstruction by closing
t2 = closingRecontruction(t1,'square',15);
%imwrite(t2, fullfile(output_images_dir,append(object,'_AfterCloseTransMap.PNG')));

%Step 2 - Performs Morphological Reconstruction by opening
t3 = openingRecontruction(t2,'square',15);
%imwrite(t3, fullfile(output_images_dir,append(object,'_AfterOpenTransMap.PNG')));

%Step 3 - Removes objects smaller that are clearer than the environment
R = removedSmallObjects(t1,t3);

%Step 4 - Recover ranges of values original for the original transmissions
t3_prime = recoverRanges(t1,t3);

%Step 5 - Refine the Transmission map
t_morf = refineTransmissionMap(t3_prime,R);
%imwrite((t_morf), fullfile(output_images_dir,append(object,'_FinalTransMap.PNG')));

%Step 6 - Final step to complete the dehzing process
dehazed_img = removeHaze(input_image, t_morf, AtmostpherLight);
%imwrite(uint8(dehazed_img), fullfile(output_images_dir,append(object,'_Dehazed.PNG')));

%imwrite(t1-t_morf, fullfile(output_images_dir,append(object,'_ObjsRemTransMap.PNG')));
toc;
imwrite(uint8(dehazed_img), fullfile(output_images_dir,append(object,'_Dehazed.PNG')));
disp(memory);
%figure();
%imshow(t1-t_morf);
%---------------------------------END-------------------------------------%
