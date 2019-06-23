classdef c3dFile
    % This class models all the infos contained in a c3d file
    
    properties (Access = public)
        FileName;
        Markers;
        VideoFrameRate;
        % The actual useful signals
        AnalogSignals;
        % The sample rate for the analog signals
        AnalogFrameRate;
        Event;
        ParameterGroup;
        CameraInfo;
        ResidualError;
        HeaderGroup;
    end
    
    methods (Access = public)
    end
end

