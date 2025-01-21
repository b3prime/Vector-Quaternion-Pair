classdef Pose
    properties
        Position (1, 3) double = [0, 0, 0];
        Quaternion Quaternion = Quaternion([0 0 0 0]);
    end
    methods
        function obj = Pose(position, quaternion)
            if nargin > 0
                if isvector(position) && numel(position) == 3
                    obj.Position = position;
                else
                    fprintf("Error in Position\n");
                end          

                obj.Quaternion = quaternion / norm(quaternion);
            end
        end

        function obj = setPosition(obj, newPosition)
            if isvector(newPosition) && numel(newPosition) == 3
                obj.Position = newPosition;
            else
                fprintf("newPosition must be 3-Vector\n");
            end
        end

        function obj = setQuaternion(obj, newQuaternion)
            obj.Quaternion = newQuaternion / newQuaternion.norm;
        end

        function position = get.Position(obj)
            position = obj.Position;
        end

        function quaternion = get.Quaternion(obj)
            quaternion = obj.Quaternion;
        end

        function displayPose(obj)
            fprintf('Position: [%f, %f, %f]\n', obj.Position);
            fprintf(strcat('Quaternion: ', obj.Quaternion.char(), '\n'));
        end

    end
end
