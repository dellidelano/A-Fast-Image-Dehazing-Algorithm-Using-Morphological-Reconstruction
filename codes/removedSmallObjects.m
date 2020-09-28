%{
Name: Delano Thomas
Student ID: 201970904
Date: July 19, 2020
Removing the smaller objects in the Transmission map
%}

%Remove objects smaller that are clearer than the environment
function out_image = removedSmallObjects(transMap1, transMap3)

    %Take te difference of the two images
    out_image = double(transMap1) - double(transMap3);

    %figure('Name','No small objects');
    %imshow(out_image);

end
