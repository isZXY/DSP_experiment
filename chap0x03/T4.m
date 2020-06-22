clc,clear
% 4．分别用N＝21和N＝51的Blackman窗对截止频率ωc＝0.4π的理想低通滤波器截
% 断设计FIR滤波器并分别求出两个滤波器的幅度响应和最小阻带衰减As。从中能得出什么结论。

%% N=21
% 查表，得Blackman窗过渡带宽度：11*pi/N
N=21;
deltaw=11*pi/N
wc=0.4*pi;
As=50;

% ws-wp=deltaw,ws+wp=2*wc
ws=(deltaw+2*wc)/2;
wp=(2*wc-deltaw)/2; 

%悬着Blackman 窗
N0 = ceil(11*pi/deltaw);
N = N0 + mod(N0+1,2) ;  %% 保证N为奇数
wc = (wp + ws)/2;

% 得到理想单位脉冲响应 hd
n = 0:N-1;
n0 = (N-1)/2;
m = n -n0 + eps;
hd = sin(wc*m)./(pi*m);
% 得到N点的hamming窗
wdham = blackman(N)';
% 得到脉冲响应
h = hd.*wdham;
% 画出幅频特性(dB)，并检测As是否满足设计指标
[Rpp,Ass] = freqzn(h,1,wp/pi,ws/pi,0.5,As,'low') 


%% N=51
N=51;
deltaw=11*pi/N
wc2=0.4*pi;
As=50;

% ws-wp=deltaw,ws+wp=2*wc
ws2=(deltaw+2*wc)/2;
wp2=(2*wc-deltaw)/2;

%悬着Blackman 窗
N0 = ceil(11*pi/deltaw);
N = N0 + mod(N0+1,2) ;  %% 保证N为奇数
wc2 = (wp2 + ws2)/2;

% 得到理想单位脉冲响应 hd
n = 0:N-1;
n0 = (N-1)/2;
m = n -n0 + eps;
hd = sin(wc2*m)./(pi*m);
% 得到N点的hamming窗
wdham = blackman(N)';
% 得到脉冲响应
h = hd.*wdham;
% 画出幅频特性(dB)，并检测As是否满足设计指标
[Rpp2,Ass2] = freqzn(h,1,wp2/pi,ws2/pi,0.5,As,'low') 


%% 结论：看图，可以知道。阶数越高，最小阻带衰减As相对也更大一些，但是相对来说旁
% 瓣出现的也更多更早一些。阶数高的过渡带也短一些。（deltaw）