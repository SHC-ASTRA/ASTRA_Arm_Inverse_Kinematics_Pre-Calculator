function [data, info] = homeRequest
%Home gives an empty data for end_effector_control/HomeRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'end_effector_control/HomeRequest';
[data.Home, info.Home] = ros.internal.ros.messages.ros.default_type('logical',1, 1);
info.MessageType = 'end_effector_control/HomeRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'home';
