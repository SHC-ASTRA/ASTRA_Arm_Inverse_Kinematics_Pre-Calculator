function [data, info] = actuatorFeedback
%ActuatorFeedback gives an empty data for end_effector_control/ActuatorFeedback
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'end_effector_control/ActuatorFeedback';
[data.Axis, info.Axis] = ros.internal.ros.messages.ros.default_type('int8',1);
[data.Angle, info.Angle] = ros.internal.ros.messages.ros.default_type('double',1);
[data.ActualRate, info.ActualRate] = ros.internal.ros.messages.ros.default_type('double',1);
info.MessageType = 'end_effector_control/ActuatorFeedback';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,3);
info.MatPath{1} = 'axis';
info.MatPath{2} = 'angle';
info.MatPath{3} = 'actualRate';
