function [pxx,fc] = octaveFeatures(x,fs,varargin)
%%OCTAVEFEATURES Creates octave spectrum features for the signal
%   Generates classification features from the input signal based on octave
%   spectrum processing. 
% 
% Syntax
% [pxx,fc] = octaveFeatures(x,fs)
% [pxx,fc] = octaveFeatures(x,fs,'BandsPerOctave',nbpo,'FrequencyLimits',freqlim)
% 
% Inputs
% x = time series vector or matrix where each column is treated as a
%   vector (EU)
% fs = sampling frequency (Hz)
% Name-Value pairs
% 'BandsPerOctave' - number of bands in each octave, defaults to 1
% 'FrequencyLimits' - lower and upper frequency limits for octave bands as
%   2 element vector, defaults to [0 fs/2]
% 
% Outputs
% pxx = octave specture features
% fc = center frequencies for each band (Hz)
%
%   Example
%      x = randn(102400,1);
%      fs = 51200;
%      xblock = spectralReshape(x,0,1024);
%      [pxx,fc] = octaveFeatures(xblock,fs);
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
addParameter(p,'BandsPerOctave',1,@(x)validateattributes(x,{'numeric'},{'scalar','real','finite','positive'},mfilename,'BandsPerOctave'))
addParameter(p,'FrequencyLimits',[0 inf],@(x)validateattributes(x,{'numeric'},{'vector','numel',2,'real','finite','nonnegative'},mfilename,'BandsPerOctave'))

% Parse and store inputs
parse(p,x,fs,varargin{:})
nbpo = p.Results.BandsPerOctave;        % number of bands per octave
freqlim = p.Results.FrequencyLimits;    % frequency limits (Hz)

%% Process data
% Process each block with octave band spectrum
[pxx,fc] = poctave(x,fs,'BandsPerOctave',nbpo,'FrequencyLimits',freqlim);

% Normalize the octave spectrum to remove the absolute power levels and retain only the shape
pxx = pxx./sum(pxx);
end

