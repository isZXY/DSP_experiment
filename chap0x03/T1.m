clc,clear
% 求其级联型、并联型结构。

b=[1,-2,1,0,0];
a=[1,0,1.76,0,6.25];


% 输出级联型的结构
[sos, g] = tf2sos(b, a) 


% 并联型
[r,p,k] = residuez (b, a)

% 输出结果说明，系统无常数项，有四个极点，其中第1、2个为共轭极点，组合成
% 二阶基本阶；3、4为一个二阶基本阶
[b1,a1] = residuez(r(1:2),p(1:2),[])
[b2,a2] = residuez(r(3:4),p(3:4),[])