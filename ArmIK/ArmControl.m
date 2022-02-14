X_dot_des = [0;0;0;0;0;0]; % Desired world rates
X_dot_des_now = X_dot_des;
theta_t = [];
theta_t(:,1) = deg2rad([0,70,-130,60,0,0]).'; % Initial angles
theta_min = deg2rad([-360,-15,-140,-75,-45,-360]).';
theta_max = deg2rad([360,90,-40,60,45,360]).';
%theta_t(:,1) = deg2rad([0,45,-90,45,0,0]).'; % Initial angles
X_t = [];
X_t(:,1) = forward_kinematics(theta_t(:,1).'); % Initial pose
T = 1; % Simulation time
iter = 100; % Number of iterations
dt = T/iter; % Timestep

t_list = [];

do_animation = false; % Set this to true in order to output a gif animation

T_1_to_0_f = matlabFunction(T_1_to_0,"Vars",{theta});
T_2_to_1_f = matlabFunction(T_2_to_1,"Vars",{theta});
T_3_to_2_f = matlabFunction(T_3_to_2,"Vars",{theta});
T_4_to_3_f = matlabFunction(T_4_to_3,"Vars",{theta});
T_5_to_4_f = matlabFunction(T_5_to_4,"Vars",{theta});
T_6_to_5_f = matlabFunction(T_6_to_5,"Vars",{theta});

joy = vrjoystick(1);

h = figure();

if do_animation
    filename = 'testAnimated.gif';
end
tic
k = 1;
while ishghandle(h)
    t = k*dt; % Calculate time
    t_list(k) = t;
    J_val = J_func(theta_t(1,k),theta_t(2,k),theta_t(3,k),theta_t(4,k),theta_t(5,k),theta_t(6,k)); % Calculate Jacobian
    J_pinv = pinv(J_val); % Invert Jacobian

    joyval = read(joy);
    joybutt = button(joy);
    if ~joybutt(6)
        X_dot_des = 1*[-joyval(2);-joyval(5);-joyval(4);0;0;0];
    else
        X_dot_des = 6*[0;0;0;-joyval(5);-joyval(4);joyval(1)];
    end

    mode = ~joybutt(5);

    T_H_0 = fwd_kin_matrix(theta_t(:,k).');

    T_1_0 = T_1_to_0_f(theta_t(:,k).');
    T_2_1 = T_2_to_1_f(theta_t(:,k).');
    T_3_2 = T_3_to_2_f(theta_t(:,k).');
    T_4_3 = T_4_to_3_f(theta_t(:,k).');
    T_5_4 = T_5_to_4_f(theta_t(:,k).');
    T_6_5 = T_6_to_5_f(theta_t(:,k).');

    T_4_0 = T_1_0*T_2_1*T_3_2*T_4_3;
    T_5_0 = T_4_0*T_5_4;

    if mode
        %         T_control = T_H_0 * [1 0 0 0; 0 cos(-theta_t(6,k)) -sin(-theta_t(6,k)) 0; 0 sin(-theta_t(6,k)) cos(-theta_t(6,k)) 0; 0 0 0 1];
        T_control = T_5_0 * [0 1 0 0; -1 0 0 0; 0 0 1 0; 0 0 0 1];
        T_control(1:3,4) = T_H_0(1:3,4);
        %         T_control(1:3,2:3) = 0;
        %         x_vec = T_control(1:3,1);
        %         y_vec = T_1_0(1:3,2);
        %         y_vec = y_vec/norm(y_vec);
        %         z_vec = cross(x_vec,y_vec);
        %         z_vec = z_vec/norm(z_vec);
        %         T_control(1:3,2) = y_vec;
        %         T_control(1:3,3) = z_vec;
    else
        T_control = T_1_0;
        T_control(1:3,4) = T_H_0(1:3,4);
    end


    X_dot_des_now = zeros([6,1]);

    X_dot_des_now(1:3) = T_control(1:3,1:3) * [X_dot_des(1);0;0] + T_control(1:3,1:3) * [0;0;X_dot_des(2)] + T_control(1:3,1:3)*[0;X_dot_des(3);0];

    %     R_H_0_rot = [1 0 -sin(b_now); 0 cos(a_now) sin(a_now)*cos(b_now); 0 -sin(a_now) cos(a_now)*cos(b_now)];

    X_dot_des_now(4:6) = [0;0;0];

    theta_rates = J_pinv * X_dot_des_now; % Calculate joint rates

    if mode
        theta_rates(4:6) = theta_rates(4:6) + X_dot_des(4:6);
    else
        theta_rates(4) = theta_rates(4) + X_dot_des(4);
        theta_rates(5:6) = X_dot_des(5:6);
    end

    % Replace the line below with commanding the new joint rates, waiting
    % for a moment, then reading the joint angles.
    theta_t(:,k+1) = theta_t(:,k) + theta_rates*dt; % Move Arm (Simulation only)

    theta_t(theta_t(:,k+1)<theta_min,k+1) = theta_min(theta_t(:,k+1)<theta_min);
    theta_t(theta_t(:,k+1)>theta_max,k+1) = theta_max(theta_t(:,k+1)>theta_max);

    X_t(:,k+1) = forward_kinematics(theta_t(:,k+1).'); % Calculate new world position with forward kinematics


    clf
    set(gca, 'Projection','perspective')
    plot_arm({T_1_0,T_2_1,T_3_2,T_4_3,T_5_4,T_6_5,T_H_to_6},0.5)
    grid on
    plot_tform(T_control,"FrameSize",1)
    %plot_tform(T_5_0,"FrameSize",1)
    %plot3(X_t(1,:),X_t(2,:),X_t(3,:));
    xlim([-1,1]);
    ylim([-1,1]);
    zlim([-0.5,1.5]);
    view([45 45])
    text(-1,-1,string(X_dot_des))

    drawnow;
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
end
toc

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

function R = Euler_ZYX(alpha,beta,gamma)
%From Assignment 1
R_z = [cos(alpha) -sin(alpha) 0; sin(alpha) cos(alpha) 0; 0 0 1];
R_y = [cos(beta) 0 sin(beta); 0 1 0; -sin(beta) 0 cos(beta)];
R_x = [1 0 0; 0 cos(gamma) -sin(gamma); 0 sin(gamma) cos(gamma)];
R = R_z*R_y*R_x;
end

function [alpha,beta,gamma] = Inv_Euler_ZYX(R,posOrNeg)
%From Assignment 1
if nargin == 1 || posOrNeg == 0
    posOrNeg = 1;
end
posOrNeg = sign(posOrNeg);

beta = atan2(-R(3,1),posOrNeg*sqrt(R(1,1)^2+R(2,1)^2));

alpha = piecewise(cos(beta)==0, 0, cos(beta)~=0, (atan2(R(2,1)/cos(beta),R(1,1)/cos(beta))));
gamma = piecewise(cos(beta)==0, sign(beta)*atan2(R(1,2),R(2,2)), cos(beta)~=0, atan2(R(3,2)/cos(beta),R(3,3)/cos(beta)));

% if cos(beta)==0
%     alpha = 0;
%     gamma = sign(beta)*atan2(R(1,2),R(2,2));
% else
%     alpha = atan2(R(2,1)/cos(beta),R(1,1)/cos(beta));
%     gamma = atan2(R(3,2)/cos(beta),R(3,3)/cos(beta));
% end
end

function [alpha,beta,gamma] = Inv_Euler_XYZ(r)
beta = asin(r(1,3));
alpha = atan2 (-r(2,3) , r(3,3)) ;
gamma = atan2 (-r(1,2) , r (1,1) ) ;
end

function T = DH_vals_to_T(alpha_im1,a_im1,d_i,theta_i)
T = [cos(theta_i) -sin(theta_i) 0 a_im1;...
    sin(theta_i)*cos(alpha_im1) cos(theta_i)*cos(alpha_im1) -sin(alpha_im1) -sin(alpha_im1)*d_i;...
    sin(theta_i)*sin(alpha_im1) cos(theta_i)*sin(alpha_im1) cos(alpha_im1) cos(alpha_im1)*d_i;...
    0 0 0 1];
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

function pretty_expression = compactify_angles(expression)
syms theta_1 theta_2 theta_3
syms c1 c2 c3 s1 s2 s3 c12 s12 c23 s23 c123 s123
pretty_expression = subs(expression,[sin(theta_1) sin(theta_2) sin(theta_3) cos(theta_1) cos(theta_2) cos(theta_3)],[s1 s2 s3 c1 c2 c3]);
pretty_expression = subs(pretty_expression,[c1*c2-s1*s2 cos(theta_1+theta_2) s1*c2+c1*s2 sin(theta_1+theta_2)],[c12 c12 s12 s12]);
pretty_expression = subs(pretty_expression,[c2*c3-s2*s3 cos(theta_2+theta_3) s2*c3+c2*s3 sin(theta_2+theta_3)],[c23 c23 s23 s23]);
pretty_expression = subs(pretty_expression,[c12*c3-s12*s3 cos(theta_1+theta_2+theta_3) s12*c3+c12*s3 sin(theta_1+theta_2+theta_3)],[c123 c123 s123 s123]);
end

function real_expression = decompactify_angles(expression)
syms theta_1 theta_2 theta_3
syms c1 c2 c3 s1 s2 s3 c12 s12 c23 s23 c123 s123
real_expression = subs(expression , [c1 c2 c3 s1 s2 s3 c12 s12 c23 s23 c123 s123], [cos(theta_1) cos(theta_2) cos(theta_3) sin(theta_1) sin(theta_2) sin(theta_3) cos(theta_1+theta_2) sin(theta_1+theta_2) cos(theta_2+theta_3) sin(theta_2+theta_3) cos(theta_1+theta_2+theta_3) sin(theta_1+theta_2+theta_3)]);
end