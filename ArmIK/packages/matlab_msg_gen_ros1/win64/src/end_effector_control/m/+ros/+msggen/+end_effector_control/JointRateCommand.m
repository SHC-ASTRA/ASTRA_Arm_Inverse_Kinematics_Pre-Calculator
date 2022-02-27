
classdef JointRateCommand < ros.Message
    %JointRateCommand MATLAB implementation of end_effector_control/JointRateCommand
    %   This class was automatically generated by
    %   ros.internal.pubsubEmitter.
    %   Copyright 2014-2020 The MathWorks, Inc.
    properties (Constant)
        MessageType = 'end_effector_control/JointRateCommand' % The ROS message type
    end
    properties (Constant, Hidden)
        MD5Checksum = '7c9621cdf3b2746e88f21114aece282c' % The MD5 Checksum of the message definition
        PropertyList = { 'Axis' 'DesiredRate' } % List of non-constant message properties
        ROSPropertyList = { 'axis' 'desiredRate' } % List of non-constant ROS message properties
        PropertyMessageTypes = { '' ...
            '' ...
            } % Types of contained nested messages
    end
    properties (Constant)
    end
    properties
        Axis
        DesiredRate
    end
    methods
        function set.Axis(obj, val)
            validClasses = {'numeric'};
            validAttributes = {'nonempty', 'scalar'};
            validateattributes(val, validClasses, validAttributes, 'JointRateCommand', 'Axis');
            obj.Axis = int8(val);
        end
        function set.DesiredRate(obj, val)
            validClasses = {'numeric'};
            validAttributes = {'nonempty', 'scalar'};
            validateattributes(val, validClasses, validAttributes, 'JointRateCommand', 'DesiredRate');
            obj.DesiredRate = double(val);
        end
    end
    methods (Static, Access = {?matlab.unittest.TestCase, ?ros.Message})
        function obj = loadobj(strObj)
        %loadobj Implements loading of message from MAT file
        % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = ros.msggen.end_effector_control.JointRateCommand.empty(0,1);
                return
            end
            % Create an empty message object
            obj = ros.msggen.end_effector_control.JointRateCommand(strObj);
        end
    end
end
