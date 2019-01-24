function [acc,fpr,fnr,f1] = scoreModel(ytrue,ypred)
%%SCOREMODEL computes model metrics for a binary classification model
%   Computes the accuracy, false postive rate, false negative rate, and the
%   F1 score for evaluating the performance of a binary classification
%   problem. 
% 
% Syntax
% [acc,fpr,fnr,f1] = scoreModel(ytrue,ypred)
% 
% Inputs
% ytrue = vector of known classes
% ypred = vector of predicted classes from model
% 
% Outputs
% acc = accuracy as a fraction between 0 and 1
% fpr = false positive rate as a fraction
% fnr = false negative rate as a fraction
% f1 = F1 score as a fraction
%
%   Example
%      [acc,fpr,fnr,f1] = scoreModel(ytrue,ypred)
% 
%   See also confusionmat

% Copyright 2019
% Written by Todd Schultz

%% Check inputs and outputs
narginchk(2,2)
nargoutchk(3,3)

% ytrue and ypred must be the same type and size
assert(class(ytrue) == class(ypred),'scoreModel:InputClasses','Classes of inputs ytrue and ypred are not equal.')
assert(size(ytrue) == size(ypred),'scoreModel:InputSize','Sizes of inputs ytrue and ypred are not equal.')

%% Compute metrics
confMat = confusionmat(ytrue,ypred);

% Accuracy
acc = sum(diag(confMat))/sum(confMat(:));

% False positive rate = # false positives / (total # of true negatives)
fpr = confMat(1,2)/(confMat(1,1) + confMat(1,2));

% False negative rate = # of false negatives / (total # of true postives)
fnr = confMat(2,1)/(confMat(2,2) + confMat(2,1));

% F1 score = 2*true postives / (2*true positives + false postives + false negatives)
f1 = 2*confMat(2,2)/(2*confMat(2,2) + confMat(1,2) + confMat(2,1));

end
