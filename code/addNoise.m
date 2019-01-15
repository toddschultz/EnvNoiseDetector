function y = addNoise(x,n,snrdB)
%%ADDNOISE Add noise signal to clean signal
%   Adds the noise signal, n, to the clean signal, x, with the specified
%   signal-to-noise ratio. The two signals must be the same size and each
%   column will be treated seperatedly. 
% 
% Syntax
% y = addNoise(x,n,snrdB,varargin)
% 
% Inputs
% x = clean time series signal vector or matrix where each column is 
%   treated as a vector (EU)
% n = noise time series signal vector or matrix where each column is 
%   treated as a vector (EU)
% snrdB = signal to noise ratio (dB)
% 
% Outputs
% y = combined signal
%
%   Example
%      x = 2.3*randn(102400,1);
%      n = randn(102400,1);
%      x = spectralReshape(x,0,1024);
%      n = spectralReshape(n,0,1024);
%      snrdB = 10; 
%      y = addNoise(x,n,snrdB);
% 
%   See also spectralReshape

% Copyright 2018
% Written by Todd Schultz

%% Check inputs and outputs
narginchk(3,3)
nargoutchk(1,1)

% Define Input scheme
p = inputParser;
addRequired(p,'x',@(x)validateattributes(x,{'double','single'},{'real','finite'},mfilename,'x'))
addRequired(p,'n',@(x)validateattributes(x,{'double','single'},{'real','finite'},mfilename,'n'))
addRequired(p,'snrdB',@(x)validateattributes(x,{'numeric'},{'real','scalar','positive'},mfilename,'snrdB'))

% Parse and store inputs
parse(p,x,n,snrdB)
snratio = 10^(snrdB/10);

% Adjust signal-to-noise ratio
signalPow = rms(x).^2;
noisePow  = rms(n).^2;
n = sqrt(signalPow./noisePow/snratio).*n;
assert(abs(snr(x,n)-snrdB) <= 0.1,'addNoise:SignaltoNoiseRatioError',...
    'Error scaling noise signal power for request signal-to-noise ratio.')

% Super impose signal and noise together
y = x + n;

end
