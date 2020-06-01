% @author:ZXY
clc,clear
% 2.已知序列
%（1）计算该序列DTFT的表达式 ，并画出N=10时的 曲线；
N=10;
w=2*pi*(0:2047)/2048; % 采样2048个点可以近似看作是连续的频谱

% Xw的表达式
R1=(1-exp(-j*N*(w+pi/(2*N))))./(1-exp(-j*w+pi/(2*N)));
R2=(1-exp(-j*N*(w-pi/(2*N))))./(1-exp(-j*w-pi/(2*N)));
Xw=0.5*(R1+R2);

% 分幅度和相位画图
subplot(5,1,1);
plot(w/pi,abs(Xw));
title("Xw幅度");
xlabel('w/pi');

subplot(5,1,2);
plot(w/pi, angle(Xw));
title("Xw相位");
axis([0,2,-pi,pi]);
line([0,2],[0,0]); 
xlabel('w/pi');



%（2）计算N＝10时，序列x[n]的10点DFT，并画出曲线。
n=0:9;
N=10;
xn=cos((n*pi)./(2*N));
Xk=fft(xn);
subplot(5,1,3);
stem(n,abs(Xk));
title("DFT");

%（3）利用hold函数，将DTFT和DFT画在一起。
subplot(5,1,4);
stem(n,abs(Xk));
title("结合 幅度");
hold on;
plot(N/2*w/pi, abs(Xw));%归一




subplot(5,1,5);
stem(n,angle(Xk));
title("结合 相位");
hold on;
plot(N/2*w/pi, angle(Xw));%归一