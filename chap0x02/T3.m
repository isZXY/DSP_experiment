clc,clear

%% 数字滤波器的设计指标
wp = 0.4*pi; 
ws = 0.54*pi;
Rp = 1;
As = 15;
%% 将数字滤波器设计指标转换为模拟滤波器的设计指标
%% 当使用双线性变化法时要预畸变!
%% 假设采样周期T=1;
T = 1;
omegaP = (2/T)*tan(wp/2);
omegaS = (2/T)*tan(ws/2);
%% 得到模拟滤波器的阶次
[N,Wn] = cheb1ord (omegaP,omegaS,Rp,As,'s')
%% 设计模拟滤波器
[b,a] = cheby1(N,Rp,Wn,'s')
%% 使用双线性变换法将模拟滤波器转换为数字滤波器
[bz,az] = bilinear(b,a,1/T)
%% 画出所设计数字滤波器的幅频特性，并检测Rp，As是否满足设计指标
[Rpp,Ass] = freqzn(bz, az, wp/pi, ws/pi, Rp, As, 'low')  %%（自编函数）
%%%%%% 直接在数字域设计
[N,Wn] = cheb1ord (wp/pi, ws/pi,Rp,As)
[b,a] = cheby1(N,Rp,Wn,'low')
