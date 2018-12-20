function plotSpectrumFeatures(pxx,f)
%%PLOTSPECTRUMFEATURES plot features from spectral-based processing
%   Plot spectral-based features for the processed signal
% 
% Syntax
% plotSpectrumFeatures(pxx,f)
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
%      plotSpectrumFeatures(pxx,f)
% 
%   See also octaveFeatures

% Copyright 2018
% Written by Todd Schultz

% Plot octave spectrum
cbone = bone(size(pxx,2));
hf = figure;
axes(hf,'XScale','log')
hold on;
for iblock = 1:size(pxx,2)
    semilogx(f,10*log10(pxx(:,iblock)),'Color',cbone(end+1-iblock,:))
end
hold off;
xlabel('Frequency (Hz)')
ylabel('P_{xx} (dB)')