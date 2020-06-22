clc,clear

OmegaP = 2*pi*2500;
OmegaS = 2*pi*3500;
Rp = 2; 
As = 15;
Fs=10000;
T=1/Fs;

%转换至数字频率
wp=OmegaP/Fs;
ws=OmegaS/Fs;

% 将数字滤波器设计指标转换为模拟滤波器的设计指标
% 当使用双线性变化法时要预畸变!
OmegaP = (2/T)*tan(wp/2);
OmegaS = (2/T)*tan(ws/2);


[N, Wn] = buttord(OmegaP, OmegaS ,Rp,As,'s')  %%得到模拟滤波器的阶次和3dB截止频率 
[B,A] = butter(N,Wn,'s')  %%由阶次和3dB截止频率得到模拟滤波器的系统函数
[Bz,Az] = bilinear(B,A,1/T);%利用冲激响应不变法将模拟滤波器转换为数字滤波器
[App,Ass]=freqzn(Bz,Az,wp/pi,ws/pi,Rp,As,'low')

