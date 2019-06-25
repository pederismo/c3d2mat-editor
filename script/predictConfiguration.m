function [sensorsNumber, dataType] = predictConfiguration(AnalogSignals)
% This function predicts the sensor configuration of a specific c3d file by
% looking at the size of the analog signals' matrix. 13*n columns mean a
% mixed data configuration (4 quaternions, 3 accelerometer, 3 gyroscope, 3
% magnetometer).
if mod(size(AnalogSignals, 2), 13) == 0
    sensorsNumber = size(AnalogSignals, 2) / 13;
    dataType = 'Mixed Data';
else
    sensorsNumber = size(AnalogSignals, 2) / 9;
    dataType = 'Raw Data';
end
end

