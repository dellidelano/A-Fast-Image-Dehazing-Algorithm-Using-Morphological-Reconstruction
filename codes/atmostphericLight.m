%{
Name: Delano Thomas
Student ID: 201970904
Date: July 19, 2020
Atmostpheric Light
%}

%Compute Atmostpheric light
function atmostpherVal = atmostphericLight(input_image, dcp)
    
    %Get dimension of the image
    [image_H, image_W, col] = size(dcp);
    image_size = image_H * image_W;
    
    %Place of dark channel intensities as a 1byX array
    dcp_as_list = reshape(dcp,image_size,1);
    img_as_list = reshape(input_image,image_size,3);
 
    %Sort dcp array
    [dcp_sorted, dcp_index] = sort(dcp_as_list,'descend');
    
    %Size of max elements to chose
    argMaxSize = ceil(0.001 * image_H * image_W);
    
    %Get index of top 0.1%
    top_dcp_index = dcp_index(1:argMaxSize,1);
        
    %Iniital intensity
    top_intensity = 0;
    
    for i=1:argMaxSize
                
        %Get index of arg max value
        sorted_index = top_dcp_index(i,1);
        
        %Compare and select highest values pixel
        intensity_at_top_index = img_as_list(sorted_index,:);
        sum_intensity_at_top_index = sum(intensity_at_top_index);
                
        if sum_intensity_at_top_index >= top_intensity
            
            atmostpherVal = intensity_at_top_index;
            top_intensity = sum_intensity_at_top_index;
        end
    end
    
end