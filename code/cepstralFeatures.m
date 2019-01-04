function [cepcoef,fc] = cepstralFeatures(x,fs,varargin)
%%CEPSTRALFEATURES Creates cepstral features for the signal
%   Generates classification features from the input signal based on octave
%   spectrum processing. 
% 
% Syntax
% [pxx,fc] = cepstralFeatures(x,fs)
% [pxx,fc] = cepstralFeatures(x,fs,'NumFeatures',nfeatures)
% 
% Inputs
% x = time series vector or matrix where each column is treated as a
%   vector (EU)
% fs = sampling frequency (Hz)
% Name-Value pairs
% 'NumFeatures' - number of cepstral features to compute, defaults to 13
% 
% Outputs
% cepcoef = cepstral feature coefficients
% fc = center frequencies for each band (Hz)
%
%   Example
%      x = randn(102400,1);
%      fs = 51200;
%      xblock = spectralReshape(x,0,1024);
%      [cepcoef,fc] = cepstralFeatures(xblock,fs);
% 
%   See also poctave, pwelch

% Copyright 2018
% Written by Todd Schultz

%% Check inputs and outputs
narginchk(2,6)
nargoutchk(1,2)

% Define Input scheme
p = inputParser;
addRequired(p,'x',@(x)validateattributes(x,{'double','single'},{'real','finite'},mfilename,'x'))
addRequired(p,'fs',@(x)validateattributes(x,{'numeric'},{'scalar','real','finite','positive'},mfilename,'fs'))
addParameter(p,'NumFeatures',13,@(x)validateattributes(x,{'numeric'},{'scalar','real','finite','positive'},mfilename,'NumFeatures'))

% Parse and store inputs
parse(p,x,fs,varargin{:})
nfeatures = p.Results.NumFeatures;        % number of cepstral features

%% Parameters
[nfft,nblocks] = size(x);

% window function
win = hamming(nfft);

%% Process data
% Process each block for cepstral features

% Normalize the power in each block 
x = x./rms(x);

% compute FFT with window function
X = abs(fft(x.*win));
f = fs*(0:(nfft/2))/nfft;

% Default band edges as defined by the cepstralFeatureExtractor in the
% Audio System Toolbox and the Auditory Toolbox and extended to cover the
% range from 30 Hz to 20 kHz to be consistent with the frequency range
% limits used for the octave feature processing. 
freqlim = [30 20000];
factor = 133.33333333333333;
bE = zeros(1,59);
for i = 1:14
    bE(i) = factor + (factor/2)*(i-2);
end
for i = 15:59
    bE(i) = bE(i-1)*1.0711703;
end
bE = bE(bE >= freqlim(1) & bE <= freqlim(2));

fc = bE(2:end-1);
fl = bE(1:end-2);
fu = bE(3:end);

% Find FFT indices for each filter band
idxfilter = nan(2,length(fc));


% 
% The sequence of processing includes for each chunk of data:
% Window the data with a hamming window,
% Shift it into FFT order,
% Find the magnitude of the FFT,
% Convert the FFT data into filter bank outputs,
% Find the log base 10,
% Find the cosine transform to reduce dimensionality.
% The filter bank is constructed using 13 linearly-spaced filters (133.33Hz between
% center frequencies,) followed by 27 log-spaced filters (separated by a factor of
% 1.0711703 in frequency.) Each filter is constructed by combining the amplitude of
% FFT bin as shown in the figure below.



% function bE = getDefaultBandEdges(~)
%  % Default band edges as defined by the documentation for the
%  % Auditory Toolbox.
%  factor = 133.33333333333333;
%  bE = zeros(1,42);
%   1for i = 1:13
%      bE(i) = factor + (factor/2)*(i-1);
%  end
%  for i = 14:42
%      bE(i) = bE(i-1)*1.0711703;
%  end
%  end

% Default band edges as defined by the cepstralFeatureExtractor in the
% Audio System Toolbox and the Auditory Toolbox and extended to cover the
% range from 30 Hz to 20 kHz to be consistent with the frequency range
% limits used for the octave feature processing. 
freqlim = [30 20000];
factor = 133.33333333333333;
bE = zeros(1,59);
for i = 1:14
    bE(i) = factor + (factor/2)*(i-2);
end
for i = 15:59
    bE(i) = bE(i-1)*1.0711703;
end
bE = bE(bE >= freqlim(1) & bE <= freqlim(2));

fc = bE(2:end-1);
fl = bE(1:end-2);
fu = bE(3:end);

end

