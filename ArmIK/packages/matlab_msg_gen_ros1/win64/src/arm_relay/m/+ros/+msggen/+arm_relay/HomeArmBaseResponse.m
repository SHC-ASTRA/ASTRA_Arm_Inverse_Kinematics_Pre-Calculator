
classdef HomeArmBaseResponse < ros.Message
    %HomeArmBaseResponse MATLAB implementation of arm_relay/HomeArmBaseResponse
    %   This class was automatically generated by
    %   ros.internal.pubsubEmitter.
    %   Copyright 2014-2020 The MathWorks, Inc.
    properties (Constant)
        MessageType = 'arm_relay/HomeArmBaseResponse' % The ROS message type
    end
    properties (Constant, Hidden)
        MD5Checksum = '358e233cde0c8a8bcfea4ce193f8fc15' % The MD5 Checksum of the message definition
        PropertyList = { 'Success' } % List of non-constant message properties
        ROSPropertyList = { 'success' } % List of non-constant ROS message properties
        PropertyMessageTypes = { '' ...
            } % Types of contained nested messages
    end
    properties (Constant)
    end
    properties
        Success
    end
    methods
        function set.Success(obj, val)
            validClasses = {'logical', 'numeric'};
            validAttributes = {'nonempty', 'scalar'};
            validateattributes(val, validClasses, validAttributes, 'HomeArmBaseResponse', 'Success');
            obj.Success = logical(val);
        end
    end
    methods (Static, Access = {?matlab.unittest.TestCase, ?ros.Message})
        function obj = loadobj(strObj)
        %loadobj Implements loading of message from MAT file
        % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = ros.msggen.arm_relay.HomeArmBaseResponse.empty(0,1);
                return
            end
            % Create an empty message object
            obj = ros.msggen.arm_relay.HomeArmBaseResponse(strObj);
        end
    end
end
