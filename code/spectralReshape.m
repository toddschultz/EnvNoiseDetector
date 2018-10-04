function xblock = spectralReshape(x,noverlap,nfft,varargin)
%SPECTRALRESHAPE reshapes the signal into overlapped records
%   Reshapes the given time series signal into overlapped records in
%   preparation for spectrum estimation. The output is a two dimensional
%   matrix where each column is a record of the signal. 
%
% Syntax
% xblock = spectralReshape(x,noverlap,nfft)
% xblock = spectralReshape(x,noverlap,nfft,nrec)
% 
% Inputs
% x = signal, column vector
% noverlap = number of data points to overlap each block by
% nfft = number for points for each data block
% nrec (optional) = number of records or blocks to return, not to exceed 
%       floor((length(x) - noverlap)./(nfft - noverlap))
%
% Outputs
% xblock = reshaped signal, nfft by nrec matrix
%
%   Example
%      h = fir1(30,0.2,rectwin(31));
%      x = randn(16384,1);
%      y = filter(h,1,x);
%      fs = 500; nrec = 16
%      yblock = spectralReshape(y,0,1024,nrec);
% 
%   See also PWELCH, SPECTROGRAM

% Copyright 2015-2017
% Written by Todd Schultz

%% Check Inputs & Outputs
% Check number of input and output arguments
narginchk(3,4);
nargoutchk(1,1);

% Check x
validateattributes(x,{'numeric'},{'column'},mfilename,'x')
npts = length(x);       % need to generalize for an array of signals

% Check noverlap
validateattributes(noverlap,{'numeric'},{'scalar','integer','nonnegative'},mfilename,'noverlap')

% Check nfft
validateattributes(nfft,{'numeric'},{'scalar','integer','positive'},mfilename,'nfft')

% Parameter
nrec = floor((npts - noverlap)./(nfft - noverlap));

% Check nrec
if ~isempty(varargin)   % user supplied nrec
    validateattributes(varargin{1},{'numeric'},{'scalar','integer','positive','<=',nrec},mfilename,'nrec')
    nrec = varargin{1};
end

% Compute start and end points for each record
xStart = 1:(nfft - noverlap):nrec*(nfft - noverlap);
xEnd   = xStart + nfft - 1;

% Partion signal into records
xblock = zeros(nfft,nrec,'like',x);
for irec = 1:nrec
    xblock(:,irec) = x(xStart(irec):xEnd(irec));
%    [Sxxk,...] = computeperiodogram(x(xStart(irec):xEnd(irec),:),win,...)
%    Sxx  = Sxx + Sxxk;
end