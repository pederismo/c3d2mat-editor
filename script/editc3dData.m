clc
clear
close all
% This script is useful for the cropping and calibration of c3dData. It is
% meant to have as input a c3d file and then assist with the editing.
%% Load the calibration file
[calibrationSignals, calibrationSampleRate] = loadc3dFile();
%% Predict configuration
[calibrationSensorsNumber, calibrationDataType] = predictConfiguration(calibrationSignals);
%% Load the file to be calibrated
[toCalibrateSignals, toCalibrateSampleRate] = loadc3dFile();
%% Predict configuration
[toCalibrateSensorsNumber, toCalibrateDataType] = predictConfiguration(toCalibrateSignals);
%% If configurations are not the same throw an error
if calibrationSensorsNumber ~= toCalibrateSensorsNumber
    message = ['Configurations are not the same: calibration has ' calibrationSensorsNumber ' sensors whereas the file to be calibrated ' ...
        'has ' toCalibrateSensorsNumber ' sensors']; 
    error(message);
end
if ~strcmp(calibrationDataType, toCalibrateDataType)
    message = ['Configurations are not the same: calibration is ' calibrationDataType ' whereas the file to be calibrated is ' toCalibrateDataType];
    error(message);
end
%% Create a first time array
time = createTimeArray(length(toCalibrateSignals), toCalibrateSampleRate); 
%% Choose the signal to use for cropping
signal = input('Take a look at the signals to calibrate and type the column number for the signal you want to use for cropping: ');
plot(time, toCalibrateSignals(:, signal));
%% Identify first point and last point from cursor
% This part is done using plot tools, variable name should be chosen
% properly according to the next lines of code
pause;
%% Crop ALL the signals according to that choice
toCalibrateSignals = toCalibrateSignals(indices(2).DataIndex:indices(1).DataIndex, :);
%% Plot the new signal
time = createTimeArray(length(toCalibrateSignals), toCalibrateSampleRate);
plot(time, toCalibrateSignals(:, signal));
%% Calibrate the z-axis of the accelerometers
% Acceleration is measured in g
expectedValue = -1;
calibratedSignals = toCalibrateSignals;
for i = 7:13:size(toCalibrateSignals, 2)
    for j = 1:length(toCalibrateSignals)
        % The first value is used because it is sure to be when the sensor
        % is static
        offset = expectedValue - calibrationSignals(1, i);
        calibratedSignals(j, i) = toCalibrateSignals(j, i) + offset;
    end
end
hold on
plot(time, calibratedSignals(:, signal));

save 






