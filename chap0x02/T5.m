clear,clc;
%数字带通滤波器的设计指标
wp1 = 0.4*pi; wp2 = 0.5*pi;
ws1 = 0.2*pi; ws2 = 0.7*pi;
Rp = 1;
As = 15;

%1）将数字带通设计指标转化为数字低通设计指标
%设数字低通滤波器的通带截至频率为 cetaP = 0.2*pi;
cetaP = 0.2*pi;
beta = cos((wp2+wp1)/2)/cos((wp2-wp1)/2);
k = cot((wp2-wp1)/2)*tan(cetaP/2);
alpha1 = (-2*beta*k)/(1+k);
alpha2 = (k-1)/(k+1);
cetaS=(log(-(exp(-j*2*ws2)+alpha1*exp(-j*ws2)+alpha2)/(alpha2*exp(-j*2*ws2)+alpha1*exp(-j*ws2)+1)))/(-j);

%2）将数字低通滤波器设计指标转换为模拟低通滤波器的设计指标
%当使用双线性变化法时要预畸变
%假设采样周期T=1;
T = 1;
omegaP = (2/T)*tan(cetaP/2);
omegaS = (2/T)*tan(cetaS/2);

%3）设计模拟低通滤波器
%得到模拟滤波器的阶次
[N,Wn]=cheb1ord(omegaP,omegaS,Rp,As,'s');
%得到模拟滤波器的系统函数的系数
[b,a] = cheby1(N,Rp,Wn,'s');

%4）使用双线性变化法将模拟低通滤波器转换为数字低通滤波器
[Bz,Az] = bilinear(b,a,1/T);

%5）将数字低通滤波器转化为数字带通滤波器
[bz,az] = lp2bpz(Bz,Az,alpha1,alpha2)

%画出所设计数字滤波器的幅频特性
[Rpp,Ass] = freqzn(bz, az, [wp1,wp2]/pi, [ws1,ws2]/pi, Rp, As, 'band')