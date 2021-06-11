function img_merged = hybrid_image(img1, img2, ratio)

    %% split img1 and img2 into low/high frequency maps
    [img1_high_frequency_map,img1_low_frequency_map] = separate_frequency(img1, ratio); 
    [img2_high_frequency_map, img2_low_frequency_map] = separate_frequency(img2,ratio);
    
    %% combine the low-frequency map of img1 with the high-frequency map of img2
    img_merged = img1_low_frequency_map + img2_high_frequency_map; % change this line
    
    
end
