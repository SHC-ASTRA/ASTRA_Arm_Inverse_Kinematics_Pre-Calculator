function [data, info] = enableActuatorsResponse
%EnableActuators gives an empty data for arm_relay/EnableActuatorsResponse
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'arm_relay/EnableActuatorsResponse';
[data.Enabled, info.Enabled] = ros.internal.ros.messages.ros.default_type('logical',1);
info.MessageType = 'arm_relay/EnableActuatorsResponse';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'enabled';
