function se = shannonEntropyV2(xblock,waveletName,waveletLevels)

numBlocks = size(xblock,1);
se = nan(numBlocks,2^waveletLevels);

parfor iblock = 1:numBlocks
    wpt = modwpt(xblock(iblock,:),waveletName,waveletLevels);
    
    % Sum across time and normalized
    E = sum(wpt.^2,2);
    Pij = wpt.^2./E;
    
    % save final Shannon Entropy values
    se(iblock,:) = -sum(Pij.*log(Pij+eps),2);
end

end