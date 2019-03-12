# EnvNoiseDetector
Machine learning applied to detecting environmental noise contamination in aircraft acoustic signals

This project is the work of Todd Schultz, Rahul Birmiwal, Sean Miller as a portion of the requirements for the Masters in Data Science at the University of Washington. The goal of the project was to carry out a feasibility study to assess the suitability of feature sets and machine learning algorithms to automatically identify acoustic signals with environmental noise contamination such as bird calls, livestock vocalizations, insect sounds, and other non-test aircraft sounds. This project was intended to be a wide survey of various methods for generating features sets from the time-series audio recordings and various classification algorithms. The majority of the data used in this project was provided by Boeing Test & Evaluation with additional files from the National Parks Service (https://www.nps.gov/subjects/sound/gallery.htm). However, the raw audio files are not included in this repo due to their size. 

The repo is composed the following folders:
* code - contains the scripts and functions required to reproduce the results
* data - contains folders for the raw data, intermediate results, and final results
* devdocs - contains documents regarding the background of the project, progress reports, the final project poster and the final report
* zreferences - contains copy of references useful for the project

Inside the code folder, there are many scripts and functions that were used to carry out the analysis. The MATLAB Live scripts were used to document and compute the major components of the project. For example, MFCCFeatureGenerator.mlx is the live script that processes the raw time series data and computes the mel-frequency cepstral coefficients feature set. Typically, the live scripts followed a naming convention of XYGenerator.mlx, where X would be the name of the algorithm or model and Y would specify if the result was a feature set, model, or simulation result. Also, many functions are available in the folder and follow a similar naming convention. All of the live scripts and functions are documented thoroughly via in-code comments. 

A PDF copy of the final report is available in the root folder of the repo. 
