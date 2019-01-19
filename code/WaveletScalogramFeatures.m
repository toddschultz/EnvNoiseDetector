function WaveletScalogramFeatures(x,imageWidth,imageHeight,baseFileName,outputDir)
%%WAVELETSCALOGRAMFEATURES Generates scalograms and writes files to disk
%   Generates scalogram features from the input signal and writes files
%   to disk representing the signal
%
% Syntax
% WaveletScalogramFeatures(x,fs,)
% WaveletScalogramFeatures(x,fs,'NumFeatures',nfeatures)
% 
% Inputs
% x = time series vector or matrix where each column is treated as a
%   vector (EU)
% fs = sampling frequency (Hz)
% imageWidth = width of images to write out
% imageHeight = height of images to write out
% outputDir = path to write files out to
%
% Outputs
%   Files written to disk
% 

% Copyright 2019
% Written by Sean Miller

% See the following MathWorks documentation for further information:
% https://www.mathworks.com/help/wavelet/examples/signal-classification-with-wavelet-analysis-and-convolutional-neural-networks.html

[~,nblocks] = size(x);
for i = 1:nblocks
    n = x(:,i);
    outputFileName = fullfile(outputDir,strcat(baseFileName,"_",num2str(i),".jpg"));
    [signalLength,~] = size(n);

    % Create the continuous wavelet transform
    fb = cwtfilterbank('SignalLength',signalLength,'VoicesPerOctave',12);

    % Create 
    cfs = abs(fb.wt(n));

    % Create RGB image from image data
    im = ind2rgb(im2uint8(rescale(cfs)),jet(128));

    % Write image out to disk
    imwrite(imresize(im,[imageHeight imageWidth]),outputFileName);
end
