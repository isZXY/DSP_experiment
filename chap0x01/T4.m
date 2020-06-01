% @author:ZXY

%4．用DFT对连续信号做谱分析。
clc,clear

for i = 1:4
    Tp=0.04*2.^(i-1);
    fs=400;
    t=0:1/fs:99; % 采样
    xt=cos(200*pi*t)+sin(100*pi*t)+cos(50*pi*t);
    
    %  计算截断点数
    f0=1/Tp; % 频率分辨力是信号记录长度的倒数
    %w=2*pi*f0/fs;
    N=fs/f0;
    
    % 矩形窗的情况
    wn1=rectwin(N)';
    xn1=wn1.*xt(1:N);
    Xk1=fft(xn1,2048);
    
    
    % hamming窗
    wn2=hamming(N)';
    xn2=wn2.*xt(1:N);
    Xk2=fft(xn2,2048);
    
    % 画图
    figure(i)
    subplot(2,1,1)
    plot(0:2047,abs(Xk1)) % 数据量太大，不画散点图了
    title("rectwin截断")
    
    subplot(2,1,2)
    plot(0:2047,abs(Xk2))
    title("hamming截断")
end