%{
Name: Delano Thomas
Student ID: 201970904
Date: July 19, 2020
Closing by Reconstruction
%}

%Performs Morphological Reconstruction by closing
function out_image = closingRecontruction(input_image, SE_type, SE_size)

    %Create marker using image erosion
    SE = strel(SE_type,SE_size);
    img_marker = imdilate(input_image,SE);
        
    %Performs closing by recontrution
    out_image = imcomplement(imreconstruct(imcomplement(img_marker), imcomplement(input_image)));

    %figure('Name','Tranmission Map - t2');
    %imshow(out_image);

end
