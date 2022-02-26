global theta_t;
theta_t = [];
global k;
k = 1;
theta_t(:,1) = deg2rad([10,70,-130,60,0,0]).'; % Initial angles


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
    feedback_listener = rossubscriber("/feedback",@(x,data)process_feedback(data),"DataFormat","struct");
    control_publisher = rospublisher("joint_rate_command","arm_relay/JointRateCommand","DataFormat","struct");

    home_client = rossvcclient("/home_arm_base","DataFormat","struct");
    enable_client = rossvcclient("/enable_actuators","DataFormat","struct");

    input("Press Enter to Enable Arm");
    enable_req = rosmessage(enable_client);

    enable_req.Enable = true;

    enable_resp = call(enable_client,enable_req,"Timeout",3);
    if enable_resp.Enabled
        disp("Arm Succesfully Enabled")
    else
        disp("ERROR! Arm Not Enabled!")
    end

    home_input = input("Home Arm? (y/N)\n",'s');
    if home_input == "y" || home_input == "Y"
        home_req = rosmessage(home_client);
        homed = false;
        while ~homed
            home_resp = call(home_client,home_req,"Timeout",3);
            if home_resp.Success
                homed = true;
                disp("Arm Succesfully Homed")
            end
            pause(1)
        end
    end

end

try

do_serial = false;
if ~do_ros
    ports = serialportlist;
    ports = setdiff(ports,["COM9","COM19"]);

    do_serial = ~isempty(ports);
end

if do_serial
    port = serialport(ports(end),115200);
end


joy = vrjoystick(1);


X_dot_des = [0;0;0;0;0;0]; % Desired world rates
X_dot_des_now = X_dot_des;
theta_min = deg2rad([-360,-15,-140,-75,-45,-360]).';
theta_max = deg2rad([360,90,-40,60,45,360]).';
%theta_t(:,1) = deg2rad([0,45,-90,45,0,0]).'; % Initial angles
X_t = [];
X_t(:,1) = forward_kinematics(theta_t(:,1).'); % Initial pose
T = 1; % Simulation time
iter = 100; % Number of iterations
dt = T/iter; % Timestep
t = 0;

max_allowed_rates = [30;4;4;10;10;10];
speed = 2.5;
rot_speed = 10;

t_list = [];

do_animation = false; % Set this to true in order to output a gif animation

T_1_0 = T_1_to_0_f(theta_t(:,1).');
T_2_1 = T_2_to_1_f(theta_t(:,1).');
T_3_2 = T_3_to_2_f(theta_t(:,1).');
T_4_3 = T_4_to_3_f(theta_t(:,1).');
T_5_4 = T_5_to_4_f(theta_t(:,1).');
T_6_5 = T_6_to_5_f(theta_t(:,1).');
T_H_6 = T_H_to_6_f(theta_t(:,1).');

[armX,armY,armZ] = prepare_plot_arm({T_1_0,T_2_1,T_3_2,T_4_3,T_5_4,T_6_5,T_H_6});
[X_X,X_Y,X_Z] = prepare_plot_tform_X({eye(4),T_1_0,T_2_1,T_3_2,T_4_3,T_5_4,T_6_5,T_H_6},[0.5,0.1,0.1,0.1,0.1,0.1,0.1,0.1]);
[Y_X,Y_Y,Y_Z] = prepare_plot_tform_Y({eye(4),T_1_0,T_2_1,T_3_2,T_4_3,T_5_4,T_6_5,T_H_6},[0.5,0.1,0.1,0.1,0.1,0.1,0.1,0.1]);
[Z_X,Z_Y,Z_Z] = prepare_plot_tform_Z({eye(4),T_1_0,T_2_1,T_3_2,T_4_3,T_5_4,T_6_5,T_H_6},[0.5,0.1,0.1,0.1,0.1,0.1,0.1,0.1]);

h = figure();
arm_plot = plot3(armX,armY,armZ,"k");
hold('on')
TX_plot = plot3(X_X,X_Y,X_Z,"r");
TY_plot = plot3(Y_X,Y_Y,Y_Z,"g");
TZ_plot = plot3(Z_X,Z_Y,Z_Z,"b");
xlim([-1.3,1.3]);
ylim([-1.3,1.3]);
zlim([-0.5,1.5]);
view([45 45])
grid("on")

drawnow limitrate

if do_animation
    filename = 'testAnimated.gif';
end
while ishghandle(h)
    tic
    t = t+dt; % Calculate time
    t_list(k) = t;
    J_val = J_func(theta_t(1,k),theta_t(2,k),theta_t(3,k),theta_t(4,k),theta_t(5,k),theta_t(6,k)); % Calculate Jacobian
    J_pinv = pinv(J_val); % Invert Jacobian

    joyval = read(joy);
    joyval(abs(joyval)<0.01) = 0;
    joybutt = button(joy);
    if ~joybutt(6)
        X_dot_des = speed*[-joyval(2);-joyval(5);-joyval(4);0;0;0];
    else
        X_dot_des = rot_speed*[0;0;0;-joyval(5);-joyval(4);joyval(1)];
    end

    mode = joybutt(5);

    T_H_0 = fwd_kin_matrix(theta_t(:,k).');

    T_1_0 = T_1_to_0_f(theta_t(:,k).');
    T_2_1 = T_2_to_1_f(theta_t(:,k).');
    T_3_2 = T_3_to_2_f(theta_t(:,k).');
    T_4_3 = T_4_to_3_f(theta_t(:,k).');
    T_5_4 = T_5_to_4_f(theta_t(:,k).');
    T_6_5 = T_6_to_5_f(theta_t(:,k).');

    T_2_0 = T_1_0*T_2_1;
    T_3_0 = T_2_0*T_3_2;
    T_4_0 = T_3_0*T_4_3;
    T_5_0 = T_4_0*T_5_4;
    T_6_0 = T_5_0*T_6_5;

    if mode
        T_control = T_5_0 * [0 1 0 0; -1 0 0 0; 0 0 1 0; 0 0 0 1];
        T_control(1:3,4) = T_H_0(1:3,4);
    else
        T_control = T_1_0;
        T_control(1:3,4) = T_H_0(1:3,4);
    end


    X_dot_des_now = zeros([6,1]);

    X_dot_des_now(1:3) = T_control(1:3,1:3) * [X_dot_des(1);0;0] + T_control(1:3,1:3) * [0;0;X_dot_des(2)] + T_control(1:3,1:3)*[0;X_dot_des(3);0];

    X_dot_des_now(4:6) = [0;0;0];

    theta_rates = J_pinv * X_dot_des_now; % Calculate joint rates

    theta_rates(1) = theta_rates(1) + 20*joyval(3);

    if mode
        theta_rates(4:6) = theta_rates(4:6) + X_dot_des(4:6);
    else
        theta_rates(4) = theta_rates(4) + X_dot_des(4);
        theta_rates(5:6) = X_dot_des(5:6);
    end

    theta_rates(abs(theta_rates)<0.002) = 0;

    if any(abs(theta_rates)>max_allowed_rates)
        max_rate = max(abs(theta_rates./max_allowed_rates));
        theta_rates = theta_rates./max_rate;
    end

    if do_ros
        
        for axis = 1:4
            msg = rosmessage(control_publisher,"DataFormat","struct");
            msg.Axis=int8(axis);
            msg.DesiredRate = theta_rates(axis);

            send(control_publisher,msg);
        end

        X_t(:,k+1) = forward_kinematics(theta_t(:,k).');

    elseif do_serial
        theta_t(:,k+1) = theta_t(:,k);

        while port.NumBytesAvailable > 0
            in_data = port.readline();
            data_array = split(in_data,{';',':',','});
            data_array = strtrim(data_array);
            if data_array(1) == "feedback"
                actuator = str2num(data_array(2));
                angle = str2num(data_array(3));

                theta_t(actuator,k+1) = deg2rad(angle);
            end
        end

        X_t(:,k+1) = forward_kinematics(theta_t(:,k+1).');

        port.writeline("1,"+string(theta_rates(1)))
        port.writeline("2,"+string(theta_rates(2)))
        port.writeline("3,"+string(theta_rates(3)))
    else
        % Replace the line below with commanding the new joint rates, waiting
        % for a moment, then reading the joint angles.
        theta_t(:,k+1) = theta_t(:,k) + theta_rates*dt; % Move Arm (Simulation only)

        theta_t(theta_t(:,k+1)<theta_min,k+1) = theta_min(theta_t(:,k+1)<theta_min);
        theta_t(theta_t(:,k+1)>theta_max,k+1) = theta_max(theta_t(:,k+1)>theta_max);

        X_t(:,k+1) = forward_kinematics(theta_t(:,k+1).'); % Calculate new world position with forward kinematics
    end

    

    [armX,armY,armZ] = prepare_plot_arm({T_1_0,T_2_1,T_3_2,T_4_3,T_5_4,T_6_5,T_H_6});
    [X_X,X_Y,X_Z] = prepare_plot_tform_X({eye(4),T_1_0,T_2_0,T_3_0,T_4_0,T_5_0,T_6_0,T_H_0,T_control},[0.5,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.6]);
    [Y_X,Y_Y,Y_Z] = prepare_plot_tform_Y({eye(4),T_1_0,T_2_0,T_3_0,T_4_0,T_5_0,T_6_0,T_H_0,T_control},[0.5,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.6]);
    [Z_X,Z_Y,Z_Z] = prepare_plot_tform_Z({eye(4),T_1_0,T_2_0,T_3_0,T_4_0,T_5_0,T_6_0,T_H_0,T_control},[0.5,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.6]);

    arm_plot.XData = armX;
    arm_plot.YData = armY;
    arm_plot.ZData = armZ;

    TX_plot.XData = X_X;
    TX_plot.YData = X_Y;
    TX_plot.ZData = X_Z;

    TY_plot.XData = Y_X;
    TY_plot.YData = Y_Y;
    TY_plot.ZData = Y_Z;

    TZ_plot.XData = Z_X;
    TZ_plot.YData = Z_Y;
    TZ_plot.ZData = Z_Z;

    xlim([-1.3,1.3]);
    ylim([-1.3,1.3]);
    zlim([-0.5,1.5]);
    view([45 45])

    drawnow limitrate

    if do_animation && ishghandle(h)
        %         Capture the plot as an image

        frame = getframe(h);
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        % Write to the GIF File
        if k == 1
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',dt*3);
        else
            imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',dt*3);
        end
    end
    k = k+1;
    theta_t(:,k) = theta_t(:,k-1);
    dt = toc;
end

figure()
plot(t_list,theta_t(:,1:end-1))
title("Joint Angles vs Time");
xlabel("Time (s)");
ylabel("Joint Angle (radians)");
legend(["\theta_1" "\theta_2" "\theta_3" "\theta_4" "\theta_5" "\theta_6"],"Location","best")
figure()
plot(t_list,X_t(:,1:end-1))
title("World Pose vs Time");
xlabel("Time (s)");
ylabel("Position (meters) OR Angle (radians)");
legend(["x" "y" "z" "\alpha" "\beta" "\gamma"],"Location","best")

catch ME
    warning(ME.identifier +": " + ME.message)
end
clear port

if do_ros
    enable_req = rosmessage(enable_client);

    enable_req.Enable = false;

    enable_resp = call(enable_client,enable_req,"Timeout",3);
    if ~enable_resp.Enabled
        disp("Arm Succesfully Disabled")
    else
        disp("ERROR! Arm Not Disabled!")
    end
    
    rosshutdown
end

function process_feedback(feedback)
    global k
    global theta_t

    axis = feedback.Axis;
    angle = feedback.Angle;

    theta_t(axis,k) = deg2rad(angle);
end

function plot_arm(AxesCells, frameSize)
if nargin == 1 || frameSize == 0
    frameSize = 1;
end

% legendArray = {};
% figure();
% clf
cmap = [0 0.4470 0.7410;0.8500 0.3250 0.0980;0.9290 0.6940 0.1250;0.4940 0.1840 0.5560;0.4660 0.6740 0.1880;0.3010 0.7450 0.9330;0.6350 0.0780 0.1840];
hold on;
baseTransform = eye(4);
plot_tform(baseTransform,"FrameSize",1*frameSize);
armTransform = AxesCells{1};
plot_tform(armTransform,"FrameSize",0.1*frameSize);
for i = 2:length(AxesCells)
    P1 = armTransform*[0 0 0 1]';
    armTransform = armTransform*AxesCells{i};
    P2 = armTransform*[0 0 0 1]';
    plot_tform(armTransform,"FrameSize",0.1*frameSize);
    patch([P2(1) P1(1)], [P2(2) P1(2)], [P2(3) P1(3)],"r","EdgeColor",cmap(i,:))
    hold on;
    %     legendArray{i-1} = "Link "+(i-1);
end
axis equal;

% plot(NaN,"-r")
% plot(NaN,"-g")
% plot(NaN,"-b")
% legend([legendArray {"Frame X Axis" "Frame Y Axis" "Frame Z Axis"}])
end

function [X,Y,Z] = prepare_plot_arm(AxesCells)

armTransform = eye(4);

P = armTransform*[0 0 0 1]';

X = [P(1)];
Y = [P(2)];
Z = [P(3)];

for i = 1:length(AxesCells)

    armTransform = armTransform*AxesCells{i};
    P = armTransform*[0 0 0 1]';

    X(i+1) = [P(1)];
    Y(i+1) = [P(2)];
    Z(i+1) = [P(3)];

end
axis equal;

end

function plot_tform(T,varargin)
p = inputParser;
p.KeepUnmatched = true;
p.addOptional("FrameSize",1);

p.parse(varargin);
f = p.Results.FrameSize{2};

patch([T(1,4), (T(1,4)+T(1,1)*f)],[T(2,4), (T(2,4)+T(2,1)*f)],[T(3,4), (T(3,4)+T(3,1)*f)],"r","EdgeColor","r")
patch([T(1,4), (T(1,4)+T(1,2)*f)],[T(2,4), (T(2,4)+T(2,2)*f)],[T(3,4), (T(3,4)+T(3,2)*f)],"g","EdgeColor","g")
patch([T(1,4), (T(1,4)+T(1,3)*f)],[T(2,4), (T(2,4)+T(2,3)*f)],[T(3,4), (T(3,4)+T(3,3)*f)],"b","EdgeColor","b")
%plotTransforms(tform2trvec(T),tform2quat(T),varargin{:})
end

function [X,Y,Z] = prepare_plot_tform_X(T_Cells,Sizes)
X = [];
Y = [];
Z = [];

for i = 1:length(T_Cells)
    T = T_Cells{i};
    X = [X, T(1,4), (T(1,4)+T(1,1)*Sizes(i)) nan];
    Y = [Y, T(2,4), (T(2,4)+T(2,1)*Sizes(i)) nan];
    Z = [Z, T(3,4), (T(3,4)+T(3,1)*Sizes(i)) nan];
end
end

function [X,Y,Z] = prepare_plot_tform_Y(T_Cells,Sizes)

X = [];
Y = [];
Z = [];

for i = 1:length(T_Cells)
    T = T_Cells{i};
    X = [X, T(1,4), (T(1,4)+T(1,2)*Sizes(i)) nan];
    Y = [Y, T(2,4), (T(2,4)+T(2,2)*Sizes(i)) nan];
    Z = [Z, T(3,4), (T(3,4)+T(3,2)*Sizes(i)) nan];
end
end

function [X,Y,Z] = prepare_plot_tform_Z(T_Cells,Sizes)

X = [];
Y = [];
Z = [];
T = eye(4);

for i = 1:length(T_Cells)
    T = T_Cells{i};
    X = [X, T(1,4), (T(1,4)+T(1,3)*Sizes(i)) nan];
    Y = [Y, T(2,4), (T(2,4)+T(2,3)*Sizes(i)) nan];
    Z = [Z, T(3,4), (T(3,4)+T(3,3)*Sizes(i)) nan];
end
end