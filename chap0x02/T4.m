%% 数字高通滤波器的设计指标
wp = 0.6*pi; 
ws = 0.46*pi;
Rp = 1;
As = 15;
%% 1）将数字高通设计指标转化为数字低通设计指标
%% 设数字低通滤波器的通带截至频率为 cetaP = 0.3*pi;
cetaP = 0.3*pi;
alpha = -cos((wp+cetaP)/2)/cos((wp-cetaP)/2)
cetaS = log(-(exp(j*ws)+alpha)/(1+alpha*exp(j*ws)))/(-j)
%% 2）将数字低通滤波器设计指标转换为模拟低通滤波器的设计指标
%% 使用双线性转换，故需要预畸变!
%% 假设采样周期T=1;
T = 1;
omegaP = (2/T)*tan(cetaP/2);
omegaS = (2/T)*tan(cetaS/2);
%% 3）设计模拟低通滤波器
%% 得到模拟滤波器的阶次
[N,Wn] = cheb1ord (omegaP,omegaS,Rp,As,'s')
%% 得到模拟滤波器的系统函数
[b,a] = cheby1(N,Rp,Wn,'s')
%% 4）使用双线性变化法将模拟滤波器转换为数字滤波器
[Bz,Az] = bilinear(b,a,1/T)
%% 5）将数字低通滤波器转化为数字高通滤波器 
[bz,az] = lp2hpz(Bz,Az,alpha)  %%（该函数为自编函数见附录）
%% 画出所设计数字滤波器的幅频特性，并检测Rp，As是否满足设计指标
[Rpp,Ass] = freqzn(bz, az, wp/pi, ws/pi, Rp, As, 'high')  %%（自编函数）
%%%%%% 直接在数字域设计
[N,Wn] = cheb1ord (wp/pi,ws/pi,Rp,As)
[b,a] = cheby1(N,Rp,Wn,'high')
