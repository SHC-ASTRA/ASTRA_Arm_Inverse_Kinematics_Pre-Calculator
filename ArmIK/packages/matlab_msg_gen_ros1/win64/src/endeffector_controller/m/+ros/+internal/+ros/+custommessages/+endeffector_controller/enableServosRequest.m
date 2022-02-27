function [data, info] = enableServosRequest
%EnableServos gives an empty data for endeffector_controller/EnableServosRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'endeffector_controller/EnableServosRequest';
[data.Enable, info.Enable] = ros.internal.ros.messages.ros.default_type('logical',1);
info.MessageType = 'endeffector_controller/EnableServosRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'enable';
