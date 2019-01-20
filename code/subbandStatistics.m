function w = subbandStatistics(x,maxLevel, wname)
    levs = 2:maxLevel; 
    [c,l] = wavedec(x, maxLevel, wname); 
    dcell = detcoef(c,l,levs);
    
    feature_vect = [];
    subband_means = [];
    for j = 1:length(dcell)
        mean_abs = meanabs(dcell{j});
        sd = std(dcell{j});
        subband_means = [subband_means, mean(dcell{j})];
        feature_vect = [feature_vect, mean_abs sd];
    end 
    ratio_means = []; 
    for j = 2:length(subband_means)
        ratio_means = [ratio_means, (subband_means(j) / subband_means(j-1))  ];
    end 
    feature_vect = [feature_vect, ratio_means]; 
    w = feature_vect'; 
end

