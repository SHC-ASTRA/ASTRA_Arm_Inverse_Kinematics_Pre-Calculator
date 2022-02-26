
classdef EnableActuatorsRequest < ros.Message
    %EnableActuatorsRequest MATLAB implementation of arm_relay/EnableActuatorsRequest
    %   This class was automatically generated by
    %   ros.internal.pubsubEmitter.
    %   Copyright 2014-2020 The MathWorks, Inc.
    properties (Constant)
        MessageType = 'arm_relay/EnableActuatorsRequest' % The ROS message type
    end
    properties (Constant, Hidden)
        MD5Checksum = '8c1211af706069c994c06e00eb59ac9e' % The MD5 Checksum of the message definition
        PropertyList = { 'Enable' } % List of non-constant message properties
        ROSPropertyList = { 'enable' } % List of non-constant ROS message properties
        PropertyMessageTypes = { '' ...
            } % Types of contained nested messages
    end
    properties (Constant)
    end
    properties
        Enable
    end
    methods
        function set.Enable(obj, val)
            validClasses = {'logical', 'numeric'};
            validAttributes = {'nonempty', 'scalar'};
            validateattributes(val, validClasses, validAttributes, 'EnableActuatorsRequest', 'Enable');
            obj.Enable = logical(val);
        end
    end
    methods (Static, Access = {?matlab.unittest.TestCase, ?ros.Message})
        function obj = loadobj(strObj)
        %loadobj Implements loading of message from MAT file
        % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = ros.msggen.arm_relay.EnableActuatorsRequest.empty(0,1);
                return
            end
            % Create an empty message object
            obj = ros.msggen.arm_relay.EnableActuatorsRequest(strObj);
        end
    end
end
