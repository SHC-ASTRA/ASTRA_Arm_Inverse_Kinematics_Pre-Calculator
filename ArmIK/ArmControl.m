global theta_t;
theta_t = [];
global k;
k = 1;
theta_t(:,1) = deg2rad([10,70,-130,60,0,0]).'; % Initial angles

rosshutdown

theta_min = deg2rad([-inf,-15,-140,-75,-45,-inf]).';
theta_max = deg2rad([inf,90,-40,60,45,inf]).';

max_allowed_rates = [30;4;4;10;15;30];
speed = 2.5;
rot_speed = 1;
fast_axis1_speed = 30;
grip_speed = 50;



arm_ip = resolvehost("192.168.1.3","address");
do_ros = false;

if isempty(arm_ip)
    disp("Cannot connect to arm controller")
    do_ros = false;

else
    disp("Arm Controller IP: "+arm_ip)

    try
        rosinit(arm_ip);
    catch
        do_ros = false;
    end
end

if do_ros

    status_listener = rossubscriber("/status",@(x,y) disp(y.Data),"DataFormat","struct");
    feedback_listener = rossubscriber("/feedback",@(x,data)process_feedback(data),"DataFormat","struct");
    control_publisher = rospublisher("joint_rate_command","arm_relay/JointRateCommand","DataFormat","struct");

    do_clients = false;
    try
        home_client = rossvcclient("/home_arm_base","DataFormat","struct","Timeout",3);
        enable_client = rossvcclient("/enable_actuators","DataFormat","struct","Timeout",3);
        do_clients = true;
    catch

    end

    if do_clients
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
    
    X_t = [];
    X_t(:,1) = forward_kinematics(theta_t(:,1).'); % Initial pose
    T = 1; % Simulation time
    iter = 100; % Number of iterations
    dt = T/iter; % Timestep
    t = 0;
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

        dist2D = sqrt(X_t(1,k)^2+X_t(2,k)^2);
        
        % Read controller
        joyval = read(joy);
        joyval(abs(joyval)<0.01) = 0;

        LStick_Horiz = joyval(1);
        LStick_Vert = joyval(2);
        RStick_Horiz = joyval(4);
        RStick_Vert = joyval(5);
        Triggers = joyval(3);

        joybutt = button(joy);
        
        A_button = joybutt(1);
        B_button = joybutt(2);
        X_button = joybutt(3);
        Y_button = joybutt(4);
        L_Shoulder = joybutt(5);
        R_Shoulder = joybutt(6);
        Back_button = joybutt(7);
        Start_button = joybutt(8);
        LStick_Press = joybutt(9);
        RStick_Press = joybutt(10);

        joypov = pov(joy,1);

        dpad_up = false;
        dpad_right = false;
        dpad_down = false;
        dpad_left = false;

        switch joypov

            case 0
                dpad_up = true;
            case 45*1
                dpad_up = true;
                dpad_right = true;
            case 45*2
                dpad_right = true;
            case 45*3
                dpad_right = true;
                dpad_down = true;
            case 45*4
                dpad_down = true;
            case 45*5
                dpad_down = true;
                dpad_left = true;
            case 45*6
                dpad_left = true;
            case 45*7
                dpad_left = true;
                dpad_up = true;
        end
        
        % Calculate Inputs
        relative_mode = L_Shoulder;
        direct_rotation_mode = R_Shoulder;

        delta_theta_dot = zeros([6,1]);
        X_dot_des = zeros([6,1]);

        if direct_rotation_mode
            delta_theta_dot(4:6) = rot_speed*[-RStick_Vert;-RStick_Horiz;LStick_Horiz].*max_allowed_rates(4:6);
        elseif ~direct_rotation_mode && ~relative_mode
            X_dot_des = speed*[-LStick_Vert;-RStick_Vert;0;0;0;0];
            delta_theta_dot(1) = speed*-RStick_Horiz/dist2D*1.5;
        elseif ~direct_rotation_mode && relative_mode
            X_dot_des = speed*[-LStick_Vert;-RStick_Vert;-RStick_Horiz;0;0;0];
        end

        delta_theta_dot(1) = delta_theta_dot(1) + fast_axis1_speed*(dpad_left*1 + dpad_right*-1);

        gripper_rate = grip_speed * Triggers;

        % Forward Kinematics

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

        if relative_mode
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

        theta_rates = theta_rates + delta_theta_dot;

        theta_rates(abs(theta_rates)<0.002) = 0;

        if any(abs(theta_rates)>max_allowed_rates)
            max_rate = max(abs(theta_rates./max_allowed_rates));
            theta_rates = theta_rates./max_rate;
        end

        if do_ros

            for axis = 1:6
                msg = rosmessage(control_publisher,"DataFormat","struct");
                msg.Axis=int8(axis);
                msg.DesiredRate = theta_rates(axis);

                send(control_publisher,msg);
            end

            msg = rosmessage(control_publisher,"DataFormat","struct");
            msg.Axis=int8(7);
            msg.DesiredRate = gripper_rate;

            send(control_publisher,msg);

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
            
            theta_rates

            theta_t(:,k+1) = theta_t(:,k) + deg2rad(theta_rates)*dt; % Move Arm (Simulation only)

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

        camproj('perspective')

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
        if do_ros
            theta_t(:,k) = theta_t(:,k-1);
        end
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
    clear port

    if do_ros && do_clients
        enable_req = rosmessage(enable_client);

        enable_req.Enable = false;

        enable_resp = call(enable_client,enable_req,"Timeout",3);
        if ~enable_resp.Enabled
            disp("Arm Succesfully Disabled")
        else
            disp("ERROR! Arm Not Disabled!")
        end

    end

    rosshutdown

    rethrow(ME)

end

if do_ros && do_clients
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