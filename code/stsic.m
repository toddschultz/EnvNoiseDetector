function [x,Ireject] = stsic(x,varargin)
%%STSIC stationary transient signal classifier
%   Identifies data blocks in the signal that have high variance
%   as compared to the rest of the data, which is assumed to be stationary.
%   The implication is that the low variance signal blocks are the clean 
%   stationary signals of interest whereas the high variance signal blocks 
%   are contaminated with noise that if left in the signal will decrease 
%   the signal-to-noise ratio of the desired stationary signal. For
%   example, the stationary signal could be an acoustic signal of interest
%   whereas the high variance noise signal is hydrodynamic fluctuations 
%   impinging on the microphone.
%   This algorithm follows standard outlier rejection methodology by first 
%   estimating a test statistic for each block, then selecting a rejection 
%   criteria, and finally rejecting any blocks with a test statistic above 
%   the criteria. The test statistic for this function is the Kullback-
%   Leibler divergence statistic which is a statistical measure comparing 
%   different distributions. The distributions compared are two gamma 
%   distributions estimated from the mean block variance and the median 
%   block variance. The rejection criteria is the number of blocks included
%   in the data set, as sorted by increasing variance, where the Kullback-
%   Leibler divergence statistic is a minimum. All signal blocks with 
%   higher variance are rejected as being contaminated with noise. This 
%   function does allow for a maximum number of blocks to be provide to 
%   ensure sufficient data for further processing. If the algorithm 
%   identifies more blocks as contaminated as allowed by the maximum number
%   of blocks the function will issue a warning and return the entire 
%   signal without rejecting any data.
%
% Syntax
% y = stsic(x)
% y = stsic(x,maxblocks)
% [y,Ireject] = stsic(x,...)
%
% Inputs
% x = signal partioned into blocks in EU (V, Pa, etc), npts by nblocks matrix
% maxblocks (optional) = maximum number of outlier blocks allowed, scalar
%       (defaults to nblocks/2)
%
% Outputs
% y = accepted signal blocks in original order, npts by nblocks accepted matrix
% Ireject = logical vector indicating if a data block is rejected, 1 by
%       nblocks vector
%
%   Example
%      h = fir1(30,0.2,rectwin(31));
%      x = randn(16384,1);
%      y = filter(h,1,x);
%      y(2048:3000) = 3*y(2048:3000);   % add disturbance
%      fs = 500; nrec = 16
%      ys = stsic(y);
% 
%   See also SPECTRALRESHAPE, SMOOTHDATA, FINDCHANGEPTS

% Reference
% Bahr, C. J., Brooks, T. F., Humpreys, W. M., Spalt, T. B., & Stead, D. J.
%   (2014). Acoustic data processing and transient signal analysis for the
%   hybrid wing body 14- by 22-Foot subsonic wind tunnel test. 20th 
%   AIAA/CEAS Aeroacoustic Conference. Atlanta, GA: AIAA.

% Copyright 2015-2017
% Written by Todd Schultz

%% Check Inputs & Outputs
% Check number of input and output arguments
narginchk(1,2);
nargoutchk(1,2);

% Check x
validateattributes(x,{'numeric'},{'2d','real'},mfilename,'x')
[npts,nblocks] = size(x);

% Check maxblocks
maxblocks = nblocks/2;    % default value
if nargin > 1 && ~isempty(varargin{1})  % user supplied maxblocks
    maxblocks = varargin{1};
    validateattributes(maxblocks,{'numeric'},{'scalar','positive','integer'},mfilename,'maxblocks')
end

% Parameter
minblocks = round(0.2*nblocks);     % minimum number of data blocks needed
Ireject = false(1,nblocks);         % initialize Ireject assuming all good data

% Sort data blocks by ascending variance
% Data blocks with the smallest variance are assumed to be the clean
% acoustic signal and the ones to keep.
xvar = var(x);
[xvar,Idx] = sort(xvar);
Gxx = fft(x);
Gxx = Gxx(:,Idx);   % sort FFT results in order of ascending variance

% Algorithmic note
% From here on, the algorithm computes the parameters needed for all of the
% blocks in a cumulative fashion in order of ascending variance. Thus the
% number of data blocks with the lowest variance that generate the minimum
% value for the test statistic, K, is easily identified and the data blocks
% are classified into accepted data and outliers based off their sorted
% order. 

% Compute degrees of freedom
% Find the effective normalized bandwidth from 
%       B = (1/fmax)*int(Gxx(f),f,0..fmax) = mean(Gxx).
% Proper scaling of the magnitude isn't necessary since the magnitude of
% the autospectrum will be normalized such that the maximum value is one.
Gxx = cumsum((conj(Gxx).*Gxx),2);
Gxx = Gxx./repmat(1:nblocks,npts,1);
Gxx = Gxx./repmat(max(Gxx),npts,1);
B = mean(Gxx);

nu = B*(npts-1);

% Estimate robust shape parameter, alpha
alpha = nu/2;

% Estimate mean and median scale parameters, beta = variance/alpha
betamean = cumsum(xvar,2)./(1:nblocks)./alpha;

xvarmedian = zeros(1,nblocks);
bhat = gammaincinv(0.5,alpha);
for ibm = 1:nblocks
    xvarmedian(ibm) = median(xvar(1:ibm));
end
betamedian = xvarmedian./bhat;

% Compute test statistic, K, from Eq. 13 in reference
K = alpha.*(log(betamean) - log(betamedian) + (betamedian - betamean)./betamean);
K(1:minblocks) = nan;   % ensure at least minblocks are kept

% Identify block count where minimum |K| occurs as rejection criteria
[~,IKmin] = min(K);

if (nblocks - IKmin) > maxblocks    % check number of outliers blocks > maxblocks
    warning('stsic:minblocks',...
       'Too many data blocks rejected, entire signal returned.')
else    % Reject outlier blocks
    x = x(:,sort(Idx(1:IKmin)));
    Ireject(Idx(IKmin+1:end)) = true;
end

end