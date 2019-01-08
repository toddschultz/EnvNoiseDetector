function plotFeaturesClass(xfeatures,trueClass,predClass)
%%PLOTFEATURESCLASS plot features and correct predicted class
%   Plot features as a line for each observation and color the line based
%   on if the predicted class is correct. 
% 
% Syntax
% plotFeaturesClass(xfeatures,trueClass,predClass)
% 
% Inputs
% xfeatures = table of features, only features
% trueClass = (catagorical or logical) vector of known classes
% predClass = (catagorical or logical) vector of predicted classes
% 
% Outputs
% pxx = octave specture features
% fc = center frequencies for each band (Hz)
%
%   Example
%      plotFeaturesClass(xfeatures,trueClass,predClass)
% 
%   See also octaveFeatures

% Copyright 2018
% Written by Todd Schultz

% Feature vector
f = 1:width(xfeatures);

% Correct class indicator
classInd = trueClass == predClass;

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