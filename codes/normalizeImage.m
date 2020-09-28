%{
Name: Delano Thomas
Student ID: 201970904
Date: July 19, 2020
Normalize hazed image using Atmospheric Light
%}

%Normalize image using Atmospheric light A
 function out_image = normalizeImage(input_image, atmLight)

    %format data to double
    atmLight = double(atmLight);

    %Normalize each channel based on A
    out_image(:,:,1) = input_image(:,:,1) / atmLight(1);
    out_image(:,:,2) = input_image(:,:,2) / atmLight(2);
    out_image(:,:,3) = input_image(:,:,3) / atmLight(3);
    
    %Formally normalize each channel between 0&1
    out_image(:,:,1) = out_image(:,:,1) / (max(out_image(:,:,1), [], 'all'));
    out_image(:,:,2) = out_image(:,:,2) / (max(out_image(:,:,2), [], 'all'));
    out_image(:,:,3) = out_image(:,:,3) / (max(out_image(:,:,3), [], 'all'));
    
    %figure('Name','Normalize Image');
    %imshow(out_image);
end