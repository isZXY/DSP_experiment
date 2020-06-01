% @author:ZXY

clc,clear,close all

% 5.要求频率分辨率为1Hz，确定抽样频率 、持续时间Tp和抽样点数N。
f0=1; % 频率分辨率
Tp=1/f0% 频率分辨力是信号记录长度的倒数

% 确定fs
% fs>=2fh
% 由欧拉公式，exp(-3t)=cos(-3t)+isin(-3t)=cos(2pi*fh*t),求出m
fh=3/(2*pi);
fs_min=2*fh; %所以fs要>=2fh就可以确保不发生混叠失真。

% 随后依次迭代
fs = 1000


N=fs/f0

n=0:1/fs:Tp;
xn=exp(-3*n);

Xk=fft(xn);

% 画图
stem(n,Xk)
