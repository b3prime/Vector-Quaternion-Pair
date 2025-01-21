pose1 = Pose([1, 2, 3], Quaternion([1 1 0 0]));
pose2 = Pose([2, 2, 2], Quaternion([0 1 0 1]));

function P3 = composePoses(P1, P2)
    q1 = P1.Quaternion;
    q2 = P2.Quaternion;
       
    t1 = P1.Position;
    t2 = P2.Position;

    newQuaternion = q1 * q2;
    newPosition_quat = [0, t1] + q1 * Quaternion([0, t2]);
    newPosition = newPosition_quat.double;
    newPosition(1) = [];

    P3 = Pose(newPosition, newQuaternion);
end

pose3 = composePoses(pose1, pose2);
pose3.displayPose()