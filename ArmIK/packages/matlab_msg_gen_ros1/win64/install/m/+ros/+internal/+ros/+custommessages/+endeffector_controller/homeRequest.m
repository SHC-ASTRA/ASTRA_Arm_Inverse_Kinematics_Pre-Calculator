function [data, info] = homeRequest
%Home gives an empty data for endeffector_controller/HomeRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'endeffector_controller/HomeRequest';
[data.Home, info.Home] = ros.internal.ros.messages.ros.default_type('logical',1, 1);
info.MessageType = 'endeffector_controller/HomeRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'home';
