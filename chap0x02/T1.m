clc,clear

omegaP = 2*pi*1500;
omegaS = 2*pi*3000;
Rp = 3; 
As = 12;
Fs=10000;

%转换至数字频率
wp=omegaP/Fs;
ws=omegaS/Fs;


[N, Wn] = buttord(omegaP, omegaS ,Rp,As,'s')  %%得到模拟滤波器的阶次和3dB截止频率
[B,A] = butter (N,Wn,'s')  %%由阶次和3dB截止频率得到模拟滤波器的系统函数
[Bz,Az]=impinvar(B,A,Fs);%利用冲激响应不变法将模拟滤波器转换为数字滤波器
[App,Ass]=freqzn(Bz,Az,wp/pi,ws/pi,Rp,As,'low')