%{
Name: Delano Thomas
Student ID: 201970904
Date: July 19, 2020
Completing the Dehazing process
%}

%Final Step to remove the haze in the original image
function out_image = removeHaze(input_image, t_morf, atmLight)

    %Convert to double
    input_image = double(input_image);
    
    %Normalize the trasmission map values
    t_morf = abs(t_morf)/max(abs(t_morf(:)))*0.7+0.3;
        
    %Compute dehazed image
    out_image(:,:,1) = ((input_image(:,:,1) - atmLight(1)) ./ t_morf(:,:,1)) + atmLight(1);
    out_image(:,:,2) = ((input_image(:,:,2) - atmLight(2)) ./ t_morf(:,:,1)) + atmLight(2);
    out_image(:,:,3) = ((input_image(:,:,3) - atmLight(3)) ./ t_morf(:,:,1)) + atmLight(3);

    
    %disp(out_image(513,512,:));
    figure('Name','Dehazed Image')
    imshow(uint8(out_image));
    
end