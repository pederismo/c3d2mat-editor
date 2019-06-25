function [offset] = calibrationProcess(expected, actual)
% This function outputs the offset on the measurement of acceleration from
% an IMU. The error on the measured value is believed to be according to
% this function:
%                   expected = actual * gain + offset
% 
% Since this version of the function only accepts one input value, only the
% value of the offset can be calculated. A later release might include also
% the computation of gain, while also using a least squares linear
% regression algorithm to get the best approximation of those two values.
offset = expected - actual;
end

