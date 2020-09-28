%{
Name: Delano Thomas
Student ID: 201970904
Date: July 19, 2020
Opening by Reconstruction
%}

%Performs Morphological Reconstruction by opening
function out_image = openingRecontruction(input_image, SE_type, SE_size)

    %Create marker using image dilation
    SE = strel(SE_type,SE_size);
    img_marker = imerode(input_image,SE);

    %Performs opening by reconstruction
    out_image = imreconstruct(img_marker, input_image);
    
    %figure('Name','Transmission Map - t3');
    %imshow(out_image);
    
end
