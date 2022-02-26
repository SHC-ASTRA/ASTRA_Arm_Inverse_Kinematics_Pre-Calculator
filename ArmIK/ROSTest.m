rosshutdown

arm_ip = resolvehost("astraarm.local","address");
do_ros = true;
if isempty(arm_ip)
    disp("Cannot connect to arm controller")
    do_ros = false;
else
    disp("Arm Controller IP: "+arm_ip)

    rosinit(arm_ip);
    
    status_listener = rossubscriber("/status",@(x,y) disp(y.Data),"DataFormat","struct");
    feedback_listener = rossubscriber("/feedback","DataFormat","struct");
    control_publisher = rospublisher("joint_rate_command","arm_relay/JointRateCommand","DataFormat","struct");
end

pause(600)

rosshutdown