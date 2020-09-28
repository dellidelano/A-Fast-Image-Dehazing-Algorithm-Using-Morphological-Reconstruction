%{
Name: Delano Thomas
Student ID: 201970904
Date: July 19, 2020
Refine the Transmission map
%}

%Refine the Transmission map
function out_image = refineTransmissionMap(transMap_img, noSmallObject_img)

    %Transform by summing the images
    out_image = transMap_img + noSmallObject_img;
        
    %figure('Name','Transmission Map - t_morf');
    %imshow(out_image);
    %colormap(gca, jet(256));

end
