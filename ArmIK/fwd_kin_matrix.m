function T_H_to_0 = fwd_kin_matrix(in1)
%FWD_KIN_MATRIX
%    T_H_to_0 = FWD_KIN_MATRIX(IN1)

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
t6 = cos(theta6);
t7 = sin(theta1);
t8 = sin(theta2);
t9 = sin(theta3);
t10 = sin(theta4);
t11 = sin(theta6);
t16 = pi./2.0;
t12 = t3.*t4;
t13 = t3.*t9;
t14 = t4.*t8;
t15 = t8.*t9;
t22 = t16+theta5;
t17 = t2.*t15;
t18 = t7.*t13;
t19 = t7.*t14;
t20 = t7.*t15;
t21 = -t15;
t23 = t2.*t12;
t24 = t2.*t13;
t25 = t2.*t14;
t26 = t7.*t12;
t27 = cos(t22);
t28 = sin(t22);
t33 = t13+t14;
t29 = -t23;
t30 = -t26;
t31 = t2.*t28;
t32 = t7.*t28;
t34 = t12+t21;
t35 = t5.*t33;
t36 = t10.*t33;
t37 = t24+t25;
t38 = t18+t19;
t39 = t5.*t34;
t40 = t10.*t34;
t41 = -t36;
t42 = t17+t29;
t43 = t20+t30;
t44 = t5.*t37;
t45 = t10.*t37;
t46 = t5.*t38;
t47 = t10.*t38;
t48 = t5.*t42;
t49 = t10.*t42;
t50 = t5.*t43;
t51 = t10.*t43;
t54 = t35+t40;
t55 = t39+t41;
t52 = -t49;
t53 = -t51;
t56 = t45+t48;
t57 = t47+t50;
t58 = t44+t52;
t59 = t46+t53;
t60 = t27.*t56;
t61 = t27.*t57;
t62 = -t61;
t63 = t32+t60;
t64 = t31+t62;
mt1 = [t7.*t27-t28.*t56,-t2.*t27-t28.*t57,t28.*t54,0.0,-t6.*t63-t11.*t58,t6.*t64-t11.*t59,-t11.*(t36-t39)+t6.*t27.*t54,0.0,-t6.*t58+t11.*t63,-t6.*t59-t11.*t64,-t6.*(t36-t39)-t11.*t27.*t54,0.0];
mt2 = [t2.*3.48e-3-t17.*(8.3e+1./2.0e+2)+t23.*(8.3e+1./2.0e+2)-t44.*2.517e-2-t45.*7.171e-2-t48.*7.171e-2+t49.*2.517e-2+t2.*t3.*(1.4e+1./2.5e+1)+t7.*t27.*2.1744e-1-t28.*t56.*2.1744e-1];
mt3 = [t7.*3.48e-3-t20.*(8.3e+1./2.0e+2)+t26.*(8.3e+1./2.0e+2)-t46.*2.517e-2-t47.*7.171e-2-t50.*7.171e-2+t51.*2.517e-2+t3.*t7.*(1.4e+1./2.5e+1)-t2.*t27.*2.1744e-1-t28.*t57.*2.1744e-1];
mt4 = [t8.*(1.4e+1./2.5e+1)+t13.*(8.3e+1./2.0e+2)+t14.*(8.3e+1./2.0e+2)+t35.*7.171e-2-t36.*2.517e-2+t39.*2.517e-2+t40.*7.171e-2+t28.*t54.*2.1744e-1+2.4092e-1,1.0];
T_H_to_0 = reshape([mt1,mt2,mt3,mt4],4,4);
