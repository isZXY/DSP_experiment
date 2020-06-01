% @author:ZXY
% 1. 用快速卷积法计算下面两个序列的线性卷积。
clc,clear

% 生成序列
n1=0:14;
xn=sin(0.4*n1);

n2=0:19;
hn=0.9.^n2;

% 计算线性卷积需要的fft长度
N=length(n1)+length(n2)-1;

% 做fft变换
Xk=fft(xn,N);
Hk=fft(hn,N);

%Yk为线性卷积的fft
Yk=Xk.*Hk;

% 对Yk做ifft
yn=ifft(Yk)

%画出yn
n3=0:33;
stem(n3,yn)
