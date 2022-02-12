function J = J_func(theta1,theta2,theta3,theta4,theta5,theta6)
%J_func
%    J = J_func(THETA1,THETA2,THETA3,THETA4,THETA5,THETA6)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    12-Feb-2022 14:09:49

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
t19 = theta6.*2.0;
t36 = -theta5;
t50 = atan(3.509970715381397e-1);
t68 = 7.599903288858352e+3;
t20 = cos(t15);
t21 = cos(t16);
t22 = cos(t17);
t23 = cos(t19);
t24 = t6.^2;
t25 = t7.^2;
t26 = sin(t15);
t27 = sin(t16);
t28 = sin(t17);
t29 = sin(t18);
t30 = sin(t19);
t31 = t12.^2;
t32 = t13.^2;
t33 = cos(t14);
t34 = sin(t14);
t35 = t14+theta4;
t44 = t9.*(1.4e+1./2.5e+1);
t51 = t3.*t4.*t11.*t13.*4.0;
t52 = t3.*t5.*t10.*t13.*4.0;
t53 = t4.*t5.*t9.*t13.*4.0;
t54 = t9.*t10.*t11.*t13.*4.0;
t69 = t3.*t4.*t5.*t7.*t12.*4.0;
t70 = t3.*t7.*t10.*t11.*t12.*4.0;
t71 = t4.*t7.*t9.*t11.*t12.*4.0;
t72 = t5.*t7.*t9.*t10.*t12.*4.0;
t37 = cos(t35);
t38 = sin(t35);
t39 = t35+theta5;
t45 = t35+t36;
t47 = t23.*t24;
t48 = t24.*t25;
t55 = t11.*t34.*2.517e+3;
t56 = t3.*t4.*t11.*t29;
t57 = t3.*t5.*t10.*t29;
t58 = t4.*t5.*t9.*t29;
t59 = t9.*t10.*t11.*t29;
t60 = t5.*t33.*2.517e+3;
t61 = t11.*t33.*7.171e+3;
t62 = t5.*t34.*7.171e+3;
t63 = -t54;
t65 = t33.*(8.3e+1./2.0e+2);
t66 = t34.*(8.3e+1./2.0e+2);
t73 = t20.*t21.*t22;
t74 = t20.*t27.*t28;
t75 = t21.*t26.*t28;
t76 = t22.*t26.*t27;
t79 = -t70;
t80 = -t71;
t81 = -t72;
t82 = t3.*t4.*t5.*t6.*t30.*2.0;
t83 = t35+t50;
t84 = t3.*t6.*t10.*t11.*t30.*2.0;
t85 = t4.*t6.*t9.*t11.*t30.*2.0;
t86 = t5.*t6.*t9.*t10.*t30.*2.0;
t120 = t12.*t20.*t21.*t28.*t30.*2.0;
t121 = t12.*t20.*t22.*t27.*t30.*2.0;
t122 = t12.*t21.*t22.*t26.*t30.*2.0;
t125 = t12.*t26.*t27.*t28.*t30.*2.0;
t126 = t7.*t12.*t13.*t20.*t21.*t28.*2.0;
t127 = t7.*t12.*t13.*t20.*t22.*t27.*2.0;
t128 = t7.*t12.*t13.*t21.*t22.*t26.*2.0;
t129 = t7.*t12.*t13.*t26.*t27.*t28.*2.0;
t40 = cos(t39);
t41 = sin(t39);
t42 = t37.^2;
t43 = t38.^2;
t46 = sin(t45);
t49 = cos(t45);
t64 = -t55;
t77 = -t59;
t78 = t6.*t38.*2.1744e+4;
t87 = -t73;
t88 = -t82;
t89 = t23.*t56;
t90 = t23.*t57;
t91 = t23.*t58;
t92 = cos(t83);
t93 = t23.*t59;
t96 = t24.*t73;
t97 = t24.*t74;
t98 = t24.*t75;
t99 = t24.*t76;
t100 = t37.*2.517e-2;
t101 = t38.*7.171e-2;
t104 = t23.*t73.*2.0;
t105 = t25.*t73.*2.0;
t106 = t7.*t12.*t13.*t37.*t38.*2.0;
t107 = t23.*t74.*2.0;
t108 = t23.*t75.*2.0;
t109 = t23.*t76.*2.0;
t110 = t25.*t74.*2.0;
t111 = t25.*t75.*2.0;
t112 = t25.*t76.*2.0;
t130 = -t125;
t131 = t47.*t73;
t132 = t48.*t73;
t133 = t47.*t74;
t134 = t47.*t75;
t135 = t47.*t76;
t136 = t48.*t74;
t137 = t48.*t75;
t138 = t48.*t76;
t139 = -t129;
t146 = t51+t52+t53+t63+t69+t79+t80+t81;
t67 = t32.*t43;
t94 = t25.*t31.*t42;
t95 = t41.*1.0872e-1;
t102 = t23.*t77;
t103 = t40.*1.0872e-1;
t113 = t24.*t87;
t114 = -t107;
t115 = -t108;
t116 = -t109;
t117 = -t110;
t118 = -t111;
t119 = -t112;
t123 = t49.*1.0872e-1;
t124 = t46.*1.0872e-1;
t140 = t47.*t87;
t141 = t48.*t87;
t142 = (t68.*t92)./1.0e+5;
t144 = t60+t61+t62+t64+t78;
t143 = t48+t67+t94+t106;
t145 = t44+t66+t95+t100+t101+t124;
t147 = t56+t57+t58+t77+t84+t85+t86+t88+t89+t90+t91+t102;
t148 = t48+t74+t75+t76+t87+t105+t117+t118+t119+t126+t127+t128+t136+t137+t138+t139+t141+1.0;
t152 = t24+t47+t97+t98+t99+t104+t113+t114+t115+t116+t120+t121+t122+t130+t133+t134+t135+t140+2.0;
t149 = 1.0./t148;
t153 = 1.0./t152;
t154 = 1.0./t152.^(3.0./2.0);
t150 = t6.*t7.*t149.*2.0;
t155 = t143.*t146.*t154.*2.0;
t156 = t147.*t153;
t151 = -t150;
t157 = -t156;
mt1 = [t8.*(-3.48e-3)-t3.*t8.*(1.4e+1./2.5e+1)-t2.*t12.*2.1744e-1-t3.*t4.*t8.*(8.3e+1./2.0e+2)+t8.*t9.*t10.*(8.3e+1./2.0e+2)-t5.*t8.*t33.*7.171e-2+t5.*t8.*t34.*2.517e-2-t6.*t8.*t37.*2.1744e-1+t8.*t11.*t33.*2.517e-2+t8.*t11.*t34.*7.171e-2];
mt2 = [t2.*3.48e-3+t2.*t3.*(1.4e+1./2.5e+1)-t8.*t12.*2.1744e-1+t2.*t3.*t4.*(8.3e+1./2.0e+2)-t2.*t9.*t10.*(8.3e+1./2.0e+2)+t2.*t5.*t33.*7.171e-2-t2.*t5.*t34.*2.517e-2+t2.*t6.*t37.*2.1744e-1-t2.*t11.*t33.*2.517e-2-t2.*t11.*t34.*7.171e-2,0.0,1.0,0.0,0.0,-t2.*t145,-t8.*t145,t3.*(1.4e+1./2.5e+1)+t65+t103+t123+t142,t157,t155,t151];
mt3 = [t2.*(t34.*4.15e+4+t37.*2.517e+3+t38.*7.171e+3+t41.*1.0872e+4+t46.*1.0872e+4).*(-1.0e-5),-t8.*(t66+t95+t100+t101+t124),t65+t103+t123+t142,t157,t155,t151,t2.*t144.*(-1.0e-5),t8.*t144.*(-1.0e-5),t103+t123+t142,t157,t155,t151,t6.*t8.*(-2.1744e-1)-t2.*t12.*t37.*2.1744e-1,t2.*t6.*2.1744e-1-t8.*t12.*t37.*2.1744e-1,t12.*t38.*(-2.1744e-1)];
mt4 = [-t153.*(t3.*t4.*t5.*-2.0+t3.*t10.*t11.*2.0+t4.*t9.*t11.*2.0+t5.*t9.*t10.*2.0-t3.*t4.*t5.*t23.*2.0+t3.*t10.*t11.*t23.*2.0+t4.*t9.*t11.*t23.*2.0+t5.*t9.*t10.*t23.*2.0-t3.*t4.*t11.*t12.*t30.*2.0-t3.*t5.*t10.*t12.*t30.*2.0-t4.*t5.*t9.*t12.*t30.*2.0+t9.*t10.*t11.*t12.*t30.*2.0),t6.*t7.*t38.*t143.*t154.*8.0,t149.*(t13+t13.*t74+t13.*t75+t13.*t76+t13.*t87+t7.*t12.*t20.*t21.*t28+t7.*t12.*t20.*t22.*t27+t7.*t12.*t21.*t22.*t26-t7.*t12.*t26.*t27.*t28),0.0,0.0,0.0,t153.*(t41.*2.0+t46.*2.0),t143.*t154.*(t12.*t51+t12.*t52+t12.*t53+t3.*t4.*t5.*t7.*4.0-t3.*t7.*t10.*t11.*4.0-t4.*t7.*t9.*t11.*4.0-t5.*t7.*t9.*t10.*4.0-t9.*t10.*t11.*t12.*t13.*4.0).*-2.0];
mt5 = [-t149.*(t6.*(t13.*t20.*t21.*t28+t13.*t20.*t22.*t27+t13.*t21.*t22.*t26-t13.*t26.*t27.*t28)-t6.*t7.*(t12+t12.*t74+t12.*t75+t12.*t76+t12.*t87))];
J = reshape([mt1,mt2,mt3,mt4,mt5],6,6);