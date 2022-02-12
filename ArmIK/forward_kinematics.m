function fwd_kin = forward_kinematics(in1)
%FORWARD_KINEMATICS
%    FWD_KIN = FORWARD_KINEMATICS(IN1)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    12-Feb-2022 14:07:21

theta1 = in1(:,1);
theta2 = in1(:,2);
theta3 = in1(:,3);
theta4 = in1(:,4);
theta5 = in1(:,5);
theta6 = in1(:,6);
t2 = cos(theta1);
t3 = cos(theta2);
t4 = cos(theta3);
t5 = cos(theta4);
t6 = cos(theta5);
t7 = cos(theta6);
t8 = sin(theta1);
t9 = sin(theta2);
t10 = sin(theta3);
t11 = sin(theta4);
t12 = sin(theta5);
t13 = sin(theta6);
t14 = theta2+theta3;
t15 = t6.^2;
t16 = t7.^2;
t17 = t12.^2;
t18 = t13.^2;
t19 = cos(t14);
t20 = sin(t14);
t21 = t14+theta4;
t22 = cos(t21);
t23 = sin(t21);
t26 = t15.*t16;
t24 = t22.^2;
t25 = t23.^2;
t27 = t13.*t22.*1i;
t30 = t7.*t12.*t23.*1i;
t32 = t7.*t12.*t13.*t22.*t23.*2.0;
t28 = t18.*t25;
t29 = -t27;
t31 = t16.*t17.*t24;
t33 = t26+t28+t31+t32;
t34 = sqrt(t33);
t35 = 1.0./t34;
t36 = t29+t30+t34;
t37 = abs(t36);
mt1 = [t2.*3.48e-3+t2.*t3.*(1.4e+1./2.5e+1)-t8.*t12.*2.1744e-1+t2.*t3.*t4.*(8.3e+1./2.0e+2)-t2.*t9.*t10.*(8.3e+1./2.0e+2)+t2.*t5.*t19.*7.171e-2-t2.*t5.*t20.*2.517e-2+t2.*t6.*t22.*2.1744e-1-t2.*t11.*t19.*2.517e-2-t2.*t11.*t20.*7.171e-2];
mt2 = [t8.*3.48e-3+t3.*t8.*(1.4e+1./2.5e+1)+t2.*t12.*2.1744e-1+t3.*t4.*t8.*(8.3e+1./2.0e+2)-t8.*t9.*t10.*(8.3e+1./2.0e+2)+t5.*t8.*t19.*7.171e-2-t5.*t8.*t20.*2.517e-2+t6.*t8.*t22.*2.1744e-1-t8.*t11.*t19.*2.517e-2-t8.*t11.*t20.*7.171e-2];
mt3 = [t9.*(1.4e+1./2.5e+1)+t20.*(8.3e+1./2.0e+2)+sin(t21-theta5).*1.0872e-1+sin(t21+theta5).*1.0872e-1+(7.599903288858352e+3.*cos(t21-atan(2.849026618990862)))./1.0e+5+2.4092e-1,angle(t35.*t37.*(t2+t8.*1i).*(t6.*t7+t3.*t4.*t11.*t13.*1i+t3.*t5.*t10.*t13.*1i+t4.*t5.*t9.*t13.*1i-t9.*t10.*t11.*t13.*1i+t3.*t4.*t5.*t7.*t12.*1i-t3.*t7.*t10.*t11.*t12.*1i-t4.*t7.*t9.*t11.*t12.*1i-t5.*t7.*t9.*t10.*t12.*1i).*1i),angle(t36)];
mt4 = [angle(t35.*t37.*(t3.*t4.*t5.*t7.*1i+t3.*t4.*t6.*t11+t3.*t5.*t6.*t10+t4.*t5.*t6.*t9-t3.*t7.*t10.*t11.*1i-t4.*t7.*t9.*t11.*1i-t5.*t7.*t9.*t10.*1i-t6.*t9.*t10.*t11+t3.*t4.*t11.*t12.*t13.*1i+t3.*t5.*t10.*t12.*t13.*1i+t4.*t5.*t9.*t12.*t13.*1i-t9.*t10.*t11.*t12.*t13.*1i))];
fwd_kin = reshape([mt1,mt2,mt3,mt4],6,1);
