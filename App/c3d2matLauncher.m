clc
clear
close all
%% Create instances of controller and view and assign to each other
controller = c3dEditorMainController();
app = MainScreen(controller);
controller.view = app;