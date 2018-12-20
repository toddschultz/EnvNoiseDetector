function [pxx,fc] = octaveFeatures(x)
%%OCTAVEFEATURES Creates octave spectrum features for the signal
%   Generates classification features from the input signal based on octave
%   spectrum processing. 
% 
% Syntax
% [pxx,fc] = octaveFeatures(x)
% 
% Inputs
% x = input signal to process
% 
% Outputs
% pxx = octave specture features
% fc = center frequencies for each band (Hz)
%
%   Example
%      x = randn(16384,1);
%      [pxx,fc] = octaveFeatures(x);
% 
%   See also poctave, pwelch

% Copyright 2018
% Written by Todd Schultz



% Bands per octave
nbpo = 1;

% record or block duration (s)
tblock = 1;

% fractional overlap between blocks, 0 <= foverlap <= 1
foverlap = 0.25;

% frequency limits for octave 
freqlim = [30 20000];

% Convert processing parameters to samples
nblock = tblock*fs;
noverlap = round(foverlap*nblock);

xblock = spectralReshape(x,noverlap,nblock);

% Process each block with octave band spectrum
[pxx,fc] = poctave(xblock,fs,'BandsPerOctave',nbpo,'FrequencyLimits',freqlim);

% Normalize the octave spectrum to remove the absolute power levels and retain only the shape
pxx = pxx./sum(pxx);


end

