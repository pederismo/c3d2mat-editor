function [AnalogSignals, AnalogFrameRate, fileName] = loadc3dFile()
% This function has the user choose a c3d file and it loads it as mat
% variables. Since only sampling rate and analog signals are used, all the
% other infos are blacklisted.
[fileName, path] = uigetfile('.c3d');
[~, ~, ~, AnalogSignals, AnalogFrameRate, ~, ~, ~, ~, ~] = readc3d(fullfile(path, fileName));
end

