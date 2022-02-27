function [data, info] = enableServosResponse
%EnableServos gives an empty data for end_effector_control/EnableServosResponse
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'end_effector_control/EnableServosResponse';
[data.Enabled, info.Enabled] = ros.internal.ros.messages.ros.default_type('logical',1);
info.MessageType = 'end_effector_control/EnableServosResponse';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'enabled';
