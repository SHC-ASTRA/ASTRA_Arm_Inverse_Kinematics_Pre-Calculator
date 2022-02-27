function [data, info] = jointRateCommand
%JointRateCommand gives an empty data for end_effector_control/JointRateCommand
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'end_effector_control/JointRateCommand';
[data.Axis, info.Axis] = ros.internal.ros.messages.ros.default_type('int8',1);
[data.DesiredRate, info.DesiredRate] = ros.internal.ros.messages.ros.default_type('double',1);
info.MessageType = 'end_effector_control/JointRateCommand';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,2);
info.MatPath{1} = 'axis';
info.MatPath{2} = 'desiredRate';
