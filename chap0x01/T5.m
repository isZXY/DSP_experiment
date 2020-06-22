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

fs = 5


N=fs/f0

n=0:1/fs:Tp;
xn=exp(-3*n);

Xk=1/fs*fftshift(fft(xn));
abs(Xk(1))

while abs(Xk(1))>0.001 
   fs = fs*2;


    N=fs/f0;

    n=0:1/fs:Tp;
    xn=exp(-3*n);

    Xk=1/fs*fftshift(fft(xn)); 

end
    % 画图
    fs
     stem(n,Xk)
