function [pxx,f] = fftFeatures(x,win,noverlap,nfft,fs,varargin)
%%FFTFEATURES Creates fft-based spectrum features for the signal
%   Generates classification features from the input signal based on FFT
%   spectrum processing. 
% 
% Syntax
% [pxx,f] = fftFeatures(x,win,noverlap,nfft,fs);
% [pxx,f] = fftFeatures(x,win,noverlap,nfft,fs,'FrequencyLimits',freqlim);
% 
% Inputs
% x = time series vector or matrix where each column is treated as a
%   vector (EU)
% fs = sampling frequency (Hz)
% Name-Value pairs
% 'FrequencyLimits' - lower and upper frequency limits for octave bands as
%   2 element vector, defaults to [0 fs/2]
% 
% Outputs
% pxx = octave spectral features
% f = center frequencies for each bin (Hz)
%
%   Example
%      x = randn(102400,1);
%      fs = 51200;
%      nfft = 1024; win = hann(nfft);
%      noverlap = nfft*3/4;
%      xblock = spectralReshape(x,noverlap,nblock);
%      [pxx,fc] = fftFeatures(xblock,win,noverlap,nfft,fs);
% 
%   See also spectrogram, pwelch

% Copyright 2018
% Written by Todd Schultz

%% Check inputs and outputs
narginchk(5,7)
nargoutchk(1,2)

% Define Input scheme
p = inputParser;
addRequired(p,'x',@(x)validateattributes(x,{'double','single'},{'real','finite'},mfilename,'x'))
addRequired(p,'win',@(x)validateattributes(x,{'double','single'},{'vector','real','finite'},mfilename,'win'))
addRequired(p,'noverlap',@(x)validateattributes(x,{'numeric'},{'scalar','real','finite','positive'},mfilename,'noverlap'))
addRequired(p,'nfft',@(x)validateattributes(x,{'numeric'},{'scalar','real','finite','positive'},mfilename,'nfft'))
addRequired(p,'fs',@(x)validateattributes(x,{'numeric'},{'scalar','real','finite','positive'},mfilename,'fs'))
addParameter(p,'FrequencyLimits',[0 inf],@(x)validateattributes(x,{'numeric'},{'vector','numel',2,'real','finite','nonnegative'},mfilename,'BandsPerOctave'))

% Parse and store inputs
parse(p,x,win,noverlap,nfft,fs,varargin{:})
freqlim = p.Results.FrequencyLimits;    % frequency limits (Hz)

%% Process data
% Compute short-time FFT-based power spectrum values for each column of x
% [~,f,~,pxx] = spectrogram(x,win,noverlap,nfft,fs,'power');
[pxx,f] = pwelch(x,win,0,nfft,fs,'power');

% Extract only frequencies of interest
idxFreq = freqlim(1) <= f & f <= freqlim(2);
f = f(idxFreq);
pxx = pxx(idxFreq,:);

% Normalize the spectrum to remove absolute power levels and retain only
% the shape
pxx = pxx./sum(pxx);
end