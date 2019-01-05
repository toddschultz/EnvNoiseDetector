function cepcoef = cepstralFeatures(x,fs,varargin)
%%CEPSTRALFEATURES Creates cepstral features for the signal
%   Generates classification features from the input signal based on octave
%   spectrum processing. 
% 
% Syntax
% cepcoef = cepstralFeatures(x,fs)
% cepcoef = cepstralFeatures(x,fs,'NumFeatures',nfeatures)
% 
% Inputs
% x = time series vector or matrix where each column is treated as a
%   vector (EU)
% fs = sampling frequency (Hz)
% Name-Value pairs
% 'NumFeatures' - number of cepstral features to compute, defaults to 13
%   and must not exceed 58
% 
% Outputs
% cepcoef = cepstral feature coefficients
%
%   Example
%      x = randn(102400,1);
%      fs = 51200;
%      xblock = spectralReshape(x,0,1024);
%      cepcoef = cepstralFeatures(xblock,fs);
% 
%   See also octaveFeatures, spectralReshape

% Copyright 2018
% Written by Todd Schultz

%% Check inputs and outputs
narginchk(2,6)
nargoutchk(1,2)

% Define Input scheme
p = inputParser;
addRequired(p,'x',@(x)validateattributes(x,{'double','single'},{'real','finite'},mfilename,'x'))
addRequired(p,'fs',@(x)validateattributes(x,{'numeric'},{'scalar','real','finite','positive'},mfilename,'fs'))
addParameter(p,'NumFeatures',13,@(x)validateattributes(x,{'numeric'},{'scalar','real','finite','positive','<=',58},mfilename,'NumFeatures'))

% Parse and store inputs
parse(p,x,fs,varargin{:})
nfeatures = p.Results.NumFeatures;        % number of cepstral features

%% Parameters
[nfft,nblocks] = size(x); %#ok

% window function
win = hamming(nfft);

% Compute filter band edges and center frequenies
[bE,fc] = computeFilterBands(); %#ok

% Create filter bank matrix
[filterBank,nValidBands] = designAuditoryFilterBank(fs,bE,nfft);
filterBank = filterBank';

%% Process data
% Process each block for cepstral features

% Normalize the power in each block 
x = x./rms(x);

% compute FFT with window function
% f = fs*(0:(nfft/2))/nfft;   % valid for even values of nfft
X = abs(fft(x.*win));

% Apply filter bank as matrix multiplication
Xfilt = log10(filterBank*X);

% Compute final coefficients
DCTmatrix = createDCTmatrix(nfeatures,nValidBands,bE);
cepcoef = DCTmatrix*Xfilt;
end

%% Subfunctions
function [bE,fc,fl,fu] = computeFilterBands()
%%COMPUTEFILTERBANDS compute filter band edge frequencies
%   Default band edges as defined by the cepstralFeatureExtractor in the
%   Audio System Toolbox and the Auditory Toolbox and extended to cover the
%   range from 30 Hz to 20 kHz to be consistent with the frequency range
%   limits used for the octave feature processing. 

% Desired frequency range
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


function [filterBank,validNumBands] = designAuditoryFilterBank(fs,bandEdges,nfft)
%%DESIGNAUDITORYFILTERBANK returnes filter bank matrix for auditory model
%   This function is for internal use and may change in a future release.
%
% fs            - Sample rate of audio input
% nfft          - Number of bins in the DTFT
% bandEdges     - Band edges of filter bank
% sumExponent   - Exponent used for normalization. This controls whether you
%                 are analyzing in magnitude, power, or some random exponent.
% normalization - Type of normalization, specified as Area or Bandwidth.
% designDomain  - Domain in which the triangles are drawn, specified as
%                 'bin' (ETSI-style) or 'Hz' (Slaney-style).

% Copyright 2017 The Mathworks, Inc.
% Copied from designAuditoryFilterBank.m from the Audio System Toolbox and
% simplified for use here. 

% Parameters (defaults from cepstralFeatureExtractor.m)
% sumExponent = 1;
% normalization = 'Bandwidth';
% designDomain = 'Hz';

% Determine the number of bands
numEdges = numel(bandEdges);
numBands = numEdges - 2;

% Determine the number of valid bands
validNumEdges = sum(bandEdges < floor(fs/2));
validNumBands = validNumEdges - 2;

% Preallocate the filter bank
filterBank = zeros(nfft,numBands);

% This algorithm is specified by the documentation of Slaney's Auditory Toolbox.
linFq = (0:nfft-1)/nfft*fs;

% Determine inflection points
assert(validNumEdges <= numEdges)
p = zeros(validNumEdges,1);
for edgeNumber = 1:validNumEdges
    p(edgeNumber) = find(linFq >= bandEdges(edgeNumber),1,'first');     % changed to >=
end

% Create triangular filters for each band
bw = diff(bandEdges);
for k = 1:validNumBands
    % Rising side of triangle
    filterBank(p(k):p(k+1)-1,k) = ...
        (linFq(p(k):p(k+1)-1) - bandEdges(k)) / bw(k);
    
    % Falling side of triangle
    filterBank(p(k+1):p(k+2)-1,k) = ...
        (bandEdges(k+2) - linFq(p(k+1):p(k+2)-1)) / bw(k+1);
end

% Apply normalization
% Weight by bandwidth
filterBandWidth = bandEdges(3:end) - bandEdges(1:end-2);
weightPerBand   = 2./filterBandWidth;
for iband = 1:numBands
    filterBank(:,iband) = filterBank(:,iband).*weightPerBand(iband);
end

end


function dctmatrix = createDCTmatrix(NumCoeffs,NumValidBands,BandEdges)
% The DCT-II unitary algorithm is defined in "Discrete Time Signal
% Processing", equations (8.158), (8.159), (8.160).
N = NumCoeffs;
K = NumValidBands;

% The number of band edges is locked. To support dynamic memory
% allocation off, always create a matrix of the same size, but make
% the valid part of the matrix 1:N,1:K
matrix = zeros(N,numel(BandEdges)-2);
A = sqrt(1/K);
B = sqrt(2/K);
C = 2*K;

for n = 1:N
    for k = 1:K
        if n == 1
            matrix(n,k) = A*cos(pi*(n-1)*(2*k-1)/C);
        else
            matrix(n,k) = B*cos(pi*(n-1)*(2*k-1)/C);
        end
    end
end
dctmatrix = matrix;
end