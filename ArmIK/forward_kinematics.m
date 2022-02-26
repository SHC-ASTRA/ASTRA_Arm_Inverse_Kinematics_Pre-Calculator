function fwd_kin = forward_kinematics(in1)
%FORWARD_KINEMATICS
%    FWD_KIN = FORWARD_KINEMATICS(IN1)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    25-Feb-2022 21:41:38

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
t15 = theta2.*2.0;
t16 = theta3.*2.0;
t17 = theta4.*2.0;
t18 = theta5.*2.0;
t23 = -theta5;
t30 = sqrt(2.0);
t19 = cos(t18);
t20 = cos(t14);
t21 = sin(t14);
t22 = t14+theta4;
t24 = -t18;
t25 = t6.*t7;
t26 = t2.*t12;
t28 = t8.*t12;
t31 = t8.*1i;
t45 = t14.*2.0+t17;
t48 = t3.*t4.*t11.*t13.*1i;
t49 = t3.*t5.*t10.*t13.*1i;
t50 = t4.*t5.*t9.*t13.*1i;
t51 = t9.*t10.*t11.*t13.*1i;
t60 = t3.*t4.*t5.*t7.*t12.*1i;
t62 = t3.*t7.*t10.*t11.*t12.*1i;
t63 = t4.*t7.*t9.*t11.*t12.*1i;
t64 = t5.*t7.*t9.*t10.*t12.*1i;
t27 = cos(t22);
t29 = t22+theta5;
t33 = t19.*2.0;
t35 = -t31;
t36 = -t19;
t38 = t22+t23;
t46 = cos(t45);
t55 = t18+t45;
t56 = -t48;
t57 = -t49;
t58 = -t50;
t61 = t24+t45;
t67 = -t60;
t32 = cos(t29);
t34 = sin(t29);
t37 = -t33;
t39 = sin(t38);
t40 = cos(t38);
t41 = t36+1.0;
t42 = t2.*t6.*t27;
t43 = t6.*t8.*t27;
t44 = t2+t35;
t54 = t46.*2.0;
t59 = cos(t55);
t65 = cos(t61);
t84 = t25+t51+t56+t57+t58+t62+t63+t64+t67;
t47 = t34.*5.0e-1i;
t53 = sqrt(t41);
t66 = t39.*5.0e-1i;
t68 = t34+t39;
t70 = (t28 == t42);
t71 = t26+t43;
t72 = (t28 ~= t42);
t77 = t37+t54+t59+t65+6.0;
t85 = t44.*t84;
t52 = -t47;
t69 = -t66;
t73 = (t71 == 0.0);
t74 = (t71 ~= 0.0);
t78 = sqrt(t77);
t86 = angle(t85);
t75 = (t72 | t74);
t76 = t52+t53+t69;
t79 = 1.0./t78;
t80 = (t30.*t78)./4.0;
t81 = -t80;
mt1 = [t2.*3.48e-3-t28.*2.1744e-1+t42.*2.1744e-1+t2.*t3.*(1.4e+1./2.5e+1)+t2.*t3.*t4.*(8.3e+1./2.0e+2)-t2.*t9.*t10.*(8.3e+1./2.0e+2)+t2.*t5.*t20.*7.171e-2-t2.*t5.*t21.*2.517e-2-t2.*t11.*t20.*2.517e-2-t2.*t11.*t21.*7.171e-2];
mt2 = [t8.*3.48e-3+t26.*2.1744e-1+t43.*2.1744e-1+t3.*t8.*(1.4e+1./2.5e+1)+t3.*t4.*t8.*(8.3e+1./2.0e+2)-t8.*t9.*t10.*(8.3e+1./2.0e+2)+t5.*t8.*t20.*7.171e-2-t5.*t8.*t21.*2.517e-2-t8.*t11.*t20.*2.517e-2-t8.*t11.*t21.*7.171e-2];
if (t70 & t73)
    t0 = 0.0;
elseif (t75)
    t0 = angle(abs(sin(t29).*5.0e-1i+sin(t38).*5.0e-1i-(t30.*sqrt(t37+t59+t65+cos(t45).*2.0+6.0))./4.0).*(t2+t31).*(t12.*-2.0+cos(t29).*1i+cos(t38).*1i).*1.0./sqrt(t37+t59+t65+cos(t45).*2.0+6.0).*-1i);
else
    t0 = NaN;
end
mt3 = [t9.*(1.4e+1./2.5e+1)+t21.*(8.3e+1./2.0e+2)+t34.*1.0872e-1+t39.*1.0872e-1+(7.599903288858352e+3.*cos(t22-atan(2.849026618990862)))./1.0e+5+2.4092e-1;t0;angle(t52+t69+t80)];
if ((t70 & t73) & (0.0 < t68))
    t0 = -angle(t44.*t84);
elseif ((t70 & t73) & (0.0 <= t76))
    t0 = 0.0;
elseif ((t70 & t73) & ((t68 < 0.0) | (t76 < 0.0)))
    t0 = angle(t44.*t84);
elseif (t75)
    t0 = angle(abs(sin(t29).*5.0e-1i+sin(t38).*5.0e-1i-(t30.*sqrt(t37+t59+t65+cos(t45).*2.0+6.0))./4.0).*(t7+t13.*1i).*(cos(t22)+cos(t29).*5.0e-1i-cos(t38).*5.0e-1i).*1.0./sqrt(t37+t59+t65+cos(t45).*2.0+6.0));
else
    t0 = NaN;
end
mt4 = [t0];
fwd_kin = [mt1;mt2;mt3;mt4];
