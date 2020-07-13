% Main script for calibration and 3D reconstruction 
% Before running this function create your own config file
% using template_config_file.m as reference
%
% Copyright (c) 2019 Swathi Sheshadri
% German Primate Center
% swathishesh AT gmail DOT com
%
% If used in published work please see repository README.md for citation
% and license information: https://github.com/SwathiSheshadri/pose3d

dbstop if error;

clear 
close all
clc

% allow to direct this to a specific location
base_path = fullfile('/', 'Volumes', 'taskcontroller$', 'SCP_DATA', 'SCP-CTRL-01', 'POSE3D');
if ~isfolder(base_path)
	mkdir(base_path);
end

cd(base_path);


%% Initializes experiment parameters as provided in your config file 
%template_config_file %run your config file here
template_config_file_SCP01_v01 %run your config file here



%% Call for calibration 
calibration_helper

%% Load and undistort 2D data if requested in config file
load_preprocess_2d_data

%% Perform 3D reconstruction
reconstruct_3D

%% Plot 3D reconstructed data
simple_3Ddata_plotter %To quickly vizualizate 3D reconstruction results
