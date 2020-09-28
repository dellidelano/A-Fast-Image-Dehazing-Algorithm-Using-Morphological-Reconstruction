
%{
Name: Delano Thomas
Student ID: 201970904
Date: July 19, 2020
Initial tranmission map using Grayscale
%}

%Create the initial Transmission map
function out_image = initialTransMap(minChannel)

    %Subtract min Channel from 1
    out_image = 1 - minChannel;

    %figure('Name','Initial Transmission Map - t1');
    %imshow(out_image);

end
