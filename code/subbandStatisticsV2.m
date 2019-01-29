function subbandstats = subbandStatisticsV2(xblock,waveletName,waveletLevels)

numBlocks = size(xblock,1);

subbandstats = nan(size(xblock,1),2*(waveletLevels-1)+(waveletLevels-2));
parfor iblock = 1:numBlocks
    xloop = xblock(iblock,:);
    ss = subbandStatisticsSub(xloop,waveletName,waveletLevels); 
    subbandstats(iblock,:) = ss; 
end

end

function feature_vect = subbandStatisticsSub(xblock1,waveletName,waveletLevels)

levs = 2:waveletLevels;
[c,l] = wavedec(xblock1, waveletLevels, waveletName);
dcell = detcoef(c,l,levs);

feature_vect = nan(2,length(levs));
subband_means = nan(1,length(levs));
for ilev = 1:length(dcell)
    mean_abs = meanabs(dcell{ilev});
    sd = std(dcell{ilev});
    subband_means(ilev) = mean(dcell{ilev});
    feature_vect(:,ilev) = [mean_abs sd];
end

ratio_means = (subband_means(2:end)./subband_means(1:end-1));

% Assembly subband statistics feature vector
feature_vect = [feature_vect(:)' ratio_means];
end