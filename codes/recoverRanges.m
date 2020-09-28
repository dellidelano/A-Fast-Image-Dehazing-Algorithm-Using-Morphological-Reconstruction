%{
Name: Delano Thomas
Student ID: 201970904
Date: July 19, 2020
Adjusting range to initial transmission map
%}

%Recover ranges of values from the original transmission
function out_image = recoverRanges(transMap1, transMap3)

    disp('---Recover Ranges----');
    t1_max = max(transMap1, [], 'all');
    t1_min = min(transMap1, [], 'all');
    
    t3_max = max(transMap3, [], 'all');
    t3_min = min(transMap3, [], 'all');
    
    r_value = (t1_max - t1_min) / (t3_max - t3_min);
    first_Brakect = transMap3 - t3_min;
    out_image = (first_Brakect * r_value) + t1_min;
    
    %figure('Name','Transmission Map - t3_prime');
    %imshow(out_image);

end