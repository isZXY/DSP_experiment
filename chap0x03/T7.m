clc,clear,close all

wp1 = 0.3*pi;
wp2 = 0.7*pi;
ws1 = 0.4*pi;
ws2 = 0.6*pi;
Rp = 0.5;
As = 40;
deltaw = min((ws1 - wp1),(wp2-ws2));
%% 由阻带衰减 =40dB，选择hanning窗；hanning窗的带宽为 6.2*pi/N
N0 = ceil(6.2*pi/deltaw);
N = N0 + mod(N0+1,2)   %% 保证N为奇数
%% 得到带通滤波器的理想单位脉冲响应 hd
wc1 = (wp1 + ws1)/2;
wc2 = (wp2 + ws2)/2;
n = 0:N-1;
n0 = (N-1)/2;
m = n -n0 + eps;
hd = sin(pi*m)./(pi*m) - sin(wc2*m)./(pi*m)+sin(wc1*m)./(pi*m); %% 带阻
%% 得到N点的hanning窗
wdham = hanning(N)';
%% 得到脉冲响应
h = hd.*wdham;
%% 画出幅频特性(dB)，并检测As是否满足设计指标
[Rpp,Ass] = freqzn(h,1,[wp1,wp2]/pi,[ws1,ws2]/pi,Rp,As,'stop') 
%% 如果Ass <40 则N = N+2 重新计算
