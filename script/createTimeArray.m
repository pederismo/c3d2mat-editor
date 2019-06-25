function [time] = createTimeArray(length, sampleRate)
% This simple function outputs a time array based on his length and the
% sampling rate (period)
time = zeros(1, length);
for i = 2:length
    time(i) = time(i - 1) + 1/double(sampleRate); 
end
end

