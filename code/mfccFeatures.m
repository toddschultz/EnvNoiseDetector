function pxx = mfccFeatures(x,fs,nfeatures)
%%MFCCFEATURES Creates mel frequency cepstral coefficients for the signal
%   Generates classification features from the input signal based on mel 
%   frequency cepstral coefficients processing. 
% 
% Syntax
% pxx = mfccFeatures(x,fs,nfeatures)
% 
% Inputs
% x = time series vector or matrix where each column is treated as a
%   vector (EU)
% fs = sampling frequency (Hz)
% nfeatures = number of features to compute
% 
% Outputs
% pxx = mel frequency cepstral coefficients
%
%   Example
%      x = randn(102400,1);
%      fs = 51200;
%      xblock = spectralReshape(x,0,1024);
%      pxx = mfccFeatures(x,fs,nfeatures)
% 
%   See also mfcc

% Copyright 2018
% Written by Todd Schultz

%% Check inputs and outputs
narginchk(3,3)
nargoutchk(1,1)

% Define Input scheme
p = inputParser;
addRequired(p,'x',@(x)validateattributes(x,{'double','single'},{'real','finite'},mfilename,'x'))
addRequired(p,'fs',@(x)validateattributes(x,{'numeric'},{'scalar','real','finite','positive'},mfilename,'fs'))
addRequired(p,'nfeatures',@(x)validateattributes(x,{'numeric'},{'scalar','real','finite','positive'},mfilename,'nfeatures'))

% Parse and store inputs
parse(p,x,fs,nfeatures)

%% Process data
% Normalized signal power
x = x./rms(x);

% Compute mel frequency cepstral coefficients 
pxx = mfcc(x,fs,'WindowLength',size(x,1),'OverlapLength',0,'LogEnergy','Ignore');

% Resphase matrix
pxx = squeeze(pxx)';
end