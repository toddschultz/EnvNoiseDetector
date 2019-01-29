function wVar = waveletVar(xblock,waveletName,waveletLevels)

numBlocks = size(xblock,1);

% Execute first block to find number of variance estimates
iblock = 1;
wvarloop = modwtvar(modwt(xblock(iblock,:),waveletName,waveletLevels),waveletName);

wVar = nan(numBlocks,length(wvarloop));
wVar(iblock,:) = wvarloop;

% repeat for remaining blocks
parfor iblock = 2:numBlocks
    wvarloop = modwtvar(modwt(xblock(iblock,:),waveletName,waveletLevels),waveletName);
    wVar(iblock,:) = wvarloop;
end

end