function T_4_to_3 = T_4_to_3_f(in1)
%T_4_to_3_f
%    T_4_to_3 = T_4_to_3_f(IN1)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    26-Feb-2022 00:12:28

theta4 = in1(:,4);
t2 = cos(theta4);
t3 = sin(theta4);
T_4_to_3 = reshape([t2,t3,0.0,0.0,-t3,t2,0.0,0.0,0.0,0.0,1.0,0.0,8.3e+1./2.0e+2,0.0,0.0,1.0],[4,4]);
