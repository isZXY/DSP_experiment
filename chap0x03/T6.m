clc,clear,close all

wp = 0.4*pi;
ws = 0.6*pi;
As = 45;
deltaw = ws - wp;

%% Hamming 窗
% 选择hamming窗；hamming窗的带宽为 6.6*pi/N
N0 = ceil(6.6*pi/deltaw);
N = N0 + mod(N0+1,2)   %% 保证N为奇数
wc = (wp + ws)/2;
% 得到理想单位脉冲响应 hd
n = 0:N-1;
n0 = (N-1)/2;
m = n -n0 + eps;
hd = sin(wc*m)./(pi*m);
% 得到N点的hamming窗
wdham = hamming(N)';
% 得到脉冲响应
h = hd.*wdham;
% 画出幅频特性(dB)，并检测As是否满足设计指标
6.6*pi/N
[Rpp,Ass] = freqzn(h,1,wp/pi,ws/pi,0.5,As,'low') 
% 满足要求

%% Blackman窗
% blackman窗的带宽为 11*pi/N
N0 = ceil(11*pi/deltaw);
N = N0 + mod(N0+1,2)   %% 保证N为奇数
wc = (wp + ws)/2;
% 得到理想单位脉冲响应 hd
n = 0:N-1;
n0 = (N-1)/2;
m = n -n0 + eps;
hd = sin(wc*m)./(pi*m);
% 得到N点的blackman窗
wdham = blackman(N)';
% 得到脉冲响应
h = hd.*wdham;
% 画出幅频特性(dB)，并检测As是否满足设计指标
11*pi/N
[Rpp,Ass] = freqzn(h,1,wp/pi,ws/pi,0.5,As,'low') 
% 满足要求



%% 评述：Figure 1是hamming窗，其衰减为47dB较小；其过渡带宽度 0.6283。
% Figure 2是blackman窗，其衰减为71dB较大，更好一些；其过渡带宽度同样是0.6283（阶数高）。
%由图可以知道hamming窗的旁瓣也较高，没有blackman好
