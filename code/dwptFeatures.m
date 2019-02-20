function xfeatures = dwptFeatures(xsignal,varargin)
%%DWPTFEATURES Creates discrete wavelet packet transform features
%   Generates classification features from the input signal based on
%   discrete wavelet packet transform signal processing. The features
%   include the first 4 principal components of Shannon entropy, the
%   wavelet variance, and the wavelet subband statistics. 
% 
% Syntax
% xfeatures = dwptFeatures(xsignal)
% xfeatures = dwptFeatures(xsignal,Name,Value)
% 
% Inputs
% xsignal = time series vector or matrix where each column is treated as a
%   vector (EU)
% Name-Value pairs
% 'WaveletName' - wavelet name to use for processing, defaults to 'coif2'
% 'WaveletLevel' - wavelet transform level, defaults to 5
% 
% Outputs
% xfeatures = DWPT features
%
%   Example
%      x = randn(102400,1);
%      fs = 51200;
%      nfft = 1024; win = hann(nfft);
%      noverlap = nfft*3/4;
%      xblock = spectralReshape(x,noverlap,nblock);
%      xfeatures = dwptFeatures(xblock);
% 
%   See also spectrogram, pwelch

% Copyright 2019
% Written by Todd Schultz

%% Check inputs and outputs
narginchk(1,5)
nargoutchk(1,1)

% Define Input scheme
p = inputParser;
addRequired(p,'xsignal',@(x)validateattributes(x,{'double','single'},{'real','finite'},mfilename,'xsignal'))
addParameter(p,'WaveletName',"coif2",@(x)validateattributes(x,{'char','string'},{'scalartext'},mfilename,'WaveletName'))
addParameter(p,'WaveletLevel',5,@(x)validateattributes(x,{'numeric'},{'real','finite','scalar','positive'},mfilename,'WaveletLevel'))

% Parse and store inputs
parse(p,xsignal,varargin{:})
waveletName = p.Results.WaveletName;
waveletLevels = p.Results.WaveletLevel;


%% Compute discrete wavelet packet features
% Shannon entropy
se = shannonEntropyV2(xsignal,waveletName,waveletLevels);
[~,sepca] = pca(se,'NumComponents',4);

% Wavelet variance
wVar = waveletVar(xsignal,waveletName,waveletLevels);

% Subband statistics
if (waveletLevels > 2)
    subbandstats = subbandStatisticsV2(xsignal,waveletName,waveletLevels);
else 
    subbandstats = []; 
end

% Assemble final feature set
xfeatures = [se wVar subbandstats];
end