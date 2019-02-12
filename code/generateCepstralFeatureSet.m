function cepFeatureSet = generateCepstralFeatureSet(tblock,snrdB,rootFilePath,signalFiles,contaminationFiles)
%%GENERATECEPSTRALFEATURESET Returns a set of cepstral features for the
%%specified files
%   Generates a set of classification features from the input signal based 
%   on octave spectrum processing. 
% 
% Syntax
% cepcoef = cepstralFeatures(x,fs)
% cepcoef = cepstralFeatures(x,fs,'NumFeatures',nfeatures)
% 
% Inputs
% tblock = length of clip block size in seconds
% snrdB = signal to noise ratio
% rootFilePath = path to where audio files are located
% signalFiles = array of files to use as the signal
% contaminationFile = array of files to be used as contamination
% 
% Outputs
% cepcoef = 
% 
%   See also cepstralFeatures

% Copyright 2019
% Written by Sean Miller

foverlap = 0.5;
nfeatures = 26;

% Loop over all signal files
tic
xfeaturecell = cell(length(signalFiles),1);
parfor ifile = 1:length(signalFiles)
    % Load file
    [x,fs] = audioread(fullfile(rootFilePath,signalFiles(ifile)));
    
    % Convert processing parameters to samples
    nblock = tblock*fs;
    noverlap = round(foverlap*nblock);
    
    xblock = spectralReshape(x,noverlap,nblock);
    
    % Process each block with cepstral features
    pxx = cepstralFeatures(xblock,fs,'NumFeatures',nfeatures);
    
    % save features to cell array for coversion to table later
    xfeaturecell{ifile} = [pxx' zeros(size(pxx,2),1)];
end

xfeature = cell2mat(xfeaturecell);
% Create table for classifier
xsignal = array2table(xfeature,'VariableNames',["feature" + (1:nfeatures) "contaminated"]);
toc

% Make contamination signal assignments
% one contamination file index for each of the signal files
contaminationAssign = randi(length(contaminationFiles),1,length(signalFiles));

% Process signal files one at a time and add contamination signals
tic
xfeaturecell = cell(length(signalFiles),1);
parfor ifile = 1:length(signalFiles)
    contaminationFilesLocal = contaminationFiles;
    % Load files
    [x,fs] = audioread(fullfile(rootFilePath,signalFiles(ifile)));
    [n,fn] = audioread(fullfile(rootFilePath,contaminationFilesLocal(contaminationAssign(ifile))));
    assert(fs == fn,'featureGenerator:UnequalSampleRates',...
        'Sample rates for the signal data and the contamination data are not equal.')
    
    % Adjust contamination signal length
    n = repmat(n,ceil(length(x)/length(n)),1);
    n = n(1:length(x));
    
    % Convert processing parameters to samples
    nblock = tblock*fs;
    noverlap = round(foverlap*nblock);
    
    % Reshape into blocks
    xblock = spectralReshape(x,noverlap,nblock);
    n = spectralReshape(n,noverlap,nblock);
    
    % Super impose signal and noise together
    xblock = addNoise(xblock,n,snrdB);
    
    % Process each block with cepstral features
    pxx = cepstralFeatures(xblock,fs,'NumFeatures',nfeatures)
    
    % save features to cell array for coversion to table later
    xfeaturecell{ifile} = [pxx' ones(size(pxx,2),1)];
end
xfeature = cell2mat(xfeaturecell);
% Create table for classifier
xcontamination = array2table(xfeature,'VariableNames',["feature" + (1:nfeatures) "contaminated"]);
toc

cepFeatureSet = [xsignal; xcontamination];
end