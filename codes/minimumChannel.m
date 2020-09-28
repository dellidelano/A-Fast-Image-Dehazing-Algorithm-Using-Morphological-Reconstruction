%{
Name: Delano Thomas
Student ID: 201970904
Date: July 19, 2020
Create image using the minimal channel in the RGB
%}

%Create the minimum channel
function out_image = minimumChannel(input_image)
    
    %Get min intensity at each pixel
    out_image = min(input_image, [], 3);
    
    %figure('Name','Minimal Channel Image');
    %imshow(out_image);
end