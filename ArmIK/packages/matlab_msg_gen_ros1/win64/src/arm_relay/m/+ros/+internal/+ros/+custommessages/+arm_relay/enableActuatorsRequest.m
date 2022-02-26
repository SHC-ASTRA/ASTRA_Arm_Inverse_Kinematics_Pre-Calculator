function [data, info] = enableActuatorsRequest
%EnableActuators gives an empty data for arm_relay/EnableActuatorsRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'arm_relay/EnableActuatorsRequest';
[data.Enable, info.Enable] = ros.internal.ros.messages.ros.default_type('logical',1);
info.MessageType = 'arm_relay/EnableActuatorsRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'enable';
