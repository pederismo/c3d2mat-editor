classdef c3dEditorMainController
    % This is a controller for the MainScreen
    
    properties (Constant)
        MIXEDSIGNALS = 13;
        RAWSIGNALS = 9;
    end
    
    properties
        c3dFile;
        % The MainScreen
        view;
    end
    
    methods
        % The constructor
        function obj = c3dEditorMainController()
            obj.c3dFile = c3dFile;
            obj.view = MainScreen.empty;
        end
        
        % Have the user load the .c3d file
        function loadc3d(obj)
            % Read the c3d file
            [fileName, path] = uigetfile('.c3d');
            [FileName, Markers, VideoFrameRate, AnalogSignals, AnalogFrameRate, Event, ParameterGroup, CameraInfo, ResidualError, HeaderGroup] = readc3d(fullfile(path, fileName));
            obj.c3dFile.FileName = FileName;
            obj.c3dFile.Markers = Markers;
            obj.c3dFile.VideoFrameRate = VideoFrameRate;
            obj.c3dFile.AnalogSignals = AnalogSignals;
            obj.c3dFile.AnalogFrameRate = AnalogFrameRate;
            obj.c3dFile.Event = Event;
            obj.c3dFile.ParameterGroup = ParameterGroup;
            obj.c3dFile.CameraInfo = CameraInfo;
            obj.c3dFile.ResidualError = ResidualError;
            obj.c3dFile.HeaderGroup = HeaderGroup;
            
            % Display dialog
            if mod(size(obj.c3dFile.AnalogSignals, 2), obj.MIXEDSIGNALS) == 0
                sensorsNumber = size(obj.c3dFile.AnalogSignals, 2) / obj.MIXEDSIGNALS;
                dataType = 'Mixed Data';
            else
                sensorsNumber = size(obj.c3dFile.AnalogSignals, 2) / obj.RAWSIGNALS;
                dataType = 'Raw Data';
            end
            message = ['File was uploaded correctly, it contains ' dataType ' and the configuration has ' num2str(sensorsNumber) ' sensors'];
            msgbox(message, 'Correct Loading', 'help');
            obj.view.addAssignmentLayout(sensorsNumber);
        end
    end
end

