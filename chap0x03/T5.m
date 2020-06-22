wp = 0.6*pi;  ws = 0.4*pi;
Rp = 1;  As = 45;
deltaw = wp - ws;
%% 要求选择Hamming；Hamming窗的带宽为 6.6*pi/N
N0 = ceil(6.6*pi/deltaw);
N = N0 + mod(N0+1,2)   %% 保证N为奇数
wc = (wp + ws)/2;
%% 得到高通滤波器的理想单位脉冲响应 hd
n = 0:N-1;
n0 = (N-1)/2;
m = n -n0 + eps;
hd = sin(pi*m)./(pi*m) - sin(wc*m)./(pi*m); %% 高通滤波器的理想单位脉冲响应
%% 得到N点的hamming窗
wdham = hamming(N)';
%% 得到脉冲响应
h = hd.*wdham;
%% 画出幅频特性(dB)，并检测As是否满足设计指标
[Rpp,Ass] = freqzn(h,1,wp/pi,ws/pi,Rp,As,'high') 


% 满足指标。
