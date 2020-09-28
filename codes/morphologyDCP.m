%{
Name: Delano Thomas
Student ID: 201970904
Date: July 19, 2020
Dark Channel Prior
%}

%Compute Dark Channel Prior using equation
function out_image = morphologyDCP(input_image, SE_type, SE_size)

    %Get min intensity at each pixel
    out_image = min(input_image, [], 3);
    
    %Morphologiacl Grayscale Erosion
    struct_elem=strel(SE_type,SE_size);
    out_image = imerode(out_image,struct_elem);
    
    %figure('Name','Morphological DCP');
    %imshow(uint8(out_image));
    
end
